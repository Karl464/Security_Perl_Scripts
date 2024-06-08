#!/usr/bin/perl-w 

=pod

https://metacpan.org/pod/LWP::UserAgent

=cut


use strict;
use LWP::UserAgent;

my $ua = LWP::UserAgent->new; 
$ua->agent ("Mozilla/5.0 (Windows; U; Windows NT 6.2 en-US; rv:1.9.2.18) Gecko/20110614 Firefox/4.5.5"); 

my $response = $ua->get('http://scrapeme.live');  #http://example.com
 
if ($response->is_success) {
    print $response->decoded_content;
}
else {
    die $response->status_line;
}

print ("\n-----------------------------------\n");

my @lines = split (/\n/, $response->content);
foreach (@lines) {
    print $_."\n" if ($_ =~ m/<img.+src=("|').*>/);
}

