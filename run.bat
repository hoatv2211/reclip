@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"

REM Check prerequisites
set "missing="
where python >nul 2>nul || set "missing=%missing%python "
where yt-dlp >nul 2>nul || set "missing=%missing%yt-dlp "
where ffmpeg >nul 2>nul || set "missing=%missing%ffmpeg "

if defined missing (
    echo Missing required tools:%missing%
    echo.
    echo Please install:%missing%
    exit /b 1
)

REM Set up venv and install Python deps
if not exist "venv" (
    echo Setting up virtual environment...
    python -m venv venv
    echo Installing dependencies...
    venv\Scripts\python.exe -m pip install --quiet flask yt-dlp
)

REM Activate venv and run
echo Starting ReClip server...
call venv\Scripts\activate.bat

set PORT=8899
set PORT=!PORT!

echo.
echo ========================================
echo   ReClip is running at http://localhost:!PORT!
echo ========================================
echo.
python app.py

endlocal
