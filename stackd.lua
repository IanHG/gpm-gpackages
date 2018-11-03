function stackd()
   -- General stuff
   homepage   ("https://github.com/IanHG/stackd")
   url        ("git://github.com/IanHG/stackd.git")
   version    ("%version%")
   description([[
      stackd : Debug tool for printing stacktraces.
   ]])
   
   -- Dependecies
   dependson("cmake@3.9.0", "load")
   
   -- Build
   build()
      .cmake()
      .make()
      .makeinstall()
   
   --.file("lol.txt", [[This is some content]])
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("stackd")
      .group ("tools")

   symbol()
      .add("name"   , "stackd")
      .add("version", "1.0.0")
end
