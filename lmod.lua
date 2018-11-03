---
-- This package builds lmod
--
function lmod()
   -- Generel
   homepage    ("<homepage>")
   .url        ("git://github.com/TACC/Lmod.git")
   .version    ("%version%")
   .description([[
      <description>
   ]])
   
   -- Build
   build()
      .shell("git checkout %version%")
      .configure("--with-spiderCacheDir=%install%/modulesdata/cache", "--with-updateSystemFn=%install%/modulesdata/system.txt")
      .make()
      .makeinstall()
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("lmod")
      .group ("tools")
   
   -- Custom symbols
   symbol()
      .add("name"   , "lmod")
      .add("version", "7.7.27")
end
