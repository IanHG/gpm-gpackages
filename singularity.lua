function singularity()
   -- General
   homepage    ("https://singularity.lbl.gov")
   .url        ("https://github.com/singularityware/singularity/releases/download/%version%/singularity-%version%.tar.gz")
   .version    ("%version%")
   .description([[
      Singularity enables users to have full control of their environment. 
      Singularity containers can be used to package entire scientific workflows, 
      software and libraries, and even data.
   ]])

   depend("libarchive@3.3.3", "dependson")
   
   -- Build
   build()
      .configure()
      .make()
      .makeinstall()
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("singularity")
      .group ("tools")
   
   -- Custom symbols
   symbol()
      .add("name"   , "singularity")
      .add("version", "2.5.2")
end
