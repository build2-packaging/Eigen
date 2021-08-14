./: lib{Eigen}: Eigen/hxx{**. -*.txt.}
{
  cxx.export.poptions =+ "-I$src_root"
}
hxx{*}: install.subdirs = true

./: tests/ manifest legal{COPYING*}
tests/: install = false

./: doc{UPSTREAM.README.md README.md}
doc{UPSTREAM.README.md}@./: install = doc/README.md
doc{README.md}@./: install = doc/PACKAGE.README.md
