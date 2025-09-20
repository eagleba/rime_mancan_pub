# CMake generated Testfile for 
# Source directory: F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj
# Build directory: F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build-v141/c++/src/kj
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(kj-tests-run "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build-v141/c++/src/kj/Release/kj-tests.exe")
  set_tests_properties(kj-tests-run PROPERTIES  _BACKTRACE_TRIPLES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/CMakeLists.txt;252;add_test;F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/CMakeLists.txt;0;")
else()
  add_test(kj-tests-run NOT_AVAILABLE)
endif()
if(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(kj-heavy-tests-run "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build-v141/c++/src/kj/Release/kj-heavy-tests.exe")
  set_tests_properties(kj-heavy-tests-run PROPERTIES  _BACKTRACE_TRIPLES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/CMakeLists.txt;290;add_test;F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/CMakeLists.txt;0;")
else()
  add_test(kj-heavy-tests-run NOT_AVAILABLE)
endif()
