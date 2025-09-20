@echo off
echo 使用修复的Windows SDK版本构建weasel...

REM 设置环境变量
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" 2>nul
if errorlevel 1 (
    echo 尝试备用路径...
    call "C:\Program Files (x86)\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" 2>nul
)

REM 清理之前的构建
if exist msbuild rmdir /s /q msbuild

REM 构建weasel
echo 开始构建weasel...
msbuild weasel.sln /p:Configuration=Release /p:Platform=x64 /p:WindowsTargetPlatformVersion=10.0.26100.0 /p:PlatformToolset=v141

if errorlevel 1 (
    echo 构建失败！
    pause
) else (
    echo 构建成功！
    echo 输出文件在 msbuild\Release\x64\ 目录中
)

pause




