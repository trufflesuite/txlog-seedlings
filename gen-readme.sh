#! /usr/bin/env bash


echo "# Transactions of note"
sed 's:svg:png:' out | sed '/^$/d' | sed 's/Plantuml specs written to: //' | sed 's:.puml::' |
while IFS= read -r url; do
  read -r name
  #$(wget "$url" -O "${name}.png")
  echo "## ${name}"
  echo "<details><summary>uml</summary>"
  printf "\n"
  echo "'''"
  printf "\n"
  cat "./uml/${name}.puml"

  echo "'''"
  printf "\n"
  echo "</details>"
  printf "\n"
  echo "![](./uml/${name}.png)"
done
