#include <stdio.h>

void a(int i) {}

void b(int i) {}

void c(int i) {}

void d(int i) {}

void dispatcher(void (*funptr)(int)) { funptr(1); }

int
main(int argc, char **argv) {
  dispatcher(a);
  dispatcher(b);
  dispatcher(c);
  dispatcher(d);
  /*if (argc & 1) {
    dispatcher(a);
  } else {
    dispatcher(b);
  }

  if (argc & 2) {
    dispatcher(c);
  } else {
    dispatcher(d);
  }*/

  return 0;
}


