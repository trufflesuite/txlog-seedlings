#! /usr/bin/env zsh
TRUFFLE=~/work/truffle/packages/core/cli.js
# node txns.js| grep -v done | xargs -n 1 node $TRUFFLE run tx2seq --compile-tests --short-participant-names > out
node txns.js| grep -v done | xargs -n 1 node $TRUFFLE run tx2seq > out
