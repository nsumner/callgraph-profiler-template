#include <stdio.h>

void a() {}

int
main(int argc, char **argv) {
  for (unsigned i = 0; i < 10; ++i) {
    a();
  }
  return 0;
}

