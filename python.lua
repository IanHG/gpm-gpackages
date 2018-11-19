function python()
   -- General
   homepage    ("<homepage>")
   .url        ("https://www.python.org/ftp/python/%version%/Python-%version%.tgz")
   .version    ("%version%")
   .description([[
      <description>
   ]])
   
   -- Build
   build()
      .configure("--enable-optimizations", "--with-lto", "--enable-unicode=ucs4")
      .make()
      .makeinstall()
   
   -- Lmod stuff
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("python")
      .group ("core")
      .setenv("PYTHONHOME", "")
      .setenv("PYTHONPATH", "lib/python2.7")
   
   -- Post install
   post("python -m ensurepip")
   
   -- Define some symbols
   symbol()
      .add("name"   , "python")
      .add("version", "2.7.14")
end
