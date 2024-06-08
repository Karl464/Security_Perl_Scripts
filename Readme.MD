# General description
Current scripts are related to security activities, like, web scraping, sniffing, socket connection, fuzzer, or similar activities.
Based on [https://metacpan.org/](https://metacpan.org/)

# Environment preparation

## Install VSC debug extentions + dependencies
In order to use the debug options use:
[https://open-vsx.org/vscode/item?itemName=richterger.perl](https://open-vsx.org/vscode/item?itemName=richterger.perl)


## Perl modules installation prerequisites
To instlal modules cpanm will be require, fallow next instructions:
[https://learn.perl.org/modules/](https://learn.perl.org/modules/)

> sudo apt-get install cpanminus


## Create a virtual enviroment

Use some of the next libraries to create a vrtual enviroment:
[cpanm](https://metacpan.org/pod/App::Virtualenv)
or
[https://metacpan.org/pod/local::lib](https://metacpan.org/pod/local::lib)


## Install nmap extentions
In order to use the debug options use:
[https://metacpan.org/pod/Nmap::Scanner](https://metacpan.org/pod/Nmap::Scanner)
> sudo cpanm install Nmap::Parser
> sudo cpanm install Nmap::Scanner --force
> apt-get install libnet-pcap-perl   #prerequirement for NetworkInfo::Discovery >> Net::Pcap
> sudo cpanm install NetworkInfo::Discovery --force
> sudo cpanm install NetworkInfo::Discovery::Nmap --force

## Sniffer

Try: [https://github.com/lmayorga1980/sniffy/blob/main/sniffy.pl](https://github.com/lmayorga1980/sniffy/blob/main/sniffy.pl)
  

# References

[https://www.perl.org/cpan.html](https://www.perl.org/cpan.html)

