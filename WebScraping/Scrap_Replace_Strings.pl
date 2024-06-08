#!/usr/bin/perl -w

=pod
Perl web scraping with string replacement
=cut

use strict;
use IO::Socket;

#my $url = $ARGV[0] or die "please provide a URL";
my $url = "https://scrapeme.live/";
my @html = `curl $url 2>/dev/null`;

#print @html;

foreach my $line (@html) {
  if ($line =~ m/<img.src=/) {
  $line =~ s/<img.src=["']//; # remove beginning of HTML tag
  $line =~ s/["'].*//; # greedily remove everything after the SRC attribute 
  print $line;
  }
}