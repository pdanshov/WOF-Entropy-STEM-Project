#! perl
# Double hash example.
use warnings;
use strict;
use Data::Dumper;

my %hash;

my $total_categories = 0;
my $char = "";
my $total_chars = 0;
my $total_puzzles = 0;
my $formatted_percent;

open my $WoF_bonus_master, '<', 'WoF_bonus_master_corrected.txt' or die "Can't open WoF_bonus_master_corrected: $!";

open (my $outfile, ">Results.txt");
print $outfile "";
close ($outfile);

open ($outfile, ">>Results.txt");

while(my $line = <$WoF_bonus_master>){
	chomp $line;
#	if($line =~ /^([A-Za-z ]*?);([A-Z ]*?);/){
	if($line =~ /^(.*?);(.*?);/){
		if (!exists $hash{$1}) {
			$hash{$1}{"puzzles"}=1;
			$total_categories+=1;
		} else {
			$hash{$1}{"puzzles"}+=1;
		}
		foreach my $char (split //, $2) {
			if (!exists $hash{$1}{$char}) {
				$hash{$1}{$char}=1;
				$hash{$1}{"cat_chars"}+=1;
				$hash{$1}{"cat_count"}+=1;
				$total_chars+=1;
			} else {
				$hash{$1}{$char}+=1;
				$hash{$1}{"cat_count"}+=1;
				$total_chars+=1;
			}
		}
		$total_puzzles+=1;
	}
}

#printf $outfile "%-20s %-5s %s\n", "Category", "Occur", "Percentage";
#foreach my $category (sort keys %hash) {
#	foreach my $data (sort keys $hash{$category}) {
#		$formatted_percent = sprintf('%.3f', $hash{$category}/$total_categories*100);
		#$formatted_percent =~ s/(\d{3})$/.$1/;
		#substr( $hash{$name}/$total_categories*100, -3, 0, '.' );
#		printf $outfile "%-20s %-5s %s\n", $category, $hash{$category}, $formatted_percent;
#	}
#}
#printf $outfile "%-20s %s\n\n", "Total:", $total_categories;

printf $outfile "%-20s %-15s %-10s %-s\n\n", "Category", "Data", "Count", "Cat_Percent";
# This double loop prints an extra "\n" at the end and I cannot figure out why this is the case.
foreach my $key1 (sort keys %hash) {
	foreach my $key2 (sort keys $hash{$key1}) {
		$formatted_percent = sprintf('%.3f', $hash{$key1}{$key2}/$hash{$key1}{"cat_count"}*100);
		printf $outfile "%-20s %-15s %-10s %-s\n", $key1, $key2, $hash{$key1}{$key2}, $formatted_percent;
	}
	print $outfile "\n";
}
print $outfile "Total Categories: " . $total_categories . "\n";
print $outfile "Total Puzzles: " . $total_puzzles . "\n";
print $outfile "Total Characters: " . $total_chars . "\n";
close ($outfile);
#print Dumper(\%hash);

