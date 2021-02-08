#!/usr/bin/env zsh

gawk '

BEGIN {
	diagram_count = 0
	printf("Test date: %s\n", strftime("%Y %b %d\n"))
}

/begin-test/ {
	split($0, inp, "begin-test: ")
	title = inp[2]
	printf("\n\n## %s\n", title)
	diagram_count = 0
}

/end-test/ {

}

/0x/ {
	svg = sprintf("uml-output/%s.svg.txt", $0)
	puml = sprintf("uml-output/%s.puml", $0)

  # printf("Tx: %s\n\n", $0)

	getline svg_url < svg
	svg_line = sprintf("[SVG :telescope:](%s)\n", svg_url)

	printf("##### d%d, tx: %s\n\n", ++diagram_count, $0)
	# dump svg link
	printf ("%s\n\n", svg_line)

	# dump uml
	printf("```plantuml\n")
	#while (getline<puml) {print}
	while ((getline line < puml) > 0)
			 print line
	close(puml)
	printf("```\n\n")

}

' $1 > $2
