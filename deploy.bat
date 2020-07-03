@echo off
setlocal

if .%1. == .. set X=%GX_PROGRAM_DIR%
if not .%1. == .. set X=%1

set GX_PATH=%X%

if "%GX_PATH%" == "" goto errorNoPath

xcopy src\* %GX_PATH%\DeploymentTargets /s /i /Y

goto end

:errorNoPath
echo Please set the GX_PROGRAM_DIR environment variable or pass a valid GeneXus path as an argument
goto end

:end