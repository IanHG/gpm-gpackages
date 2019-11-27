---
-- This package builds flex
--
function flex()
   -- Generel
   homepage    ("<homepage>")
   .url        ("https://github.com/westes/flex/releases/download/v%version%/flex-%version%.tar.gz")
   .version    ("%version%")
   .description([[
      <description>
   ]])
	
	dependson("m4/1.4.18")
   
   -- Build
   build()
		.configure()
		.make()
		.make_install()
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("flex")
      .group ("tools")
   
   -- Custom symbols
   symbol()
      .add("name"   , "flex")
      .add("version", "2.6.4")
end
