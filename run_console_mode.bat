@echo off

echo KATALONSTUDIO_HOME="%KATALONSTUDIO_HOME%"

set DIR=%~dp0
set SCRIPT_DIR=%DIR:~0,-1%
echo SCRIPT_DIR=%SCRIPT_DIR%
cd "%KATALONSTUDIO_HOME%"
.\katalon.exe -noSplash -runMode=console -summaryReport -projectPath="%SCRIPT_DIR%" -testSuitePath="Test Suites\TS0" -browserType="Firefox (headless)" --config -proxyOption=MANUAL_CONFIG -proxy.server.type=HTTP -proxy.server.address="172.24.2.10" -proxy.server.port="8080"
set exitCode=%ERRORLEVEL%
cd /d "%SCRIPT_DIR%"

echo exitCode=%exitCode%
exit /B %exitCode%
