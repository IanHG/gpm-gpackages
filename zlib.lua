---
-- This package builds zlib
--
function zlib()
   -- Generel
   homepage    ("<homepage>")
   .url        ("https://zlib.net/zlib-%version%.tar.gz")
   .version    ("%version%")
   .description([[
      <description>
   ]])
   
   -- Build
   build()
      .configure()
      .make()
      .makeinstall()
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("zlib")
      .group ("tools")
   
   -- Custom symbols
   symbol()
      .add("name"   , "zlib")
      .add("version", "<version>")
end
