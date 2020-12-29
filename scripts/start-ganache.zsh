#!/usr/bin/env zsh

# ts on os x: brew install task-spooler
# tsp on linux
if command -v tsp &> /dev/null; then
  TASKSPOOLER=tsp
  echo "Using tsp"
elif command -v ts &> /dev/null; then
  TASKSPOOLER=ts
  echo "Using ts"
fi

"$TASKSPOOLER" ganache-cli --noVMErrorsOnRPCResponse
