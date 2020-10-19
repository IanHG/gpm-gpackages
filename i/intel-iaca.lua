---
-- This package builds intel-iaca
--
function intel_iaca()
   -- Generel
   homepage    ("<homepage>")
   .url        ("/home/ian/Downloads/intel_iaca/iaca-version-v%version%-lin64.zip")
   .version    ("%version%")
   .description([[
      <description>
   ]])
   
   -- Build
   build()
      .shell("mkdir -p %install%/bin")
      .shell("mkdir -p %install%/include")
      .shell("cp %build%/iaca-lin64/iaca        %install%/bin")
      .shell("cp %build%/iaca-lin64/iacaMarks.h %install%/include")
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("iaca")
      .group ("libs")
   
   -- Custom symbols
   symbol()
      .add("name"   , "intel-iaca")
      .add("version", "3.0")
end
