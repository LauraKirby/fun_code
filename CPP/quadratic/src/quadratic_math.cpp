#include <iostream>
#include "console.h"
#include <cmath>
using namespace std;

// passing parameters by reference allow us to "return"
// multiple values from a function. See the new values for
// 'root1' and 'root1' after the 'quadratic' function call.

void quadratic(double a, double b, double c,double& root1, double& root2);

int main() {
    double a = 2;
    double b = 5;
    double c = 3;
    double root1 = 0;
    double root2 = 0;
    quadratic(a,b,c, root1, root2);
    cout << "new value for root one: " << root1 << endl;
    cout << "new value for root two: " << root2 << endl;
    return 0;
}

void quadratic(double a, double b, double c,double& root1, double& root2){
   double d = sqrt(b * b - 4 * a * c);
   cout << "sqrt: " << d << endl;
   root1 = (-b + d) / (2 * a);
   root2 = (-b - d) / (2 * a);
}
