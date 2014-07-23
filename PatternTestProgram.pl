#!/bin/perl
# Pattern Test Program

while ( <> ) {
	chomp;								# Take one input line at a time
	if (/^.*?;.*?;/) {
		print "Matched: |$`<$&>$'|\n";  # the special match vars
	  } else {
		print "No match: |$_|\n";
	  }
}