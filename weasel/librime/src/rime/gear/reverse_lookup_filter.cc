//
// Copyright RIME Developers
// Distributed under the BSD License
//
// 2013-11-05 GONG Chen <chen.sst@gmail.com>
//
#include <rime/candidate.h>
#include <rime/engine.h>
#include <rime/schema.h>
#include <rime/translation.h>
#include <rime/dict/reverse_lookup_dictionary.h>
#include <rime/gear/reverse_lookup_filter.h>
#include <rime/gear/translator_commons.h>
// extra includes for UTF-8 handling and string processing
#include <boost/locale/utf.hpp>
#include <boost/algorithm/string.hpp>
#include <unordered_set>
#include <vector>
#include <cstdio>

namespace rime {

class ReverseLookupFilterTranslation : public CacheTranslation {
 public:
  ReverseLookupFilterTranslation(an<Translation> translation,
                                 ReverseLookupFilter* filter)
      : CacheTranslation(translation), filter_(filter) {
  }
  virtual an<Candidate> Peek();

 protected:
  ReverseLookupFilter* filter_;
};

an<Candidate> ReverseLookupFilterTranslation::Peek() {
  auto cand = CacheTranslation::Peek();
  if (cand) {
    filter_->Process(cand);
  }
  return cand;
}

ReverseLookupFilter::ReverseLookupFilter(const Ticket& ticket)
    : Filter(ticket), TagMatching(ticket) {
  if (ticket.name_space == "filter") {
    name_space_ = "reverse_lookup";
  }
}

void ReverseLookupFilter::Initialize() {
  FILE* log_file;
  
  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "=== ReverseLookupFilter::Initialize START ===\n");
    fclose(log_file);
  }
  
  initialized_ = true;
  if (!engine_) {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "ERROR: No engine available for ReverseLookupFilter\n");
      fclose(log_file);
    }
    return;
  }
  
  Ticket ticket(engine_, name_space_);
  if (auto c = ReverseLookupDictionary::Require("reverse_lookup_dictionary")) {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "Creating reverse lookup dictionary...\n");
      fclose(log_file);
    }
    
    rev_dict_.reset(c->Create(ticket));
    if (rev_dict_) {
      log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
      if (log_file) {
        fprintf(log_file, "Reverse lookup dictionary created, attempting to load...\n");
        fclose(log_file);
      }
      
      if (!rev_dict_->Load()) {
        log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
        if (log_file) {
          fprintf(log_file, "ERROR: Failed to load reverse lookup dictionary\n");
          fclose(log_file);
        }
        rev_dict_.reset();
      } else {
        log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
        if (log_file) {
          fprintf(log_file, "SUCCESS: Reverse lookup dictionary loaded successfully\n");
          fclose(log_file);
        }
      }
    } else {
      log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
      if (log_file) {
        fprintf(log_file, "ERROR: Failed to create reverse lookup dictionary\n");
        fclose(log_file);
      }
    }
  } else {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "ERROR: ReverseLookupDictionary::Require failed\n");
      fclose(log_file);
    }
  }
  
  if (Config* config = engine_->schema()->config()) {
    config->GetBool(name_space_ + "/overwrite_comment", &overwrite_comment_);
    comment_formatter_.Load(config->GetList(name_space_ + "/comment_format"));
    
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "ReverseLookupFilter config loaded, overwrite_comment=%d\n", overwrite_comment_ ? 1 : 0);
      fclose(log_file);
    }
  }
  
  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "=== ReverseLookupFilter::Initialize COMPLETE ===\n");
    fclose(log_file);
  }
}

an<Translation> ReverseLookupFilter::Apply(
    an<Translation> translation, CandidateList* candidates) {
  FILE* log_file;
  
  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "=== ReverseLookupFilter::Apply START ===\n");
    fclose(log_file);
  }
  
  if (!initialized_) {
    Initialize();
  }
  
  if (!rev_dict_) {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "WARNING: No reverse lookup dictionary available, returning original translation\n");
      fclose(log_file);
    }
    return translation;
  }
  
  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "Creating ReverseLookupFilterTranslation wrapper\n");
    fclose(log_file);
  }
  
  return New<ReverseLookupFilterTranslation>(translation, this);
}

void ReverseLookupFilter::Process(const an<Candidate>& cand) {
  FILE* log_file;
  
  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "=== ReverseLookupFilter::Process START ===\n");
    fprintf(log_file, "Processing candidate: '%s'\n", cand->text().c_str());
    fclose(log_file);
  }
  
  if (!overwrite_comment_ && !cand->comment().empty()) {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "Candidate already has comment, skipping\n");
      fclose(log_file);
    }
    return;
  }
  
  auto phrase = As<Phrase>(Candidate::GetGenuineCandidate(cand));
  if (!phrase) {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "Candidate is not a phrase, skipping\n");
      fclose(log_file);
    }
    return;
  }
  
  string codes;
  // 1) Try phrase-level reverse lookup first
  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "Trying phrase-level reverse lookup for: '%s'\n", phrase->text().c_str());
    fclose(log_file);
  }
  bool found = rev_dict_ && rev_dict_->ReverseLookup(phrase->text(), &codes);
  
  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "Phrase-level lookup result: %s\n", found ? "found" : "not found");
    if (found) {
      fprintf(log_file, "Phrase-level codes: '%s'\n", codes.c_str());
    }
    fclose(log_file);
  }

  // 2) If not found, build per-character Jyutping with multi-reading join '/'
  if (!found) {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "Starting per-character reverse lookup...\n");
      fclose(log_file);
    }
    const string& text = phrase->text();
    const char* p = text.data();
    const char* e = p + text.size();
    std::vector<string> per_char_codes;
    per_char_codes.reserve(text.size());
    
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "Text length: %zu characters\n", text.size());
      fclose(log_file);
    }

    while (p < e) {
      const char* cp_begin = p;
      boost::locale::utf::code_point cp = boost::locale::utf::utf_traits<char>::decode(p, e);
      if (cp == boost::locale::utf::illegal || cp == boost::locale::utf::incomplete) {
        // skip invalid byte to avoid infinite loop
        ++p;
        continue;
      }
      string ch(cp_begin, p - cp_begin);
      string ch_codes;
      log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
      if (log_file) {
        fprintf(log_file, "Processing character: '%s'\n", ch.c_str());
        fclose(log_file);
      }
      
      if (rev_dict_ && rev_dict_->ReverseLookup(ch, &ch_codes) && !ch_codes.empty()) {
        log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
        if (log_file) {
          fprintf(log_file, "  Found pronunciation: '%s'\n", ch_codes.c_str());
          fclose(log_file);
        }
        // split readings by whitespace, deduplicate, then join with '/'
        std::vector<string> tokens;
        boost::split(tokens, ch_codes, boost::is_any_of("\t \f\v"), boost::token_compress_on);
        std::unordered_set<string> seen;
        std::vector<string> unique_tokens;
        unique_tokens.reserve(tokens.size());
        for (auto& t : tokens) {
          if (t.empty()) continue;
          if (seen.insert(t).second) unique_tokens.push_back(t);
        }
        if (!unique_tokens.empty()) {
          string joined = boost::algorithm::join(unique_tokens, "/");
          per_char_codes.push_back(joined);
          log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
          if (log_file) {
            fprintf(log_file, "  Deduplicated pronunciation: '%s'\n", joined.c_str());
            fclose(log_file);
          }
        }
      }
      else {
        log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
        if (log_file) {
          fprintf(log_file, "  No pronunciation found\n");
          fclose(log_file);
        }
        // no reading found for this char; keep it empty to avoid noise
        per_char_codes.push_back("");
      }
    }

    // join non-empty per-char codes with space
    std::vector<string> filtered;
    filtered.reserve(per_char_codes.size());
    for (auto& c : per_char_codes) {
      if (!c.empty()) filtered.push_back(c);
    }
    if (!filtered.empty()) {
      codes = boost::algorithm::join(filtered, " ");
      found = true;
      log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
      if (log_file) {
        fprintf(log_file, "Per-character lookup result: '%s'\n", codes.c_str());
        fclose(log_file);
      }
    } else {
      log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
      if (log_file) {
        fprintf(log_file, "Per-character lookup found no pronunciations\n");
        fclose(log_file);
      }
    }
  }

  if (found) {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "Applying comment formatter...\n");
      fclose(log_file);
    }
    comment_formatter_.Apply(&codes);
    if (!codes.empty()) {
      phrase->set_comment(codes);
      log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
      if (log_file) {
        fprintf(log_file, "Set final comment: '%s'\n", codes.c_str());
        fclose(log_file);
      }
    }
  } else {
    log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
    if (log_file) {
      fprintf(log_file, "No pronunciations found, not setting comment\n");
      fclose(log_file);
    }
  }
  
  log_file = fopen("F:\\3.Projects\\mancan_v1\\debug_log.txt", "a");
  if (log_file) {
    fprintf(log_file, "=== ReverseLookupFilter::Process COMPLETE ===\n");
    fclose(log_file);
  }
}

}  // namespace rime
