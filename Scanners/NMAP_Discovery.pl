use NetworkInfo::Discovery::Nmap;
 
my $scanner = NetworkInfo::Discovery::Nmap->new(
    hosts => [ qw( 10.0.2.0/24 ) ], 
);
$scanner->do_it;