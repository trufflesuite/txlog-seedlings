#!/usr/bin/env zsh

gawk -v url=$3 '

BEGIN {
	diagram_count = 0
	printf("Test date: %s\n", strftime("%Y %b %d\n"))
}

/begin-test/ {
	split($0, inp, "begin-test: ")
	title = inp[2]

  cmd = sprintf("ag -Q --vimgrep --js \"%s\" | cut -d \":\" -f1,2 | sed \"s/:/#L/\"", title)
  cmd | getline fn
  close(cmd);
  gh_url = sprintf("%s%s", url, fn)
	printf("\n\n## %s\n", title)
  printf("[link to test...](%s)\n\n", gh_url);

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
