# $Id$
MACRO = ms

.PHONY: all clean

all: ../README README.ansi README.ps README.pdf

README.ansi: README.$(MACRO)
	tbl README.$(MACRO) | groff -Tutf8 -$(MACRO) > README.ansi

README.ps: README.$(MACRO)
	tbl README.$(MACRO) | groff -Tps -$(MACRO) > README.ps

../README: README.ansi
	cat README.ansi | perl -pe 's/\e\[[0-9;]*m(?:\e\[K)?//g' > ../README

README.pdf: README.ps
	gs -sDEVICE=pdfwrite -sOutputFile=README.pdf -dNOPAUSE -dBATCH README.ps

clean:
	rm -f README.ansi README.ps README.pdf
