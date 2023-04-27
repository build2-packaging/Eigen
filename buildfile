# Eigen Library
# The relative include paths of the unsupported modules
# need to be kept valid and they should not pollute
# the system's include folder with an 'unsupported' directory.
# So, the Eigen library and the unsupported Eigen modules will
# both be put in another directory 'Eigen'
# in the system's include folder when installed.
#
./: lib{Eigen}: Eigen/hxx{**. **.h}
{
  export.metadata = 1 Eigen
  Eigen.unsupported = [bool] $config.Eigen.unsupported

  cxx.export.poptions =+ "-I$src_root"
  cxx.pkgconfig.include = include/Eigen/
}
#
cxx.poptions =+ "-I$src_root"
#
Eigen/hxx{*}:
{
  install = include/Eigen/Eigen/
  install.subdirs = true
}

# Add unsupported modules when enabled.
#
lib{Eigen}: unsupported/Eigen/hxx{**. **.h}: include = $config.Eigen.unsupported
#
if $config.Eigen.unsupported
{
  cxx.poptions =+ "-I$src_root/unsupported"
  lib{Eigen}:
  {
    cxx.export.poptions =+ "-I$src_root/unsupported"
    cxx.pkgconfig.include =+ include/Eigen/unsupported/
  }
}
#
unsupported/hxx{*}:
{
  install = include/Eigen/unsupported/
  install.subdirs = true
}

# Run some custom tests.
#
./: tests/ manifest legal{COPYING*}
tests/: install = false

# Install UPSTREAM.README.md as README.md
# and README.md as PACKAGE.README.md
# to make the package README.md the default
# for the build2 package repository web view.
#
./: doc{UPSTREAM.README.md README.md}
doc{UPSTREAM.README.md}@./: install = doc/README.md
doc{README.md}@./: install = doc/PACKAGE.README.md
