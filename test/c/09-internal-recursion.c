#include <stdio.h>

void b(int i);

void
a(int i) {
  b(i);
}

void
b(int i) {
  if (i > 0) {
    a(i - 1);
  }
}

int
main(int argc, char **argv) {
  a(argc);
  return 0;
}

