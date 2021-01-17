#!/usr/bin/zsh

gawk '

BEGIN {
	url = ""
}

/https/ {
	url = $0
}

/^Plantuml/ {
	split($0, pieces, "uml-output/")
	tx = pieces[2]
	sub(/.puml$/, "", tx)
	svg = sprintf("[click for SVG render](%s)\n", url)
	printf("## %s\n\n%s\n\n", tx, svg)
	fn = sprintf("uml-output/%s.puml", tx);
	printf("```plantuml\n\n")
	while(getline<fn){print}
	printf("```\n\n")
}

' ./out
