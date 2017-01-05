#include <stdio.h>

void a(int i) {}

void b(int i) {}

int
main(int argc, char **argv) {
  void (*funptr)(int);
  if (argc & 1) {
    funptr = a;
  } else {
    funptr = b;
  }
  funptr(1);
  return 0;
}


