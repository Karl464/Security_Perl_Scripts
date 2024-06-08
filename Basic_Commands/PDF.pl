#!/usr/bin/perl -w 

=pod
https://metacpan.org/pod/PDF::API2
=cut

use strict;
use PDF::API2;

# Create a blank PDF file
my $pdf = PDF::API2->new();
my $font = $pdf->ttfont('fonts/calibri.ttf');
my $page = $pdf->page();
my $lineNum = 700; # start at 700.
my $fontSize = 20; # start with Header size my $margin = 20; # the left margin for text # Add some text to the page
my $text = $page->text(); 
sub fSC ($); # prototype 
sub nextline():