#include <iostream>
#include <array>

int main() {

    int numArray[4];
    char opArray[4];
    int counter = 0;

    for (int i = 0; i < 4; i++) {
            std::cout << "Please enter the operation (+ or -): " << std::endl;
            std::cin >> opArray[i];
            std::cout << "Please enter a number: "<< std::endl;
            std::cin >> numArray[i];
    }

    for (int i = 0; i < 4; i++) {
        std::cout << opArray[i] << numArray[i];
    }
    std::cout << std::endl;

    int display = 0;
    for (int i = 0; i < 4; i++) {
        if (opArray[i] == '+') {
            std::cout << "processing: " << opArray[i];
            std::cout << std::endl;
            std::cout << "displaying: " << display << std::endl;
            display += numArray[i];
            std::cout << "processing: " << numArray[i];
        }else if (opArray[i] == '-'){
            std::cout << "processing: " << opArray[i];
            std::cout << std::endl;
            std::cout << "displaying: " << display << std::endl;
            display -= numArray[i];
            std::cout << "processing: " << numArray[i];
        }else {
            break;
        }
        std::cout << std::endl;
        std::cout << "displaying: " << display;
        std::cout << std::endl;
        std::cout << std::endl;
    }



}