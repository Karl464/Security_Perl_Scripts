use Nmap::Scanner;
 
#  Batch scan method
 
my $scanner = new Nmap::Scanner;
$scanner->tcp_syn_scan();
$scanner->add_scan_port('1-1024');
$scanner->add_scan_port(8080);
$scanner->guess_os();
#$scanner->max_rtt_timeout(200);
$scanner->add_target('www.vulnweb.com');
 
#   $results is an instance of Nmap::Scanner::Backend::Results
my $results = $scanner->scan();
 
#  Print the results out as an well-formatted XML document
print $results->as_xml();
 
#  Event scan method using *new* easier way to set scan options.
 
my $scanner = new Nmap::Scanner;
$scanner->register_scan_started_event(\&scan_started);
$scanner->register_port_found_event(\&port_found);
$scanner->scan('-sS -p 1-1024 -O --max-rtt-timeout 200 somehost.org.net.it');
 
sub scan_started {
    my $self     = shift;
    my $host     = shift;
 
    my $hostname = $host->hostname();
    my $addresses = join(',', map {$_->addr()} $host->addresses());
    my $status = $host->status();
 
    print "$hostname ($addresses) is $status\n";
}
 
sub port_found {
    my $self     = shift;
    my $host     = shift;
    my $port     = shift;
 
    my $name = $host->hostname();
    my $addresses = join(',', map {$_->addr()} $host->addresses());
 
    print "On host $name ($addresses), found ",
          $port->state()," port ",
          join('/',$port->protocol(),$port->portid()),"\n";
 
}