#! /usr/bin/env zsh

for tx in $(node txns.js| grep -v done) ; do
	file=${tx}.puml
	echo
	echo "## ${tx} "
	echo
	echo "\`\`\`plantuml"
  echo
	cat "./uml-output/${file}"
	echo
	echo "\`\`\`"
	echo
done > test.md


#for file in *puml; do
	#echo
	#echo "## ${file:r} "
	#echo
	#echo "\`\`\`plantuml"
#
	#cat ${file}
	#echo
	#echo "\`\`\`"
	#echo
#done > test.md
