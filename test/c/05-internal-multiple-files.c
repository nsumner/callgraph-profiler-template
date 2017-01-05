#include <stdio.h>

void a() {}

void b() {
  a();
}

int
main(int argc, char **argv) {
#line 0 "file1.c"
  b();
#line 0 "file2.c"
  b();
#line 65536 "file2.c"
  b();
  return 0;
}

