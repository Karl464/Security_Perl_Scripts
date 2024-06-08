#!/usr/bin/perl

=pod
Basic Perl queries for:
array managment
file calls
=cut

##-------------------- Print ------------------------
print "Hello, World\n";
$num = 7;

$txt = 'it is $num'; 
print $txt;
print "\n";

$txt = "it is $num"; 
print $txt;
print "\n";


$txt = "it is $num\n"; 
print $txt;

##-------------------- Arrays ------------------------

my @array=(a,b,c,d);
print @array;
print "\n";
print $size=scalar (@array);
print "\n";


print"-------------------- push, pop, shift, and unshift for Perl arrays function -----------------------\n";

@days = ("Mon","Tue","Wed");
print "1st : @days\n";
push(@days, "Thu"); # adds one element at the end of an array
print "2nd when push : @days\n";
unshift(@days, "Fri"); # adds one element at the beginning of an array
print "3rd when unshift : @days\n";
pop(@days);
print "4th when pop : @days\n"; # remove one element from the last of an array.
shift(@days); # remove one element from the beginning of an array.
print "5th when shift : @days\n";


print"-------------------- file handling -----------------------\n";

#open file.txt in read-only mode
open(DATA, "<file.txt") or die "Couldn't open file file.txt, $!";  

while(<DATA>) {
   print "$_";
}

close(DATA);

#open file.txt in write mode, with concatenation of strings ">>"
open(DATAW, ">>file_w.txt") or die "Couldn't open file file.txt, $!";

$datestring = localtime();
print DATAW "Local date and time $datestring\n";


print"-------------------- Multi Line print -----------------------\n";

my $multiline = <<"ML"; # notice tabs!
This is a multi line string in Perl
using the simple Here Document operator. Thanks for reading!
Goodbye!
ML

print $multiline;


print"-------------------- grep on perl -----------------------\n";

my @passwd = ("123password", "mypass00", "secr3tPASSWORD", "ultraPassWORD", "password_2015",
            "fb_password_011","secret6667", "H1KING3343","1337 secrets_MS");

print $_ ."\n" foreach (grep (/pass/i,@passwd));