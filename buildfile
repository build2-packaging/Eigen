# Eigen library
#
./: lib{Eigen}: Eigen/hxx{**. **.h}
{
  cxx.export.poptions =+ "-I$src_root"
  cxx.pkgconfig.include = include/
}

cxx.poptions =+ "-I$src_root"

hxx{*}: install.subdirs = true

# Add unsupported header files when needed
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
