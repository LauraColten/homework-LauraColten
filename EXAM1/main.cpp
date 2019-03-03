#include <iostream>
#include <bitset>
#include <cstdlib>
#include <iomanip>


uint16_t code[] = {
        0b0000000000100010,
        0b1111110100011000,
        0b1101101001001000,
        0b0101010001100001
};


void decode(uint16_t data) {
    std::bitset<6> z(data >> 10);
    std::cout << "opcode: 0b" << z << '\t';
    std::bitset<5> y(data >> 5);
    std::cout << "op1: R" << std::setfill('0') << std::setw(2) << y.to_ulong() << '\t';
    std::bitset<5> x(data);
    std::cout << "op2: R" << std::setfill('0') << std::setw(2) << x.to_ulong() << '\n';

}

int main(void) {
    for (int i = 0; i < sizeof(code) / 2; i++) {
        decode(code[i]);
    }

    return 0;
}
