---
-- This package builds libX11
--
function libX11()
   -- Generel
   homepage    ("<homepage>")
   .url        ("https://github.com/mirror/libX11/archive/libX11-%version%.tar.gz")
   .version    ("%version%")
   .description([[
      <description>
   ]])
   
   -- Build
   build()
      .shell("./autogen.sh")
      .configure("--disable-dependency-tracking")
      .make()
      .makeinstall()
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("libx11")
      .group ("tools")
   
   -- Custom symbols
   symbol()
      .add("name"   , "libX11")
      .add("version", "1.6.7")
end
