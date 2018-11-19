---
-- This package builds texlive
--
function texlive()
   -- Generel
   homepage    ("<homepage>")
   .url        ("ftp://tug.org/texlive/historic/2018/texlive-%version%-source.tar.xz")
   .version    ("%version%")
   .description([[
      <description>
   ]])

   dependson("libX11@1.6.7" , "dependson")
   dependson("libXpm@3.5.12", "dependson")
   dependson("libXaw@1.0.13", "dependson")
   
   -- Build
   build()
      .configure("--disable-dependency-tracking", "--enable-build-in-source-tree")
      .make()
      .makeinstall()
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("texlive")
      .group ("tools")
   
   -- Custom symbols
   symbol()
      .add("name"   , "texlive")
      .add("version", "20180414")
end
