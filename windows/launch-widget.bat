@echo off
REM LabPlan Desktop Widget — Windows
REM Place this file in the same folder as widget.html
REM Then double-click to launch, or add shortcut to shell:startup

SET "WIDGET=%~dp0widget.html"
SET "WIDGET_URL=file:///%WIDGET:\=/%"

REM Adjust position (X,Y from top-left) and size to your screen
SET POS=1580,60
SET SIZE=316,520

SET BROWSER=
IF EXIST "%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe" SET "BROWSER=%LOCALAPPDATA%\Google\Chrome\Application\chrome.exe"
IF EXIST "%PROGRAMFILES%\Google\Chrome\Application\chrome.exe" SET "BROWSER=%PROGRAMFILES%\Google\Chrome\Application\chrome.exe"
IF EXIST "%PROGRAMFILES(X86)%\Google\Chrome\Application\chrome.exe" SET "BROWSER=%PROGRAMFILES(X86)%\Google\Chrome\Application\chrome.exe"
IF NOT DEFINED BROWSER IF EXIST "%PROGRAMFILES(X86)%\Microsoft\Edge\Application\msedge.exe" SET "BROWSER=%PROGRAMFILES(X86)%\Microsoft\Edge\Application\msedge.exe"

IF NOT DEFINED BROWSER (
  echo Neither Chrome nor Edge was found.
  echo Please install Google Chrome: https://chrome.google.com
  pause
  exit /b 1
)

START "" "%BROWSER%" ^
  --app="%WIDGET_URL%" ^
  --window-position=%POS% ^
  --window-size=%SIZE% ^
  --no-first-run ^
  --no-default-browser-check ^
  --disable-background-networking ^
  --disable-extensions

REM NOTE: widget reads from the same Chrome localStorage as the PWA.
REM Open https://SunehoDM.github.io/labplan in Chrome to add entries.
