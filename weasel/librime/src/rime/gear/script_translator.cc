//
// Copyright RIME Developers
// Distributed under the BSD License
//
// Script translator
//
// 2011-07-10 GONG Chen <chen.sst@gmail.com>
//
#include <algorithm>
#include <stack>
#include <cstdio>
#include <boost/algorithm/string/join.hpp>
#include <boost/range/adaptor/reversed.hpp>
#include <rime/composition.h>
#include <rime/candidate.h>
#include <rime/config.h>
#include <rime/context.h>
#include <rime/engine.h>
#include <rime/schema.h>
#include <rime/translation.h>
#include <rime/algo/syllabifier.h>
#include <rime/dict/corrector.h>
#include <rime/dict/dictionary.h>
#include <rime/dict/user_dictionary.h>
#include <rime/gear/poet.h>
#include <rime/gear/script_translator.h>
#include <rime/gear/translator_commons.h>


//static const char* quote_left = "\xef\xbc\x88";
//static const char* quote_right = "\xef\xbc\x89";

namespace rime {

namespace {

struct SyllabifyTask {
  const Code& code;
  const SyllableGraph& graph;
  size_t target_pos;
  function<void (SyllabifyTask* task, size_t depth,
                      size_t current_pos, size_t next_pos)> push;
  function<void (SyllabifyTask* task, size_t depth)> pop;
};

static bool syllabify_dfs(SyllabifyTask* task,
                          size_t depth, size_t current_pos) {
  if (depth == task->code.size()) {
    return current_pos == task->target_pos;
  }
  SyllableId syllable_id = task->code.at(depth);
  auto z = task->graph.edges.find(current_pos);
  if (z == task->graph.edges.end())
    return false;
  // favor longer spellings
  for (const auto& y : boost::adaptors::reverse(z->second)) {
    size_t end_vertex_pos = y.first;
    if (end_vertex_pos > task->target_pos)
      continue;
    auto x = y.second.find(syllable_id);
    if (x != y.second.end()) {
      task->push(task, depth, current_pos, end_vertex_pos);
      if (syllabify_dfs(task, depth + 1, end_vertex_pos))
        return true;
      task->pop(task, depth);
    }
  }
  return false;
}

}  // anonymous namespace

class ScriptSyllabifier : public PhraseSyllabifier {
 public:
  ScriptSyllabifier(ScriptTranslator* translator,
                    Corrector* corrector,
                    const string& input,
                    size_t start)
      : translator_(translator), input_(input), start_(start),
        syllabifier_(translator->delimiters(),
                     translator->enable_completion(),
                     translator->strict_spelling()) {
    if (corrector) {
      syllabifier_.EnableCorrection(corrector);
    }
  }

  virtual Spans Syllabify(const Phrase* phrase);
  size_t BuildSyllableGraph(Prism& prism);
  string GetPreeditString(const Phrase& cand) const;
  string GetOriginalSpelling(const Phrase& cand) const;
  bool IsCandidateCorrection(const Phrase& cand) const;

  const SyllableGraph& syllable_graph() const { return syllable_graph_; }

 protected:
  ScriptTranslator* translator_;
  string input_;
  size_t start_;
  Syllabifier syllabifier_;
  SyllableGraph syllable_graph_;
};

class ScriptTranslation : public Translation {
 public:
  ScriptTranslation(ScriptTranslator* translator,
                    Corrector* corrector,
                    Poet* poet,
                    const string& input,
                    size_t start)
      : translator_(translator),
        poet_(poet),
        start_(start),
        syllabifier_(New<ScriptSyllabifier>(
            translator, corrector, input, start)),
        enable_correction_(corrector) {
    set_exhausted(true);
  }
  bool Evaluate(Dictionary* dict, UserDictionary* user_dict);
  virtual bool Next();
  virtual an<Candidate> Peek();

 protected:
  bool CheckEmpty();
  bool IsNormalSpelling() const;
  void PrepareCandidate();
  template <class QueryResult>
  void EnrollEntries(map<int, DictEntryList>& entries_by_end_pos,
                     const an<QueryResult>& query_result);
  an<Sentence> MakeSentence(Dictionary* dict, UserDictionary* user_dict);

  ScriptTranslator* translator_;
  Poet* poet_;
  size_t start_;
  an<ScriptSyllabifier> syllabifier_;

  an<DictEntryCollector> phrase_;
  an<UserDictEntryCollector> user_phrase_;
  an<Sentence> sentence_;

  an<Phrase> candidate_ = nullptr;

  DictEntryCollector::reverse_iterator phrase_iter_;
  UserDictEntryCollector::reverse_iterator user_phrase_iter_;

  size_t max_corrections_ = 4;
  size_t correction_count_ = 0;

  bool enable_correction_;
};

// ScriptTranslator implementation

ScriptTranslator::ScriptTranslator(const Ticket& ticket)
    : Translator(ticket),
      Memory(ticket),
      TranslatorOptions(ticket) {
  if (!engine_)
    return;
  if (Config* config = engine_->schema()->config()) {
    config->GetInt(name_space_ + "/spelling_hints", &spelling_hints_);
    config->GetBool(name_space_ + "/always_show_comments",
                    &always_show_comments_);
    config->GetBool(name_space_ + "/enable_correction", &enable_correction_);
    config->GetInt(name_space_ + "/max_homophones", &max_homophones_);
    poet_.reset(new Poet(language(), config));
  }
  if (enable_correction_) {
    if (auto* corrector = Corrector::Require("corrector")) {
      corrector_.reset(corrector->Create(ticket));
    }
  }
}

an<Translation> ScriptTranslator::Query(const string& input,
                                        const Segment& segment) {
  if (!dict_ || !dict_->loaded())
    return nullptr;
  if (!segment.HasTag(tag_))
    return nullptr;
  
  // Detailed debug logging: record input pinyin and function calls
  FILE* log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "=== ScriptTranslator::Query START ===\n");
    fprintf(log_file, "Input pinyin: '%s'\n", input.c_str());
    fprintf(log_file, "Input position: [%zu, %zu)\n", segment.start, segment.end);
    fprintf(log_file, "Dictionary status: dict_loaded=%d\n", (dict_ && dict_->loaded()) ? 1 : 0);
    fprintf(log_file, "User dictionary status: user_dict_loaded=%d\n", (user_dict_ && user_dict_->loaded()) ? 1 : 0);
    fclose(log_file);
  }

  FinishSession();

  bool enable_user_dict = user_dict_ && user_dict_->loaded() &&
      !IsUserDictDisabledFor(input);
  
  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "User dictionary enabled: %d\n", enable_user_dict ? 1 : 0);
    fprintf(log_file, "Creating ScriptTranslation object...\n");
    fclose(log_file);
  }

  // the translator should survive translations it creates
  auto result = New<ScriptTranslation>(this,
                                       corrector_.get(),
                                       poet_.get(),
                                       input,
                                       segment.start);
  if (!result) {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "ScriptTranslation creation failed!\n");
      fclose(log_file);
    }
    return nullptr;
  }
  
  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "Starting Evaluate for dictionary lookup...\n");
    fclose(log_file);
  }
  
  if (!result->Evaluate(dict_.get(),
                        enable_user_dict ? user_dict_.get() : NULL)) {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "Evaluate failed, no matching words found\n");
      fclose(log_file);
    }
    return nullptr;
  }
  
  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "Evaluate succeeded, creating deduplication translation object...\n");
    fclose(log_file);
  }
  
  auto deduped = New<DistinctTranslation>(result);
  if (contextual_suggestions_) {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "Applying contextual suggestion weights...\n");
      fclose(log_file);
    }
    return poet_->ContextualWeighted(deduped, input, segment.start, this);
  }
  
  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "=== ScriptTranslator::Query COMPLETE ===\n");
    fclose(log_file);
  }
  return deduped;
}

string ScriptTranslator::FormatPreedit(const string& preedit) {
  string result = preedit;
  preedit_formatter_.Apply(&result);
  return result;
}

string ScriptTranslator::Spell(const Code& code) {
  string result;
  vector<string> syllables;
  if (!dict_ || !dict_->Decode(code, &syllables) || syllables.empty())
    return result;
  result =  boost::algorithm::join(syllables,
                                   string(1, delimiters_.at(0)));
  comment_formatter_.Apply(&result);
  return result;
}

string ScriptTranslator::GetPrecedingText(size_t start) const {
  return !contextual_suggestions_ ? string() :
      start > 0 ? engine_->context()->composition().GetTextBefore(start) :
      engine_->context()->commit_history().latest_text();
}

bool ScriptTranslator::Memorize(const CommitEntry& commit_entry) {
  bool update_elements = false;
  // avoid updating single character entries within a phrase which is
  // composed with single characters only
  if (commit_entry.elements.size() > 1) {
    for (const DictEntry* e : commit_entry.elements) {
      if (e->code.size() > 1) {
        update_elements = true;
        break;
      }
    }
  }
  if (update_elements) {
    for (const DictEntry* e : commit_entry.elements) {
      user_dict_->UpdateEntry(*e, 0);
    }
  }
  user_dict_->UpdateEntry(commit_entry, 1);
  return true;
}

// ScriptSyllabifier implementation

Spans ScriptSyllabifier::Syllabify(const Phrase* phrase) {
  Spans result;
  vector<size_t> vertices;
  vertices.push_back(start_);
  SyllabifyTask task{
    phrase->code(),
    syllable_graph_,
    phrase->end() - start_,
    [&](SyllabifyTask* task, size_t depth,
        size_t current_pos, size_t next_pos) {
      vertices.push_back(start_ + next_pos);
    },
    [&](SyllabifyTask* task, size_t depth) {
      vertices.pop_back();
    }
  };
  if (syllabify_dfs(&task, 0, phrase->start() - start_)) {
    result.set_vertices(std::move(vertices));
  }
  return result;
}

size_t ScriptSyllabifier::BuildSyllableGraph(Prism& prism) {
  return (size_t)syllabifier_.BuildSyllableGraph(input_,
                                                 prism,
                                                 &syllable_graph_);
}

bool ScriptSyllabifier::IsCandidateCorrection(const rime::Phrase &cand) const {
  std::stack<bool> results;
  // Perform DFS on syllable graph to find whether this candidate is a correction
  SyllabifyTask task {
    cand.code(),
    syllable_graph_,
    cand.end() - start_,
    [&](SyllabifyTask* task, size_t depth,
        size_t current_pos, size_t next_pos) {
      auto id = cand.code()[depth];
      auto it_s = syllable_graph_.edges.find(current_pos);
      // C++ prohibit operator [] of const map
      // if (syllable_graph_.edges[current_pos][next_pos][id].type == kCorrection)
      if (it_s != syllable_graph_.edges.end()) {
        auto it_e = it_s->second.find(next_pos);
        if (it_e != it_s->second.end()) {
          auto it_type = it_e->second.find(id);
          if (it_type != it_e->second.end()) {
            results.push(it_type->second.is_correction);
            return;
          }
        }
      }
      results.push(false);
    },
    [&](SyllabifyTask* task, size_t depth) {
      results.pop();
    }
  };
  if (syllabify_dfs(&task, 0, cand.start() - start_)) {
    for (; !results.empty(); results.pop()) {
      if (results.top())
        return results.top();
    }
  }
  return false;
}

string ScriptSyllabifier::GetPreeditString(const Phrase& cand) const {
  const auto& delimiters = translator_->delimiters();
  std::stack<size_t> lengths;
  string output;
  SyllabifyTask task{
    cand.code(),
    syllable_graph_,
    cand.end() - start_,
    [&](SyllabifyTask* task, size_t depth,
        size_t current_pos, size_t next_pos) {
      size_t len = output.length();
      if (depth > 0 && len > 0 &&
          delimiters.find(output[len - 1]) == string::npos) {
        output += delimiters.at(0);
      }
      output += input_.substr(current_pos, next_pos - current_pos);
      lengths.push(len);
    },
    [&](SyllabifyTask* task, size_t depth) {
      output.resize(lengths.top());
      lengths.pop();
    }
  };
  if (syllabify_dfs(&task, 0, cand.start() - start_)) {
    return translator_->FormatPreedit(output);
  }
  else {
    return string();
  }
}

string ScriptSyllabifier::GetOriginalSpelling(const Phrase& cand) const {
  if (translator_ &&
      static_cast<int>(cand.code().size()) <= translator_->spelling_hints()) {
    return translator_->Spell(cand.code());
  }
  return string();
}

// ScriptTranslation implementation

bool ScriptTranslation::Evaluate(Dictionary* dict, UserDictionary* user_dict) {
  FILE* log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "=== ScriptTranslation::Evaluate START ===\n");
    fclose(log_file);
  }
  
  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "Building syllable graph...\n");
    fclose(log_file);
  }
  
  size_t consumed = syllabifier_->BuildSyllableGraph(*dict->prism());
  const auto& syllable_graph = syllabifier_->syllable_graph();
  
  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "Syllable graph built, consumed chars: %zu\n", consumed);
    fprintf(log_file, "Syllable graph vertices: %zu\n", syllable_graph.vertices.size());
    fprintf(log_file, "Syllable graph edges: %zu\n", syllable_graph.edges.size());
    fclose(log_file);
  }

  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "Querying main dictionary...\n");
    fclose(log_file);
  }
  
  phrase_ = dict->Lookup(syllable_graph, 0);
  
  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "Main dictionary result: %s\n", (phrase_ ? "found words" : "no words found"));
    fclose(log_file);
  }
  
  if (user_dict) {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "Querying user dictionary...\n");
      fclose(log_file);
    }
    
    user_phrase_ = user_dict->Lookup(syllable_graph, 0);
    
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "User dictionary result: %s\n", (user_phrase_ ? "found words" : "no words found"));
      fclose(log_file);
    }
  } else {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "User dictionary not enabled\n");
      fclose(log_file);
    }
  }
  
  if (!phrase_ && !user_phrase_) {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "Both main and user dictionaries found no matching words, returning failure\n");
      fclose(log_file);
    }
    return false;
  }
  // make sentences when there is no exact-matching phrase candidate
  size_t translated_len = 0;
  if (phrase_ && !phrase_->empty())
    translated_len = (std::max)(translated_len, phrase_->rbegin()->first);
  if (user_phrase_ && !user_phrase_->empty())
    translated_len = (std::max)(translated_len, user_phrase_->rbegin()->first);
  
  LOG(INFO) << "Translated length: " << translated_len << ", consumed length: " << consumed;
  
  if (translated_len < consumed &&
      syllable_graph.edges.size() > 1) {  // at least 2 syllables required
    LOG(INFO) << "Need to generate sentence, calling MakeSentence...";
    sentence_ = MakeSentence(dict, user_dict);
    LOG(INFO) << "Sentence generation result: " << (sentence_ ? "success" : "failed");
  } else {
    LOG(INFO) << "No need to generate sentence";
  }

  if (phrase_) {
    phrase_iter_ = phrase_->rbegin();
    LOG(INFO) << "Initializing main dictionary iterator";
  }
  if (user_phrase_) {
    user_phrase_iter_ = user_phrase_->rbegin();
    LOG(INFO) << "Initializing user dictionary iterator";
  }
  
  bool result = !CheckEmpty();
  LOG(INFO) << "=== ScriptTranslation::Evaluate COMPLETE, result: " << (result ? "success" : "failed") << " ===";
  return result;
}

bool ScriptTranslation::Next() {
  bool is_correction;
  do {
    is_correction = false;
    if (exhausted())
      return false;
    if (sentence_) {
      sentence_.reset();
      return !CheckEmpty();
    }
    int user_phrase_code_length = 0;
    if (user_phrase_ && user_phrase_iter_ != user_phrase_->rend()) {
      user_phrase_code_length = user_phrase_iter_->first;
    }
    int phrase_code_length = 0;
    if (phrase_ && phrase_iter_ != phrase_->rend()) {
      phrase_code_length = phrase_iter_->first;
    }
    if (user_phrase_code_length > 0 &&
        user_phrase_code_length >= phrase_code_length) {
      UserDictEntryIterator& uter(user_phrase_iter_->second);
      if (!uter.Next()) {
        ++user_phrase_iter_;
      }
    }
    else if (phrase_code_length > 0) {
      DictEntryIterator& iter(phrase_iter_->second);
      if (!iter.Next()) {
        ++phrase_iter_;
      }
    }
    if (enable_correction_) {
      PrepareCandidate();
      if (!candidate_) {
        break;
      }
      is_correction = syllabifier_->IsCandidateCorrection(*candidate_);
    }
  } while ( // limit the number of correction candidates
      enable_correction_ &&
      is_correction &&
      correction_count_ > max_corrections_);
  if (is_correction) {
    ++correction_count_;
  }
  return !CheckEmpty();
}

bool ScriptTranslation::IsNormalSpelling() const {
  const auto& syllable_graph = syllabifier_->syllable_graph();
  return !syllable_graph.vertices.empty() &&
      (syllable_graph.vertices.rbegin()->second == kNormalSpelling);
}

an<Candidate> ScriptTranslation::Peek() {
  FILE* log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "=== ScriptTranslation::Peek START ===\n");
    fclose(log_file);
  }
  
  PrepareCandidate();
  if (!candidate_) {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "No candidate, returning null\n");
      fclose(log_file);
    }
    return nullptr;
  }
  
  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "Candidate text: '%s'\n", candidate_->text().c_str());
    fprintf(log_file, "Candidate type: %s\n", candidate_->type().c_str());
    fclose(log_file);
  }
  
  if (candidate_->preedit().empty()) {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "Setting preedit text...\n");
      fclose(log_file);
    }
    candidate_->set_preedit(syllabifier_->GetPreeditString(*candidate_));
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "Preedit text: '%s'\n", candidate_->preedit().c_str());
      fclose(log_file);
    }
  }
  
  if (candidate_->comment().empty()) {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "Setting comment...\n");
      fclose(log_file);
    }
    auto spelling = syllabifier_->GetOriginalSpelling(*candidate_);
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "Original spelling: '%s'\n", spelling.c_str());
      fclose(log_file);
    }
    if (!spelling.empty() &&
        (translator_->always_show_comments() ||
          spelling != candidate_->preedit())) {
      candidate_->set_comment(spelling);
      log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
      if (log_file) {
        fprintf(log_file, "Set comment to: '%s'\n", candidate_->comment().c_str());
        fclose(log_file);
      }
    }
  }
  
  candidate_->set_syllabifier(syllabifier_);
  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "=== ScriptTranslation::Peek COMPLETE ===\n");
    fclose(log_file);
  }
  return candidate_;
}

void ScriptTranslation::PrepareCandidate() {
  LOG(INFO) << "=== ScriptTranslation::PrepareCandidate START ===";
  
  if (exhausted()) {
    LOG(INFO) << "Candidates exhausted, returning null";
    candidate_ = nullptr;
    return;
  }
  if (sentence_) {
    LOG(INFO) << "Using sentence candidate";
    candidate_ = sentence_;
    return;
  }
  
  size_t user_phrase_code_length = 0;
  if (user_phrase_ && user_phrase_iter_ != user_phrase_->rend()) {
    user_phrase_code_length = user_phrase_iter_->first;
  }
  size_t phrase_code_length = 0;
  if (phrase_ && phrase_iter_ != phrase_->rend()) {
    phrase_code_length = phrase_iter_->first;
  }
  
  LOG(INFO) << "User dictionary code length: " << user_phrase_code_length;
  LOG(INFO) << "Main dictionary code length: " << phrase_code_length;
  
  an<Phrase> cand;
  if (user_phrase_code_length > 0 &&
      user_phrase_code_length >= phrase_code_length) {
    LOG(INFO) << "Using user dictionary candidate first";
    UserDictEntryIterator& uter = user_phrase_iter_->second;
    const auto& entry = uter.Peek();
    LOG(INFO) << "User dictionary word: '" << entry->text << "', code length: " << user_phrase_code_length;
    LOG(INFO) << "Word weight: " << entry->weight;
    
    cand = New<Phrase>(translator_->language(),
                       "user_phrase",
                       start_,
                       start_ + user_phrase_code_length,
                       entry);
    double quality = exp(entry->weight) +
                     translator_->initial_quality() +
                     (IsNormalSpelling() ? 0.5 : -0.5);
    cand->set_quality(quality);
    LOG(INFO) << "Candidate quality score: " << quality;
  }
  else if (phrase_code_length > 0) {
    LOG(INFO) << "Using main dictionary candidate";
    DictEntryIterator& iter = phrase_iter_->second;
    const auto& entry = iter.Peek();
    LOG(INFO) << "Main dictionary word: '" << entry->text << "', code length: " << phrase_code_length;
    LOG(INFO) << "Word weight: " << entry->weight;
    
    cand = New<Phrase>(translator_->language(),
                       "phrase",
                       start_,
                       start_ + phrase_code_length,
                       entry);
    double quality = exp(entry->weight) +
                     translator_->initial_quality() +
                     (IsNormalSpelling() ? 0 : -1);
    cand->set_quality(quality);
    LOG(INFO) << "Candidate quality score: " << quality;
  }
  
  candidate_ = cand;
  LOG(INFO) << "=== ScriptTranslation::PrepareCandidate COMPLETE ===";
}

bool ScriptTranslation::CheckEmpty() {
  set_exhausted((!phrase_ || phrase_iter_ == phrase_->rend()) &&
                (!user_phrase_ || user_phrase_iter_ == user_phrase_->rend()));
  return exhausted();
}

template <class QueryResult>
void ScriptTranslation::EnrollEntries(
    map<int, DictEntryList>& entries_by_end_pos,
    const an<QueryResult>& query_result) {
  if (query_result) {
    for (auto& y : *query_result) {
      DictEntryList& homophones = entries_by_end_pos[y.first];
      while (homophones.size() < translator_->max_homophones() &&
             !y.second.exhausted()) {
        homophones.push_back(y.second.Peek());
        if (!y.second.Next())
          break;
      }
    }
  }
}

an<Sentence> ScriptTranslation::MakeSentence(Dictionary* dict,
                                             UserDictionary* user_dict) {
  const int kMaxSyllablesForUserPhraseQuery = 5;
  const auto& syllable_graph = syllabifier_->syllable_graph();
  WordGraph graph;
  for (const auto& x : syllable_graph.edges) {
    auto& same_start_pos = graph[x.first];
    if (user_dict) {
      EnrollEntries(same_start_pos,
                    user_dict->Lookup(syllable_graph,
                                      x.first,
                                      kMaxSyllablesForUserPhraseQuery));
    }
    // merge lookup results
    EnrollEntries(same_start_pos, dict->Lookup(syllable_graph, x.first));
  }
  if (auto sentence =
      poet_->MakeSentence(graph,
                          syllable_graph.interpreted_length,
                          translator_->GetPrecedingText(start_))) {
    sentence->Offset(start_);
    sentence->set_syllabifier(syllabifier_);
    return sentence;
  }
  return nullptr;
}


}  // namespace rime
