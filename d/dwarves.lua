---
-- This package builds dwarves
--
function dwarves()
   -- Generel
   homepage    ("<homepage>")
   .url        ("https://github.com/acmel/dwarves.git")
   .version    ("%version%")
   .description([[
      <description>
   ]])
   
   -- Build
   build()
      .shell("git checkout v%version%")
      .shell("git submodule update --recursive")
      .cmake("-D__LIB=lib")
      .make()
      .makeinstall()
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("dwarves")
      .group ("tools")
   
   -- Custom symbols
   symbol()
      .add("name"   , "dwarves")
      .add("version", "1.17")
end
