#! /usr/bin/env zsh

for file in *puml; do
	echo
	echo "## ${file:r} "
	echo
	echo "\`\`\`plantuml"

	cat ${file}
	echo
	echo "\`\`\`"
	echo
done > test.md
