@echo off
setlocal EnableExtensions

rem Ensure working directory is weasel root
cd /d %~dp0
set "WEASEL_ROOT=%cd%"

rem VS toolchain (v141) and cmake path
call "D:\Program\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
if errorlevel 1 goto :e
set "CMAKE_EXE=D:\Program\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"

echo Quick fixing glog ERROR macro conflict...

rem Clean librime build
rmdir /s /q "%WEASEL_ROOT%\librime\build" 2>nul

rem Rebuild librime with GLOG_NO_ABBREVIATED_SEVERITIES
cd "%WEASEL_ROOT%\librime"
"%CMAKE_EXE%" -S . -B build -G "Visual Studio 17 2022" -T v141 -DCMAKE_CONFIGURATION_TYPES=Release -DBUILD_STATIC=ON -DBUILD_SHARED_LIBS=ON -DBUILD_TEST=OFF -DENABLE_LOGGING=ON -DBOOST_USE_CXX11=ON -DCMAKE_INSTALL_PREFIX="dist" -DCMAKE_PREFIX_PATH="thirdparty" -DCMAKE_CXX_STANDARD=17 -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG /DGLOG_NO_ABBREVIATED_SEVERITIES /std:c++17" -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" -DBOOST_ROOT="F:\3.Projects\mancan_v1\boost_1_89_0" -DBOOST_LIBRARYDIR="F:\3.Projects\mancan_v1\boost_1_89_0\lib64-msvc-14.1"
if errorlevel 1 goto :e
"%CMAKE_EXE%" --build build --config Release --target INSTALL
if errorlevel 1 goto :e

echo librime fixed successfully.
echo Now building weasel...
cd "%WEASEL_ROOT%"
build.bat weasel
if errorlevel 1 goto :e

echo All done!
exit /b 0

:e
echo Fix failed.
exit /b %errorlevel%




