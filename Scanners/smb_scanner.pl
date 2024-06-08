#!/usr/local/bin/perl -wu 

=pod
Basic Perl smb scan
=cut

use strict;

my @smbshares = `smbtree -N`;
my ($protShares, $shareCount)=(0)x2; 
foreach (@smbshares) {
    chomp (my $line = $_);
    if(/^[0-9A-Z]/){
        print "GROUP: ",$line, "\n";
    }elsif (/\s+\\\\[^\\]+\\([^ ]+).*/){ 
        print "\t", $1,"\n";
        $shareCount++;
        $protShares++ if ($1 = /\$$/);
    }elsif (/\s+\\\\([^\\]+)\n$/){ 
        print "MACHINE: ",$1,"\n";
    }
}
END { print "\nShares: ",$shareCount, "Protected: ",$protShares, "\n"; }