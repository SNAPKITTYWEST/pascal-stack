{ ========================================================================
  SOVEREIGN LEVIATHAN COVENANT — MGPLv3 RECURSIVE INFECTION CLAUSE
  ========================================================================

  Node-ID:           PASCAL-STACK-012
  File:              pascal-gpu-stack.lpr
  Parent-Work:       pascal-stack
  Copyright:         2026 SNAPKITTYWEST
  License-ID:        SL-AGPL3-001 / MGPLv3
  Covenant-Version:  1.0
  Compliance:        FAIL-CLOSED

  This file is governed by the GNU Affero General Public License,
  version 3, together with the applicable Sovereign Leviathan
  Recursive Infection Clause (MGPLv3).

  AGPLv3 terms remain authoritative wherever the Covenant does not
  validly add additional terms.

  Whatsoever branch this root shall bear,
  Must breathe the exact and sovereign air.
  Touch but a leaf, invoke a single thread,
  And honor still the terms beneath it spread.

  Lex in solido: the applicable license governs the covered work
  according to its actual terms and applicable law.

  Ignorantia juris non excusat.

  See: SOVEREIGN_LICENSE.md | MGPLv3 Recursive Infection Clause
  Jurisdiction: England and Wales

  ======================================================================== }

{$mode objfpc}{$H+}{$modeswitch inscope}
program PascalGPUStack;
uses PascalGPU_Types, PascalGPU_Memory, PascalGPU_Device,
     PascalGPU_Kernel, PascalGPU_Execution, PascalGPU_Sync,
     PascalGPU_Numerical, PascalGPU_Matrix, PascalGPU_Advanced,
     PascalGPU_Tests, PascalGPU_Integration;
begin
  PascalGPU_Init(nil);
  WriteLn(PascalGPUVersion);
  WriteLn(PrintCompatibilityReport);
  WriteLn(IntegrationTest);
  WriteLn(RunAllTests);
  PascalGPU_Shutdown;
end.
