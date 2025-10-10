# build2 Package Repository for Eigen

This is a [build2](https://build2.org) package repository for [Eigen](https://eigen.tuxfamily.org), a high-performance C++ template library for linear algebra, including matrices, vectors, numerical solvers, and related algorithms.

This repository is a community-maintained effort and is not officially endorsed by the Eigen authors.

| Package | Summary | Status |
|---|---|---|
| **[`Eigen`](Eigen/PACKAGE-README.md)** | C++ Linear Algebra Library | [![cppget.org](https://img.shields.io/website/https/cppget.org/Eigen.svg?down_message=offline&label=cppget.org&style=for-the-badge&up_color=blue&up_message=online)](https://cppget.org/Eigen) [![queue.cppget.org](https://img.shields.io/website/https/queue.cppget.org/Eigen.svg?down_message=empty&down_color=blue&label=queue.cppget.org&style=for-the-badge&up_color=orange&up_message=running)](https://queue.cppget.org/Eigen) |

## Usage
If you want to use the Eigen package in your `build2`-based project, add an appropriate repository manifest to your project's `repositories.manifest` and refer to [Eigen's `PACKAGE-README`](Eigen/PACKAGE-README.md).

### `repositories.manifest`
To be able to fetch this repository's packages, add one of the following prerequisites to your project's `repositories.manifest`.

**Option A: `cppget.org` (Recommended)**

Based on your project's stability requirements, choose either the [`stable` section](https://cppget.org/?about#pkg%3Acppget.org%2Fstable) for thoroughly tested versions or the [`testing` section](https://cppget.org/?about#pkg%3Acppget.org%2Ftesting) for the latest releases before they are marked as stable.
For example:

    :
    role: prerequisite
    location: https://pkg.cppget.org/1/stable
    # trust: ...

**Option B: Git Repository**

    :
    role: prerequisite
    location: https://github.com/build2-packaging/Eigen.git

## Development Setup
The development setup for this repository uses the standard `bdep`-based workflow.
For general information and guidance on package maintenance, please see the [`build2` Documentation](https://build2.org/doc.xhtml).

First, clone the repository via SSH or HTTPS.

    git clone --recurse https://github.com/build2-packaging/Eigen.git  # HTTPS
    git clone --recurse git@github.com:build2-packaging/Eigen.git      # SSH

Inside the repository's directory, initialize your build configuration.

    bdep init -C @gcc cc config.cxx=g++ config.install.root=../.install config.dist.root=../.dist

Afterwards, use `b` or `bdep` to build, test, install, and distribute the packages.

## Issues and Notes

### Naming Scheme
We currently use `Eigen%lib{Eigen}` for compatibility with older versions.
However, this naming scheme is inconsistent with other package managers and Eigen's own internal logic (GitLab Repository: `libeigen/eigen`, pkgconfig: `eigen3`, `CMakeLists.txt`: `Eigen3::Eigen`).
A more conventional name might be `libeigen3%lib{eigen}` or `libeigen%lib{eigen}`.
Still, Eigen's upstream source code lacks a consistent naming convention and makes ideal names for the repository, package, and library target difficult to choose.
Other package managers also provide their own naming convention (e.g., Arch Linux: `eigen`, Debian: `libeigen3-dev`).

### Version Header Generation
Eigen's sources already come with the generated version file `Eigen/Version`.
Should there be any release in the future that does not provide the correct version header, we can generate it ourselves:

Add symlink to the version header config file `upstream/cmake/Version.in`:
```
cd Eigen/eigen3/
ln -s ../../upstream/cmake/Version.in
```

Generate version header in `buildfile`:
```buildfile
# Version Header
# Generate intermediate file in this directory use it to
# generate the version header in the `Eigen/` directory.
#
lib{Eigen}: Eigen/hxx{Version.}
Eigen/hxx{Version.}: in{Version.in.in} $src_root/manifest
{
  in.symbol = '@'
  EIGEN_MAJOR_VERSION = $version.major
  EIGEN_MINOR_VERSION = $version.minor
  EIGEN_PATCH_VERSION = $version.patch
  EIGEN_VERSION_STRING = $version
  EIGEN_PRERELEASE_VERSION = # Empty
  EIGEN_BUILD_VERSION = # Empty
}
in{Version.in.in}: file{Version.in}
{{
  sed -e 's/\$\{(.+)\}/@\1@/g' $path($<) >$path($>)
}}
```

Make sure to add the output directory as preprocessor include path:
```buildfile
poptions = "-I$out_base" "-I$src_base" "-I$src_base/unsupported"
```

## Contributing
Contributions are welcome and greatly appreciated!
Please start by [opening an issue](https://github.com/build2-packaging/Eigen/issues) to report a bug, suggest an improvement, or request a version update.
This helps us coordinate efforts and avoid duplicate work.
You are then welcome to submit a [pull request](https://github.com/build2-packaging/Eigen/pulls) that references the issue.
For guidance on package maintenance, please see the [`build2` Packaging Guidelines](https://build2.org/build2-toolchain/doc/build2-toolchain-packaging.xhtml).
