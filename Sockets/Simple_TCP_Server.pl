=pod
Basic Perl TCP Server Socket
=cut

use IO::Socket; 
use strict;
use warnings;
my $socket = new IO::Socket::INET ( 
    LocalHost => 'localhost',
    LocalPort => '12345',
    Proto => 'tcp',
    Listen => 1,
    Reuse => 1,
);
die "Could not create socket: $!n" unless $socket; 
print "Waiting for the client to send datan"; 
my $new_socket = $socket->accept();
while(<$new_socket>) {
    print "\n";
    print $_;
}
print "\n";
close($socket);