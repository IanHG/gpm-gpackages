---
-- This package builds intel
--
function intel_mpi()
   -- Generel
   homepage    ("https://www.intel.com/content/www/us/en/homepage.html")
   .url        ("/home/ian/Downloads/intel_mpi/l_mpi_2019.6.154.tgz")
   .version    ("2020.0.154")
   .description([[
   ]])

   depends_on("gcc@8.2.0", "heirarchical:compiler")
   
   -- Build
   build()
      .install()
      .shell("mkdir %build%/%nameversion%_tmp")
      .shell("%build%/%nameversion%/install.sh --silent %build%/silent.cfg --user-mode --tmp-dir %build%/%nameversion%_tmp --SHARED_INSTALL --nonrpm_db_dir %install%/db")
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("mpi")
      .group ("core")
      -- Set environments
      .setenv("MKLROOT", "mkl")
      .setenv("DALLROOT", "daal")
      .setenv("I_MPI_ROOT", "mpi")
      .setenv("IPPROOT", "ipp")
      .setenv("TBBROOT", "tbb")
      .setenv("INCLUDE", "mkl/include")
      -- CPATH
      -- LD_LIBRARY_PATH
      .prepend_path("LD_LIBRARY_PATH", "compilers_and_libraries_%version%/linux/mpi/intel64/lib")
      -- IBRARY_PATH
      -- PATH
      .prepend_path("PATH", "compilers_and_libraries_%version%/linux/mpi/intel64/bin")
      -- MANPATH
   
   -- Custom symbols
   symbol()
      .add("name"   , "intel-mpi")

   -- Create files
   file("silent.cfg", [[
# Patterns used to check silent configuration file
#
# anythingpat - any string
# filepat     - the file location pattern (/file/location/to/license.lic)
# lspat       - the license server address pattern (0123@hostname)
# snpat       - the serial number pattern (ABCD-01234567)

# Accept EULA, valid values are: {accept, decline}
ACCEPT_EULA=accept

# Install mode, valid values are: {RPM, NONRPM}
INSTALL_MODE=NONRPM

# Optional error behavior, valid values are: {yes, no}
CONTINUE_WITH_OPTIONAL_ERROR=yes

# Install location, valid values are: {/opt/intel, filepat}
PSET_INSTALL_DIR=%install%

# Continue with overwrite of existing installation directory, valid values are: {yes, no}
CONTINUE_WITH_INSTALLDIR_OVERWRITE=yes

# List of components to install, valid values are: {ALL, DEFAULTS, anythingpat}
COMPONENTS=ALL

# Installation mode, valid values are: {install, repair, uninstall}
PSET_MODE=install

# Path to the cluster description file, valid values are: {filepat}
#CLUSTER_INSTALL_MACHINES_FILE=filepat

# Perform validation of digital signatures of RPM files, valid values are: {yes, no}
SIGNING_ENABLED=yes

# Select target architecture of your applications, valid values are: {IA32, INTEL64, ALL}
ARCH_SELECTED=ALL
      ]])
end
