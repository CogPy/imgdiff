#!/bin/bash
set -e

TMPFILE=`mktemp`
./imgdiff.rb $1 $2 $TMPFILE
xdg-open $TMPFILE
#rm $TMPFILE
