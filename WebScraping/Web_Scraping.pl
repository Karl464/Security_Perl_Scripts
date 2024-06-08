
#!/usr/bin/perl use strict;

=pod
Basic Perl Web Graber
use this command on terminal:
> perl Web_Scraping.pl 192.168.1.2 80
> perl Web_Scraping.pl example.com 80
=cut


use IO::Socket;
use LWP::UserAgent;
use LWP::Protocol::https; #in case of HTTPS
use List::Compare; #compare web pages

my $ua = LWP::UserAgent->new; # now spoof a UA:
$ua->agent ("Mozilla/5.0 (Windows; U; Windows NT 6.1 en-US; rv:1.9.2.18) Gecko/20110614 Firefox/4.5.10");
$ua->from('admin@cyber2labs.com'); 
$ua->timeout (18);  # setup a timeout 

my $usage = "./bg<host> <port>\n"; 
my $host = shift or die $usage;
my $port = shift or die $usage;
my $buf; # buffer for returned result
my $web= 0;     #a token for web

my $sock = IO::Socket::INET->new(PeerAddr => $host,PeerPort => $port,
                    Proto =>"tcp") || die "Cannot connect to ".$host; 

$sock->send("HEAD / HTTP/1.1\r\n");
$sock->send("\r\n"); 
$sock->send("\r\n"); 
$sock->recv($buf, 2048);

my @buf = split("\n", $buf);

foreach (@buf){
    if (m/^Server:(.*)/){
            print "Web Server Found: ",$1,"\n";   #prints server header
            $web++;
        }
}

if ($web){ #this is a confirmed web server
    print("this is a confirmed web server");
    foreach("html","htm","php","asp","aspx", "cfn","txt","html.backup"){
        if(page("index.".$_)){
            print "Page: ","index.".$_."\n";
            foreach (@content){
                print "File: ".$2,"\n" 
                if (m/<a.*href=("|')([^"']+)("|')/);
            }
            last; # we found the page
        }
    }

} 

sub page { #check for pages
    my $res = $ua->get("http://".$host.":".$port."/".$_[0]);
    if ($res->is_success) {
    @content = split(/\015?\012/,$res->content);
    return $_[0];
    }
    return 0;
}

END {
    $sock->close()  if $sock;
}