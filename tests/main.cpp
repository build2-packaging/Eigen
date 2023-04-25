#ifdef __clang__
#pragma clang diagnostic ignored "-Wdeprecated"
#endif

#include <Eigen/Dense>
#include <iostream>

using Eigen::MatrixXd;

int main() {
  MatrixXd m(2, 2);
  m(0, 0) = 3;
  m(1, 0) = 2.5;
  m(0, 1) = -1;
  m(1, 1) = m(1, 0) + m(0, 1);
  std::cout << m << '\n';
}