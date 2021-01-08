#! /usr/bin/env zsh

# update local truffle command
# xargs (on arch) seems to not respect the use-truffle-core alias
TRUFFLE=~/work/truffle/packages/core/cli.js


# execute `truffle run tx2seq --compile-tests TXN` against the last 3 transactions on Ganache
node txns.js | grep -v done | tail -3 | xargs -n 1 node "${TRUFFLE}" run tx2seq --compile-tests > out
