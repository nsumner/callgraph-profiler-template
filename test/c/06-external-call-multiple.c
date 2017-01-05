#include <stdio.h>

void a() {
  printf("Inside %s() at %s:%u\n", __FUNCTION__, __FILE__, __LINE__);
}

int
main(int argc, char **argv) {
  a();
  a();
  a();
  return 0;
}

