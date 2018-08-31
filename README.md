How to return Exit Code from Katalon to Jenkins
===============================================

This is a [Katalon Studio](https://www.katalon.com/) project for demonstration purpose. You can clone this out to your PC and run it using your Katalon Studio.

This project was developed using Katalon Studion v5.5

This objective of this project is to provide a working example solution to the discussion posted in the Katalon Forum:

- [Console Mode and Returning Exit Status](https://forum.katalon.com/discussion/5292/console-mode-and-returning-exit-status)

## Problem to solve

I have made a simple Katalon studio project, which has a test suite named `TS0` which invokes 2 test cases named `TC1` and `TC2`. The TC1 always success while the TC2 always fails. Consequently the TS0 always has 1 failure when finished.

I have made a Windows batch file named `run_console_mode.bat`. By executing this bat file in the Windows Command Prompt, I could run the `TS0`.

Then I put this project into GitHub and configured my Jenkins, Continuous Integration server, to execute this project by calling the `run_console?mode.bat`

When I tried for the first time, in the Jenkins dashboard I found a blue ball for the project. This means that Jenkins sees the project ran successfully.

Ran successfully? --- No, this should not be so. Because the test case `TC2` is coded to fail always.

I realized that Jenkins is not informed of the failure of the test case `TC2`. Possibly I need to rewrite the `run_console_mode.bat` script.

## How to run the demonstration
 
