#include <stdio.h>
#include <stdlib.h>

int main(void) {
  int a[2];
  a[0] = 7;
  a[1] = 42;
  int *b = a;
  b += 1;
  printf("%d\n", *b);
  return EXIT_SUCCESS;
}