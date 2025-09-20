@echo off
setlocal
call "D:\Program\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
cd /d F:\3.Projects\mancan_v1\weasel\librime || exit /b 1
set PATH=D:\Program\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin;%PATH%
set CMAKE_PREFIX_PATH=F:\3.Projects\mancan_v1\weasel\librime\deps\capnproto\install_static;F:\3.Projects\mancan_v1\weasel\librime\deps\yaml-cpp\install;F:\3.Projects\mancan_v1\weasel\librime\deps\glog\install;F:\3.Projects\mancan_v1\weasel\librime\thirdparty
if not exist thirdparty\include mkdir thirdparty\include
if not exist thirdparty\lib mkdir thirdparty\lib
xcopy /e /y deps\capnproto\install_static\include\* thirdparty\include\ >nul
xcopy /y deps\capnproto\install_static\lib\*.lib thirdparty\lib\ >nul
xcopy /e /y deps\glog\install\include\* thirdparty\include\ >nul
xcopy /y deps\glog\install\lib\*.lib thirdparty\lib\ >nul
xcopy /e /y deps\yaml-cpp\install\include\* thirdparty\include\ >nul
xcopy /y deps\yaml-cpp\install\lib\yaml-cpp.lib thirdparty\lib\ >nul
cmake -S deps\leveldb -B deps\leveldb\build-v141 -G "Visual Studio 17 2022" -T v141 -DCMAKE_CONFIGURATION_TYPES=Release -DLEVELDB_BUILD_TESTS=OFF -DLEVELDB_BUILD_BENCHMARKS=OFF -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="%CD%\thirdparty" -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" || exit /b 1
cmake --build deps\leveldb\build-v141 --config Release --target INSTALL || exit /b 1
cmake -S deps\marisa-trie -B deps\marisa-trie\build-v141 -G "Visual Studio 17 2022" -T v141 -DCMAKE_CONFIGURATION_TYPES=Release -DCMAKE_INSTALL_PREFIX="%CD%\thirdparty" -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" || exit /b 1
cmake --build deps\marisa-trie\build-v141 --config Release --target INSTALL || exit /b 1
cmake -S deps\opencc -B deps\opencc\build-v141 -G "Visual Studio 17 2022" -T v141 -DCMAKE_CONFIGURATION_TYPES=Release -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX="%CD%\thirdparty" -DCMAKE_CXX_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" -DCMAKE_C_FLAGS_RELEASE="/MT /O2 /Ob2 /DNDEBUG" || exit /b 1
cmake --build deps\opencc\build-v141 --config Release --target INSTALL || exit /b 1
cmake -S . -B build-v141 -G "Visual Studio 17 2022" -T v141 -DCMAKE_CONFIGURATION_TYPES=Release -DBUILD_STATIC=ON -DBUILD_SHARED_LIBS=ON -DBUILD_TEST=OFF -DENABLE_LOGGING=ON -DBOOST_USE_CXX11=ON -DCMAKE_INSTALL_PREFIX="%CD%\dist" -DCMAKE_PREFIX_PATH="%CD%\thirdparty" || exit /b 1
cmake --build build-v141 --config Release --target INSTALL || exit /b 1
@echo ready.
