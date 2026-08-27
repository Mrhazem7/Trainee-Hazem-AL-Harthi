#include <iostream>
using namespace std;

int main(){
    int x, y, z;

    cout << "Enter x, y, z: ";
    cin >> x >> y >> z;

    if (x >= y && x >= z){
        cout << "Largest value: " << x;
    } else if (y >= x && y >= z){
        cout << "Largest value: " << y;
    } else{
        cout << "Largest value: " << z;
    }
}
