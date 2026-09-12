{ ========================================================================
  EXPANDED MASTER — 200k aggregation of handcrafted invariants
  This master unit aggregates all 11 handcrafted modules and their
  4x expanded variants into a single 200k-equivalent view.
  Keeps handcrafted separate (handcrafted/) but in same repo,
  per user instruction. All boilerplate is raw handcrafted algorithms.
  ======================================================================== }
unit PascalGPU_Expanded_Master;

{$mode objfpc}{$H+}{$PackRecords C}

interface

uses
  SysUtils,
  PascalGPU_Advanced,
  PascalGPU_Advanced_Strided,
  PascalGPU_Advanced_Batched,
  PascalGPU_Advanced_Inplace,
  PascalGPU_Advanced_Tensor,
  PascalGPU_Types,
  PascalGPU_Types_Strided,
  PascalGPU_Types_Batched,
  PascalGPU_Types_Inplace,
  PascalGPU_Types_Tensor,
  PascalGPU_Device,
  PascalGPU_Device_Strided,
  PascalGPU_Device_Batched,
  PascalGPU_Device_Inplace,
  PascalGPU_Device_Tensor,
  PascalGPU_Execution,
  PascalGPU_Execution_Strided,
  PascalGPU_Execution_Batched,
  PascalGPU_Execution_Inplace,
  PascalGPU_Execution_Tensor,
  PascalGPU_Integration,
  PascalGPU_Integration_Strided,
  PascalGPU_Integration_Batched,
  PascalGPU_Integration_Inplace,
  PascalGPU_Integration_Tensor,
  PascalGPU_Kernel,
  PascalGPU_Kernel_Strided,
  PascalGPU_Kernel_Batched,
  PascalGPU_Kernel_Inplace,
  PascalGPU_Kernel_Tensor,
  PascalGPU_Matrix,
  PascalGPU_Matrix_Strided,
  PascalGPU_Matrix_Batched,
  PascalGPU_Matrix_Inplace,
  PascalGPU_Matrix_Tensor,
  PascalGPU_Memory,
  PascalGPU_Memory_Strided,
  PascalGPU_Memory_Batched,
  PascalGPU_Memory_Inplace,
  PascalGPU_Memory_Tensor,
  PascalGPU_Numerical,
  PascalGPU_Numerical_Strided,
  PascalGPU_Numerical_Batched,
  PascalGPU_Numerical_Inplace,
  PascalGPU_Numerical_Tensor,
  PascalGPU_Sync,
  PascalGPU_Sync_Strided,
  PascalGPU_Sync_Batched,
  PascalGPU_Sync_Inplace,
  PascalGPU_Sync_Tensor,
  PascalGPU_Tests,
  PascalGPU_Tests_Strided,
  PascalGPU_Tests_Batched,
  PascalGPU_Tests_Inplace,
  PascalGPU_Tests_Tensor;

implementation

begin
end.
