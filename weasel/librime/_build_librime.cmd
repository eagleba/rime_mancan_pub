@echo off
call "D:\Program\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
cd /d F:\3.Projects\mancan_v1\weasel\librime
set CMAKE_PREFIX_PATH=F:\3.Projects\mancan_v1\weasel\librime\deps\capnproto\install_static;F:\3.Projects\mancan_v1\weasel\librime\deps\yaml-cpp\install;F:\3.Projects\mancan_v1\weasel\librime\deps\glog\install;F:\3.Projects\mancan_v1\weasel\librime\thirdparty
build.bat clean
build.bat librime

