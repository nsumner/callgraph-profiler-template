#include <stdio.h>

void a() {}

void b() {
  a();
}

int
main(int argc, char **argv) {
  b();
  b();
  return 0;
}

