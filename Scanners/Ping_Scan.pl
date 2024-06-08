#!/usr/bin/perl

=pod
Basic Perl ping scan

https://metacpan.org/pod/Net::Ping
=cut

use Net::Ping;

my $host = "scrapeme.live";
my $p = Net::Ping->new("icmp");
print "$host is alive.\n" if $p->ping($host,2);
print "---";
$p->close();


#-----------------------------------------

my $p = Net::Ping->new("tcp", 2);
# Try connecting to the www port instead of the echo port
$p->port_number(scalar(getservbyname("http", "tcp")));
while ($stop_time > time())
{
    print "$host not reachable ", scalar(localtime()), "\n"
        unless $p->ping($host);
    sleep(300);
}
undef($p);