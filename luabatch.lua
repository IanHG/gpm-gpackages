function luabatch()
   homepage    ("https://github.com/IanHG/luabatch")
   .url        ("git://github.com/IanHG/luabatch.git")
   .version    ("%version%")
   .description([[
      Awesome batching meta-language.
   ]])
   
   cmake(">=3.9")

   --.file("lol.txt", [[This is some content]])

   lmod  
      .help  ([[This module loads %name% v. %version%.]])
      .family("luabatch")
      .group ("tools")

   symbol
      .add("name"   , "luabatch")
      .add("version", "1.0.0")
end
