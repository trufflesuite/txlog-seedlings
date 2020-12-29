#! /usr/bin/env zsh
TRUFFLE=~/work/truffle/packages/core/cli.js

# options
COMPILE_TESTS="--compile-tests"
SHORT_PARTICIPANT_NAMES="--short-participant-names"

echo "processing tx: $1"

node $TRUFFLE run tx2seq \
  ${COMPILE_TESTS} \
  ${SHORT_PARTICIPANT_NAMES} \
  $1 || echo "TXN FAILED: $1"
