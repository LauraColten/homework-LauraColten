#include <iostream>
#include <array>
#include "Process.cpp"

//Machine Control Logic
int main() {


    int numArray[4];
    char opArray[4];
    int counter = 0;

    // Fetch Unit
    for (int i = 0; i < 4; i++) {
        std::cout << "Please enter the operation (+ or -): " << std::endl;
        std::cin >> opArray[i];//r3 (+ or -)
        std::cout << "Please enter a number: "<< std::endl;
        std::cin >> numArray[i];//r1, KEY digit
    }

    for (int i = 0; i < 4; i++) {
        std::cout << opArray[i] << numArray[i];
    }
    std::cout << std::endl;
    process(opArray, numArray);
}

