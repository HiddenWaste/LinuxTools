# Script to find txt files with a string within them
PATTERN=$1

find . -type f -exec grep -l "$PATTERN" {} +
