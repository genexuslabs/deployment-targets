echo off
setlocal

if .%1. == .. set X=%GX_PROGRAM_DIR%
if not .%1. == .. set X=%1

set TARGET=\%2
set GX_PATH=%X%

if "%GX_PATH%" == "" goto errorNoPath

xcopy src%TARGET%\*.* %GX_PATH%\DeploymentTargets%TARGET% /s /i /Y

echo Finished copying to "%GX_PATH%\DeploymentTargets%TARGET%"
goto end

:errorNoPath
echo Please set the GX_PROGRAM_DIR environment variable or pass a valid GeneXus path as an argument
goto end

:end