
#!/usr/bin/perl

=pod
Basic Perl Web Scraper

Execute Script using this command on terminal:
> perl Web_Scraping_Simple.pl https://scrapeme.live/shop/
> perl Web_Scraping_Simple.pl http://www.example.com/

https://www.zenrows.com/blog/perl-web-scraping

=cut


use strict;
use warnings;
use HTTP::Tiny;
use HTML::TreeBuilder;

my $usage = "./bg<url>\n"; 
my $url = shift or die $usage;

print ("$url");

# initialize the HTTP client
my $http = HTTP::Tiny->new();
# Retrieve the HTML code of the page to scrape
#my $response = $http->get('https://scrapeme.live/shop/');
my $response = $http->get($url);
my $html_content = $response->{content};
    
# Print the HTML document
print "$html_content\n";
