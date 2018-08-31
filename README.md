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
(TODO)
```
(Please note that I have NOT written any code to deal with exit code from `.\katalon.exe` here)


By executing this bat file in the Windows Command Prompt, I could run `TS0`. As expected `TC1` passed and `TC2` failed.

Then I put this project into GitHub and configured my Continuous Integration (Jenkins) so that it continuously build this project by executing the bat file. When I tried for the first time, in the Jenkins dashboard I found a blue ball icon for the project. ![blue_ball]() The blue ball icon means that Jenkins sees the project ran passed. PASSED? --- No, this should not be. Because the test case `TC2` always fails.

I realized that Jenkins is not informed of the failure of the test case `TC2`. Possibly I need to rewrite the `run_console_mode.bat` script.

## How to run the demonstration
