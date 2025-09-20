# Install script for directory: F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/install_static")
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
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/Debug/capnp.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/Release/capnp.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/MinSizeRel/capnp.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/RelWithDebInfo/capnp.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/capnp" TYPE FILE FILES
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/c++.capnp.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/common.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/blob.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/endian.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/layout.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/orphan.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/list.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/any.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/message.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/capability.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/membrane.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/dynamic.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/schema.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/schema.capnp.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/stream.capnp.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/schema-lite.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/schema-loader.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/schema-parser.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/pretty-print.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/serialize.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/serialize-async.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/serialize-packed.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/serialize-text.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/pointer-helpers.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/generated-header-support.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/raw-schema.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/c++.capnp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/schema.capnp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/stream.capnp"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/capnp/compat" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/compat/std-iterator.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/Debug/capnp-rpc.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/Release/capnp-rpc.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/MinSizeRel/capnp-rpc.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/RelWithDebInfo/capnp-rpc.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/capnp" TYPE FILE FILES
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/rpc-prelude.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/rpc.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/rpc-twoparty.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/rpc.capnp.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/rpc-twoparty.capnp.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/persistent.capnp.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/ez-rpc.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/rpc.capnp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/rpc-twoparty.capnp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/persistent.capnp"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/Debug/capnp-json.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/Release/capnp-json.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/MinSizeRel/capnp-json.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/RelWithDebInfo/capnp-json.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/capnp/compat" TYPE FILE FILES
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/compat/json.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/compat/json.capnp.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/compat/json.capnp"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/Debug/capnp-websocket.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/Release/capnp-websocket.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/MinSizeRel/capnp-websocket.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/RelWithDebInfo/capnp-websocket.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/capnp/compat" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/c++/src/capnp/compat/websocket-rpc.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/Debug/capnpc.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/Release/capnpc.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/MinSizeRel/capnpc.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/RelWithDebInfo/capnpc.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/Debug/capnp.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/Release/capnp.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/MinSizeRel/capnp.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/RelWithDebInfo/capnp.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/Debug/capnpc-c++.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/Release/capnpc-c++.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/MinSizeRel/capnpc-c++.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/RelWithDebInfo/capnpc-c++.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/Debug/capnpc-capnp.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/Release/capnpc-capnp.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/MinSizeRel/capnpc-capnp.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/RelWithDebInfo/capnpc-capnp.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "D:/Program/Microsoft Visual Studio/2022/Community/Common7/IDE/CommonExtensions/Microsoft/CMake/CMake/bin/cmake.exe" -E copy "$ENV{DESTDIR}F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/install_static/bin/capnp.exe" "$ENV{DESTDIR}F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/install_static/bin/capnpc.exe")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "F:/3.Projects/mancan_v1/weasel/librime/deps/capnproto/build_static/src/capnp/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
