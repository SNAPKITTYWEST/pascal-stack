{$mode objfpc}{$H+}
program PascalGPUStack;
uses PascalGPU_Types, PascalGPU_Memory, PascalGPU_Device,
     PascalGPU_Kernel, PascalGPU_Execution, PascalGPU_Sync,
     PascalGPU_Numerical, PascalGPU_Matrix, PascalGPU_Advanced,
     PascalGPU_Tests, PascalGPU_Integration;
begin
  PascalGPU_Init;
  WriteLn(PascalGPUVersion);
  WriteLn(PrintCompatibilityReport);
  WriteLn(IntegrationTest);
  WriteLn(RunAllTests);
  PascalGPU_Shutdown;
end.
