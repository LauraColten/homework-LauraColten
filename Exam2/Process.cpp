#include <iostream>

void process(char opArray[4], int numArray[4]) {
    int display = 0;
    for (int i = 0; i < 4; i++) {
        // Decode Unit
        if (opArray[i] == '+') { //r3, 0
            std::cout << "processing: " << opArray[i];
            std::cout << std::endl;
            std::cout << "displaying: " << display << std::endl;
            // Execute Unit
            display += numArray[i];
            std::cout << "processing: " << numArray[i];
        }else if (opArray[i] == '-'){
            std::cout << "processing: " << opArray[i];
            std::cout << std::endl;
            std::cout << "displaying: " << display << std::endl;
            // Execute Unit
            display -= numArray[i];
            std::cout << "processing: " << numArray[i];
        }else {
            break;
        }

        std::cout << std::endl;
        // Store Unit
        std::cout << "displaying: " << display; //r2 OUT
        std::cout << std::endl;
        std::cout << std::endl;
    }
}