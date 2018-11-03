function nodejs()
   homepage    ("https://nodejs.org")
   .url        ("https://nodejs.org/dist/v%version%/node-v%version%-linux-x64.tar.xz")
   .version    ("%version%")
   .description([[
Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine.
   ]])
   
   build()
      .install("bin", "include", "lib", "share")

   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("nodejs")
      .group ("tools")

   symbol()
      .add("name"   , "nodejs")
      .add("version", "8.11.4")
end
