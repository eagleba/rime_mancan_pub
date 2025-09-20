@echo off
setlocal EnableExtensions

rem Ensure working directory is librime root
cd /d %~dp0
set "RIME_ROOT=%cd%"

rem VS toolchain (v141) and cmake path
call "D:\Program\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
if errorlevel 1 goto :e
set "CMAKE_EXE=D:\Program\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"

echo Force cleaning and rebuilding everything...

rem Clean everything
rmdir /s /q "%RIME_ROOT%\deps\capnproto\build-v141" 2>nul
rmdir /s /q "%RIME_ROOT%\build-v141" 2>nul
del "%RIME_ROOT%\thirdparty\lib\capnp.lib" 2>nul
del "%RIME_ROOT%\thirdparty\lib\kj.lib" 2>nul
del "%RIME_ROOT%\thirdparty\lib\kj-*.lib" 2>nul
del "%RIME_ROOT%\thirdparty\lib\capnp-*.lib" 2>nul

echo Rebuilding capnproto with correct settings...
"%CMAKE_EXE%" -S "%RIME_ROOT%\deps\capnproto" -B "%RIME_ROOT%\deps\capnproto\build-v141" -G "Visual Studio 17 2022" -T v141 -DCMAKE_CONFIGURATION_TYPES=Release -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="%RIME_ROOT%\thirdparty" -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG /std:c++17 /EHsc" -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" -DCMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded -DCMAKE_CXX_FLAGS="/MT /EHsc" -DCMAKE_C_FLAGS="/MT"
if errorlevel 1 goto :e
"%CMAKE_EXE%" --build "%RIME_ROOT%\deps\capnproto\build-v141" --config Release --target INSTALL
if errorlevel 1 goto :e

echo Rebuilding librime...
"%CMAKE_EXE%" -S "%RIME_ROOT%" -B "%RIME_ROOT%\build-v141" -G "Visual Studio 17 2022" -T v141 -DCMAKE_CONFIGURATION_TYPES=Release -DBUILD_STATIC=ON -DBUILD_SHARED_LIBS=ON -DBUILD_TEST=OFF -DENABLE_LOGGING=ON -DBOOST_USE_CXX11=ON -DCMAKE_INSTALL_PREFIX="%RIME_ROOT%\dist" -DCMAKE_PREFIX_PATH="%RIME_ROOT%\thirdparty" -DCMAKE_CXX_STANDARD=17 -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG /DGLOG_NO_ABBREVIATED_SEVERITIES /std:c++17" -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" -DBOOST_ROOT="F:\3.Projects\mancan_v1\boost_1_89_0" -DBOOST_LIBRARYDIR="F:\3.Projects\mancan_v1\boost_1_89_0\lib64-msvc-14.1"
if errorlevel 1 goto :e
"%CMAKE_EXE%" --build "%RIME_ROOT%\build-v141" --config Release --target INSTALL
if errorlevel 1 goto :e

echo All done successfully!
exit /b 0

:e
echo Build failed.
exit /b %errorlevel%




