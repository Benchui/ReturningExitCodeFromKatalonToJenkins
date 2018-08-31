How to return Exit Code from Katalon to Jenkins
===============================================

This is a [Katalon Studio](https://www.katalon.com/) project for demonstration purpose. You can clone this out to your PC and run it using your Katalon Studio.

This project was developed using Katalon Studion v5.5

This objective of this project was to propose a solution to the discussion posted in the Katalon Forum:

- [Console Mode and Returning Exit Status, 02/21/2018](https://forum.katalon.com/discussion/5292/console-mode-and-returning-exit-status)

## Problem to solve

I made a simple Katalon Studio project, which has a test suite named `TS0`. It invokes 2 test cases named `TC1` and `TC2`. The TC1 always gets success while the TC2 always fails. Consequently the TS0 always finishes with 1 failure.

I wanted to execute the test suite in console. I read the documentation of [Console Mode Execution](https://docs.katalon.com/display/KD/Console+Mode+Execution). I made a Windows batch file named `run_console_mode.bat`. Its initial version was like this:
```
@echo off
echo KATALONSTUDIO_HOME="%KATALONSTUDIO_HOME%"

set DIR=%~dp0
set SCRIPT_DIR="%DIR:~0,-1%"
echo SCRIPT_DIR="%PROJECT_DIR%"
cd "%KATALONSTUDIO_HOME%"

.\katalon.exe -noSplash -runMode=console -summaryReport -projectPath="%PROJECT_DIR%" -testSuiteCollectionPath="Test Suites\Execute_headless" --config -proxyOption=MANUAL_CONFIG -proxy.server.type=HTTP -proxy.server.address="http://172.24.2.10" -proxy.server.port="8080"
cd /d "%SCRIPT_DIR%"

echo done
```
(Please note that I have NOT written any code to deal with exit code from `.\katalon.exe` here)


By executing this bat file in the Windows Command Prompt, I could run `TS0`. As expected `TC1` passed and `TC2` failed.

Then I put this project into GitHub and configured my Continuous Integration (Jenkins) so that it continuously build this project by executing the bat file.

When I tried for the first time, in the Jenkins dashboard I found a blue ball for the project.

This means that Jenkins sees the project ran successfully.

Ran successfully? --- No, this should not be so. Because the test case `TC2` is coded to fail always.

I realized that Jenkins is not informed of the failure of the test case `TC2`. Possibly I need to rewrite the `run_console_mode.bat` script.

## How to run the demonstration
