@echo off
echo 修复Windows SDK版本问题...

REM 设置环境变量
call "C:\Program Files (x86)\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"

REM 使用MSBuild重新定向解决方案到Windows SDK 10.0.26100.0
echo 重新定向解决方案到Windows SDK 10.0.26100.0...
msbuild weasel.sln /p:WindowsTargetPlatformVersion=10.0.26100.0 /p:PlatformToolset=v141

echo Windows SDK修复完成！




