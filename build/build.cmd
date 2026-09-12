@echo off
REM Build script for PascalStack — Pure Pascal (no Python)
setlocal
set ROOT=%~dp0..
set OUT=%ROOT%\build\out
if not exist "%OUT%" mkdir "%OUT%"
echo === PascalStack Build (Pure Pascal) ===
echo Root: %ROOT%

where fpc >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
  echo FPC not found — running PowerShell fallback verification
  powershell -ExecutionPolicy Bypass -File "%ROOT%\build\build.ps1"
  exit /b %ERRORLEVEL%
)

echo FPC found
echo Compiling Verify.pas...
fpc -Mdelphi -Sh -O2 -FE"%OUT%" "%ROOT%\tools\Verify.pas"
if %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%
"%OUT%\Verify.exe"
if %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%

echo Compiling TestRunner.pas...
fpc -Mdelphi -Sh -O2 -FE"%OUT%" "%ROOT%\tests\TestRunner.pas"
if %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%
"%OUT%\TestRunner.exe"
if %ERRORLEVEL% NEQ 0 exit /b %ERRORLEVEL%

echo Build complete — STATICALLY VERIFIED
exit /b 0
