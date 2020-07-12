./: {*/ -build/} manifest

tests/: install = false

upstream/
{
  ./: doc/ doc{*.md COPYING*}
  doc/
  {
    install.subdirs = true
    ./: doc{**}
  }
}