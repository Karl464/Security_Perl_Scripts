
#!/usr/bin/perl -w

use strict;

system("cat /etc/passwd 2>/dev/null");


print "\n -------------------------- list passwords ----------------------\n";

my @passwds = `cat /etc/passwd`; foreach (@passwds) 
{ 
#    print "$_"; 
    print if (m/^root:/);
}

