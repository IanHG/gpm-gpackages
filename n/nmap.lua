---
-- This package builds nmap
--
function nmap()
   -- Generel
   homepage    ("https://nmap.org")
   .url        ("https://nmap.org/dist/nmap-%version%.tar.bz2")
   .version    ("%version%")
   .description([[
Nmap ("Network Mapper") is a free and open source (license) utility for network discovery and security auditing. 
Many systems and network administrators also find it useful for tasks such as network inventory, 
managing service upgrade schedules, and monitoring host or service uptime. 
Nmap uses raw IP packets in novel ways to determine what hosts are available on the network, 
what services (application name and version) those hosts are offering, what operating systems (and OS versions) they are running, 
what type of packet filters/firewalls are in use, and dozens of other characteristics. 
It was designed to rapidly scan large networks, but works fine against single hosts. 
Nmap runs on all major computer operating systems, and official binary packages are available for Linux, Windows, and Mac OS X. 
In addition to the classic command-line Nmap executable, the Nmap suite includes an advanced GUI and results viewer (Zenmap), 
a flexible data transfer, redirection, and debugging tool (Ncat), a utility for comparing scan results (Ndiff), 
and a packet generation and response analysis tool (Nping). 

https://nmap.org/
   ]])
   
   -- Build
   build()
      .configure("--without-zenmap")
      .make()
      .make_install()
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("nmap")
      .group ("tools")
   
   -- Custom symbols
   symbol()
      .add("name"   , "nmap")
      .add("version", "7.80")
end
