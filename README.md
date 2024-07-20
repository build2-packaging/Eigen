# build2 Package for Eigen

This project is a [build2](https://build2.org) package repository that provides access to [Eigen](https://eigen.tuxfamily.org/index.php), a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms.

[![Official](https://img.shields.io/website/https/eigen.tuxfamily.org/index.php.svg?down_message=offline&label=Official&style=for-the-badge&up_color=blue&up_message=online)](https://eigen.tuxfamily.org/index.php)
[![build2](https://img.shields.io/website/https/github.com/build2-packaging/Eigen.svg?down_message=offline&label=build2&style=for-the-badge&up_color=blue&up_message=online)](https://github.com/build2-packaging/Eigen)
[![cppget.org](https://img.shields.io/website/https/cppget.org/Eigen.svg?down_message=offline&label=cppget.org&style=for-the-badge&up_color=blue&up_message=online)](https://cppget.org/Eigen)
[![queue.cppget.org](https://img.shields.io/website/https/queue.cppget.org/Eigen.svg?down_message=empty&down_color=blue&label=queue.cppget.org&style=for-the-badge&up_color=orange&up_message=running)](https://queue.cppget.org/Eigen)

## Usage
Make sure to add the stable `cppget.org` repositories to your project's `repositories.manifest` to be able to fetch the packages.

    :
    role: prerequisite
    location: https://pkg.cppget.org/1/stable
    # trust: ...

If the stable section of `cppget.org` is not an option then add this Git repository itself instead as a prerequisite.

    :
    role: prerequisite
    location: https://github.com/build2-packaging/Eigen.git

Add the respective dependency in your project's `manifest` file to make the package available for import.

    depends: Eigen ^3.4.0

The header-only C++ library to use Eigen can be imported by the following declaration in a `buildfile`.

    import Eigen = Eigen%lib{Eigen}

## Configuration

### Unsupported Modules
Eigen's unsupported modules can be enabled by setting the following configuration variable to `true`.
In this case, the path to unsupported header files is automatically added to the include directories such that unsupported modules may be used as if they were supported Eigen modules.

    config [bool] config.Eigen.unsupported ?= false

## Issues and Notes
- Eigen is a header-only library that provides a [bunch of preprocessor directives](https://eigen.tuxfamily.org/dox/TopicPreprocessorDirectives.html) to configure its API and implementation. So far, these macros are not managed by configuration variables in build2. Consequently, the dependency negotiation during package consumption to ensure no API- or ABI-breaking changes across different projects, packages, and source files is not available. You need to make sure that all package consumers use the same library configuration and are provided with the same preprocessor directives.
- Tests that require external dependencies have not been added so far.
- Currently, CUDA is not supported by build2 and, thus, tests for CUDA are not included.

## Contributing
Thank you in advance for your help and contribution to keep this package up-to-date.
Please, file an issue on [GitHub](https://github.com/build2-packaging/Eigen/issues) for questions, bug reports, or to recommend updating the package version.
If you're making a pull request to fix bugs or update the package version yourself, refer to the [`build2` Packaging Guidelines](https://build2.org/build2-toolchain/doc/build2-toolchain-packaging.xhtml#core-version-management).
