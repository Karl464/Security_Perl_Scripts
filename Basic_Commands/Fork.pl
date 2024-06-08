#!/usr/bin/perl -w

=pod
Basic Perl query for fork
=cut

system("curl -s http://www.vulnweb.com/ &");
print "This print function came AFTER the curl request!\n";