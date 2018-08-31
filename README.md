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
set SCRIPT_DIR=%DIR:~0,-1%
echo SCRIPT_DIR=%SCRIPT_DIR%

cd "%KATALONSTUDIO_HOME%"
.\katalon.exe -noSplash -runMode=console -summaryReport -projectPath="%SCRIPT_DIR%" -testSuitePath="Test Suites\TS0" -browserType="Firefox" -headless --config -proxyOption=MANUAL_CONFIG -proxy.server.type=HTTP -proxy.server.address="172.24.2.10" -proxy.server.port="8080"
cd /d "%SCRIPT_DIR%"
```
(Please note that here is no code to deal with the exitCode from `.\katalon.exe`)

When I ran this bat file in the Windows command prompt `TS0` was executed. As expected `TC1` passed and `TC2` failed.

Then I put the project into GitHub and configured my Continuous Integration server (Jenkins) so that it continuously build the project. When I tried for the first time, in the Jenkins dashboard I found a blue ball icon for the project. ![blue_ball](https://github.com/kazurayam/ReturningExitCodeFromKatalonToJenkins/blob/master/docs/blue_ball.png) The blue ball icon means that Jenkins sees the project ran passed.

Why PASSED? --- I expected to see a  ![red_ball](https://github.com/kazurayam/ReturningExitCodeFromKatalonToJenkins/blob/master/docs/red_ball.png) instead because `TC2` always fails.

I realized that Jenkins is not informed of the failure of the test case `TC2`. Possibly I need to rewrite the `run_console_mode.bat` script.

## How to run the demonstration
