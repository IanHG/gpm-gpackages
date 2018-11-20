---
-- This package builds xorg-macros
--
function xorg_macros()
   -- Generel
   homepage    ("<homepage>")
   .url        ("https://github.com/freedesktop/xorg-macros/archive/util-macros-%version%.tar.gz")
   .version    ("%version%")
   .description([[
      <description>
   ]])
   
   -- Build
   build()
      .shell("./autogen.sh")
      .configure()
      .make()
      .makeinstall()
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("xorg_macros")
      .group ("tools")
      .prepend_path("ACLOCAL_PATH", "share/aclocal")
   
   -- Custom symbols
   symbol()
      .add("name"   , "xorg-macros")
      .add("version", "1.19.1")
end
