#include <iostream>
using namespace std;

void calculator(int a, int b){
    cout << "Addition: " << a + b << "\n";
    cout << "Subtraction: " << a - b << "\n";
    cout << "Multiplication: " << a * b << "\n";
    cout << "Division: " << a / b << "\n";
    cout << "Modulus: " << a % b << "\n";
}

int main(){
    calculator(100, 3);
}