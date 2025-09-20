@echo off
setlocal EnableExtensions

rem Ensure working directory is librime root
cd /d %~dp0
set "RIME_ROOT=%cd%"

rem VS toolchain (v141) and cmake path
call "D:\Program\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
if errorlevel 1 goto :e
set "CMAKE_EXE=D:\Program\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"

echo Fixing capnproto runtime library mismatch...

rem Clean and rebuild capnproto with correct runtime library
rmdir /s /q "%RIME_ROOT%\deps\capnproto\build-v141" 2>nul
rmdir /s /q "%RIME_ROOT%\thirdparty\lib\capnp.lib" 2>nul
rmdir /s /q "%RIME_ROOT%\thirdparty\lib\kj.lib" 2>nul

rem Rebuild capnproto with static runtime and exception handling
"%CMAKE_EXE%" -S "%RIME_ROOT%\deps\capnproto" -B "%RIME_ROOT%\deps\capnproto\build-v141" -G "Visual Studio 17 2022" -T v141 -DCMAKE_CONFIGURATION_TYPES=Release -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="%RIME_ROOT%\thirdparty" -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG /std:c++17 /EHsc" -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded -DCMAKE_CXX_FLAGS="/MT /EHsc" -DCMAKE_C_FLAGS="/MT"
if errorlevel 1 goto :e
"%CMAKE_EXE%" --build "%RIME_ROOT%\deps\capnproto\build-v141" --config Release --target INSTALL
if errorlevel 1 goto :e

echo capnproto fixed successfully.
echo Now rebuilding librime...
"%CMAKE_EXE%" --build "%RIME_ROOT%\build-v141" --config Release --target INSTALL
if errorlevel 1 goto :e

echo All done!
exit /b 0

:e
echo Fix failed.
exit /b %errorlevel%
