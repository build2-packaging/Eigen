# Eigen - C++ Template Library for Linear Algebra

This is the `build2` package for Eigen, a high-performance C++ template library for linear algebra, including matrices, vectors, numerical solvers, and related algorithms.

## Usage
To use this package in your project, add the following configurations to the respective files after you have gained access to a `build2` package repository that contains it.

### `manifest`
To make Eigen available for import, add the following dependency to the `manifest` of each package in your project that requires it, adjusting the version constraint as appropriate.

    depends: Eigen ^5.0.0

### `buildfile`
To import the library, use the following declaration in your `buildfile`.

    import eigen = Eigen%lib{Eigen}

### C++ Header Inclusion
Finally, include the necessary headers in your C++ source code.
Eigen's behavior can be controlled by defining preprocessor macros before including any Eigen headers.
Note the most robust way to do this project-wide is in your `buildfile`.

**Standard Headers:**
Most features can be accessed via the Dense and Sparse headers.

```c++
#include <Eigen/Dense>   // Includes Core, Geometry, LU, Cholesky, SVD, QR, and Eigenvalues
#include <Eigen/Sparse>  // Sparse matrices and solvers

#include <Eigen/Eigen>   // Convenience header for both Dense and Sparse
```

**Unsupported Modules:**
This package provides the direct, top-level include path for Eigen's unsupported modules, which is the recommended way to use them.
The prefixed paths are also available for compatibility, for example:

```c++
// Splines Module
#include <Eigen/Splines>
#include <unsupported/Eigen/Splines>

// Tensor Module
#include <Eigen/CXX11/Tensor>
#include <unsupported/Eigen/CXX11/Tensor>
```

## Configuration

Currently, there are no configuration variables available.
For controlling library features, refer to Eigen's preprocessor macros.

### Breaking Change `5.0.0`
The configuration variable `config.Eigen.unsupported` has been removed.
Access to the unsupported module headers is now enabled by default at all times.
