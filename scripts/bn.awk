#! /usr/bin/env zsh

ls ./uml-output/*.js | xargs -n 1 gawk -i inplace '

BEGINFILE { print "const BigNumber = require(\"bignumber.js\");\n\nconst txlog = " }
ENDFILE   { print "\nmodule.exports = txlog;" }
      { print gensub(/<BN:[[:space:]]([[:xdigit:]]+)>/, "BigNumber(\"0x\\1\")", "g", $0) }
'

