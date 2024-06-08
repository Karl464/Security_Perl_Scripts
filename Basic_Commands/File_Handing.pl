#!/usr/bin/perl

=pod
Basic Perl queries for:
file handling
=cut

use warnings;
use strict;

print"-------------------- file handling -----------------------\n";

my $filename = 'file.txt';
open(FH, '<', $filename) or die $!;
while(<FH>)
{
   print $_;
}
close(FH);


print"\n-------------------- file handling - read pointer position-----------------------\n";

open(FH, "BasicCommands.pl");
while(<FH>)
{
    $a=tell FH;     # Now check the position of read pointer.
    print "$a-";
}

print"\n-------------------- file handling - move read position -----------------------\n";

open(FH, "file.txt");

seek FH, 5, 0; # This will start reading data after 5 bytes.

while(<FH>)
{
    #print $_;
    $a=tell FH;     # Now check the position of read pointer.
    print "$a-";
}

$/ = undef;
#$out = "" ;
# print $out;

close FH;

print"\n-------------------- file handling - scrap dir Windows-----------------------\n";

opendir(my $DIR,"C:\\Users\\[user]\\Documents\\Development\\");

my @content = readdir($DIR);
foreach(@content)
{
    print "$_\n";
}
closedir($DIR);



