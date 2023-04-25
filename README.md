<h1 align="center">
    build2 Package for Eigen
</h1>

<p align="center">
    This project builds and defines the build2 package for Eigen.
    Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms.
</p>

<p align="center">
    <a href="https://eigen.tuxfamily.org/index.php">
        <img src="https://img.shields.io/website/https/eigen.tuxfamily.org/index.php.svg?down_message=offline&label=Official&style=for-the-badge&up_color=blue&up_message=online">
    </a>
    <a href="https://github.com/build2-packaging/Eigen">
        <img src="https://img.shields.io/website/https/github.com/build2-packaging/Eigen.svg?down_message=offline&label=build2&style=for-the-badge&up_color=blue&up_message=online">
    </a>
    <a href="https://cppget.org/Eigen">
        <img src="https://img.shields.io/website/https/cppget.org/Eigen.svg?down_message=offline&label=cppget.org&style=for-the-badge&up_color=blue&up_message=online">
    </a>
    <a href="https://queue.cppget.org/Eigen">
        <img src="https://img.shields.io/website/https/queue.cppget.org/Eigen.svg?down_message=empty&down_color=blue&label=queue.cppget.org&style=for-the-badge&up_color=orange&up_message=running">
    </a>
</p>

## Usage
Make sure to add the stable `cppget.org` repositories to your project's `repositories.manifest` to be able to fetch the packages.

    :
    role: prerequisite
    location: https://pkg.cppget.org/1/stable
    # trust: ...

Add the respective dependency in your project's `manifest` file to make the package available for import.

    depends: Eigen ^ 3.4.0

The header-only C++ library to use Eigen can be imported by the following declaration in a `buildfile`.

    import Eigen = Eigen%lib{Eigen}

## Configuration

### Unsupported Modules
The unsupported modules of the Eigen library can be enabled by setting the following configuration variable to `true`.
In this case, the path to unsupported header files is automatically added to the include directories such that unsupported may be used as if they were supported Eigen modules.

    config [bool] config.Eigen.unsupported ?= false

## Contributing
Thanks in advance for your help and contribution to keep this package up-to-date.
For now, please, file an issue on [GitHub](https://github.com/build2-packaging/Eigen/issues) for everything that is not described below.

### Recommend Updating Version
Please, file an issue on [GitHub](https://github.com/build2-packaging/Eigen/issues) with the new recommended version.

### Update Version by Pull Request
1. Fork the repository on [GitHub](https://github.com/build2-packaging/Eigen) and clone it to your local machine.
2. Run `git submodule init` and `git submodule update` to get the current upstream directory.
3. Inside the `upstream` directory, checkout the new library version `X.Y.Z` by calling `git checkout vX.Y.Z` that you want to be packaged.
4. If needed, change source files, `buildfiles`, and symbolic links accordingly to create a working build2 package. Make sure not to directly depend on the upstream directory inside the build system but use symbolic links instead.
5. Update library version in `manifest` file if it has changed or add package update by using `+n` for the `n`-th update.
6. Make an appropriate commit message by using imperative mood and a capital letter at the start and push the new commit to the `master` branch.
7. Run `bdep ci` and test for errors.
8. If everything works fine, make a pull request on GitHub and write down the `bdep ci` link to your CI tests.
9. After a successful pull request, we will run the appropriate commands to publish a new package version.

### Update Version Directly if You Have Permissions
1. Inside the `upstream` directory, checkout the new library version `X.Y.Z` by calling `git checkout vX.Y.Z` that you want to be packaged.
2. If needed, change source files, `buildfiles`, and symbolic links accordingly to create a working build2 package. Make sure not to directly depend on the upstream directory inside the build system but use symbolic links instead.
3. Update library version in `manifest` file if it has changed or add package update by using `+n` for the `n`-th update.
4. Make an appropriate commit message by using imperative mood and a capital letter at the start and push the new commit to the `master` branch.
5. Run `bdep ci` and test for errors and warnings.
6. When successful, run `bdep release --tag --push` to push new tag version to repository.
7. Run `bdep publish` to publish the package to [cppget.org](https://cppget.org).
