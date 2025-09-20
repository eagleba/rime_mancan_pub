# Install script for directory: F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie

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
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/build-v141/Release/marisa.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/include/marisa.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/marisa" TYPE FILE FILES
    "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/include/marisa/agent.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/include/marisa/base.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/include/marisa/exception.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/include/marisa/iostream.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/include/marisa/key.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/include/marisa/keyset.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/include/marisa/query.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/include/marisa/scoped-array.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/include/marisa/scoped-ptr.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/include/marisa/stdio.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/include/marisa/trie.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/marisa/marisa-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/marisa/marisa-targets.cmake"
         "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/build-v141/CMakeFiles/Export/71eb9abfd800cf0803628d1a4c3f71dd/marisa-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/marisa/marisa-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/marisa/marisa-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/marisa" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/build-v141/CMakeFiles/Export/71eb9abfd800cf0803628d1a4c3f71dd/marisa-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/marisa" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/build-v141/CMakeFiles/Export/71eb9abfd800cf0803628d1a4c3f71dd/marisa-targets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/build-v141/marisa.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/marisa" TYPE FILE FILES
    "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/build-v141/marisa-config.cmake"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/build-v141/marisa-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/build-v141/tools/cmake_install.cmake")

endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/build-v141/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
if(CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_COMPONENT MATCHES "^[a-zA-Z0-9_.+-]+$")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
  else()
    string(MD5 CMAKE_INST_COMP_HASH "${CMAKE_INSTALL_COMPONENT}")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INST_COMP_HASH}.txt")
    unset(CMAKE_INST_COMP_HASH)
  endif()
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "F:/3.Projects/mancan_v1/weasel/librime/deps/marisa-trie/build-v141/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
