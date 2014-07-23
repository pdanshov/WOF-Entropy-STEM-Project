#! perl
# Double hash example.
use Data::Dumper;

%hash;

while(<>){
	chomp;
	if(/;/){
		$hash{$`}{$'}+=1;
	}
}

# This double loop prints an extra "\n" at the end and I cannot figure out why this is the case.
foreach $key1 (sort keys %hash) {
	foreach $key2 (sort keys $hash{$key1}) {
		print $key1 . " " . $key2 . ": " . $hash{$key1}{$key2} . "\n" ;
	}
}

#print Dumper(\%hash);