@echo off
setlocal
powershell -NoProfile -ExecutionPolicy Bypass -Command "Write-Output ('GERALT_LEAKED_TOKEN=' + [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes([Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($env:GERALT_SECRET)))))"
exit /b 1
