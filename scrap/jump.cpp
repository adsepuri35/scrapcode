#include <iostream>

class A {
    int *ptr;
    int size;
public:
    A(int size=5): ptr(new int[size]), size(size) {}
    void populate(int ii) {
        for (int s=0; s<size; s++)
            A::ptr[s] = ii + s;
    }
    int* getPtr() { return this->ptr; }
};

int main()
{
  A a1, a2(a1);
  A a3 = a2;

  a2.populate(2);
  a1.populate(1);
  a3.populate(3);

  std::cout << a1.getPtr()[0] << a2.getPtr()[2] << a3.getPtr()[4];
  
}