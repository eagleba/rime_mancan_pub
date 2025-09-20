@echo off
chcp 65001 >nul
echo ========================================
echo Safe Clean Script - Only Remove Build Files
echo ========================================
echo.
echo This script will delete the following files:
echo   - Build output directories (output/, build*/)
echo   - Build artifacts (*.obj, *.pdb, *.exe, *.dll, *.ime)
echo.
echo Files to keep:
echo   - Source files (*.cpp, *.h, *.hpp)
echo   - Config files (*.sln, *.vcxproj, *.props)
echo   - Resource files (*.ico, *.rc)
echo   - Document files (*.md, *.txt)
echo   - Script files (*.bat, *.ps1, *.sh)
echo.
echo Continue? (Y/N)
set /p choice=
if /i "%choice%" neq "Y" (
    echo Operation cancelled
    pause
    exit /b
)

echo.
echo Starting cleanup...

REM Delete build output directories
echo Deleting build output directories...
if exist "weasel\output" rmdir /s /q "weasel\output" 2>nul
if exist "weasel\librime\build" rmdir /s /q "weasel\librime\build" 2>nul
if exist "weasel\librime\build_v141" rmdir /s /q "weasel\librime\build_v141" 2>nul
if exist "weasel\librime\build_Win32" rmdir /s /q "weasel\librime\build_Win32" 2>nul
if exist "weasel\librime\build_x64" rmdir /s /q "weasel\librime\build_x64" 2>nul
if exist "weasel\librime\build-ninja" rmdir /s /q "weasel\librime\build-ninja" 2>nul
if exist "weasel\librime\build-vs" rmdir /s /q "weasel\librime\build-vs" 2>nul

REM Delete build artifact files
echo Deleting build artifact files...
for /r weasel %%f in (*.obj *.pdb *.iobj *.ipdb *.exp *.tlog *.lastbuildstate *.exe *.dll *.ime) do del "%%f" 2>nul

echo.
echo ========================================
echo Cleanup completed!
echo ========================================
echo.
echo Deleted file types:
echo   - Build output directories
echo   - *.obj, *.pdb, *.iobj, *.ipdb
echo   - *.exp, *.tlog, *.lastbuildstate
echo   - *.exe, *.dll, *.ime
echo.
echo Important files kept:
echo   - All source files
echo   - Config and project files
echo   - Document and script files
echo.
pause
