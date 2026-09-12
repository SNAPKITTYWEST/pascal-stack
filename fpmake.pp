program fpmake;

{ PascalGPU Stack — Free Pascal Package Manager build script
  Compiler: Free Pascal 3.2+
  Usage:
    fpc fpmake.pp && ./fpmake build && ./fpmake install
}

{$mode objfpc}{$H+}

uses
  fpmkunit;

procedure AddPackage;
var
  P : TPackage;
  T : TTarget;
begin
  with Installer do begin
    P := AddPackage('pascal-gpu-stack');
    P.Version     := '1.0.0';
    P.Author      := 'SNAPKITTYWEST';
    P.License     := 'MIT';
    P.HomepageURL := 'https://github.com/SNAPKITTYWEST/pascal-gpu-stack';
    P.Email       := '';
    P.Description :=
      '500-block pure Pascal replacement for a CUDA GPU computation stack. ' +
      'Covers device management, memory, kernel dispatch, synchronization, ' +
      'numerical ops, matrix/tensor algebra, and neural-network optimizers. ' +
      'No CUDA, no C, no C++ dependency. Free Pascal 3.2+.';

    { Source directories }
    P.SourcePath.Add('src/core');
    P.SourcePath.Add('src/memory');
    P.SourcePath.Add('src/device');
    P.SourcePath.Add('src/kernel');
    P.SourcePath.Add('src/execution');
    P.SourcePath.Add('src/sync');
    P.SourcePath.Add('src/numerical');
    P.SourcePath.Add('src/matrix');
    P.SourcePath.Add('src/advanced');
    P.SourcePath.Add('src/tests');
    P.SourcePath.Add('src/integration');

    { Layer 1 — Core types (Blocks 001-050) }
    T := P.Targets.AddUnit('PascalGPU_Types', 'src/core');
    T.Description := 'Core type aliases, dimensional records, error codes, platform detection';

    { Layer 2 — Memory subsystem (Blocks 051-100) }
    T := P.Targets.AddUnit('PascalGPU_Memory', 'src/memory');
    T.Dependencies.AddUnit('PascalGPU_Types');
    T.Description := 'Pool allocator, slab allocator, device memory, H2D/D2H transfers, shared memory';

    { Layer 3 — Device abstraction (Blocks 101-150) }
    T := P.Targets.AddUnit('PascalGPU_Device', 'src/device');
    T.Dependencies.AddUnit('PascalGPU_Types');
    T.Dependencies.AddUnit('PascalGPU_Memory');
    T.Description := 'IDeviceBackend, TSimulatedDeviceBackend, TDeviceRegistry, TDeviceContext';

    { Layer 4 — Kernel abstraction (Blocks 151-200) }
    T := P.Targets.AddUnit('PascalGPU_Kernel', 'src/kernel');
    T.Dependencies.AddUnit('PascalGPU_Types');
    T.Dependencies.AddUnit('PascalGPU_Memory');
    T.Dependencies.AddUnit('PascalGPU_Device');
    T.Description := 'IKernelFunction, TKernelDescriptor, TKernelParamList, built-in kernels';

    { Layer 5 — Execution and scheduling (Blocks 201-250) }
    T := P.Targets.AddUnit('PascalGPU_Execution', 'src/execution');
    T.Dependencies.AddUnit('PascalGPU_Types');
    T.Dependencies.AddUnit('PascalGPU_Memory');
    T.Dependencies.AddUnit('PascalGPU_Device');
    T.Dependencies.AddUnit('PascalGPU_Kernel');
    T.Description := 'TExecutionStream, TExecutionEvent, TExecutionScheduler, TExecutionGraph';

    { Layer 6 — Synchronization and atomics (Blocks 251-300) }
    T := P.Targets.AddUnit('PascalGPU_Sync', 'src/sync');
    T.Dependencies.AddUnit('PascalGPU_Types');
    T.Description := 'TMutex, TSpinLock, TRWLock, TBarrier, TAtomicInt32/64, TAtomicFloat32, TSemaphore';

    { Layer 7 — Numerical primitives (Blocks 301-350) }
    T := P.Targets.AddUnit('PascalGPU_Numerical', 'src/numerical');
    T.Dependencies.AddUnit('PascalGPU_Types');
    T.Description := 'Activations, reductions, vector ops, layer norm, batch norm, LogSumExp';

    { Layer 8 — Matrix and tensor operations (Blocks 351-400) }
    T := P.Targets.AddUnit('PascalGPU_Matrix', 'src/matrix');
    T.Dependencies.AddUnit('PascalGPU_Types');
    T.Dependencies.AddUnit('PascalGPU_Numerical');
    T.Description := 'TMatrix, TTensor, PascalGEMM, Conv2D, ScaledDotProductAttention';

    { Layer 9 — Advanced GPU-style primitives (Blocks 401-450) }
    T := P.Targets.AddUnit('PascalGPU_Advanced', 'src/advanced');
    T.Dependencies.AddUnit('PascalGPU_Types');
    T.Dependencies.AddUnit('PascalGPU_Numerical');
    T.Dependencies.AddUnit('PascalGPU_Matrix');
    T.Description := 'Tiled GEMM, prefix scan, radix sort, Adam/AdamW/SGD optimizers, positional encoding';

    { Layer 10 — Tests and benchmarks (Blocks 451-480) }
    T := P.Targets.AddUnit('PascalGPU_Tests', 'src/tests');
    T.Dependencies.AddUnit('PascalGPU_Types');
    T.Dependencies.AddUnit('PascalGPU_Memory');
    T.Dependencies.AddUnit('PascalGPU_Device');
    T.Dependencies.AddUnit('PascalGPU_Kernel');
    T.Dependencies.AddUnit('PascalGPU_Execution');
    T.Dependencies.AddUnit('PascalGPU_Sync');
    T.Dependencies.AddUnit('PascalGPU_Numerical');
    T.Dependencies.AddUnit('PascalGPU_Matrix');
    T.Dependencies.AddUnit('PascalGPU_Advanced');
    T.Description := 'Full test harness: 30 unit tests + 3 benchmarks, RunAllTests';

    { Layer 11 — Integration and public API (Blocks 481-500) }
    T := P.Targets.AddUnit('PascalGPU_Integration', 'src/integration');
    T.Dependencies.AddUnit('PascalGPU_Types');
    T.Dependencies.AddUnit('PascalGPU_Memory');
    T.Dependencies.AddUnit('PascalGPU_Device');
    T.Dependencies.AddUnit('PascalGPU_Kernel');
    T.Dependencies.AddUnit('PascalGPU_Execution');
    T.Dependencies.AddUnit('PascalGPU_Sync');
    T.Dependencies.AddUnit('PascalGPU_Numerical');
    T.Dependencies.AddUnit('PascalGPU_Matrix');
    T.Dependencies.AddUnit('PascalGPU_Advanced');
    T.Dependencies.AddUnit('PascalGPU_Tests');
    T.Description := 'PascalGPU_Init/Shutdown, public API, CUDA compat table, 5 examples, Block 500';

    { Example program }
    P.Targets.AddExampleProgram('pascal-gpu-stack.lpr');
  end;
end;

begin
  AddPackage;
  Installer.Run;
end.
