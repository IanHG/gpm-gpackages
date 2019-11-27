---
-- This package builds m4
--
function m4()
   -- Generel
   homepage    ("<homepage>")
   .url        ("https://ftp.gnu.org/gnu/m4/m4-%version%.tar.bz2")
   .version    ("%version%")
   .description([[
      <description>
   ]])
   
   -- Build
   build()
      .configure()
      .make()
      .make_install()
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("m4")
      .group ("tools")
   
   -- Custom symbols
   symbol()
      .add("name"   , "m4")
      .add("version", "1.4.18")
end
