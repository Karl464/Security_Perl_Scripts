#!/usr/bin/perl

=pod
Basic Perl host port dicovery

#https://metacpan.org/pod/NetworkInfo::Discovery::Scan
=cut

use NetworkInfo::Discovery;
use NetworkInfo::Discovery::Register;
use NetworkInfo::Discovery::Scan;
     
my $disc = new NetworkInfo::Discovery::Register (
    'file' => '/tmp/scan.register',
    'autosave' => 1
    )
    || warn ("failed to make new obj");
     
my $scan = new NetworkInfo::Discovery::Scan (
    hosts=>["localhost", "127.0.0.1"],
    ports=>[53,99,1000..1004],
    timeout=>1,
    'wait'=>0,
    protocol => 'tcp'
);
     
$scan->do_it();
$disc->add_interface($_) for ($scan->get_interfaces);
     
foreach my $h ($scan->get_interfaces) {
    print $h->{ip} . "\n";
    print "    has tcp ports: " . join(',',@{$h->{tcp_open_ports}}) . "\n" if (exists $h->{tcp_open_ports}) ;
}
     
$scan->{protocol} = 'tcp';
$scan->{ports} = [20..110];
$scan->do_it();
$disc->add_interface($_) for ($scan->get_interfaces);
     
foreach my $h ($scan->get_interfaces) {
    print $h->{ip} . "\n";
    print "    has tcp ports: " . join(',',@{$h->{tcp_open_ports}}) . "\n" if (exists $h->{tcp_open_ports}) ;
}