#! /usr/bin/env zsh

node ./scripts/txns.js| grep -v done |xargs -n 1 -P 16 ./scripts/trace-txn.zsh

for tx in $(node scripts/txns | grep -v done) ; do
  file=${tx}.puml
  svg=$(<./uml-output/${tx}.svg.txt)
  echo
  echo "#### ${tx} "
  echo
  echo "[SVG :telescope:](${svg})"
  echo "\`\`\`plantuml"
  echo
  cat "./uml-output/${file}"
  echo
  echo "\`\`\`"
  echo
done > test.md
