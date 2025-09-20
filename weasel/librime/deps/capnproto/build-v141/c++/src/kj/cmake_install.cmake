# Install script for directory: F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "F:/3.Projects/mancan_v1/weasel/librime/thirdparty")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build-v141/c++/src/kj/Release/kj.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj" TYPE FILE FILES
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/common.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/units.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/memory.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/refcount.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/array.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/list.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/vector.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/string.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/string-tree.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/source-location.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/hash.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/table.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/map.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/encoding.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/exception.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/debug.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/arena.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/io.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/tuple.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/one-of.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/function.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/mutex.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/thread.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/threadlocal.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/filesystem.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/time.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/main.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/win32-api-version.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/windows-sanity.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj/parse" TYPE FILE FILES
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/parse/common.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/parse/char.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj/std" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/std/iostream.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build-v141/c++/src/kj/Release/kj-test.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/test.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj/compat" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/compat/gtest.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build-v141/c++/src/kj/Release/kj-async.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj" TYPE FILE FILES
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/async-prelude.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/async.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/async-inl.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/async-unix.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/async-win32.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/async-io.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/async-queue.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/timer.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build-v141/c++/src/kj/Release/kj-http.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj/compat" TYPE FILE FILES
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/compat/url.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/compat/http.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build-v141/c++/src/kj/Release/kj-tls.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj/compat" TYPE FILE FILES
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/compat/readiness-io.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/compat/tls.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build-v141/c++/src/kj/Release/kj-gzip.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/kj/compat" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/kj/compat/gzip.h")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build-v141/c++/src/kj/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
