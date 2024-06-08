#!/usr/bin/perl

=pod
Basic Perl NetBIOS discovery

=cut

use NetworkInfo::Discovery::NetBIOS;
 
my $scanner = new NetworkInfo::Discovery::NetBIOS hosts => [ qw(10.0.2.15/24) ];
$scanner->do_it;
     
for my $host ($scanner->get_interfaces) {
    printf "<IP: %s> NetBios(NODE(hostname):%s ZONE(Domain):%s)\n", $host->{ip}, 
        $host->{netbios}{node}, $host->{netbios}{zone};
}
