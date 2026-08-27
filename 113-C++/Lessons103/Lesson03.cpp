#include <iostream>
using namespace std;

int sum(int a, int b); // function declaration

int main(){
    cout<< sum(2,3); // call function
}

int sum(int a, int b){ // function definition
    return a + b;
}
