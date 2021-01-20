#! /usr/bin/env zsh

for tx in $(node txns.js| grep -v done) ; do
  file=${tx}.puml
  svg=$(<./uml-output/${tx}.svg.txt)
  echo
  echo "## ${tx} "
  echo
  echo "[SVG :telescope:](${svg})"
  echo "\`\`\`plantuml"
  echo
  cat "./uml-output/${file}"
  echo
  echo "\`\`\`"
  echo
done > test.md
