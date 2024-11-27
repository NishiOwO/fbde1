#!/bin/sh
MACRO=ms
echo -n "Generating README.ansi... "
tbl README.$MACRO | groff -Tutf8 -$MACRO > README.ansi
echo "done"
echo -n "Generating README.ps  ... "
tbl README.$MACRO | groff -Tps -$MACRO > README.ps
echo "done"
echo -n "Generating README     ... "
cat README.ansi | perl -pe 's/\e\[[0-9;]*m(?:\e\[K)?//g' > ../README
echo "done"
gs -sDEVICE=pdfwrite -sOutputFile=README.pdf -dNOPAUSE -dBATCH README.ps
