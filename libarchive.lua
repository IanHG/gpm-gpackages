function libarchive()
   homepage    ("https://www.libarchive.org/")
   .url        ("https://www.libarchive.org/downloads/libarchive-%version%.tar.gz")
   .version    ("%version%")
   .description([[
      <description>
   ]])
   
   build()
      .configure("--disable-dependency-tracking")
      .make()
      .makeinstall()

   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("libarchive")
      .group ("tools")

   symbol()
      .add("name"   , "libarchive")
      .add("version", "3.3.3")
end
