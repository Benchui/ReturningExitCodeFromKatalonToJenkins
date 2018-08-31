#!/bin/bash

abs_dirname() {
  local cwd="$(pwd)"
  local path="$1"

  while [ -n "$path" ]; do
    cd "${path%/*}"
    local name="${path##*/}"
    path="$(readlink "$name" || true)"
  done

  pwd -P
  cd "$cwd"
}


echo Environment variable KATALONSTUDIO_HOME="$KATALONSTUDIO_HOME"

PROJECT_DIR="$(abs_dirname "$0")"
echo PROJECT_DIR=$PROJECT_DIR
cd "$KATALONSTUDIO_HOME"
.\katalon.exe -noSplash -runMode=console -summaryReport -projectPath="$PROJECT_DIR%" -testSuitePath="Test Suites/TS0" -browserType=Firefox
exitCode=$?
cd /d "$PROJECT_DIR"

echo $exitCode
exit $exitCode
