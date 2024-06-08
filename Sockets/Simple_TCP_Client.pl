=pod
Basic Perl TCP Client Socket
=cut

use strict;
use warnings;
use IO::Socket;

my $socket = new IO::Socket::INET (
PeerAddr => 'localhost',
PeerPort => '12345',
Proto => 'tcp',
);

die "Could not create socket: $!n" unless $socket;

print $socket "Hello this is socket connection!n";

close($socket);