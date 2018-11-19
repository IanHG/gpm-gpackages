function tinker()
   homepage    ("https://dasher.wustl.edu/tinker/")
   .url        ("https://dasher.wustl.edu/tinker/downloads/tinker-%version%.tar.gz")
   .version    ("%version%")
   .description([[
The Tinker molecular modeling software is a complete and general package for molecular mechanics and dynamics, with some special features for biopolymers. Tinker has the ability to use any of several common parameter sets, such as Amber (ff94, ff96, ff98, ff99, ff99SB), CHARMM (19, 22, 22/CMAP), Allinger MM (MM2-1991 and MM3-2000), OPLS (OPLS-UA, OPLS-AA), Merck Molecular Force Field (MMFF), Liam Dang's polarizable model, and the AMOEBA (2004, 2009, 2013, 2017, 2018) polarizable atomic multipole force field. Parameter sets for other widely-used force fields are under consideration for future releases. 
   ]])
   
   autoconf()
      .shell("cp make/Makefile source/.")
      .chdir("source")
      .make()

   lmod  
      .help  ([[This module loads %name% v. %version%.]])
      .family("tinker")
      .group ("apps")

   symbol
      .add("name"   , "tinker")
      .add("version", "8.4.4")
end
