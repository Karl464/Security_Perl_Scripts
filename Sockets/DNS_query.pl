#!/usr/bin/perl
use strict;
use warnings;

use Net::DNS::Resolver;

my $hostname = 'perl.org';
my $res = Net::DNS::Resolver->new(
  nameservers => [qw(8.8.8.8)],
);

my $query = $res->search($hostname);

if ($query) {
  foreach my $rr ($query->answer) {
    next unless $rr->type eq "A";
    print "Found an A record: ".$rr->address;
    print "\n";
  }
}

