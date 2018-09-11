function cutee()
   -- General stuff
   homepage   ("https://github.com/IanHG/cutee")
   url        ("git://github.com/IanHG/cutee.git")
   version    ("%version%")
   description([[
      cutee : Cpp Unit TEsting Environment

      A minimalistic unit testing framework for C++.
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
      .family("cutee")
      .group ("tools")

   symbol()
      .add("name"   , "cutee")
      .add("version", "1.0.0")
end
