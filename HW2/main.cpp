#include <iostream>
#include <string>

void message(std::string name) {
    std::cout << "My name is " << name << std::endl;
}

int main(void) {
    std::string myname = "Laura Colten";
    message(myname);
}