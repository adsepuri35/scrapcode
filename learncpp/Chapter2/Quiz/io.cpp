#include <iostream>

int readNumber() {
    int x{};
    std::cout << "Enter a number: ";
    std::cin >> x;
    return x;
}

void writeAnswer(int sum) {
    std::cout << "Sum: " << sum << '\n';
}