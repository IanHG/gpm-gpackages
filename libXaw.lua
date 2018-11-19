---
-- This package builds libXaw
--
function libXaw()
   -- Generel
   homepage    ("<homepage>")
   .url        ("https://www.x.org/releases/individual/lib/libXaw-%version%.tar.gz")
   .version    ("%version%")
   .description([[
      <description>
   ]])

   dependson("libX11@1.6.7",  "dependson")
   dependson("libXpm@3.5.12", "dependson")
   
   -- Build
   build()
      .configure("--disable-dependency-tracking")
      .make()
      .makeinstall()
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("libXaw")
      .group ("tools")
   
   -- Custom symbols
   symbol()
      .add("name"   , "libXaw")
      .add("version", "1.0.13")
end
