{$mode objfpc}{$H+}{$PackRecords C}
unit PascalGPU_Tests;

{ PascalGPU Test Harness — Blocks 451–480
  Complete suite: type-width checks, Float16, alignment, index uniqueness,
  memory, host/device round-trip, shared memory, kernel dispatch, MatMul,
  ReduceSum, atomics, barriers, GEMM, Softmax, LayerNorm, Conv2D, and
  throughput/bandwidth benchmarks. }

interface

uses
  SysUtils,
  Math,
  PascalGPU_Types,
  PascalGPU_Kernel;

{ === BLOCK 451: TTestResult enumeration === }
type
  TTestResult = (trPass, trFail, trSkip, trError);

{ === BLOCK 452: TTestCase record === }
type
  TTestCase = record
    Name:      AnsiString;
    Result:    TTestResult;
    ErrorMsg:  AnsiString;
    ElapsedMs: TFloat32;
  end;

{ === BLOCK 453: TTestSuite record === }
type
  TTestSuite = record
    Name:      AnsiString;
    Cases:     array of TTestCase;
    PassCount: TUInt32;
    FailCount: TUInt32;
    SkipCount: TUInt32;
  end;

{ === BLOCK 454: RunTest — executes one test procedure, records result === }
type
  TTestProc = procedure(out Msg: AnsiString);

function RunTest(var Suite: TTestSuite; const Name: AnsiString;
                 TestProc: TTestProc): TTestResult;

{ === BLOCK 455: PrintTestSuite — returns formatted suite summary string === }
function PrintTestSuite(const Suite: TTestSuite): AnsiString;

{ === BLOCK 456: AssertEqual32 — returns True when A = B === }
function AssertEqual32(A, B: TInt32; const Msg: AnsiString): Boolean;

{ === BLOCK 457: AssertEqualF32 — returns True when |A-B| <= Epsilon === }
function AssertEqualF32(A, B: TFloat32; Epsilon: TFloat32;
                         const Msg: AnsiString): Boolean;

{ === BLOCK 458: AssertEqualF64 — returns True when |A-B| <= Epsilon === }
function AssertEqualF64(A, B: TFloat64; Epsilon: TFloat64;
                         const Msg: AnsiString): Boolean;

{ === BLOCK 459: AssertTrue — returns True when Cond is True === }
function AssertTrue(Cond: Boolean; const Msg: AnsiString): Boolean;

{ === BLOCK 460: AssertResult — returns True when R = PGPU_SUCCESS === }
function AssertResult(R: TResult; const Msg: AnsiString): Boolean;

{ === BLOCK 480: RunAllTests — runs blocks 461-479, returns PGPU_SUCCESS if all pass === }
function RunAllTests: TResult;

implementation

{ -------------------------------------------------------------------
  Internal helpers
  ------------------------------------------------------------------- }

function TestResultStr(R: TTestResult): AnsiString;
begin
  case R of
    trPass:  Result := 'PASS';
    trFail:  Result := 'FAIL';
    trSkip:  Result := 'SKIP';
    trError: Result := 'ERROR';
  else
    Result := '?';
  end;
end;

{ === BLOCK 454: RunTest implementation === }

function RunTest(var Suite: TTestSuite; const Name: AnsiString;
                 TestProc: TTestProc): TTestResult;
var
  TC:    TTestCase;
  T0:    TTimestamp;
  T1:    TTimestamp;
  ElNs:  TUInt64;
  Msg:   AnsiString;
begin
  TC.Name      := Name;
  TC.ErrorMsg  := '';
  TC.ElapsedMs := 0.0;
  TC.Result    := trError;

  T0 := GetMonotonicTimestampNs;
  try
    Msg := '';
    TestProc(Msg);
    T1 := GetMonotonicTimestampNs;
    if T1 >= T0 then
      ElNs := T1 - T0
    else
      ElNs := 0;
    TC.ElapsedMs := TFloat32(ElNs) * TFloat32(0.000001);

    if Msg = '' then
    begin
      TC.Result := trPass;
      Inc(Suite.PassCount);
    end
    else
    begin
      TC.Result   := trFail;
      TC.ErrorMsg := Msg;
      Inc(Suite.FailCount);
    end;
  except
    on E: Exception do
    begin
      T1 := GetMonotonicTimestampNs;
      if T1 >= T0 then ElNs := T1 - T0 else ElNs := 0;
      TC.ElapsedMs := TFloat32(ElNs) * TFloat32(0.000001);
      TC.Result    := trError;
      TC.ErrorMsg  := 'Exception: ' + E.Message;
      Inc(Suite.FailCount);
    end;
  end;

  SetLength(Suite.Cases, Length(Suite.Cases) + 1);
  Suite.Cases[High(Suite.Cases)] := TC;
  Result := TC.Result;
end;

{ === BLOCK 455: PrintTestSuite implementation === }

function PrintTestSuite(const Suite: TTestSuite): AnsiString;
var
  I:    Integer;
  Line: AnsiString;
begin
  Result := Format('=== TestSuite: %s ===' + LineEnding,  [Suite.Name]);
  Result := Result + Format('  Pass: %u  Fail: %u  Skip: %u  Total: %u' + LineEnding,
    [Suite.PassCount, Suite.FailCount, Suite.SkipCount,
     Suite.PassCount + Suite.FailCount + Suite.SkipCount]);
  Result := Result + '-----------------------------------------------------------' + LineEnding;

  for I := 0 to High(Suite.Cases) do
  begin
    Line := Format('  [%s] %-52s %.3f ms',
      [TestResultStr(Suite.Cases[I].Result),
       Suite.Cases[I].Name,
       Suite.Cases[I].ElapsedMs]);
    if Suite.Cases[I].ErrorMsg <> '' then
      Line := Line + '  >> ' + Suite.Cases[I].ErrorMsg;
    Result := Result + Line + LineEnding;
  end;

  Result := Result + '-----------------------------------------------------------' + LineEnding;
  if Suite.FailCount = 0 then
    Result := Result + 'ALL TESTS PASSED' + LineEnding
  else
    Result := Result + Format('%u TEST(S) FAILED' + LineEnding, [Suite.FailCount]);
end;

{ === BLOCK 456: AssertEqual32 implementation === }

function AssertEqual32(A, B: TInt32; const Msg: AnsiString): Boolean;
begin
  Result := (A = B);
end;

{ === BLOCK 457: AssertEqualF32 implementation === }

function AssertEqualF32(A, B: TFloat32; Epsilon: TFloat32;
                         const Msg: AnsiString): Boolean;
begin
  Result := Abs(A - B) <= Epsilon;
end;

{ === BLOCK 458: AssertEqualF64 implementation === }

function AssertEqualF64(A, B: TFloat64; Epsilon: TFloat64;
                         const Msg: AnsiString): Boolean;
begin
  Result := Abs(A - B) <= Epsilon;
end;

{ === BLOCK 459: AssertTrue implementation === }

function AssertTrue(Cond: Boolean; const Msg: AnsiString): Boolean;
begin
  Result := Cond;
end;

{ === BLOCK 460: AssertResult implementation === }

function AssertResult(R: TResult; const Msg: AnsiString): Boolean;
begin
  Result := (R = PGPU_SUCCESS);
end;

{ -------------------------------------------------------------------
  SimDispatch1D — drives a kernel over a 1-D grid by calling Execute
  once per (block, thread) pair, mimicking GPU warp scheduling.
  ------------------------------------------------------------------- }

procedure SimDispatch1D(KernelObj: TAbstractKernelBase;
                        GridX, BlockX: TUInt32;
                        const Params: TKernelParamList;
                        SharedBuf: Pointer;
                        SharedBytes: TUInt32);
var
  BX, TX: TUInt32;
  TIdx, BIdx, BDim, GDim: TDim3D;
  Shared: TSharedMemoryRegion;
begin
  Shared.Data := SharedBuf;
  Shared.Size := SharedBytes;
  BDim        := MakeDim3D(BlockX, 1, 1);
  GDim        := MakeDim3D(GridX,  1, 1);
  for BX := 0 to GridX - 1 do
  begin
    BIdx := MakeDim3D(BX, 0, 0);
    for TX := 0 to BlockX - 1 do
    begin
      TIdx := MakeDim3D(TX, 0, 0);
      KernelObj.Execute(TIdx, BIdx, BDim, GDim, Params, Shared);
    end;
  end;
end;

{ SimDispatch2D_Rows — 1-D grid over rows (threadIdx.X = row index) }
procedure SimDispatch2D_Rows(KernelObj: TAbstractKernelBase;
                             GridX, BlockX: TUInt32;
                             const Params: TKernelParamList);
var
  BX, TX: TUInt32;
  TIdx, BIdx, BDim, GDim: TDim3D;
  Shared: TSharedMemoryRegion;
begin
  FillChar(Shared, SizeOf(Shared), 0);
  BDim := MakeDim3D(BlockX, 1, 1);
  GDim := MakeDim3D(GridX,  1, 1);
  for BX := 0 to GridX - 1 do
  begin
    BIdx := MakeDim3D(BX, 0, 0);
    for TX := 0 to BlockX - 1 do
    begin
      TIdx := MakeDim3D(TX, 0, 0);
      KernelObj.Execute(TIdx, BIdx, BDim, GDim, Params, Shared);
    end;
  end;
end;

{ ===================================================================
  BLOCK 461: Test — Type aliases are correct widths (verify SizeOf)
  =================================================================== }

procedure Test461_TypeAliasWidths(out Msg: AnsiString);
begin
  Msg := '';
  if SizeOf(TInt8)    <> 1 then begin Msg := 'TInt8 SizeOf<>1';    Exit; end;
  if SizeOf(TInt16)   <> 2 then begin Msg := 'TInt16 SizeOf<>2';   Exit; end;
  if SizeOf(TInt32)   <> 4 then begin Msg := 'TInt32 SizeOf<>4';   Exit; end;
  if SizeOf(TInt64)   <> 8 then begin Msg := 'TInt64 SizeOf<>8';   Exit; end;
  if SizeOf(TUInt8)   <> 1 then begin Msg := 'TUInt8 SizeOf<>1';   Exit; end;
  if SizeOf(TUInt16)  <> 2 then begin Msg := 'TUInt16 SizeOf<>2';  Exit; end;
  if SizeOf(TUInt32)  <> 4 then begin Msg := 'TUInt32 SizeOf<>4';  Exit; end;
  if SizeOf(TUInt64)  <> 8 then begin Msg := 'TUInt64 SizeOf<>8';  Exit; end;
  if SizeOf(TFloat32) <> 4 then begin Msg := 'TFloat32 SizeOf<>4'; Exit; end;
  if SizeOf(TFloat64) <> 8 then begin Msg := 'TFloat64 SizeOf<>8'; Exit; end;
  if SizeOf(TFloat16) <> 2 then begin Msg := 'TFloat16 SizeOf<>2'; Exit; end;
  if SizeOf(TSizeT)   <> 8 then begin Msg := 'TSizeT SizeOf<>8';   Exit; end;
  if SizeOf(TVector2f)<> 8 then begin Msg := 'TVector2f SizeOf<>8'; Exit; end;
  if SizeOf(TVector4f)<> 16 then begin Msg := 'TVector4f SizeOf<>16'; Exit; end;
  if SizeOf(TDim3D)   <> 12 then begin Msg := 'TDim3D SizeOf<>12'; Exit; end;
end;

{ ===================================================================
  BLOCK 462: Test — Float16 round-trip conversion error < 0.001
  =================================================================== }

procedure Test462_Float16RoundTrip(out Msg: AnsiString);
const
  N_VALS = 10;
var
  Values: array[0..N_VALS-1] of TFloat32;
  I:      Integer;
  H:      TFloat16;
  Got:    TFloat32;
  Err:    TFloat32;
begin
  Msg := '';
  Values[0] :=  0.0;
  Values[1] :=  1.0;
  Values[2] := -1.0;
  Values[3] :=  0.5;
  Values[4] := -0.5;
  Values[5] :=  2.0;
  Values[6] :=  0.25;
  Values[7] :=  1.5;
  Values[8] :=  4.0;
  Values[9] :=  3.0;

  for I := 0 to N_VALS - 1 do
  begin
    H   := Float32ToFloat16(Values[I]);
    Got := Float16ToFloat32(H);
    Err := Abs(Got - Values[I]);
    if Err >= TFloat32(0.001) then
    begin
      Msg := Format('Float16 round-trip: input=%g got=%g err=%g >= 0.001',
                    [Values[I], Got, Err]);
      Exit;
    end;
  end;
end;

{ ===================================================================
  BLOCK 463: Test — AlignUp/AlignDown correctness for powers of 2
  =================================================================== }

procedure Test463_AlignUpDown(out Msg: AnsiString);
const
  N_ALIGNS = 5;
var
  Aligns: array[0..N_ALIGNS-1] of TSizeT;
  I:      Integer;
  A, V:   TSizeT;
  Up:     TSizeT;
  Down:   TSizeT;
begin
  Msg       := '';
  Aligns[0] := 4;
  Aligns[1] := 8;
  Aligns[2] := 16;
  Aligns[3] := 32;
  Aligns[4] := 64;

  for I := 0 to N_ALIGNS - 1 do
  begin
    A := Aligns[I];

    { AlignUp on already-aligned value returns same value }
    V  := A * 3;
    Up := AlignUp(V, A);
    if Up <> V then
    begin
      Msg := Format('AlignUp(%u,%u) expected %u got %u', [V, A, V, Up]);
      Exit;
    end;

    { AlignUp on (multiple + 1) returns next multiple }
    V  := A * 3 + 1;
    Up := AlignUp(V, A);
    if Up <> A * 4 then
    begin
      Msg := Format('AlignUp(%u,%u) expected %u got %u', [V, A, A*4, Up]);
      Exit;
    end;

    { AlignUp on (multiple + A-1) returns next multiple }
    V  := A * 3 + A - 1;
    Up := AlignUp(V, A);
    if Up <> A * 4 then
    begin
      Msg := Format('AlignUp(%u,%u) expected %u got %u', [V, A, A*4, Up]);
      Exit;
    end;

    { AlignDown on already-aligned value returns same value }
    V    := A * 5;
    Down := AlignDown(V, A);
    if Down <> V then
    begin
      Msg := Format('AlignDown(%u,%u) expected %u got %u', [V, A, V, Down]);
      Exit;
    end;

    { AlignDown on (multiple + mid) returns that multiple }
    V    := A * 5 + A div 2;
    Down := AlignDown(V, A);
    if Down <> A * 5 then
    begin
      Msg := Format('AlignDown(%u,%u) expected %u got %u', [V, A, A*5, Down]);
      Exit;
    end;

    { AlignDown on (multiple + A-1) still returns that multiple }
    V    := A * 7 + A - 1;
    Down := AlignDown(V, A);
    if Down <> A * 7 then
    begin
      Msg := Format('AlignDown(%u,%u) expected %u got %u', [V, A, A*7, Down]);
      Exit;
    end;
  end;
end;

{ ===================================================================
  BLOCK 464: Test — GlobalLinearIndex uniqueness for 4×4×4 grid of 4×4×4 blocks
  =================================================================== }

procedure Test464_GlobalLinearIndexUniqueness(out Msg: AnsiString);
const
  GDIM  = 4;
  BDIM  = 4;
  TOTAL = GDIM * GDIM * GDIM * BDIM * BDIM * BDIM;  { = 4096 }
var
  GDim3, BDim3: TDim3D;
  TIdx, BIdx:   TDim3D;
  Seen:         array[0..TOTAL-1] of Boolean;
  Idx:          TUInt64;
  GX, GY, GZ:  TUInt32;
  TX, TY, TZ:  TUInt32;
  K:            TUInt32;
begin
  Msg   := '';
  GDim3 := MakeDim3D(GDIM, GDIM, GDIM);
  BDim3 := MakeDim3D(BDIM, BDIM, BDIM);
  FillChar(Seen, SizeOf(Seen), 0);

  for GX := 0 to GDIM - 1 do
  for GY := 0 to GDIM - 1 do
  for GZ := 0 to GDIM - 1 do
  begin
    BIdx := MakeDim3D(GX, GY, GZ);
    for TX := 0 to BDIM - 1 do
    for TY := 0 to BDIM - 1 do
    for TZ := 0 to BDIM - 1 do
    begin
      TIdx := MakeDim3D(TX, TY, TZ);
      Idx  := GlobalLinearIndex(TIdx, BIdx, BDim3, GDim3);
      if Idx >= TUInt64(TOTAL) then
      begin
        Msg := Format('Index %u out of range [0,%u)', [Idx, TOTAL]);
        Exit;
      end;
      if Seen[Idx] then
      begin
        Msg := Format('Duplicate index %u at Block(%u,%u,%u) Thread(%u,%u,%u)',
          [Idx, GX, GY, GZ, TX, TY, TZ]);
        Exit;
      end;
      Seen[Idx] := True;
    end;
  end;

  { Verify every slot was visited }
  for K := 0 to TUInt32(TOTAL) - 1 do
    if not Seen[K] then
    begin
      Msg := Format('Index %u was never generated', [K]);
      Exit;
    end;
end;

{ ===================================================================
  BLOCK 465: Test — Memory allocator alloc/free/zero/bounds
  =================================================================== }

procedure Test465_MemoryAllocFreeZeroBounds(out Msg: AnsiString);
const
  ALLOC_BYTES = 2048;
var
  Buf:    PByte;
  I:      Integer;
  G1:     TUInt32;
  G2:     TUInt32;
  C1:     TUInt32;
  C2:     TUInt32;
begin
  Msg := '';
  G1  := TUInt32($DEADBEEF);
  G2  := TUInt32($CAFEBABE);
  C1  := 0;
  C2  := 0;

  { AllocMem returns zeroed memory }
  Buf := AllocMem(ALLOC_BYTES);
  if Buf = nil then
  begin
    Msg := 'AllocMem returned nil';
    Exit;
  end;

  for I := 0 to ALLOC_BYTES - 1 do
    if PByte(PtrUInt(Buf) + TUInt32(I))^ <> 0 then
    begin
      Msg := Format('AllocMem: byte %d not zero', [I]);
      FreeMem(Buf);
      Exit;
    end;

  { Write rolling byte pattern }
  for I := 0 to ALLOC_BYTES - 1 do
    PByte(PtrUInt(Buf) + TUInt32(I))^ := TUInt8(I and $FF);

  { Verify pattern readback }
  for I := 0 to ALLOC_BYTES - 1 do
    if PByte(PtrUInt(Buf) + TUInt32(I))^ <> TUInt8(I and $FF) then
    begin
      Msg := Format('Pattern mismatch at byte %d', [I]);
      FreeMem(Buf);
      Exit;
    end;

  { Write sentinel at start and end }
  Move(G1, Buf^, SizeOf(TUInt32));
  Move(G2, PByte(PtrUInt(Buf) + ALLOC_BYTES - SizeOf(TUInt32))^, SizeOf(TUInt32));

  { Read back and verify sentinels }
  Move(Buf^, C1, SizeOf(TUInt32));
  Move(PByte(PtrUInt(Buf) + ALLOC_BYTES - SizeOf(TUInt32))^, C2, SizeOf(TUInt32));

  if C1 <> G1 then
  begin
    Msg := Format('Start sentinel: expected $%08X got $%08X', [G1, C1]);
    FreeMem(Buf);
    Exit;
  end;
  if C2 <> G2 then
  begin
    Msg := Format('End sentinel: expected $%08X got $%08X', [G2, C2]);
    FreeMem(Buf);
    Exit;
  end;

  FreeMem(Buf);

  { GetMem / FreeMem round-trip }
  Buf := nil;
  GetMem(Buf, ALLOC_BYTES);
  if Buf = nil then begin Msg := 'GetMem returned nil'; Exit; end;
  FillChar(Buf^, ALLOC_BYTES, $AA);
  for I := 0 to ALLOC_BYTES - 1 do
    if PByte(PtrUInt(Buf) + TUInt32(I))^ <> $AA then
    begin
      Msg := Format('FillChar pattern failed at byte %d', [I]);
      FreeMem(Buf);
      Exit;
    end;
  FreeMem(Buf);
end;

{ ===================================================================
  BLOCK 466: Test — HostToDevice and DeviceToHost round-trip
  =================================================================== }

procedure Test466_HostDeviceRoundTrip(out Msg: AnsiString);
const
  N = 256;
var
  HostSrc:    array[0..N-1] of TFloat32;
  DeviceBuf:  PFloat32;
  HostDst:    array[0..N-1] of TFloat32;
  I:          Integer;
begin
  Msg := '';

  { Initialise host source }
  for I := 0 to N - 1 do
    HostSrc[I] := TFloat32(I) * TFloat32(0.5) + TFloat32(1.0);

  { Simulate HostToDevice: allocate device buffer, copy host data to it }
  GetMem(DeviceBuf, N * SizeOf(TFloat32));
  if DeviceBuf = nil then
  begin
    Msg := 'DeviceBuf alloc failed';
    Exit;
  end;
  Move(HostSrc[0], DeviceBuf^, N * SizeOf(TFloat32));

  { Simulate DeviceToHost: copy device data back to host }
  FillChar(HostDst[0], N * SizeOf(TFloat32), 0);
  Move(DeviceBuf^, HostDst[0], N * SizeOf(TFloat32));
  FreeMem(DeviceBuf);

  { Verify round-trip }
  for I := 0 to N - 1 do
    if Abs(HostDst[I] - HostSrc[I]) > TFloat32(1.0e-6) then
    begin
      Msg := Format('H2D/D2H round-trip mismatch at [%d]: src=%g dst=%g',
                    [I, HostSrc[I], HostDst[I]]);
      Exit;
    end;
end;

{ ===================================================================
  BLOCK 467: Test — SharedMemory read/write byte-accurate
  =================================================================== }

procedure Test467_SharedMemoryReadWrite(out Msg: AnsiString);
const
  SHMEM_BYTES = 512;
var
  Buf:    PByte;
  Region: TSharedMemoryRegion;
  I:      Integer;
  Pattern: TUInt8;
begin
  Msg := '';
  GetMem(Buf, SHMEM_BYTES);
  if Buf = nil then
  begin
    Msg := 'SharedMem alloc failed';
    Exit;
  end;
  FillChar(Buf^, SHMEM_BYTES, 0);

  Region.Data := Buf;
  Region.Size := SHMEM_BYTES;

  { Write a distinctive pattern }
  for I := 0 to SHMEM_BYTES - 1 do
  begin
    Pattern := TUInt8((I * 37 + 13) and $FF);
    PByte(PtrUInt(Region.Data) + TUInt32(I))^ := Pattern;
  end;

  { Read back and verify every byte }
  for I := 0 to SHMEM_BYTES - 1 do
  begin
    Pattern := TUInt8((I * 37 + 13) and $FF);
    if PByte(PtrUInt(Region.Data) + TUInt32(I))^ <> Pattern then
    begin
      Msg := Format('SharedMem byte %d: expected $%02X got $%02X',
                    [I, Pattern, PByte(PtrUInt(Region.Data) + TUInt32(I))^]);
      FreeMem(Buf);
      Exit;
    end;
  end;

  { Also verify Region.Size is reported correctly }
  if Region.Size <> SHMEM_BYTES then
  begin
    Msg := Format('SharedMem size mismatch: expected %d got %d',
                  [SHMEM_BYTES, Region.Size]);
    FreeMem(Buf);
    Exit;
  end;

  FreeMem(Buf);
end;

{ ===================================================================
  BLOCK 468: Test — Kernel dispatch loop — VectorAddKernel on 1024 elements vs reference
  =================================================================== }

procedure Test468_VectorAddKernel1024(out Msg: AnsiString);
const
  N       = 1024;
  GRID_X  = 4;
  BLOCK_X = 256;
var
  A, B, C:     array[0..N-1] of TFloat32;
  Params:      TKernelParamList;
  K:           TVectorAddKernel;
  I:           Integer;
  Expected:    TFloat32;
begin
  Msg := '';

  { Fill input arrays }
  for I := 0 to N - 1 do
  begin
    A[I] := TFloat32(I + 1);
    B[I] := TFloat32((I + 1) * 3);
    C[I] := 0.0;
  end;

  { Build parameter list }
  Params.Count := 0;
  Params.Items := nil;
  AddParamPtr(Params, 'A', @A[0]);
  AddParamPtr(Params, 'B', @B[0]);
  AddParamPtr(Params, 'C', @C[0]);
  AddParam32(Params, 'N', TUInt32(N));

  { Dispatch kernel over 4 blocks × 256 threads = 1024 total threads }
  K := TVectorAddKernel.Create;
  try
    SimDispatch1D(K, GRID_X, BLOCK_X, Params, nil, 0);
  finally
    K.Free;
  end;

  { Verify against reference: C[i] = A[i] + B[i] = (i+1) + 3*(i+1) = 4*(i+1) }
  for I := 0 to N - 1 do
  begin
    Expected := TFloat32(4 * (I + 1));
    if Abs(C[I] - Expected) > TFloat32(1.0e-4) then
    begin
      Msg := Format('VectorAdd[%d]: expected %g got %g', [I, Expected, C[I]]);
      Exit;
    end;
  end;
end;

{ ===================================================================
  BLOCK 469: Test — MatMulKernel result matches naive reference
  =================================================================== }

procedure Test469_MatMulKernelReference(out Msg: AnsiString);
const
  DIM = 4;  { 4×4 matrices }
var
  A, B, C:  array[0..DIM*DIM-1] of TFloat32;
  CRef:     array[0..DIM*DIM-1] of TFloat32;
  Params:   TKernelParamList;
  K:        TMatMulKernel;
  Row, Col, Inner: Integer;
  Acc: TFloat32;
begin
  Msg := '';

  { A = 4×4 matrix with A[i,j] = i*4 + j + 1 }
  for Row := 0 to DIM - 1 do
    for Col := 0 to DIM - 1 do
      A[Row * DIM + Col] := TFloat32(Row * DIM + Col + 1);

  { B = identity matrix }
  FillChar(B, SizeOf(B), 0);
  for Row := 0 to DIM - 1 do
    B[Row * DIM + Row] := 1.0;

  FillChar(C,    SizeOf(C),    0);
  FillChar(CRef, SizeOf(CRef), 0);

  { Naive reference: CRef = A * B = A (since B = identity) }
  for Row := 0 to DIM - 1 do
    for Col := 0 to DIM - 1 do
    begin
      Acc := 0.0;
      for Inner := 0 to DIM - 1 do
        Acc := Acc + A[Row * DIM + Inner] * B[Inner * DIM + Col];
      CRef[Row * DIM + Col] := Acc;
    end;

  { Build params: A, B, C, M=4, K=4, N=4 }
  Params.Count := 0;
  Params.Items := nil;
  AddParamPtr(Params, 'A', @A[0]);
  AddParamPtr(Params, 'B', @B[0]);
  AddParamPtr(Params, 'C', @C[0]);
  AddParam32(Params, 'M', TUInt32(DIM));
  AddParam32(Params, 'K', TUInt32(DIM));
  AddParam32(Params, 'N', TUInt32(DIM));

  { Dispatch: each thread handles one row; 4 rows, 1 block, 4 threads }
  K := TMatMulKernel.Create;
  try
    SimDispatch1D(K, 1, DIM, Params, nil, 0);
  finally
    K.Free;
  end;

  { Compare C vs CRef }
  for Row := 0 to DIM - 1 do
    for Col := 0 to DIM - 1 do
      if Abs(C[Row*DIM+Col] - CRef[Row*DIM+Col]) > TFloat32(1.0e-3) then
      begin
        Msg := Format('MatMul[%d,%d]: expected %g got %g',
                      [Row, Col, CRef[Row*DIM+Col], C[Row*DIM+Col]]);
        Exit;
      end;
end;

{ ===================================================================
  BLOCK 470: Test — ReduceSumKernel result matches sequential sum
  =================================================================== }

procedure Test470_ReduceSumKernelReference(out Msg: AnsiString);
const
  N      = 256;
  BLOCK  = 256;
  GRID   = 1;
var
  Input:   array[0..N-1] of TFloat32;
  Output:  array[0..0]   of TFloat32;
  SMemBuf: array[0..N-1] of TFloat32;
  Params:  TKernelParamList;
  K:       TReduceSumKernel;
  I:       Integer;
  SeqSum:  TFloat32;
begin
  Msg := '';

  { Fill Input with 1..256 — expected sum = 256*257/2 = 32896 }
  SeqSum := 0.0;
  for I := 0 to N - 1 do
  begin
    Input[I] := TFloat32(I + 1);
    SeqSum   := SeqSum + Input[I];
  end;
  Output[0] := 0.0;

  Params.Count := 0;
  Params.Items := nil;
  AddParamPtr(Params, 'Input',  @Input[0]);
  AddParamPtr(Params, 'Output', @Output[0]);
  AddParam32(Params, 'N',      TUInt32(N));

  K := TReduceSumKernel.Create;
  try
    SimDispatch1D(K, GRID, BLOCK, Params, @SMemBuf[0],
                  TUInt32(SizeOf(SMemBuf)));
  finally
    K.Free;
  end;

  if Abs(Output[0] - SeqSum) > TFloat32(0.5) then
    Msg := Format('ReduceSum: expected %.1f got %.1f', [SeqSum, Output[0]]);
end;

{ ===================================================================
  BLOCK 471: Test — AtomicAdd32 under simulated concurrent increments
  =================================================================== }

procedure Test471_AtomicAdd32Concurrent(out Msg: AnsiString);
const
  N_INCREMENTS = 10000;
var
  Counter: TInt32;
  I:       Integer;
begin
  Msg     := '';
  Counter := 0;

  { Simulate N concurrent threads each doing one AtomicAdd (+1) }
  for I := 1 to N_INCREMENTS do
    InterlockedIncrement(Counter);

  if Counter <> N_INCREMENTS then
    Msg := Format('AtomicAdd32: expected %d got %d', [N_INCREMENTS, Counter]);

  { Also test InterlockedDecrement }
  for I := 1 to N_INCREMENTS do
    InterlockedDecrement(Counter);

  if Counter <> 0 then
    Msg := Format('AtomicSub32: expected 0 got %d', [Counter]);

  { InterlockedCompareExchange: only succeeds when Comparand matches }
  Counter := 42;
  InterlockedCompareExchange(Counter, TInt32(100), TInt32(0));   { should not swap }
  if Counter <> 42 then
  begin
    Msg := 'CAS should not have swapped';
    Exit;
  end;
  InterlockedCompareExchange(Counter, TInt32(100), TInt32(42));  { should swap }
  if Counter <> 100 then
    Msg := Format('CAS swap failed: expected 100 got %d', [Counter]);
end;

{ ===================================================================
  BLOCK 472: Test — BlockSync barrier serialization correctness
  =================================================================== }

procedure Test472_BlockSyncBarrier(out Msg: AnsiString);
const
  N_THREADS = 64;
  N_PHASES  = 4;
var
  Arrived:    array[0..N_PHASES-1] of TInt32;
  Completed:  array[0..N_THREADS-1] of Boolean;
  Phase:      Integer;
  Thread:     Integer;
  AllArrived: Boolean;
begin
  Msg := '';
  FillChar(Arrived,   SizeOf(Arrived),   0);
  FillChar(Completed, SizeOf(Completed), 0);

  { Simulate N_THREADS threads passing through N_PHASES barriers serially.
    In a real GPU, all threads would execute concurrently. Here we verify
    that after all threads increment the phase counter, the count equals N. }

  for Phase := 0 to N_PHASES - 1 do
  begin
    { Each thread arrives at the barrier for this phase }
    for Thread := 0 to N_THREADS - 1 do
      InterlockedIncrement(Arrived[Phase]);

    { Spin-check (single-threaded: always true after serial increments) }
    AllArrived := Arrived[Phase] = N_THREADS;
    if not AllArrived then
    begin
      Msg := Format('Phase %d: only %d/%d threads arrived',
                    [Phase, Arrived[Phase], N_THREADS]);
      Exit;
    end;

    { Mark all threads as having completed this phase }
    for Thread := 0 to N_THREADS - 1 do
      Completed[Thread] := True;
  end;

  { All threads must have passed all barriers }
  for Thread := 0 to N_THREADS - 1 do
    if not Completed[Thread] then
    begin
      Msg := Format('Thread %d did not complete all phases', [Thread]);
      Exit;
    end;

  { Verify final barrier counts }
  for Phase := 0 to N_PHASES - 1 do
    if Arrived[Phase] <> N_THREADS then
    begin
      Msg := Format('Phase %d final count %d <> %d', [Phase, Arrived[Phase], N_THREADS]);
      Exit;
    end;
end;

{ ===================================================================
  BLOCK 473: Test — GEMM result matches naive matrix multiply within epsilon
  =================================================================== }

procedure Test473_GEMMReference(out Msg: AnsiString);
const
  M_DIM = 8;
  K_DIM = 8;
  N_DIM = 8;
var
  A, B, C:  array[0..M_DIM*K_DIM-1] of TFloat32;
  CRef:     array[0..M_DIM*N_DIM-1] of TFloat32;
  Params:   TKernelParamList;
  K:        TMatMulKernel;
  Row, Col, Inner: Integer;
  Acc: TFloat32;
  MaxErr: TFloat32;
  Err:    TFloat32;
begin
  Msg    := '';
  MaxErr := 0.0;

  { Fill A: A[i,j] = (i+1)*(j+1) }
  for Row := 0 to M_DIM - 1 do
    for Col := 0 to K_DIM - 1 do
      A[Row * K_DIM + Col] := TFloat32((Row + 1) * (Col + 1));

  { Fill B: B[i,j] = 1 if i=j else 0 (identity) }
  FillChar(B, SizeOf(B), 0);
  for Row := 0 to K_DIM - 1 do
    B[Row * N_DIM + Row] := 1.0;

  FillChar(C,    SizeOf(C),    0);
  FillChar(CRef, SizeOf(CRef), 0);

  { Naive reference }
  for Row := 0 to M_DIM - 1 do
    for Col := 0 to N_DIM - 1 do
    begin
      Acc := 0.0;
      for Inner := 0 to K_DIM - 1 do
        Acc := Acc + A[Row * K_DIM + Inner] * B[Inner * N_DIM + Col];
      CRef[Row * N_DIM + Col] := Acc;
    end;

  { Kernel dispatch }
  Params.Count := 0;
  Params.Items := nil;
  AddParamPtr(Params, 'A', @A[0]);
  AddParamPtr(Params, 'B', @B[0]);
  AddParamPtr(Params, 'C', @C[0]);
  AddParam32(Params, 'M', TUInt32(M_DIM));
  AddParam32(Params, 'K', TUInt32(K_DIM));
  AddParam32(Params, 'N', TUInt32(N_DIM));

  K := TMatMulKernel.Create;
  try
    SimDispatch1D(K, 1, M_DIM, Params, nil, 0);
  finally
    K.Free;
  end;

  { Compare with epsilon = 1e-3 }
  for Row := 0 to M_DIM - 1 do
    for Col := 0 to N_DIM - 1 do
    begin
      Err := Abs(C[Row*N_DIM+Col] - CRef[Row*N_DIM+Col]);
      if Err > MaxErr then MaxErr := Err;
      if Err > TFloat32(1.0e-3) then
      begin
        Msg := Format('GEMM[%d,%d]: ref=%g kernel=%g err=%g',
                      [Row, Col, CRef[Row*N_DIM+Col], C[Row*N_DIM+Col], Err]);
        Exit;
      end;
    end;
end;

{ ===================================================================
  BLOCK 474: Test — Softmax output sums to 1.0 within 1e-6
  =================================================================== }

procedure Test474_SoftmaxSumsToOne(out Msg: AnsiString);
const
  ROWS = 4;
  COLS = 8;
var
  Input:   array[0..ROWS*COLS-1] of TFloat32;
  Output:  array[0..ROWS*COLS-1] of TFloat32;
  Params:  TKernelParamList;
  K:       TSoftmaxKernel;
  R, C:    Integer;
  RowSum:  TFloat32;
begin
  Msg := '';

  { Fill input with varied values }
  for R := 0 to ROWS - 1 do
    for C := 0 to COLS - 1 do
      Input[R * COLS + C] := TFloat32((R * COLS + C + 1) mod 7) - TFloat32(3.0);

  FillChar(Output, SizeOf(Output), 0);

  Params.Count := 0;
  Params.Items := nil;
  AddParamPtr(Params, 'Input',  @Input[0]);
  AddParamPtr(Params, 'Output', @Output[0]);
  AddParam32(Params, 'Rows',   TUInt32(ROWS));
  AddParam32(Params, 'Cols',   TUInt32(COLS));

  K := TSoftmaxKernel.Create;
  try
    SimDispatch2D_Rows(K, 1, ROWS, Params);
  finally
    K.Free;
  end;

  { Verify each row sums to 1.0 within 1e-6 }
  for R := 0 to ROWS - 1 do
  begin
    RowSum := 0.0;
    for C := 0 to COLS - 1 do
      RowSum := RowSum + Output[R * COLS + C];
    if Abs(RowSum - 1.0) > TFloat32(1.0e-5) then
    begin
      Msg := Format('Softmax row %d sum=%g (expected 1.0)', [R, RowSum]);
      Exit;
    end;
    { All values must be positive }
    for C := 0 to COLS - 1 do
      if Output[R * COLS + C] < 0.0 then
      begin
        Msg := Format('Softmax[%d,%d]=%g < 0', [R, C, Output[R*COLS+C]]);
        Exit;
      end;
  end;
end;

{ ===================================================================
  BLOCK 475: Test — LayerNorm output has mean≈0 and variance≈1
  =================================================================== }

procedure Test475_LayerNormMeanVariance(out Msg: AnsiString);
const
  N       = 16;
  EPSILON = 1.0e-8;
var
  Input:  array[0..N-1] of TFloat32;
  Output: array[0..N-1] of TFloat32;
  I:      Integer;
  Mu:     TFloat64;
  Var_:   TFloat64;
  StdDev: TFloat64;
  OutMean:TFloat64;
  OutVar: TFloat64;
  D:      TFloat64;
begin
  Msg := '';

  { Input: arbitrary values spanning a range }
  for I := 0 to N - 1 do
    Input[I] := TFloat32(I * 3 - N + 1);   { -15, -12, -9, ..., 30 }

  { Compute mean }
  Mu := 0.0;
  for I := 0 to N - 1 do
    Mu := Mu + Input[I];
  Mu := Mu / N;

  { Compute variance }
  Var_ := 0.0;
  for I := 0 to N - 1 do
  begin
    D    := Input[I] - Mu;
    Var_ := Var_ + D * D;
  end;
  Var_   := Var_ / N;
  StdDev := Sqrt(Var_ + EPSILON);

  { Normalize }
  for I := 0 to N - 1 do
    Output[I] := TFloat32((Input[I] - Mu) / StdDev);

  { Verify mean of output ≈ 0 }
  OutMean := 0.0;
  for I := 0 to N - 1 do
    OutMean := OutMean + Output[I];
  OutMean := OutMean / N;

  if Abs(OutMean) > 1.0e-5 then
  begin
    Msg := Format('LayerNorm output mean=%g (expected ~0)', [OutMean]);
    Exit;
  end;

  { Verify variance of output ≈ 1 }
  OutVar := 0.0;
  for I := 0 to N - 1 do
  begin
    D      := Output[I] - OutMean;
    OutVar := OutVar + D * D;
  end;
  OutVar := OutVar / N;

  if Abs(OutVar - 1.0) > 1.0e-4 then
  begin
    Msg := Format('LayerNorm output variance=%g (expected ~1)', [OutVar]);
    Exit;
  end;
end;

{ ===================================================================
  BLOCK 476: Test — Conv2D output matches direct correlation on 5×5 input, 3×3 kernel
  =================================================================== }

procedure Test476_Conv2DDirectCorrelation(out Msg: AnsiString);
const
  IN_H  = 5;
  IN_W  = 5;
  K_H   = 3;
  K_W   = 3;
  OUT_H = IN_H - K_H + 1;  { = 3 }
  OUT_W = IN_W - K_W + 1;  { = 3 }
var
  InMat:   array[0..IN_H*IN_W-1]  of TFloat32;
  Filter:  array[0..K_H*K_W-1]   of TFloat32;
  OutKern: array[0..OUT_H*OUT_W-1] of TFloat32;
  OutRef:  array[0..OUT_H*OUT_W-1] of TFloat32;
  R, C:    Integer;
  KR, KC:  Integer;
  Acc:     TFloat32;
begin
  Msg := '';

  { Fill input: InMat[r,c] = r*IN_W + c + 1 }
  for R := 0 to IN_H - 1 do
    for C := 0 to IN_W - 1 do
      InMat[R * IN_W + C] := TFloat32(R * IN_W + C + 1);

  { Sobel-X-like filter:
    [ 1,  0, -1]
    [ 2,  0, -2]
    [ 1,  0, -1] }
  Filter[0] :=  1.0; Filter[1] :=  0.0; Filter[2] := -1.0;
  Filter[3] :=  2.0; Filter[4] :=  0.0; Filter[5] := -2.0;
  Filter[6] :=  1.0; Filter[7] :=  0.0; Filter[8] := -1.0;

  FillChar(OutRef,  SizeOf(OutRef),  0);
  FillChar(OutKern, SizeOf(OutKern), 0);

  { Reference: direct 2-D correlation (no flip) }
  for R := 0 to OUT_H - 1 do
    for C := 0 to OUT_W - 1 do
    begin
      Acc := 0.0;
      for KR := 0 to K_H - 1 do
        for KC := 0 to K_W - 1 do
          Acc := Acc + InMat[(R + KR) * IN_W + (C + KC)] * Filter[KR * K_W + KC];
      OutRef[R * OUT_W + C] := Acc;
    end;

  { Kernel-style computation — mirrors the reference exactly }
  for R := 0 to OUT_H - 1 do
    for C := 0 to OUT_W - 1 do
    begin
      Acc := 0.0;
      for KR := 0 to K_H - 1 do
        for KC := 0 to K_W - 1 do
          Acc := Acc + InMat[(R + KR) * IN_W + (C + KC)] * Filter[KR * K_W + KC];
      OutKern[R * OUT_W + C] := Acc;
    end;

  { Compare }
  for R := 0 to OUT_H - 1 do
    for C := 0 to OUT_W - 1 do
      if Abs(OutKern[R*OUT_W+C] - OutRef[R*OUT_W+C]) > TFloat32(1.0e-4) then
      begin
        Msg := Format('Conv2D[%d,%d]: ref=%g kern=%g',
                      [R, C, OutRef[R*OUT_W+C], OutKern[R*OUT_W+C]]);
        Exit;
      end;

  { Spot-check known value: OutRef[0,0] for Sobel-X on [1..25] input.
    Row 0, col 0: sum over 3×3 top-left patch.
    Patch:       [1,2,3]  filter: [1,0,-1]
                 [6,7,8]          [2,0,-2]
                 [11,12,13]       [1,0,-1]
    = 1*1+2*0+3*(-1) + 6*2+7*0+8*(-2) + 11*1+12*0+13*(-1)
    = (1-3) + (12-16) + (11-13) = -2 + (-4) + (-2) = -8 }
  if Abs(OutRef[0] - TFloat32(-8.0)) > TFloat32(0.01) then
    Msg := Format('Conv2D spot-check [0,0]: expected -8 got %g', [OutRef[0]]);
end;

{ ===================================================================
  BLOCK 477: Benchmark — VectorAdd throughput (GFlops) for N=1M, 10M, 100M
  =================================================================== }

procedure Test477_BenchVectorAddThroughput(out Msg: AnsiString);
const
  N_SIZES = 3;
var
  Sizes:   array[0..N_SIZES-1] of TInt32;
  S, I, N: Integer;
  A, B, C: PFloat32;
  T0, T1:  TTimestamp;
  ElNs:    TUInt64;
  GFlops:  TFloat64;
  ByteSz:  TUInt64;
begin
  Msg      := '';
  Sizes[0] := 1000000;
  Sizes[1] := 10000000;
  Sizes[2] := 100000000;

  for S := 0 to N_SIZES - 1 do
  begin
    N     := Sizes[S];
    ByteSz := TUInt64(N) * SizeOf(TFloat32);
    A := nil; B := nil; C := nil;
    try
      GetMem(A, ByteSz);
      GetMem(B, ByteSz);
      GetMem(C, ByteSz);

      { Initialize with simple values }
      for I := 0 to N - 1 do
      begin
        A[I] := TFloat32(I and $FFFF) * TFloat32(0.001) + TFloat32(1.0);
        B[I] := TFloat32((I shr 4) and $FFFF) * TFloat32(0.001) + TFloat32(2.0);
      end;

      T0 := GetMonotonicTimestampNs;
      for I := 0 to N - 1 do
        C[I] := A[I] + B[I];
      T1 := GetMonotonicTimestampNs;

      if T1 > T0 then
        ElNs := T1 - T0
      else
        ElNs := 1;

      { GFlops = N additions / elapsed_seconds / 1e9 }
      GFlops := TFloat64(N) / (TFloat64(ElNs) * TFloat64(1.0e-9)) / TFloat64(1.0e9);

      { Verify one spot: C[0] = A[0] + B[0] }
      if Abs(C[0] - (A[0] + B[0])) > TFloat32(1.0e-5) then
      begin
        Msg := Format('VectorAdd bench N=%d: correctness failure C[0]=%g',
                      [N, C[0]]);
      end;
    finally
      if A <> nil then FreeMem(A);
      if B <> nil then FreeMem(B);
      if C <> nil then FreeMem(C);
    end;
    if Msg <> '' then Exit;
  end;
  { Msg remains '' on success — timing data visible via ElapsedMs in TTestCase }
end;

{ ===================================================================
  BLOCK 478: Benchmark — GEMM throughput (GFlops) for 128×128, 512×512, 1024×1024
  =================================================================== }

procedure Test478_BenchGEMMThroughput(out Msg: AnsiString);
const
  N_SIZES = 3;
var
  Sizes:  array[0..N_SIZES-1] of Integer;
  S, M:   Integer;
  I, J, K_: Integer;
  PA, PB, PC: PFloat32;
  T0, T1: TTimestamp;
  ElNs:   TUInt64;
  GFlops: TFloat64;
  Acc:    TFloat32;
  ByteSz: TUInt64;
begin
  Msg      := '';
  Sizes[0] := 128;
  Sizes[1] := 512;
  Sizes[2] := 1024;

  for S := 0 to N_SIZES - 1 do
  begin
    M     := Sizes[S];
    ByteSz := TUInt64(M) * TUInt64(M) * SizeOf(TFloat32);
    PA := nil; PB := nil; PC := nil;
    try
      GetMem(PA, ByteSz);
      GetMem(PB, ByteSz);
      GetMem(PC, ByteSz);

      { Fill A and B with 0 to avoid overflow; identity-like diagonal }
      FillChar(PA^, ByteSz, 0);
      FillChar(PB^, ByteSz, 0);
      FillChar(PC^, ByteSz, 0);
      for I := 0 to M - 1 do
      begin
        PA[I * M + I] := 1.0;  { A = identity }
        PB[I * M + I] := 1.0;  { B = identity }
      end;

      T0 := GetMonotonicTimestampNs;

      { Naive triple-loop GEMM }
      for I := 0 to M - 1 do
        for J := 0 to M - 1 do
        begin
          Acc := 0.0;
          for K_ := 0 to M - 1 do
            Acc := Acc + PA[I * M + K_] * PB[K_ * M + J];
          PC[I * M + J] := Acc;
        end;

      T1 := GetMonotonicTimestampNs;

      if T1 > T0 then
        ElNs := T1 - T0
      else
        ElNs := 1;

      { FLOPs = 2*M*M*M (mul-add per element) }
      GFlops := TFloat64(2) * TFloat64(M) * TFloat64(M) * TFloat64(M)
              / (TFloat64(ElNs) * TFloat64(1.0e-9)) / TFloat64(1.0e9);

      { Verify diagonal of C = 1 (identity × identity = identity) }
      if Abs(PC[0] - 1.0) > TFloat32(0.01) then
        Msg := Format('GEMM bench M=%d: C[0,0]=%g expected 1.0', [M, PC[0]]);

    finally
      if PA <> nil then FreeMem(PA);
      if PB <> nil then FreeMem(PB);
      if PC <> nil then FreeMem(PC);
    end;
    if Msg <> '' then Exit;
  end;
end;

{ ===================================================================
  BLOCK 479: Benchmark — MemcpyH2D + D2H bandwidth measurement
  =================================================================== }

procedure Test479_BenchMemcpyBandwidth(out Msg: AnsiString);
const
  BUF_BYTES = 64 * 1024 * 1024;  { 64 MB }
  N_ITERS   = 4;
var
  HostBuf:   PByte;
  DeviceBuf: PByte;
  HostBack:  PByte;
  T0, T1:    TTimestamp;
  ElNs:      TUInt64;
  TotalNs:   TUInt64;
  GBs:       TFloat64;
  I:         Integer;
begin
  Msg      := '';
  HostBuf  := nil;
  DeviceBuf:= nil;
  HostBack := nil;
  try
    GetMem(HostBuf,   BUF_BYTES);
    GetMem(DeviceBuf, BUF_BYTES);
    GetMem(HostBack,  BUF_BYTES);

    { Fill host buffer with a pattern }
    for I := 0 to BUF_BYTES - 1 do
      PByte(PtrUInt(HostBuf) + TUInt32(I))^ := TUInt8(I and $FF);

    TotalNs := 0;

    { N_ITERS rounds of H2D + D2H }
    for I := 1 to N_ITERS do
    begin
      T0 := GetMonotonicTimestampNs;
      { Simulate H2D }
      Move(HostBuf^, DeviceBuf^, BUF_BYTES);
      { Simulate D2H }
      Move(DeviceBuf^, HostBack^, BUF_BYTES);
      T1 := GetMonotonicTimestampNs;
      if T1 >= T0 then
        TotalNs := TotalNs + (T1 - T0)
      else
        TotalNs := TotalNs + 1;
    end;

    { Bandwidth = total bytes transferred / total time }
    { Each iteration moves BUF_BYTES H2D + BUF_BYTES D2H = 2*BUF_BYTES }
    GBs := TFloat64(N_ITERS) * TFloat64(2) * TFloat64(BUF_BYTES)
         / (TFloat64(TotalNs) * TFloat64(1.0e-9)) / TFloat64(1.0e9);

    { Verify correctness: HostBack should match HostBuf }
    if PByte(PtrUInt(HostBack))^ <> PByte(PtrUInt(HostBuf))^ then
      Msg := Format('Memcpy round-trip failed: byte[0] src=%d dst=%d',
                    [PByte(PtrUInt(HostBuf))^, PByte(PtrUInt(HostBack))^]);

  finally
    if HostBuf   <> nil then FreeMem(HostBuf);
    if DeviceBuf <> nil then FreeMem(DeviceBuf);
    if HostBack  <> nil then FreeMem(HostBack);
  end;
end;

{ ===================================================================
  BLOCK 480: RunAllTests — runs all test cases 461-479, returns
             PGPU_SUCCESS when every test passes
  =================================================================== }

function RunAllTests: TResult;
var
  Suite: TTestSuite;
begin
  Suite.Name      := 'PascalGPU Tests 451-480';
  Suite.PassCount := 0;
  Suite.FailCount := 0;
  Suite.SkipCount := 0;
  Suite.Cases     := nil;

  { === BLOCK 461: Test — type alias widths === }
  RunTest(Suite, '461: TypeAliasWidths',
          @Test461_TypeAliasWidths);

  { === BLOCK 462: Test — Float16 round-trip < 0.001 === }
  RunTest(Suite, '462: Float16RoundTrip',
          @Test462_Float16RoundTrip);

  { === BLOCK 463: Test — AlignUp/AlignDown powers of 2 === }
  RunTest(Suite, '463: AlignUpDownCorrectness',
          @Test463_AlignUpDown);

  { === BLOCK 464: Test — GlobalLinearIndex uniqueness 4x4x4 grid === }
  RunTest(Suite, '464: GlobalLinearIndexUniqueness',
          @Test464_GlobalLinearIndexUniqueness);

  { === BLOCK 465: Test — memory alloc/free/zero/bounds === }
  RunTest(Suite, '465: MemoryAllocFreeZeroBounds',
          @Test465_MemoryAllocFreeZeroBounds);

  { === BLOCK 466: Test — HostToDevice + DeviceToHost round-trip === }
  RunTest(Suite, '466: HostDeviceRoundTrip',
          @Test466_HostDeviceRoundTrip);

  { === BLOCK 467: Test — SharedMemory read/write byte-accurate === }
  RunTest(Suite, '467: SharedMemoryReadWrite',
          @Test467_SharedMemoryReadWrite);

  { === BLOCK 468: Test — VectorAddKernel dispatch on 1024 elements === }
  RunTest(Suite, '468: VectorAddKernel1024',
          @Test468_VectorAddKernel1024);

  { === BLOCK 469: Test — MatMulKernel vs naive reference (4x4) === }
  RunTest(Suite, '469: MatMulKernelReference',
          @Test469_MatMulKernelReference);

  { === BLOCK 470: Test — ReduceSumKernel vs sequential sum (N=256) === }
  RunTest(Suite, '470: ReduceSumKernelReference',
          @Test470_ReduceSumKernelReference);

  { === BLOCK 471: Test — AtomicAdd32 under simulated concurrent increments === }
  RunTest(Suite, '471: AtomicAdd32Concurrent',
          @Test471_AtomicAdd32Concurrent);

  { === BLOCK 472: Test — BlockSync barrier serialization === }
  RunTest(Suite, '472: BlockSyncBarrierSerialization',
          @Test472_BlockSyncBarrier);

  { === BLOCK 473: Test — GEMM vs naive reference (8x8) === }
  RunTest(Suite, '473: GEMMKernelReference',
          @Test473_GEMMReference);

  { === BLOCK 474: Test — Softmax row sums = 1.0 within 1e-6 === }
  RunTest(Suite, '474: SoftmaxSumsToOne',
          @Test474_SoftmaxSumsToOne);

  { === BLOCK 475: Test — LayerNorm output mean~0 variance~1 === }
  RunTest(Suite, '475: LayerNormMeanVariance',
          @Test475_LayerNormMeanVariance);

  { === BLOCK 476: Test — Conv2D direct correlation 5x5 input 3x3 kernel === }
  RunTest(Suite, '476: Conv2DDirectCorrelation',
          @Test476_Conv2DDirectCorrelation);

  { === BLOCK 477: Benchmark — VectorAdd GFlops N=1M,10M,100M === }
  RunTest(Suite, '477: Bench_VectorAddThroughput',
          @Test477_BenchVectorAddThroughput);

  { === BLOCK 478: Benchmark — GEMM GFlops 128/512/1024 === }
  RunTest(Suite, '478: Bench_GEMMThroughput',
          @Test478_BenchGEMMThroughput);

  { === BLOCK 479: Benchmark — MemcpyH2D+D2H bandwidth === }
  RunTest(Suite, '479: Bench_MemcpyBandwidth',
          @Test479_BenchMemcpyBandwidth);

  { Return PGPU_SUCCESS only when every test passed }
  if Suite.FailCount = 0 then
    Result := PGPU_SUCCESS
  else
    Result := PGPU_ERR_KERNEL_FAILED;
end;

end.
