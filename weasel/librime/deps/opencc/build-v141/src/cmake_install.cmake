# Install script for directory: F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src

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
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/lib/opencc.lib")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/src/Release/opencc.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/lib/marisa.lib")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/lib" TYPE STATIC_LIBRARY FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/deps/marisa-0.2.6/Release/marisa.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}F:/3.Projects/mancan_v1/weasel/librime/thirdparty/lib/cmake/opencc/OpenCCTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}F:/3.Projects/mancan_v1/weasel/librime/thirdparty/lib/cmake/opencc/OpenCCTargets.cmake"
         "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/src/CMakeFiles/Export/98fa35670b14225b162b65938e4cc857/OpenCCTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}F:/3.Projects/mancan_v1/weasel/librime/thirdparty/lib/cmake/opencc/OpenCCTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}F:/3.Projects/mancan_v1/weasel/librime/thirdparty/lib/cmake/opencc/OpenCCTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/lib/cmake/opencc/OpenCCTargets.cmake")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/lib/cmake/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/src/CMakeFiles/Export/98fa35670b14225b162b65938e4cc857/OpenCCTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/lib/cmake/opencc/OpenCCTargets-release.cmake")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/lib/cmake/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/src/CMakeFiles/Export/98fa35670b14225b162b65938e4cc857/OpenCCTargets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/Common.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/Config.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/Conversion.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/ConversionChain.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/Converter.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/Dict.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/DictConverter.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/DictEntry.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/DictGroup.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/Exception.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/Export.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/Lexicon.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/MarisaDict.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/MaxMatchSegmentation.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/Optional.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/PhraseExtract.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/Segmentation.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/Segments.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/SerializableDict.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/SerializedValues.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/SimpleConverter.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/TextDict.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/UTF8StringSlice.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/UTF8Util.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/opencc.h;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/opencc_config.h;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/BinaryDict.hpp;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc/DartsDict.hpp")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/include/opencc" TYPE FILE FILES
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/Common.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/Config.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/Conversion.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/ConversionChain.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/Converter.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/Dict.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/DictConverter.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/DictEntry.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/DictGroup.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/Exception.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/Export.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/Lexicon.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/MarisaDict.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/MaxMatchSegmentation.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/Optional.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/PhraseExtract.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/Segmentation.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/Segments.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/SerializableDict.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/SerializedValues.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/SimpleConverter.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/TextDict.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/UTF8StringSlice.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/UTF8Util.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/opencc.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/src/opencc_config.h"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/BinaryDict.hpp"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/src/DartsDict.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/src/tools/cmake_install.cmake")

endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/src/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
