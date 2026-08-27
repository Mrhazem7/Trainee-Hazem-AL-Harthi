#include <iostream>
using namespace std;

int main(){
    int x = 1; // First x scope begins here
    {
        int x = 2; // Second x scope begins here
    } // Second x scope ends here
} // First x scope ends here