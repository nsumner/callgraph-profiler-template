This is a template for a simple project for learning some of the LLVM APIs
relevant for dynamic analysis. It involves instrumenting an LLVM module in
order to produce a new program that collects frequency information for edges
in the call graph.


Building with CMake
==============================================
1. Clone the template repository.

        git clone https://github.com/nsumner/callgraph-profiler-template.git

2. Create a new directory for building.

        mkdir cgbuild

3. Change into the new directory.

        cd cgbuild

4. Run CMake with the path to the LLVM source.

        cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=True \
            -DLLVM_DIR=</path/to/LLVM/build>/lib/cmake/llvm/ ../callgraph-profiler-template

5. Run make inside the build directory:

        make

When you have successfully completed the project, this will produce a tool
for profiling the callgraph called `bin/callgraph-profiler` along with
supporting libraries in `lib/`.

Note, building with a tool like ninja can be done by adding `-G Ninja` to
the cmake invocation and running ninja instead of make.

Running
==============================================

First suppose that you have a program compiled to bitcode:

    clang -g -c -emit-llvm ../callgraph-profiler-template/test/test.c -o calls.bc

Running the call graph profiler:

    bin/callgraph-profiler calls.bc -o calls
    ./calls

When you have successfully completed the exercise, running an instrumented
program like `./calls` in the above example should produce a file called
`profile-results.csv` in the current directory. The file should be formatted
as follows:

    <caller function name>, <call site file name>, <call site line #>, <callee function name>, <(call site,callee) frequency>

