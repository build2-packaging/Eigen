#include <Eigen/CXX11/Tensor>

using namespace Eigen;

int main() {
  Tensor<float, 2, ColMajor> col_major(2, 4);
  Tensor<float, 2, RowMajor> row_major(2, 4);

  Tensor<float, 2> col_major_result = col_major; // ok, layouts match
  // Tensor<float, 2> col_major_result = row_major; // will not compile

  // Simple layout swap
  col_major_result = row_major.swap_layout();
  eigen_assert(col_major_result.dimension(0) == 4);
  eigen_assert(col_major_result.dimension(1) == 2);

  // Swap the layout and preserve the order of the dimensions
  array<int, 2> shuffle{1, 0};
  col_major_result = row_major.swap_layout().shuffle(shuffle);
  eigen_assert(col_major_result.dimension(0) == 2);
  eigen_assert(col_major_result.dimension(1) == 4);
}
