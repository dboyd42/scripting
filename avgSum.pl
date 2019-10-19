#!/usr/bin/perl
# Copyright 2019 David Boyd, all rights reserved
# Program: Average Sum Calculator
# Description:
#     This program calculcates the sum and average of n numbers.
# Date: Fri Oct 18 19:58:19 CDT 2019
# Revised:
#     <revision date>

# Vars
$average = 0;
$size = 10;
$sum = 0;


# Get user input
if (@ARGV) {
    @numbers = @ARGV;
} else {
    print "Input numbers 10 numbers\n";
    #chomp ($nums);
    #@numbers = split (/\d+/, $nums);
    #Requires <CR> between numbers
    for ($i=1; $i<$size+1; ++$i) {
        print "Input #${i}: ";
        chomp ($num = <STDIN>);
        push @numbers, $num;
    }

}
$numbers_length = @numbers;

calculate_sum();
calculate_avg();

# Display results
print "Sum    : $sum \n";
print "Average: $average \n";

# Calculate the sum
sub calculate_sum {
    foreach $element (@numbers) {
        $sum += $element;
    }
}
# Calculate average
sub calculate_avg {
    $average = ($sum / $numbers_length);
}

