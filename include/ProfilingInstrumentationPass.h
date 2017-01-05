

#ifndef PROFILING_INSTRUMENTATION_PASS_H
#define PROFILING_INSTRUMENTATION_PASS_H


#include "llvm/IR/Module.h"
#include "llvm/Pass.h"


namespace cgprofiler {


struct ProfilingInstrumentationPass : public llvm::ModulePass {

  static char ID;

  ProfilingInstrumentationPass()
    : llvm::ModulePass(ID)
      { }

  virtual bool runOnModule(llvm::Module &m) override;
};


}


#endif

