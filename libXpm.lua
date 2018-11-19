---
-- This package builds libXpm
--
function libXpm()
   -- Generel
   homepage    ("<homepage>")
   .url        ("https://www.x.org/releases/individual/lib/libXpm-%version%.tar.gz")
   .version    ("%version%")
   .description([[
      <description>
   ]])
   
   -- Build
   build()
      .configure("--disable-dependency-tracking")
      .make()
      .makeinstall()
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("libxpm")
      .group ("tools")
   
   -- Custom symbols
   symbol()
      .add("name"   , "libXpm")
      .add("version", "3.5.12")
end
