@echo off
setlocal EnableExtensions

set "LOG=%~dp0_build_v141.log"
echo ===== [%date% %time%] glog test start =====>> "%LOG%"
call :main >> "%LOG%" 2>&1
set "RC=%errorlevel%"
echo ===== [%date% %time%] glog test end rc=%RC% =====>> "%LOG%"
exit /b %RC%

:main
rem Ensure working directory is librime root
cd /d %~dp0
set "RIME_ROOT=%cd%"

rem VS toolchain (v141) and cmake path
call "D:\Program\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
if errorlevel 1 goto :e
set "CMAKE_EXE=D:\Program\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"

rem Prepare thirdparty prefix
if not exist "%RIME_ROOT%\thirdparty\include" mkdir "%RIME_ROOT%\thirdparty\include"
if errorlevel 1 goto :e
if not exist "%RIME_ROOT%\thirdparty\lib" mkdir "%RIME_ROOT%\thirdparty\lib"
if errorlevel 1 goto :e

rem Test glog -> thirdparty (static /MT, C++17)
echo Testing glog compilation with /MT...
"%CMAKE_EXE%" -S "%RIME_ROOT%\deps\glog" -B "%RIME_ROOT%\deps\glog\build-v141" -G "Visual Studio 17 2022" -T v141 -DCMAKE_CONFIGURATION_TYPES=Release -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="%RIME_ROOT%\thirdparty" -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG /std:c++17" -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded
if errorlevel 1 goto :e
"%CMAKE_EXE%" --build "%RIME_ROOT%\deps\glog\build-v141" --config Release --target INSTALL
if errorlevel 1 goto :e

echo glog test completed successfully.
exit /b 0

:e
exit /b %errorlevel%
