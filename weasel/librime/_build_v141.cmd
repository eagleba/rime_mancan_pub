@echo off
setlocal EnableExtensions

set "LOG=%~dp0_build_v141.log"
echo ===== [%date% %time%] start =====> "%LOG%"
call :main >> "%LOG%" 2>&1
set "RC=%errorlevel%"
echo ===== [%date% %time%] end rc=%RC% =====>> "%LOG%"
exit /b %RC%

:main
rem Ensure working directory is librime root
cd /d %~dp0
set "RIME_ROOT=%cd%"

rem VS toolchain (v141) and cmake path
call "D:\Program\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
if errorlevel 1 goto :e
set "CMAKE_EXE=D:\Program\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"

rem Configure v141 env (matches Boost 1.89 vc141)
(
  echo rem env for VS2017 toolset (v141)
  echo set RIME_ROOT=%RIME_ROOT%
  echo set BOOST_ROOT=F:\3.Projects\mancan_v1\boost_1_89_0
  echo set BOOST_LIBRARYDIR=F:\3.Projects\mancan_v1\boost_1_89_0\lib64-msvc-14.1
  echo set BJAM_TOOLSET=msvc-14.1
  echo set CMAKE_GENERATOR="Visual Studio 17 2022"
  echo set PLATFORM_TOOLSET=v141
) > "%RIME_ROOT%\env.bat"

rem Prepare thirdparty prefix
if not exist "%RIME_ROOT%\thirdparty\include" mkdir "%RIME_ROOT%\thirdparty\include"
if errorlevel 1 goto :e
if not exist "%RIME_ROOT%\thirdparty\lib" mkdir "%RIME_ROOT%\thirdparty\lib"
if errorlevel 1 goto :e

rem 0) capnproto -> thirdparty (static /MT, C++17, with exceptions)
"%CMAKE_EXE%" -S "%RIME_ROOT%\deps\capnproto" -B "%RIME_ROOT%\deps\capnproto\build-v141" -G "Visual Studio 17 2022" -T v141 -DCMAKE_CONFIGURATION_TYPES=Release -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="%RIME_ROOT%\thirdparty" -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG /std:c++17 /EHsc" -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded -DCMAKE_CXX_FLAGS="/MT /EHsc" -DCMAKE_C_FLAGS="/MT"
if errorlevel 1 goto :e
"%CMAKE_EXE%" --build "%RIME_ROOT%\deps\capnproto\build-v141" --config Release --target INSTALL
if errorlevel 1 goto :e

rem 0.5) glog -> thirdparty (static /MT, C++17)
"%CMAKE_EXE%" -S "%RIME_ROOT%\deps\glog" -B "%RIME_ROOT%\deps\glog\build-v141" -G "Visual Studio 17 2022" -T v141 -DCMAKE_CONFIGURATION_TYPES=Release -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="%RIME_ROOT%\thirdparty" -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG /std:c++17" -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded
if errorlevel 1 goto :e
"%CMAKE_EXE%" --build "%RIME_ROOT%\deps\glog\build-v141" --config Release --target INSTALL
if errorlevel 1 goto :e

rem 0.6) yaml-cpp -> thirdparty (static /MT, C++17)
"%CMAKE_EXE%" -S "%RIME_ROOT%\deps\yaml-cpp" -B "%RIME_ROOT%\deps\yaml-cpp\build-v141" -G "Visual Studio 17 2022" -T v141 -DCMAKE_CONFIGURATION_TYPES=Release -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="%RIME_ROOT%\thirdparty" -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG /std:c++17" -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded
if errorlevel 1 goto :e
"%CMAKE_EXE%" --build "%RIME_ROOT%\deps\yaml-cpp\build-v141" --config Release --target INSTALL
if errorlevel 1 goto :e

rem 1) leveldb -> thirdparty (static /MT, C++17)
"%CMAKE_EXE%" -S "%RIME_ROOT%\deps\leveldb" -B "%RIME_ROOT%\deps\leveldb\build-v141" -G "Visual Studio 17 2022" -T v141 -DCMAKE_CONFIGURATION_TYPES=Release -DLEVELDB_BUILD_TESTS=OFF -DLEVELDB_BUILD_BENCHMARKS=OFF -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="%RIME_ROOT%\thirdparty" -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG /std:c++17" -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded
if errorlevel 1 goto :e
"%CMAKE_EXE%" --build "%RIME_ROOT%\deps\leveldb\build-v141" --config Release --target INSTALL
if errorlevel 1 goto :e

rem 2) marisa -> thirdparty (static /MT, C++17)
"%CMAKE_EXE%" -S "%RIME_ROOT%\deps\marisa-trie" -B "%RIME_ROOT%\deps\marisa-trie\build-v141" -G "Visual Studio 17 2022" -T v141 -DCMAKE_CONFIGURATION_TYPES=Release -DCMAKE_INSTALL_PREFIX="%RIME_ROOT%\thirdparty" -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG /std:c++17" -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded
if errorlevel 1 goto :e
"%CMAKE_EXE%" --build "%RIME_ROOT%\deps\marisa-trie\build-v141" --config Release --target INSTALL
if errorlevel 1 goto :e

rem 3) opencc -> thirdparty (static /MT, C++17, no tests)
"%CMAKE_EXE%" -S "%RIME_ROOT%\deps\opencc" -B "%RIME_ROOT%\deps\opencc\build-v141" -G "Visual Studio 17 2022" -T v141 -DCMAKE_CONFIGURATION_TYPES=Release -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX="%RIME_ROOT%\thirdparty" -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG /std:c++17" -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded
if errorlevel 1 goto :e
"%CMAKE_EXE%" --build "%RIME_ROOT%\deps\opencc\build-v141" --config Release --target INSTALL
if errorlevel 1 goto :e

rem 4) librime (v141, static deps, C++17, no tests)
rem 使用静态运行时库(/MT)匹配所有依赖库
"%CMAKE_EXE%" -S "%RIME_ROOT%" -B "%RIME_ROOT%\build-v141" -G "Visual Studio 17 2022" -T v141 -DCMAKE_CONFIGURATION_TYPES=Release -DBUILD_STATIC=ON -DBUILD_SHARED_LIBS=ON -DBUILD_TEST=OFF -DENABLE_LOGGING=ON -DBOOST_USE_CXX11=ON -DCMAKE_INSTALL_PREFIX="%RIME_ROOT%\dist" -DCMAKE_PREFIX_PATH="%RIME_ROOT%\thirdparty" -DCMAKE_CXX_STANDARD=17 -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG /DGLOG_NO_ABBREVIATED_SEVERITIES /std:c++17" -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" -DBOOST_ROOT="F:\3.Projects\mancan_v1\boost_1_89_0" -DBOOST_LIBRARYDIR="F:\3.Projects\mancan_v1\boost_1_89_0\lib64-msvc-14.1"
if errorlevel 1 goto :e
"%CMAKE_EXE%" --build "%RIME_ROOT%\build-v141" --config Release --target INSTALL
if errorlevel 1 goto :e

echo ready.
exit /b 0

:e
exit /b %errorlevel%

