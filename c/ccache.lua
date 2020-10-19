---
-- This package builds ccache
--
function ccache()
   -- Generel
   homepage    ("<homepage>")
   .url        ("https://github.com/ccache/ccache/releases/download/v%version%/ccache-%version%.tar.gz")
   .version    ("3.7.1")
   .description([[
      <description>
   ]])
   
   -- Build
   build()
      .configure("--enable-more-warnings --enable-tracing")
      .make()
      .make_install()
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("ccache")
      .group ("tools")
   
   -- Custom symbols
   symbol()
      .add("name"   , "ccache")
end
