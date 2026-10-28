@echo off
chcp 65001 >nul
cd /d "%~dp0"
title SaleBot

set PY=
py --version >nul 2>nul && set PY=py
if not defined PY (python --version >nul 2>nul && set PY=python)
if not defined PY goto nopython

if exist .env goto haveenv
echo ==== First-time setup ====
echo.
set /p BOT_TOKEN=Paste your bot token from BotFather: 
set /p ADMIN_ID=Paste your Telegram numeric ID: 
(echo BOT_TOKEN=%BOT_TOKEN%) > .env
(echo ADMIN_ID=%ADMIN_ID%) >> .env
echo.
echo Saved to .env
:haveenv

if exist .venv\Scripts\python.exe goto install
echo Creating Python environment...
%PY% -m venv .venv
if errorlevel 1 goto installfailed

:install
echo Checking and installing required packages...
.venv\Scripts\python -m pip install -r requirements.txt
if errorlevel 1 goto installfailed

:run
echo.
echo Starting the bot... Keep this window open. Press Ctrl+C to stop.
.venv\Scripts\python bot.py
pause
exit /b

:installfailed
echo.
echo Install failed. Check your internet and run again.
pause
exit /b 1

:nopython
echo Python is not installed.
echo Download it from https://www.python.org/downloads/
echo During install, tick "Add Python to PATH". Then run this file again.
pause
