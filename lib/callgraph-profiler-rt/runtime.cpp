
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <fstream>


extern "C" {


// This macro allows us to prefix strings so that they are less likely to
// conflict with existing symbol names in the examined programs.
// e.g. CGPROF(entry) yields CaLlPrOfIlEr_entry
#define CGPROF(X)  CaLlPrOfIlEr_ ## X


// TODO: Add your runtime library data structures and functions here.


}

