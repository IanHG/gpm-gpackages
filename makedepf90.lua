function makedepf90()
   homepage    ("https://github.com/outpaddling/makedepf90")
   .url        ("git://github.com/outpaddling/makedepf90.git")
   .version    ("%version%")
   .description([[
Generate make dependencies for Fortran code
   ]])
   
   autoconf()
      .autoconf()
      .configure()
      .shell("sed -i 's/DESTDIR \?= \.//' Makefile")
      .make()
      .makeinstall()
   .endblock()

   lmod
      .help  ([[This module loads %name% v. %version%.]])
      .family("makedepf90")
      .group ("tools")

   symbol
      .add("name"   , "makedepf90")
      .add("version", "1.0.0")
end
