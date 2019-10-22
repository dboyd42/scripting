#!/usr/bin/perl
# Copyright 2019 David Boyd, all rights reserved
# Program: avg Sum Calculator
# Description:
#     This program calculates the sum and avg of n numbers.
# Date: Fri Oct 18 19:58:19 CDT 2019
# Revised:
#     Mon Oct 21 16:26:36 CDT 2019

### Variables                                                               ###
$size_restriction = 10;
$numbers_length = 0;

### Run main program                                                        ###
main();

### Functions                                                               ###
sub avgArray {
    $avg = ($sum / $numbers_length);
}
sub display_prgmName() {
    print "\n\n";
    print "\t\t++============================++\n";
    print "\t\t|| Sum And Average Calculator ||\n";
    print "\t\t++============================++\n";
    print "\n\n";
}
sub display_results() {
    print "Sum: $sum \n";
    print "Avg: $avg \n";
}
sub main {
    display_prgmName();
    setArray();
    sumArray();
    avgArray();
    print "\n";
    display_results();
    print "\nTotals";
    print "\n======\n";
    pretty_print();
}
sub pretty_print() {
    print "Array values | @numbers\n";
    print "Array size   | $numbers_length\n";
    print "Sum          | $sum\n";
    print "Avg          | $avg\n";
}
sub setArray {
    if (@ARGV) {
        @numbers = @ARGV;
    } else {
        print "Input 10 numbers\n";
        for ($i=1; $i<$size_restriction+1; ++$i) {
            print "Input #${i}: ";
            chomp ($num = <STDIN>);
            push @numbers, $num;
        }

    }
    $numbers_length = @numbers;
}
sub sumArray {
    foreach $element (@numbers) {
        $sum += $element;
    }
}

