#include <iostream>

int main() {
    
    int num {};

    std::cout << "Enter an integer: ";
    std::cin >> num;

    std::cout << "Double " << num << " is: " << num * 2 << '\n';
    std::cout << "Triple " << num << " is: " << num * 3 << '\n';

    return 0;
}