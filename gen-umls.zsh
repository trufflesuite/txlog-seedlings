#! /usr/bin/env zsh
CPU_CORES=16

node txns.js | grep -v done | xargs -n 1 -P ${CPU_CORES} ./trace-txn.zsh
