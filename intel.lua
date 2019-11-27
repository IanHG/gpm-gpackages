---
-- This package builds intel
--
function intel()
   -- Generel
   homepage    ("https://www.intel.com/content/www/us/en/homepage.html")
   --.url        ("/comm/install/intel/parallel_studio_xe_2019_composer_edition.tgz")
   --.version    ("2019.0.117")
   --.url        ("/comm/install/intel/parallel_studio_xe_2019_update2_composer_edition.tgz")
   --.version    ("2019.2.187")
   --.url        ("/comm/install/intel/parallel_studio_xe_2019_update3_composer_edition.tgz")
   --.version    ("2019.3.199")
   --.url        ("/comm/install/intel/parallel_studio_xe_2019_update4_composer_edition.tgz")
   --.version    ("2019.4.243")
   .url        ("/comm/install/intel/parallel_studio_xe_2018_update5_composer_edition.tgz")
   .version    ("2018.5.288")
   --.url        ("/comm/install/intel/parallel_studio_xe_2019_update5_composer_edition.tgz")
   --.version    ("2019.5.281")
   .description([[
   ]])
   
   -- Build
   build({version = ">=2019.0.0"})
      .install()
      .shell("mkdir %build%/%nameversion%_tmp")
      .shell("%build%/%nameversion%/install.sh --silent %build%/silent.cfg --user-mode --tmp-dir %build%/%nameversion%_tmp --SHARED_INSTALL --nonrpm_db_dir %install%/db")
      .shell("cp %build%/license.lic %install%/license.lic")
   
   build()
      .install()
      .shell("mkdir %build%/%nameversion%_tmp")
      .shell("%build%/%nameversion%/install.sh --silent %build%/silent.cfg --user-mode --tmp-dir %build%/%nameversion%_tmp --SHARED_BUILD")
      .shell("cp %build%/license.lic %install%/license.lic")
   
   -- Lmod
   lmod()
      .help  ([[This module loads %name% v. %version%.]])
      .family("compiler")
      .group ("core")
      -- Set environments
      .setenv("INTEL_LICENSE_FILE", "license.lic")
      .setenv("MKLROOT", "mkl")
      .setenv("DALLROOT", "daal")
      .setenv("I_MPI_ROOT", "mpi")
      .setenv("IPPROOT", "ipp")
      .setenv("TBBROOT", "tbb")
      .setenv("INCLUDE", "mkl/include")
      -- CPATH
      .prepend_path("CPATH", "compilers_and_libraries_%version%/linux/ipp/include")
      .prepend_path("CPATH", "compilers_and_libraries_%version%/linux/mkl/include")
      .prepend_path("CPATH", "compilers_and_libraries_%version%/linux/tbb/include")
      .prepend_path("CPATH", "compilers_and_libraries_%version%/linux/daal/include")
      -- LD_LIBRARY_PATH
      .prepend_path("LD_LIBRARY_PATH", "compilers_and_libraries_%version%/linux/compiler/lib/intel64")
      .prepend_path("LD_LIBRARY_PATH", "compilers_and_libraries_%version%/linux/mpi/intel64/lib")
      .prepend_path("LD_LIBRARY_PATH", "compilers_and_libraries_%version%/linux/mpi/mic/lib")
      .prepend_path("LD_LIBRARY_PATH", "compilers_and_libraries_%version%/linux/ipp/lib/intel64")
      .prepend_path("LD_LIBRARY_PATH", "compilers_and_libraries_%version%/linux/mkl/lib/intel64_lin")
      .prepend_path("LD_LIBRARY_PATH", "compilers_and_libraries_%version%/linux/tbb/lib/intel64/gcc4.4")
      .prepend_path("LD_LIBRARY_PATH", "compilers_and_libraries_%version%/linux/daal/lib/intel64_lin")
      .prepend_path("LD_LIBRARY_PATH", "compilers_and_libraries_%version%/linux/daal/../tbb/lib/intel64_lin/gcc4.4")
      -- LIBRARY_PATH
      .prepend_path("LIBRARY_PATH", "compilers_and_libraries_%version%/linux/ipp/lib/intel64")
      .prepend_path("LIBRARY_PATH", "compilers_and_libraries_%version%/linux/compiler/lib/intel64")
      .prepend_path("LIBRARY_PATH", "compilers_and_libraries_%version%/linux/mkl/lib/intel64_lin")
      .prepend_path("LIBRARY_PATH", "compilers_and_libraries_%version%/linux/tbb/lib/intel64/gcc4.4")
      .prepend_path("LIBRARY_PATH", "compilers_and_libraries_%version%/linux/daal/lib/intel64_lin")
      .prepend_path("LIBRARY_PATH", "compilers_and_libraries_%version%/linux/daal/../tbb/lib/intel64_lin/gcc4.4")
      -- PATH
      .prepend_path("PATH", "compilers_and_libraries_%version%/linux/bin/intel64")
      .prepend_path("PATH", "compilers_and_libraries_%version%/linux/mpi/intel64/bin")
      -- MANPATH
      .prepend_path("MANPATH", "compilers_and_libraries_%version%/linux/man/common")
   
   -- Custom symbols
   symbol()
      .add("name"   , "intel")

   -- Create files
   file("license.lic", [[
SERVER in2 001e689b4688 28518
USE_SERVER
      ]])

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

# Set database directory
#NONRPM_DB_DIR=%install%/db

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

# Directory for non-RPM database, valid values are: {filepat}
#NONRPM_DB_DIR=filepat

# Serial number, valid values are: {snpat}
#ACTIVATION_SERIAL_NUMBER=snpat

# Activation type, valid values are: {exist_lic, license_server, license_file, trial_lic, serial_number}
ACTIVATION_TYPE=license_file

# License file or license server, valid values are: {lspat, filepat}
ACTIVATION_LICENSE_FILE=%build%/license.lic

# Path to the cluster description file, valid values are: {filepat}
#CLUSTER_INSTALL_MACHINES_FILE=filepat

# Intel(R) Software Improvement Program opt-in, valid values are: {yes, no}
#PHONEHOME_SEND_USAGE_DATA=no
INTEL_SW_IMPROVEMENT_PROGRAM_CONSENT=no

# Perform validation of digital signatures of RPM files, valid values are: {yes, no}
SIGNING_ENABLED=yes

# Select target architecture of your applications, valid values are: {IA32, INTEL64, ALL}
ARCH_SELECTED=ALL
      ]])
end
