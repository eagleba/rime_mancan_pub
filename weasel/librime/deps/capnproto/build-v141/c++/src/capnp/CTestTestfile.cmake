# CMake generated Testfile for 
# Source directory: F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp
# Build directory: F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build-v141/c++/src/capnp
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(capnp-tests-run "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build-v141/c++/src/capnp/Release/capnp-tests.exe")
  set_tests_properties(capnp-tests-run PROPERTIES  _BACKTRACE_TRIPLES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/CMakeLists.txt;279;add_test;F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/CMakeLists.txt;0;")
else()
  add_test(capnp-tests-run NOT_AVAILABLE)
endif()
if(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(capnp-heavy-tests-run "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build-v141/c++/src/capnp/Release/capnp-heavy-tests.exe")
  set_tests_properties(capnp-heavy-tests-run PROPERTIES  _BACKTRACE_TRIPLES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/CMakeLists.txt;313;add_test;F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/CMakeLists.txt;0;")
else()
  add_test(capnp-heavy-tests-run NOT_AVAILABLE)
endif()
if(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(capnp-evolution-tests-run "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build-v141/c++/src/capnp/Release/capnp-evolution-tests.exe")
  set_tests_properties(capnp-evolution-tests-run PROPERTIES  _BACKTRACE_TRIPLES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/CMakeLists.txt;318;add_test;F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/CMakeLists.txt;0;")
else()
  add_test(capnp-evolution-tests-run NOT_AVAILABLE)
endif()
