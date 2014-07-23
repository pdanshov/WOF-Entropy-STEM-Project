#!/bin/perl
# Match variables

if ( "Hello there, neighbor" =~ /\s(\w+),/ ) {
	print "That was ($`)($&)($').\n";
}
print "Matched: |$`<$&>$'|\n";