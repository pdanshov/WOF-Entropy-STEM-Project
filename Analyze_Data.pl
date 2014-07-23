#!/usr/bin/perl
# run perl -d script.pl to debug
use warnings;
use strict; # looks for errors in code
use Data::Dumper;
print "top\n";

				# _,.'|`'~-,_,.'|`'~-,_,.'|`'~-,_,.'|`'~-,_,.'|`'~-,_,.'|`'~-,_,.'|`'~-,_,.'|`'~-,_,.'|`'~-,_,.'|`'~-,#
				#																											#
				#           Analyse Wheel of Fortune bonus round puzzles from file				#
				#																											#
				# _,.'|`'~-,_,.'|`'~-,_,.'|`'~-,_,.'|`'~-,_,.'|`'~-,_,.'|`'~-,_,.'|`'~-,_,.'|`'~-,_,.'|`'~-,_,.'|`'~-,#

# Read the master file
open my $WoF_bonus_master, '<', 'WoF_bonus_master.txt' or die "Can't open WoF_bonus_master: $!";
# Load each line into an array
#my @WoF_bonus_master = <$WoF_bonus_master>
# Close the master file
#close $WoF_bonus_master or die "Can't close WoF_bonus_master: $!";

# Initialize a blank array to hold the results of the analysis
my %hash; # initialize a hash; ?like a python dictionary (key/value pairs)?
my %hash_two;
my %hash_three;
my $total_categories = 0;
my $char = "";
my $total_chars = 0;
my $formatted_percent;
#$hash_ref = \%hash;
#my $hash_ref = {}; # initialize a hash reference; ?like a python dictionary (key/value pairs) but can have multiple values for each key?
print "before loop\n";
while (my $line = <$WoF_bonus_master>) {
    
	chomp $line;
	if ($line =~ /^([A-Za-z ]*?);([A-Z ]*?);/) {
		#print "Matched: |$`<$&>$'|\n";  # the special match vars
		#print "Capture Groups: |$1 - $2|\n";
		if (!exists $hash{$1}) {
			$hash{$1} = 1;
			$hash_two{$1} = { 'count' => 1 };
#			my $hash1{$1} => {
#				'A' => 0,
#				'B' => 0,
#				'C' => 0,
#				'D' => 0,
#				'E' => 0,
#				'F' => 0,
#				'G' => 0,
#				'H' => 0,
#				'I' => 0,
#				'J' => 0,
#				'K' => 0,
#				'L' => 0,
#				'M' => 0,
#				'N' => 0,
#				'O' => 0,
#				'P' => 0,
#				'Q' => 0,
#				'R' => 0,
#				'S' => 0,
#				'T' => 0,
#				'U' => 0,
#				'V' => 0,
#				'W' => 0,
#				'X' => 0,
#				'Y' => 0,
#				'Z' => 0,
#			}
			#print "$1\n";
		} else {
			$hash{$1} = $hash{$1} + 1;
			$hash_two{$1}{'count'} = $hash_two{$1}{'count'} + 1;
			#print "$1\n";
		}
		$total_categories = $total_categories + 1;
		foreach $char (split //, $2) {
			print "$char=";
			if (!exists $hash_two{$1}{$char}) {
				$hash_two{$1} = { $char => 1 };
				print "$hash_two{$1}";
				print "$hash_two{$1}{$char}\n";
			} else {
				print "=$hash_two{$1}{$char}";
				$hash_two{$1}{$char} = $hash_two{$1}{$char} + 1;
				print "-$hash_two{$1}{$char}\n";
			}
			if (!exists $hash_three{$char}) {
				$hash_three{$char} = 1;
			} else {
				$hash_three{$char} = $hash_three{$char} + 1;
			}
			$total_chars = $total_chars + 1;
		}
	}
	
	#$_ = /^(.*?;)(.*?;)/;
    #print $line;
	#print $rxline;
	#print $1;
	#print $2;
	#print $_;
	#sleep(1);
	
#	s/        # start search-and-replace regexp
#  ^       # start at the beginning of this line
#  (       # save the matched characters until ')' in $1
#    .*?;  # go forward until finding the first semicolon
#    .*?   # go forward until finding... (to be continued below)
#  )
#  (       # save the matched characters until ')' in $2
#    \w    # ... the next alphanumeric character.
#  )
#	/         # continue with the replace part
#  $1;$2   # write all characters found above, but insert a ; before $2
#	/         # finish the search-and-replace regexp.
	
}
print "after loop\n";

print Dumper(\%hash);
print Dumper(\%hash_two);
print Dumper(\%hash_three);

#my @keys = sort { $hash{$a} <=> $hash{$b} } keys(%hash);
#my @vals = @hash{@keys};

#foreach (sort { ($hash{$a} cmp $hash{$b}) || ($a cmp $b) } keys %hash)
#{
#    print "$_: $hash{$_}\n";
#}

#foreach my $occurrence (sort {$a <=> $b} values %hash) {
#    print "$occurrence\n";
#}

#Display Hash Ref key/value
#$personal_info{Flintstone}{SPOUSE}
#$personal_info{Flintstone}{FIRST}

printf "%-20s %-5s %s\n", "Category", "Occur", "Percentage";
foreach my $name (sort { $hash{$a} <=> $hash{$b} or $a cmp $b } keys %hash) {
	$formatted_percent = sprintf('%.3f', $hash{$name}/$total_categories*100);
	#$formatted_percent =~ s/(\d{3})$/.$1/;
	#substr( $hash{$name}/$total_categories*100, -3, 0, '.' );
    printf "%-20s %-5s %s\n", $name, $hash{$name}, $formatted_percent;
}
printf "%-20s %s\n\n", "Total:", $total_categories;

printf "%-20s %-5s %s\n", "Category", "Occur", "Percentage";
foreach my $name (sort { $hash_three{$a} <=> $hash_three{$b} or $a cmp $b } keys %hash_three) {
	$formatted_percent = sprintf('%.3f', $hash_three{$name}/$total_chars*100);
	#$formatted_percent =~ s/(\d{3})$/.$1/;
	#substr( $hash{$name}/$total_categories*100, -3, 0, '.' );
    printf "%-20s %-5s %s\n", $name, $hash_three{$name}, $formatted_percent;
}
printf "%-20s %s\n\n", "Total:", $total_chars;

close $WoF_bonus_master or die "Can't close WoF_bonus_master: $!";

#------------------------------------------------------------
# initializing hash with three four-value pairs, among those two are having inner hashes ( Numerals, Alpha ) which have three key-value pairs in-built
#my %hashh = ( 'Numerals' => {  
#    '1'  => 'One',
#    '2' => 'Two',
#    '3' => 'Three',
#    }, 'Alpha' => {
#    'A' => 'Apple',
#    'B' => 'Ball',
#    'C' => 'Cat'
#    },
#    'I' => 'Roman One',
#    'II' => 'Roman Two'
#);
# for getting key-value pairs of above hash
#foreach(keys %hashh) {
  # by default key stored in $_ as per above foreach statement
   # checks whether value of hash is another hash
#   if(ref($hashh{$_}) eq 'HASH') {
        # iterate the keys set of inner hash
#        foreach my $inner_key (keys%{$hashh{$_}})    { 
            # printing key and value of inner hash
#            print "Key:$inner_key and value:$hashh{$_}{$inner_key}\n"; 
#        }
#    } else {
#        print "Key: $_ and Value: $hashh{$_}\n";
#    }
#}


foreach (keys %hash_two) {
  # by default key stored in $_ as per above foreach statement
   # checks whether value of hash is another hash
   if (ref($hash_two{$_}) eq 'HASH') {
        # iterate the keys set of inner hash
        foreach my $inner_key (keys %{$hash_two{$_}}) { 
            # printing key and value of inner hash
            print "key: $inner_key and value: $hash_two{$_}{$inner_key}\n"; 
        }
    } else {
        print "key: $_ and Value: $hash_two{$_}\n";
    }
}
#--------------------------------------------------------------
=comment
while ( <> ) {
	
	/ /
	
}

foreach my $key ( keys %hash ) {
	print "key: $key, value: $hash{$key}\n";
}

foreach my $key ( keys %{ $hash_ref } ) {
	print "key: $key, value: ${$hash_ref}{$key}\n";
}

#--------------------------------------------------------------
print "content-type: text/html \n\n";
# DEFINE A HASH
%coins = ( "Quarter" , 25,
           "Dime" ,    10,
           "Nickel",    5 );
# SET UP THE TABLE
print "<table border='1'>";
print "<th>Keys</th><th>Values</th>";
# EXECUTE THE WHILE LOOP
while (($key, $value) = each(%coins)){
     print "<tr><td>".$key."</td>";
     print "<td>".$value."</td></tr>";
}
print "</table>";
#--------------------------------------------------------------
=cut
