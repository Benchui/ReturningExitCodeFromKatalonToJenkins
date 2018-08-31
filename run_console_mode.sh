#!/bin/bash

echo KATALONSTUDIO_HOME="$KATALONSTUDIO_HOME"

SCRIPT_DIR=$(cd $(dirname $0); pwd)
echo SCRIPT_DIR=$SCRIPT_DIR
cd "$KATALONSTUDIO_HOME"
./katalon -noSplash -runMode=console -summaryReport -projectPath="$SCRIPT_DIR" -testSuitePath="Test Suites/TS0" -browserType="Firefox (headless)"
#exitCode=$?
cd "$SCRIPT_DIR"

#echo exitCode=$exitCode
#exit $exitCode
