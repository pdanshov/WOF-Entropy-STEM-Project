#!/usr/bin/perl
use warnings;
use strict;
# This program sorts a list of 20 integers using insertion sort

my @list = (3,1,4,5,6,2,7,20,15,10,9,12,11,13,8,16,17,18,19,14);
#my @list = (6,2,3,1,5,4);

#print "\n";
print "\n" . join(", ", @list) . "\n\n";
#print "\n";

my $i;
my $m = 0;

for (my $j=1; $j<=19; $j++) {
	$i = 0;
	print "\n$j\n\n";
	while ($list[$j] > $list[$i]) {
		$i = $i + 1;
		print "\n$j, $i\n";
		print "\n$list[$j], $list[$i]\n\n";
	}
	$m = $list[$j];
	print "\n$m\n\n";
	for (my $k=0; $k<=$j-$i-1; $k++) {
		$list[$j-$k] = $list[$j-$k-1];
		print "\n" . join(", ", @list) . "\n\n";
	}
	$list[$i] = $m;
	print "\n" . join(", ", @list) . "\n\n";
}

print "\n" . join(", ", @list) . "\n\n";
