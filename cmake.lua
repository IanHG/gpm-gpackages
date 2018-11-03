function cmake()
   -- Define package
   homepage    ("https://cmake.org")
   url        ("https://cmake.org/files/v%version_major%.%version_minor%/cmake-%version%.tar.gz")
   version    ("3.9.1")
   description([[
CMake - CMake is an open-source, cross-platform family of tools designed to build, test and package software. CMake is used to control the software compilation process using simple platform and compiler independent configuration files, and generate native makefiles and workspaces that can be used in the compiler environment of your choice.
   ]])

   -- Builds
   -- General
   build() 
      .configure()
      .make()
      .makeinstall()
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("cmake")
      .group ("tools")

   symbol()
      .add("name"   , "cmake")
end
