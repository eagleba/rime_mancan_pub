@echo off
echo 修复所有weasel项目的Windows SDK版本设置...

REM 修复WeaselUI项目
echo 修复 WeaselUI.vcxproj...
powershell -Command "(Get-Content 'WeaselUI\WeaselUI.vcxproj') -replace '<PlatformToolset>\$\(PLATFORM_TOOLSET\)</PlatformToolset>', '<PlatformToolset>$(PLATFORM_TOOLSET)</PlatformToolset><WindowsTargetPlatformVersion>$(WINDOWS_TARGET_PLATFORM_VERSION)</WindowsTargetPlatformVersion>' | Set-Content 'WeaselUI\WeaselUI.vcxproj'"

REM 修复WeaselServer项目
echo 修复 WeaselServer.vcxproj...
powershell -Command "(Get-Content 'WeaselServer\WeaselServer.vcxproj') -replace '<PlatformToolset>\$\(PLATFORM_TOOLSET\)</PlatformToolset>', '<PlatformToolset>$(PLATFORM_TOOLSET)</PlatformToolset><WindowsTargetPlatformVersion>$(WINDOWS_TARGET_PLATFORM_VERSION)</WindowsTargetPlatformVersion>' | Set-Content 'WeaselServer\WeaselServer.vcxproj'"

REM 修复WeaselIPCServer项目
echo 修复 WeaselIPCServer.vcxproj...
powershell -Command "(Get-Content 'WeaselIPCServer\WeaselIPCServer.vcxproj') -replace '<PlatformToolset>\$\(PLATFORM_TOOLSET\)</PlatformToolset>', '<PlatformToolset>$(PLATFORM_TOOLSET)</PlatformToolset><WindowsTargetPlatformVersion>$(WINDOWS_TARGET_PLATFORM_VERSION)</WindowsTargetPlatformVersion>' | Set-Content 'WeaselIPCServer\WeaselIPCServer.vcxproj'"

REM 修复WeaselTSF项目
echo 修复 WeaselTSF.vcxproj...
powershell -Command "(Get-Content 'WeaselTSF\WeaselTSF.vcxproj') -replace '<PlatformToolset>\$\(PLATFORM_TOOLSET\)</PlatformToolset>', '<PlatformToolset>$(PLATFORM_TOOLSET)</PlatformToolset><WindowsTargetPlatformVersion>$(WINDOWS_TARGET_PLATFORM_VERSION)</WindowsTargetPlatformVersion>' | Set-Content 'WeaselTSF\WeaselTSF.vcxproj'"

REM 修复WeaselIME项目
echo 修复 WeaselIME.vcxproj...
powershell -Command "(Get-Content 'WeaselIME\WeaselIME.vcxproj') -replace '<PlatformToolset>\$\(PLATFORM_TOOLSET\)</PlatformToolset>', '<PlatformToolset>$(PLATFORM_TOOLSET)</PlatformToolset><WindowsTargetPlatformVersion>$(WINDOWS_TARGET_PLATFORM_VERSION)</WindowsTargetPlatformVersion>' | Set-Content 'WeaselIME\WeaselIME.vcxproj'"

REM 修复RimeWithWeasel项目
echo 修复 RimeWithWeasel.vcxproj...
powershell -Command "(Get-Content 'RimeWithWeasel\RimeWithWeasel.vcxproj') -replace '<PlatformToolset>\$\(PLATFORM_TOOLSET\)</PlatformToolset>', '<PlatformToolset>$(PLATFORM_TOOLSET)</PlatformToolset><WindowsTargetPlatformVersion>$(WINDOWS_TARGET_PLATFORM_VERSION)</WindowsTargetPlatformVersion>' | Set-Content 'RimeWithWeasel\RimeWithWeasel.vcxproj'"

REM 修复WeaselDeployer项目
echo 修复 WeaselDeployer.vcxproj...
powershell -Command "(Get-Content 'WeaselDeployer\WeaselDeployer.vcxproj') -replace '<PlatformToolset>\$\(PLATFORM_TOOLSET\)</PlatformToolset>', '<PlatformToolset>$(PLATFORM_TOOLSET)</PlatformToolset><WindowsTargetPlatformVersion>$(WINDOWS_TARGET_PLATFORM_VERSION)</WindowsTargetPlatformVersion>' | Set-Content 'WeaselDeployer\WeaselDeployer.vcxproj'"

echo 所有项目文件已修复！
echo 现在可以重新编译了。



