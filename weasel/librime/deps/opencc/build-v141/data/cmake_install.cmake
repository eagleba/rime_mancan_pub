# Install script for directory: F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/data

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
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/STCharacters.ocd2")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/data/STCharacters.ocd2")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/STPhrases.ocd2")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/data/STPhrases.ocd2")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/TSCharacters.ocd2")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/data/TSCharacters.ocd2")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/TSPhrases.ocd2")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/data/TSPhrases.ocd2")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/TWVariants.ocd2")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/data/TWVariants.ocd2")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/TWVariantsRevPhrases.ocd2")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/data/TWVariantsRevPhrases.ocd2")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/HKVariants.ocd2")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/data/HKVariants.ocd2")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/HKVariantsRevPhrases.ocd2")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/data/HKVariantsRevPhrases.ocd2")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/JPVariants.ocd2")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/data/JPVariants.ocd2")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/JPShinjitaiCharacters.ocd2")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/data/JPShinjitaiCharacters.ocd2")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/JPShinjitaiPhrases.ocd2")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/data/JPShinjitaiPhrases.ocd2")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/TWPhrases.ocd2")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/data/TWPhrases.ocd2")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/TWPhrasesRev.ocd2")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/data/TWPhrasesRev.ocd2")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/TWVariantsRev.ocd2")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/data/TWVariantsRev.ocd2")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/HKVariantsRev.ocd2")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/data/HKVariantsRev.ocd2")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/JPVariantsRev.ocd2")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc" TYPE FILE FILES "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/data/JPVariantsRev.ocd2")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/hk2s.json;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/hk2t.json;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/jp2t.json;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/s2hk.json;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/s2t.json;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/s2tw.json;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/s2twp.json;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/t2hk.json;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/t2jp.json;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/t2s.json;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/t2tw.json;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/tw2s.json;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/tw2sp.json;F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc/tw2t.json")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "F:/3.Projects/mancan_v1/weasel/librime/thirdparty/share/opencc" TYPE FILE FILES
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/data/config/hk2s.json"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/data/config/hk2t.json"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/data/config/jp2t.json"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/data/config/s2hk.json"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/data/config/s2t.json"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/data/config/s2tw.json"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/data/config/s2twp.json"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/data/config/t2hk.json"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/data/config/t2jp.json"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/data/config/t2s.json"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/data/config/t2tw.json"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/data/config/tw2s.json"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/data/config/tw2sp.json"
    "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/data/config/tw2t.json"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "F:/3.Projects/mancan_v1/weasel/librime/deps/opencc/build-v141/data/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
