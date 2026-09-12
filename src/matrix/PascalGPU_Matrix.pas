{ ========================================================================
  SOVEREIGN LEVIATHAN COVENANT — MGPLv3 RECURSIVE INFECTION CLAUSE
  ========================================================================

  Node-ID:           PASCAL-STACK-006
  File:              PascalGPU_Matrix.pas
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

{$mode objfpc}{$H+}{$PackRecords C}
unit PascalGPU_Matrix;

interface

uses
  SysUtils, Math, PascalGPU_Types;

{ === BLOCK 398: TReduceOp enumeration === }
type
  TReduceOp = (roSum, roMax, roMin, roMean, roProd);

{ === BLOCK 351: TMatrix record === }
type
  TMatrix = record
    Rows    : TUInt32;
    Cols    : TUInt32;
    Data    : PFloat32;
    OwnsData: Boolean;
    Stride  : TUInt32;  { row stride in elements }
  end;
  PMatrix = ^TMatrix;

{ === BLOCK 376: TTensor record === }
type
  TTensor = record
    NDim         : TUInt32;
    Shape        : array[0..7] of TUInt32;
    Strides      : array[0..7] of TUInt32;
    Data         : PFloat32;
    TotalElements: TUInt64;
  end;
  PTensor = ^TTensor;

{ === BLOCK 394: MultiHeadAttention record === }
type
  TMultiHeadAttention = record
    NumHeads : TUInt32;
    ModelDim : TUInt32;
    HeadDim  : TUInt32;
    WQ       : TMatrix;
    WK       : TMatrix;
    WV       : TMatrix;
    WO       : TMatrix;
    Initialized: Boolean;
  end;
  PMultiHeadAttention = ^TMultiHeadAttention;

{ === BLOCK 352: AllocMatrix === }
function AllocMatrix(out M: TMatrix; Rows, Cols: TUInt32): TResult;

{ === BLOCK 353: FreeMatrix === }
function FreeMatrix(var M: TMatrix): TResult;

{ === BLOCK 354: MatrixAt === }
function MatrixAt(const M: TMatrix; Row, Col: TUInt32): TFloat32;

{ === BLOCK 355: MatrixSet === }
function MatrixSet(var M: TMatrix; Row, Col: TUInt32; Value: TFloat32): TResult;

{ === BLOCK 356: MatrixFill === }
function MatrixFill(var M: TMatrix; Value: TFloat32): TResult;

{ === BLOCK 357: MatrixZero === }
function MatrixZero(var M: TMatrix): TResult;

{ === BLOCK 358: MatrixIdentity === }
function MatrixIdentity(var M: TMatrix): TResult;

{ === BLOCK 359: MatrixCopy === }
function MatrixCopy(const Src: TMatrix; out Dst: TMatrix): TResult;

{ === BLOCK 360: MatrixTranspose === }
function MatrixTranspose(const A: TMatrix; out B: TMatrix): TResult;

{ === BLOCK 361: MatrixAdd === }
function MatrixAdd(const A, B: TMatrix; out C: TMatrix): TResult;

{ === BLOCK 362: MatrixSub === }
function MatrixSub(const A, B: TMatrix; out C: TMatrix): TResult;

{ === BLOCK 363: MatrixScale === }
function MatrixScale(const A: TMatrix; Scalar: TFloat32; out B: TMatrix): TResult;

{ === BLOCK 364: MatrixMul (naive O(n^3)) === }
function MatrixMul(const A, B: TMatrix; out C: TMatrix): TResult;

{ === BLOCK 365: MatrixMulTiled === }
function MatrixMulTiled(const A, B: TMatrix; out C: TMatrix; TileSize: TUInt32): TResult;

{ === BLOCK 366: PascalGEMM === }
function PascalGEMM(Alpha: TFloat32; const A, B: TMatrix; Beta: TFloat32; var C: TMatrix): TResult;

{ === BLOCK 367: MatrixMulTransposeB === }
function MatrixMulTransposeB(const A, B: TMatrix; out C: TMatrix): TResult;

{ === BLOCK 368: VectorMatrixMul === }
function VectorMatrixMul(V: PFloat32; const M: TMatrix; OutVec: PFloat32): TResult;

{ === BLOCK 369: MatrixVectorMul === }
function MatrixVectorMul(const M: TMatrix; V: PFloat32; OutVec: PFloat32): TResult;

{ === BLOCK 370: MatrixTrace === }
function MatrixTrace(const M: TMatrix; out Trace: TFloat32): TResult;

{ === BLOCK 371: MatrixDiag === }
function MatrixDiag(const M: TMatrix; out Diag: PFloat32): TResult;

{ === BLOCK 372: MatrixNorm (Frobenius) === }
function MatrixNorm(const M: TMatrix; out Norm: TFloat64): TResult;

{ === BLOCK 373: MatrixMaxAbsElement === }
function MatrixMaxAbsElement(const M: TMatrix; out MaxVal: TFloat32; out Row, Col: TUInt32): TResult;

{ === BLOCK 374: MatrixSoftmax === }
function MatrixSoftmax(const A: TMatrix; out B: TMatrix; Axis: TUInt32): TResult;

{ === BLOCK 375: MatrixLayerNorm === }
function MatrixLayerNorm(const A: TMatrix; Gamma, Beta: PFloat32; Epsilon: TFloat32; out B: TMatrix): TResult;

{ === BLOCK 377: AllocTensor === }
function AllocTensor(out T: TTensor; NDim: TUInt32; const Shape: array of TUInt32): TResult;

{ === BLOCK 378: FreeTensor === }
function FreeTensor(var T: TTensor): TResult;

{ === BLOCK 379: TensorAt === }
function TensorAt(const T: TTensor; const Indices: array of TUInt32): TFloat32;

{ === BLOCK 380: TensorSet === }
function TensorSet(var T: TTensor; const Indices: array of TUInt32; Value: TFloat32): TResult;

{ === BLOCK 381: TensorReshape === }
function TensorReshape(const A: TTensor; out B: TTensor; const NewShape: array of TUInt32): TResult;

{ === BLOCK 382: TensorSlice === }
function TensorSlice(const A: TTensor; Dim, Start, Length: TUInt32; out B: TTensor): TResult;

{ === BLOCK 383: TensorAdd === }
function TensorAdd(const A, B: TTensor; out C: TTensor): TResult;

{ === BLOCK 384: TensorMul (element-wise) === }
function TensorMul(const A, B: TTensor; out C: TTensor): TResult;

{ === BLOCK 385: TensorBatchedMatMul === }
function TensorBatchedMatMul(const A, B: TTensor; out C: TTensor): TResult;

{ === BLOCK 386: Conv1D === }
function Conv1D(const Input, Kernel: TTensor; out OutT: TTensor; Stride, Padding: TUInt32): TResult;

{ === BLOCK 387: Conv2D === }
function Conv2D(const Input, Kernel: TTensor; out OutT: TTensor; StrideH, StrideW, PadH, PadW: TUInt32): TResult;

{ === BLOCK 388: MaxPool2D === }
function MaxPool2D(const Input: TTensor; out OutT: TTensor; KH, KW, SH, SW: TUInt32): TResult;

{ === BLOCK 389: AvgPool2D === }
function AvgPool2D(const Input: TTensor; out OutT: TTensor; KH, KW, SH, SW: TUInt32): TResult;

{ === BLOCK 390: TensorNorm === }
function TensorNorm(const T: TTensor; out Norm: TFloat64): TResult;

{ === BLOCK 391: TensorFill === }
function TensorFill(var T: TTensor; Value: TFloat32): TResult;

{ === BLOCK 392: TensorPrint === }
function TensorPrint(const T: TTensor): AnsiString;

{ === BLOCK 393: ScaledDotProductAttention === }
function ScaledDotProductAttention(const Q, K, V: TTensor; out OutT: TTensor; Scale: TFloat32): TResult;

{ === BLOCK 394: MultiHeadAttention signatures === }
function MultiHeadAttentionInit(out MHA: TMultiHeadAttention; NumHeads, ModelDim: TUInt32): TResult;
function MultiHeadAttentionForward(var MHA: TMultiHeadAttention; const Q, K, V: TTensor; out OutT: TTensor): TResult;
function MultiHeadAttentionFree(var MHA: TMultiHeadAttention): TResult;

{ === BLOCK 395: TensorCopy === }
function TensorCopy(const Src: TTensor; out Dst: TTensor): TResult;

{ === BLOCK 396: TensorBroadcastAdd === }
function TensorBroadcastAdd(const A: TTensor; V: PFloat32; VNDim: TUInt32; out B: TTensor): TResult;

{ === BLOCK 397: TensorReduce === }
function TensorReduce(const A: TTensor; Axis: TUInt32; Op: TReduceOp; out B: TTensor): TResult;

{ === BLOCK 399: TensorValidate === }
function TensorValidate(const T: TTensor): TResult;

{ === BLOCK 400: MatrixSubsystemTest === }
function MatrixSubsystemTest: TResult;

implementation

{ ============================================================
  MATRIX IMPLEMENTATIONS
  ============================================================ }

{ === BLOCK 352: AllocMatrix implementation === }
function AllocMatrix(out M: TMatrix; Rows, Cols: TUInt32): TResult;
var
  ByteCount: TUInt64;
begin
  FillChar(M, SizeOf(TMatrix), 0);
  if (Rows = 0) or (Cols = 0) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  ByteCount := TUInt64(Rows) * TUInt64(Cols) * SizeOf(TFloat32);
  GetMem(M.Data, ByteCount);
  if M.Data = nil then
  begin
    Result := PGPU_ERR_OUT_OF_MEMORY;
    Exit;
  end;
  M.Rows     := Rows;
  M.Cols     := Cols;
  M.Stride   := Cols;
  M.OwnsData := True;
  FillChar(M.Data^, ByteCount, 0);
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 353: FreeMatrix implementation === }
function FreeMatrix(var M: TMatrix): TResult;
begin
  if M.OwnsData and (M.Data <> nil) then
  begin
    FreeMem(M.Data);
    M.Data := nil;
  end;
  M.Rows     := 0;
  M.Cols     := 0;
  M.Stride   := 0;
  M.OwnsData := False;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 354: MatrixAt implementation === }
function MatrixAt(const M: TMatrix; Row, Col: TUInt32): TFloat32;
var
  Ptr: PFloat32;
begin
  if (M.Data = nil) or (Row >= M.Rows) or (Col >= M.Cols) then
  begin
    Result := 0.0;
    Exit;
  end;
  Ptr := M.Data;
  Inc(Ptr, TUInt64(Row) * M.Stride + Col);
  Result := Ptr^;
end;

{ === BLOCK 355: MatrixSet implementation === }
function MatrixSet(var M: TMatrix; Row, Col: TUInt32; Value: TFloat32): TResult;
var
  Ptr: PFloat32;
begin
  if M.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if (Row >= M.Rows) or (Col >= M.Cols) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Ptr := M.Data;
  Inc(Ptr, TUInt64(Row) * M.Stride + Col);
  Ptr^ := Value;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 356: MatrixFill implementation === }
function MatrixFill(var M: TMatrix; Value: TFloat32): TResult;
var
  i, j: TUInt32;
  Ptr: PFloat32;
begin
  if M.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  for i := 0 to M.Rows - 1 do
  begin
    Ptr := M.Data;
    Inc(Ptr, TUInt64(i) * M.Stride);
    for j := 0 to M.Cols - 1 do
    begin
      Ptr^ := Value;
      Inc(Ptr);
    end;
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 357: MatrixZero implementation === }
function MatrixZero(var M: TMatrix): TResult;
var
  i: TUInt32;
  RowPtr: PFloat32;
  RowBytes: TUInt64;
begin
  if M.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  RowBytes := TUInt64(M.Cols) * SizeOf(TFloat32);
  for i := 0 to M.Rows - 1 do
  begin
    RowPtr := M.Data;
    Inc(RowPtr, TUInt64(i) * M.Stride);
    FillChar(RowPtr^, RowBytes, 0);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 358: MatrixIdentity implementation === }
function MatrixIdentity(var M: TMatrix): TResult;
var
  i: TUInt32;
  R: TResult;
begin
  if M.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if M.Rows <> M.Cols then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  R := MatrixZero(M);
  if R <> PGPU_SUCCESS then
  begin
    Result := R;
    Exit;
  end;
  for i := 0 to M.Rows - 1 do
    MatrixSet(M, i, i, 1.0);
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 359: MatrixCopy implementation === }
function MatrixCopy(const Src: TMatrix; out Dst: TMatrix): TResult;
var
  R: TResult;
  i: TUInt32;
  SrcRow, DstRow: PFloat32;
  RowBytes: TUInt64;
begin
  FillChar(Dst, SizeOf(TMatrix), 0);
  if Src.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  R := AllocMatrix(Dst, Src.Rows, Src.Cols);
  if R <> PGPU_SUCCESS then
  begin
    Result := R;
    Exit;
  end;
  RowBytes := TUInt64(Src.Cols) * SizeOf(TFloat32);
  for i := 0 to Src.Rows - 1 do
  begin
    SrcRow := Src.Data;
    Inc(SrcRow, TUInt64(i) * Src.Stride);
    DstRow := Dst.Data;
    Inc(DstRow, TUInt64(i) * Dst.Stride);
    Move(SrcRow^, DstRow^, RowBytes);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 360: MatrixTranspose implementation === }
function MatrixTranspose(const A: TMatrix; out B: TMatrix): TResult;
var
  R: TResult;
  i, j: TUInt32;
  SrcVal: TFloat32;
begin
  FillChar(B, SizeOf(TMatrix), 0);
  if A.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  R := AllocMatrix(B, A.Cols, A.Rows);
  if R <> PGPU_SUCCESS then
  begin
    Result := R;
    Exit;
  end;
  for i := 0 to A.Rows - 1 do
    for j := 0 to A.Cols - 1 do
    begin
      SrcVal := MatrixAt(A, i, j);
      MatrixSet(B, j, i, SrcVal);
    end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 361: MatrixAdd implementation === }
function MatrixAdd(const A, B: TMatrix; out C: TMatrix): TResult;
var
  R: TResult;
  i, j: TUInt32;
begin
  FillChar(C, SizeOf(TMatrix), 0);
  if (A.Data = nil) or (B.Data = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if (A.Rows <> B.Rows) or (A.Cols <> B.Cols) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  R := AllocMatrix(C, A.Rows, A.Cols);
  if R <> PGPU_SUCCESS then
  begin
    Result := R;
    Exit;
  end;
  for i := 0 to A.Rows - 1 do
    for j := 0 to A.Cols - 1 do
      MatrixSet(C, i, j, MatrixAt(A, i, j) + MatrixAt(B, i, j));
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 362: MatrixSub implementation === }
function MatrixSub(const A, B: TMatrix; out C: TMatrix): TResult;
var
  R: TResult;
  i, j: TUInt32;
begin
  FillChar(C, SizeOf(TMatrix), 0);
  if (A.Data = nil) or (B.Data = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if (A.Rows <> B.Rows) or (A.Cols <> B.Cols) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  R := AllocMatrix(C, A.Rows, A.Cols);
  if R <> PGPU_SUCCESS then
  begin
    Result := R;
    Exit;
  end;
  for i := 0 to A.Rows - 1 do
    for j := 0 to A.Cols - 1 do
      MatrixSet(C, i, j, MatrixAt(A, i, j) - MatrixAt(B, i, j));
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 363: MatrixScale implementation === }
function MatrixScale(const A: TMatrix; Scalar: TFloat32; out B: TMatrix): TResult;
var
  R: TResult;
  i, j: TUInt32;
begin
  FillChar(B, SizeOf(TMatrix), 0);
  if A.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  R := AllocMatrix(B, A.Rows, A.Cols);
  if R <> PGPU_SUCCESS then
  begin
    Result := R;
    Exit;
  end;
  for i := 0 to A.Rows - 1 do
    for j := 0 to A.Cols - 1 do
      MatrixSet(B, i, j, MatrixAt(A, i, j) * Scalar);
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 364: MatrixMul naive O(n^3) implementation === }
function MatrixMul(const A, B: TMatrix; out C: TMatrix): TResult;
var
  R: TResult;
  i, j, k: TUInt32;
  Acc: TFloat32;
begin
  FillChar(C, SizeOf(TMatrix), 0);
  if (A.Data = nil) or (B.Data = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if A.Cols <> B.Rows then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  R := AllocMatrix(C, A.Rows, B.Cols);
  if R <> PGPU_SUCCESS then
  begin
    Result := R;
    Exit;
  end;
  for i := 0 to A.Rows - 1 do
    for j := 0 to B.Cols - 1 do
    begin
      Acc := 0.0;
      for k := 0 to A.Cols - 1 do
        Acc := Acc + MatrixAt(A, i, k) * MatrixAt(B, k, j);
      MatrixSet(C, i, j, Acc);
    end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 365: MatrixMulTiled implementation === }
function MatrixMulTiled(const A, B: TMatrix; out C: TMatrix; TileSize: TUInt32): TResult;
var
  R: TResult;
  i, j, k, ii, jj, kk: TUInt32;
  iMax, jMax, kMax: TUInt32;
  Acc: TFloat32;
  TS: TUInt32;
begin
  FillChar(C, SizeOf(TMatrix), 0);
  if (A.Data = nil) or (B.Data = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if A.Cols <> B.Rows then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  TS := TileSize;
  if TS = 0 then TS := 16;
  R := AllocMatrix(C, A.Rows, B.Cols);
  if R <> PGPU_SUCCESS then
  begin
    Result := R;
    Exit;
  end;
  MatrixZero(C);
  ii := 0;
  while ii < A.Rows do
  begin
    jj := 0;
    while jj < B.Cols do
    begin
      kk := 0;
      while kk < A.Cols do
      begin
        if ii + TS - 1 < A.Rows then iMax := ii + TS - 1 else iMax := A.Rows - 1;
        if jj + TS - 1 < B.Cols then jMax := jj + TS - 1 else jMax := B.Cols - 1;
        if kk + TS - 1 < A.Cols then kMax := kk + TS - 1 else kMax := A.Cols - 1;
        for i := ii to iMax do
          for j := jj to jMax do
          begin
            Acc := MatrixAt(C, i, j);
            for k := kk to kMax do
              Acc := Acc + MatrixAt(A, i, k) * MatrixAt(B, k, j);
            MatrixSet(C, i, j, Acc);
          end;
        Inc(kk, TS);
      end;
      Inc(jj, TS);
    end;
    Inc(ii, TS);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 366: PascalGEMM implementation === }
{ C = alpha * A * B + beta * C }
function PascalGEMM(Alpha: TFloat32; const A, B: TMatrix; Beta: TFloat32; var C: TMatrix): TResult;
var
  i, j, k: TUInt32;
  Acc, Old: TFloat32;
begin
  if (A.Data = nil) or (B.Data = nil) or (C.Data = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if (A.Cols <> B.Rows) or (C.Rows <> A.Rows) or (C.Cols <> B.Cols) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  for i := 0 to A.Rows - 1 do
    for j := 0 to B.Cols - 1 do
    begin
      Acc := 0.0;
      for k := 0 to A.Cols - 1 do
        Acc := Acc + MatrixAt(A, i, k) * MatrixAt(B, k, j);
      Old := MatrixAt(C, i, j);
      MatrixSet(C, i, j, Alpha * Acc + Beta * Old);
    end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 367: MatrixMulTransposeB implementation === }
{ C = A * B^T }
function MatrixMulTransposeB(const A, B: TMatrix; out C: TMatrix): TResult;
var
  R: TResult;
  i, j, k: TUInt32;
  Acc: TFloat32;
begin
  FillChar(C, SizeOf(TMatrix), 0);
  if (A.Data = nil) or (B.Data = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  { A is M x K, B is N x K, C is M x N }
  if A.Cols <> B.Cols then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  R := AllocMatrix(C, A.Rows, B.Rows);
  if R <> PGPU_SUCCESS then
  begin
    Result := R;
    Exit;
  end;
  for i := 0 to A.Rows - 1 do
    for j := 0 to B.Rows - 1 do
    begin
      Acc := 0.0;
      for k := 0 to A.Cols - 1 do
        Acc := Acc + MatrixAt(A, i, k) * MatrixAt(B, j, k);
      MatrixSet(C, i, j, Acc);
    end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 368: VectorMatrixMul implementation === }
{ Out[j] = sum_i V[i] * M[i,j], V is row vector of length M.Rows }
function VectorMatrixMul(V: PFloat32; const M: TMatrix; OutVec: PFloat32): TResult;
var
  i, j: TUInt32;
  Acc: TFloat32;
  PV: PFloat32;
  PO: PFloat32;
begin
  if (V = nil) or (M.Data = nil) or (OutVec = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  for j := 0 to M.Cols - 1 do
  begin
    Acc := 0.0;
    PV := V;
    for i := 0 to M.Rows - 1 do
    begin
      Acc := Acc + PV^ * MatrixAt(M, i, j);
      Inc(PV);
    end;
    PO := OutVec;
    Inc(PO, j);
    PO^ := Acc;
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 369: MatrixVectorMul implementation === }
{ Out[i] = sum_j M[i,j] * V[j], V is column vector of length M.Cols }
function MatrixVectorMul(const M: TMatrix; V: PFloat32; OutVec: PFloat32): TResult;
var
  i, j: TUInt32;
  Acc: TFloat32;
  PV: PFloat32;
  PO: PFloat32;
begin
  if (M.Data = nil) or (V = nil) or (OutVec = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  for i := 0 to M.Rows - 1 do
  begin
    Acc := 0.0;
    PV := V;
    for j := 0 to M.Cols - 1 do
    begin
      Acc := Acc + MatrixAt(M, i, j) * PV^;
      Inc(PV);
    end;
    PO := OutVec;
    Inc(PO, i);
    PO^ := Acc;
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 370: MatrixTrace implementation === }
function MatrixTrace(const M: TMatrix; out Trace: TFloat32): TResult;
var
  i, MinDim: TUInt32;
begin
  Trace := 0.0;
  if M.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if M.Rows < M.Cols then MinDim := M.Rows else MinDim := M.Cols;
  for i := 0 to MinDim - 1 do
    Trace := Trace + MatrixAt(M, i, i);
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 371: MatrixDiag implementation === }
function MatrixDiag(const M: TMatrix; out Diag: PFloat32): TResult;
var
  i, MinDim: TUInt32;
  PD: PFloat32;
begin
  Diag := nil;
  if M.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if M.Rows < M.Cols then MinDim := M.Rows else MinDim := M.Cols;
  GetMem(Diag, TUInt64(MinDim) * SizeOf(TFloat32));
  if Diag = nil then
  begin
    Result := PGPU_ERR_OUT_OF_MEMORY;
    Exit;
  end;
  PD := Diag;
  for i := 0 to MinDim - 1 do
  begin
    PD^ := MatrixAt(M, i, i);
    Inc(PD);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 372: MatrixNorm (Frobenius) implementation === }
function MatrixNorm(const M: TMatrix; out Norm: TFloat64): TResult;
var
  i, j: TUInt32;
  V: TFloat32;
  Sum: TFloat64;
begin
  Norm := 0.0;
  if M.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Sum := 0.0;
  for i := 0 to M.Rows - 1 do
    for j := 0 to M.Cols - 1 do
    begin
      V := MatrixAt(M, i, j);
      Sum := Sum + TFloat64(V) * TFloat64(V);
    end;
  Norm := Sqrt(Sum);
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 373: MatrixMaxAbsElement implementation === }
function MatrixMaxAbsElement(const M: TMatrix; out MaxVal: TFloat32; out Row, Col: TUInt32): TResult;
var
  i, j: TUInt32;
  V, AV: TFloat32;
begin
  MaxVal := 0.0;
  Row    := 0;
  Col    := 0;
  if M.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  MaxVal := -1.0;
  for i := 0 to M.Rows - 1 do
    for j := 0 to M.Cols - 1 do
    begin
      V := MatrixAt(M, i, j);
      if V < 0.0 then AV := -V else AV := V;
      if AV > MaxVal then
      begin
        MaxVal := AV;
        Row    := i;
        Col    := j;
      end;
    end;
  if MaxVal < 0.0 then MaxVal := 0.0;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 374: MatrixSoftmax implementation === }
{ Axis=0: softmax over columns (each column sums to 1)
  Axis=1: softmax over rows (each row sums to 1) }
function MatrixSoftmax(const A: TMatrix; out B: TMatrix; Axis: TUInt32): TResult;
var
  R: TResult;
  i, j: TUInt32;
  MaxV, SumV, EV: TFloat32;
begin
  FillChar(B, SizeOf(TMatrix), 0);
  if A.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Axis > 1 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  R := AllocMatrix(B, A.Rows, A.Cols);
  if R <> PGPU_SUCCESS then
  begin
    Result := R;
    Exit;
  end;
  if Axis = 1 then
  begin
    { softmax over each row }
    for i := 0 to A.Rows - 1 do
    begin
      MaxV := MatrixAt(A, i, 0);
      for j := 1 to A.Cols - 1 do
        if MatrixAt(A, i, j) > MaxV then MaxV := MatrixAt(A, i, j);
      SumV := 0.0;
      for j := 0 to A.Cols - 1 do
      begin
        EV := Exp(MatrixAt(A, i, j) - MaxV);
        MatrixSet(B, i, j, EV);
        SumV := SumV + EV;
      end;
      if SumV = 0.0 then SumV := 1.0;
      for j := 0 to A.Cols - 1 do
        MatrixSet(B, i, j, MatrixAt(B, i, j) / SumV);
    end;
  end
  else
  begin
    { softmax over each column }
    for j := 0 to A.Cols - 1 do
    begin
      MaxV := MatrixAt(A, 0, j);
      for i := 1 to A.Rows - 1 do
        if MatrixAt(A, i, j) > MaxV then MaxV := MatrixAt(A, i, j);
      SumV := 0.0;
      for i := 0 to A.Rows - 1 do
      begin
        EV := Exp(MatrixAt(A, i, j) - MaxV);
        MatrixSet(B, i, j, EV);
        SumV := SumV + EV;
      end;
      if SumV = 0.0 then SumV := 1.0;
      for i := 0 to A.Rows - 1 do
        MatrixSet(B, i, j, MatrixAt(B, i, j) / SumV);
    end;
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 375: MatrixLayerNorm implementation === }
{ Normalizes each row; Gamma and Beta are per-column scale/bias vectors of length Cols }
function MatrixLayerNorm(const A: TMatrix; Gamma, Beta: PFloat32; Epsilon: TFloat32; out B: TMatrix): TResult;
var
  R: TResult;
  i, j: TUInt32;
  Mean, Var_, Std_, NormV: TFloat32;
  PG, PBt: PFloat32;
begin
  FillChar(B, SizeOf(TMatrix), 0);
  if A.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  R := AllocMatrix(B, A.Rows, A.Cols);
  if R <> PGPU_SUCCESS then
  begin
    Result := R;
    Exit;
  end;
  for i := 0 to A.Rows - 1 do
  begin
    Mean := 0.0;
    for j := 0 to A.Cols - 1 do
      Mean := Mean + MatrixAt(A, i, j);
    Mean := Mean / A.Cols;
    Var_ := 0.0;
    for j := 0 to A.Cols - 1 do
    begin
      NormV := MatrixAt(A, i, j) - Mean;
      Var_ := Var_ + NormV * NormV;
    end;
    Var_ := Var_ / A.Cols;
    Std_ := Sqrt(Var_ + Epsilon);
    for j := 0 to A.Cols - 1 do
    begin
      NormV := (MatrixAt(A, i, j) - Mean) / Std_;
      if Gamma <> nil then
      begin
        PG := Gamma;
        Inc(PG, j);
        NormV := NormV * PG^;
      end;
      if Beta <> nil then
      begin
        PBt := Beta;
        Inc(PBt, j);
        NormV := NormV + PBt^;
      end;
      MatrixSet(B, i, j, NormV);
    end;
  end;
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  TENSOR IMPLEMENTATIONS
  ============================================================ }

{ === BLOCK 377: AllocTensor implementation === }
function AllocTensor(out T: TTensor; NDim: TUInt32; const Shape: array of TUInt32): TResult;
var
  i: TUInt32;
  Total: TUInt64;
  ByteCount: TUInt64;
begin
  FillChar(T, SizeOf(TTensor), 0);
  if (NDim = 0) or (NDim > 8) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if TUInt32(Length(Shape)) < NDim then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  T.NDim := NDim;
  Total := 1;
  for i := 0 to NDim - 1 do
  begin
    if Shape[i] = 0 then
    begin
      Result := PGPU_ERR_INVALID_PARAM;
      Exit;
    end;
    T.Shape[i] := Shape[i];
    Total := Total * Shape[i];
  end;
  T.TotalElements := Total;
  { Compute row-major strides }
  T.Strides[NDim - 1] := 1;
  if NDim > 1 then
  begin
    i := NDim - 1;
    while i > 0 do
    begin
      T.Strides[i - 1] := T.Strides[i] * T.Shape[i];
      Dec(i);
    end;
  end;
  ByteCount := Total * SizeOf(TFloat32);
  GetMem(T.Data, ByteCount);
  if T.Data = nil then
  begin
    Result := PGPU_ERR_OUT_OF_MEMORY;
    Exit;
  end;
  FillChar(T.Data^, ByteCount, 0);
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 378: FreeTensor implementation === }
function FreeTensor(var T: TTensor): TResult;
begin
  if T.Data <> nil then
  begin
    FreeMem(T.Data);
    T.Data := nil;
  end;
  FillChar(T, SizeOf(TTensor), 0);
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 379: TensorAt implementation === }
function TensorAt(const T: TTensor; const Indices: array of TUInt32): TFloat32;
var
  i: TUInt32;
  Offset: TUInt64;
  PD: PFloat32;
begin
  Result := 0.0;
  if T.Data = nil then Exit;
  if TUInt32(Length(Indices)) <> T.NDim then Exit;
  Offset := 0;
  for i := 0 to T.NDim - 1 do
  begin
    if Indices[i] >= T.Shape[i] then Exit;
    Offset := Offset + TUInt64(Indices[i]) * T.Strides[i];
  end;
  PD := T.Data;
  Inc(PD, Offset);
  Result := PD^;
end;

{ === BLOCK 380: TensorSet implementation === }
function TensorSet(var T: TTensor; const Indices: array of TUInt32; Value: TFloat32): TResult;
var
  i: TUInt32;
  Offset: TUInt64;
  PD: PFloat32;
begin
  if T.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if TUInt32(Length(Indices)) <> T.NDim then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Offset := 0;
  for i := 0 to T.NDim - 1 do
  begin
    if Indices[i] >= T.Shape[i] then
    begin
      Result := PGPU_ERR_INVALID_PARAM;
      Exit;
    end;
    Offset := Offset + TUInt64(Indices[i]) * T.Strides[i];
  end;
  PD := T.Data;
  Inc(PD, Offset);
  PD^ := Value;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 381: TensorReshape implementation === }
function TensorReshape(const A: TTensor; out B: TTensor; const NewShape: array of TUInt32): TResult;
var
  NewNDim: TUInt32;
  NewTotal: TUInt64;
  i: TUInt32;
  ByteCount: TUInt64;
begin
  FillChar(B, SizeOf(TTensor), 0);
  if A.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  NewNDim := TUInt32(Length(NewShape));
  if (NewNDim = 0) or (NewNDim > 8) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  NewTotal := 1;
  for i := 0 to NewNDim - 1 do
  begin
    if NewShape[i] = 0 then
    begin
      Result := PGPU_ERR_INVALID_PARAM;
      Exit;
    end;
    NewTotal := NewTotal * NewShape[i];
  end;
  if NewTotal <> A.TotalElements then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  B.NDim          := NewNDim;
  B.TotalElements := NewTotal;
  for i := 0 to NewNDim - 1 do
    B.Shape[i] := NewShape[i];
  B.Strides[NewNDim - 1] := 1;
  if NewNDim > 1 then
  begin
    i := NewNDim - 1;
    while i > 0 do
    begin
      B.Strides[i - 1] := B.Strides[i] * B.Shape[i];
      Dec(i);
    end;
  end;
  { Share data — not owning copy }
  ByteCount := NewTotal * SizeOf(TFloat32);
  GetMem(B.Data, ByteCount);
  if B.Data = nil then
  begin
    Result := PGPU_ERR_OUT_OF_MEMORY;
    Exit;
  end;
  Move(A.Data^, B.Data^, ByteCount);
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 382: TensorSlice implementation === }
{ Creates a new tensor by slicing dimension Dim from Start with given Length }
function TensorSlice(const A: TTensor; Dim, Start, Length: TUInt32; out B: TTensor): TResult;
var
  i: TUInt32;
  NewShape: array[0..7] of TUInt32;
  NewNDim: TUInt32;
  SrcIdx, DstIdx: array[0..7] of TUInt32;
  SrcOffset, DstOffset: TUInt64;
  ElemCount: TUInt64;
  PSrc, PDst: PFloat32;
  d, e: TUInt32;
  DimSizes: array[0..7] of TUInt32;
  Carry: TUInt32;
begin
  FillChar(B, SizeOf(TTensor), 0);
  if A.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Dim >= A.NDim then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Start + Length > A.Shape[Dim] then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  NewNDim := A.NDim;
  for i := 0 to NewNDim - 1 do
    NewShape[i] := A.Shape[i];
  NewShape[Dim] := Length;
  { Build result tensor }
  B.NDim := NewNDim;
  B.TotalElements := 1;
  for i := 0 to NewNDim - 1 do
  begin
    B.Shape[i] := NewShape[i];
    B.TotalElements := B.TotalElements * NewShape[i];
  end;
  B.Strides[NewNDim - 1] := 1;
  if NewNDim > 1 then
  begin
    i := NewNDim - 1;
    while i > 0 do
    begin
      B.Strides[i - 1] := B.Strides[i] * B.Shape[i];
      Dec(i);
    end;
  end;
  ElemCount := B.TotalElements;
  GetMem(B.Data, ElemCount * SizeOf(TFloat32));
  if B.Data = nil then
  begin
    Result := PGPU_ERR_OUT_OF_MEMORY;
    Exit;
  end;
  { Copy elements }
  FillChar(DstIdx, SizeOf(DstIdx), 0);
  for e := 0 to ElemCount - 1 do
  begin
    { Map DstIdx -> SrcIdx }
    for d := 0 to NewNDim - 1 do
      SrcIdx[d] := DstIdx[d];
    SrcIdx[Dim] := DstIdx[Dim] + Start;
    { Compute offsets }
    SrcOffset := 0;
    DstOffset := 0;
    for d := 0 to NewNDim - 1 do
    begin
      SrcOffset := SrcOffset + TUInt64(SrcIdx[d]) * A.Strides[d];
      DstOffset := DstOffset + TUInt64(DstIdx[d]) * B.Strides[d];
    end;
    PSrc := A.Data; Inc(PSrc, SrcOffset);
    PDst := B.Data; Inc(PDst, DstOffset);
    PDst^ := PSrc^;
    { Increment DstIdx }
    Carry := 1;
    d := NewNDim;
    while (d > 0) and (Carry = 1) do
    begin
      Dec(d);
      DstIdx[d] := DstIdx[d] + Carry;
      if DstIdx[d] >= B.Shape[d] then
        DstIdx[d] := 0
      else
        Carry := 0;
    end;
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 383: TensorAdd implementation === }
function TensorAdd(const A, B: TTensor; out C: TTensor): TResult;
var
  R: TResult;
  i: TUInt64;
  PA, PBPtr, PCPtr: PFloat32;
begin
  FillChar(C, SizeOf(TTensor), 0);
  if (A.Data = nil) or (B.Data = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if A.TotalElements <> B.TotalElements then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if A.NDim <> B.NDim then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  { Allocate C with same shape as A }
  C.NDim          := A.NDim;
  C.TotalElements := A.TotalElements;
  Move(A.Shape,   C.Shape,   SizeOf(A.Shape));
  Move(A.Strides, C.Strides, SizeOf(A.Strides));
  GetMem(C.Data, C.TotalElements * SizeOf(TFloat32));
  if C.Data = nil then
  begin
    Result := PGPU_ERR_OUT_OF_MEMORY;
    Exit;
  end;
  PA    := A.Data;
  PBPtr := B.Data;
  PCPtr := C.Data;
  for i := 0 to A.TotalElements - 1 do
  begin
    PCPtr^ := PA^ + PBPtr^;
    Inc(PA); Inc(PBPtr); Inc(PCPtr);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 384: TensorMul element-wise implementation === }
function TensorMul(const A, B: TTensor; out C: TTensor): TResult;
var
  i: TUInt64;
  PA, PBPtr, PCPtr: PFloat32;
begin
  FillChar(C, SizeOf(TTensor), 0);
  if (A.Data = nil) or (B.Data = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if A.TotalElements <> B.TotalElements then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  C.NDim          := A.NDim;
  C.TotalElements := A.TotalElements;
  Move(A.Shape,   C.Shape,   SizeOf(A.Shape));
  Move(A.Strides, C.Strides, SizeOf(A.Strides));
  GetMem(C.Data, C.TotalElements * SizeOf(TFloat32));
  if C.Data = nil then
  begin
    Result := PGPU_ERR_OUT_OF_MEMORY;
    Exit;
  end;
  PA    := A.Data;
  PBPtr := B.Data;
  PCPtr := C.Data;
  for i := 0 to A.TotalElements - 1 do
  begin
    PCPtr^ := PA^ * PBPtr^;
    Inc(PA); Inc(PBPtr); Inc(PCPtr);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 385: TensorBatchedMatMul implementation === }
{ A: [Batch, M, K], B: [Batch, K, N] -> C: [Batch, M, N] }
function TensorBatchedMatMul(const A, B: TTensor; out C: TTensor): TResult;
var
  Batch, M, K, N: TUInt32;
  b, i, j, k: TUInt32;
  Acc: TFloat32;
  ABase, BBase, CBase: TUInt64;
  ShapeC: array[0..2] of TUInt32;
  PA, PBPtr, PCPtr: PFloat32;
begin
  FillChar(C, SizeOf(TTensor), 0);
  if (A.Data = nil) or (B.Data = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if (A.NDim <> 3) or (B.NDim <> 3) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Batch := A.Shape[0];
  M     := A.Shape[1];
  K     := A.Shape[2];
  if (B.Shape[0] <> Batch) or (B.Shape[1] <> K) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  N := B.Shape[2];
  ShapeC[0] := Batch;
  ShapeC[1] := M;
  ShapeC[2] := N;
  Result := AllocTensor(C, 3, ShapeC);
  if Result <> PGPU_SUCCESS then Exit;
  for b := 0 to Batch - 1 do
  begin
    ABase := TUInt64(b) * M * K;
    BBase := TUInt64(b) * K * N;
    CBase := TUInt64(b) * M * N;
    for i := 0 to M - 1 do
      for j := 0 to N - 1 do
      begin
        Acc := 0.0;
        for k := 0 to K - 1 do
        begin
          PA    := A.Data; Inc(PA,    ABase + TUInt64(i) * K + k);
          PBPtr := B.Data; Inc(PBPtr, BBase + TUInt64(k) * N + j);
          Acc := Acc + PA^ * PBPtr^;
        end;
        PCPtr := C.Data; Inc(PCPtr, CBase + TUInt64(i) * N + j);
        PCPtr^ := Acc;
      end;
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 386: Conv1D implementation === }
{ Input: [Batch, InLen, InCh], Kernel: [OutCh, KLen, InCh] -> Out: [Batch, OutLen, OutCh] }
function Conv1D(const Input, Kernel: TTensor; out OutT: TTensor; Stride, Padding: TUInt32): TResult;
var
  Batch, InLen, InCh: TUInt32;
  OutCh, KLen: TUInt32;
  OutLen: TUInt32;
  ShapeOut: array[0..2] of TUInt32;
  b, oc, ol, ic, kl: TUInt32;
  InPos: LongInt;
  Acc: TFloat32;
  PIn, PKer, POut: PFloat32;
  InOff, KerOff, OutOff: TUInt64;
begin
  FillChar(OutT, SizeOf(TTensor), 0);
  if (Input.Data = nil) or (Kernel.Data = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if (Input.NDim <> 3) or (Kernel.NDim <> 3) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Batch := Input.Shape[0];
  InLen := Input.Shape[1];
  InCh  := Input.Shape[2];
  OutCh := Kernel.Shape[0];
  KLen  := Kernel.Shape[1];
  if Kernel.Shape[2] <> InCh then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Stride = 0 then Stride := 1;
  OutLen := (InLen + 2 * Padding - KLen) div Stride + 1;
  ShapeOut[0] := Batch;
  ShapeOut[1] := OutLen;
  ShapeOut[2] := OutCh;
  Result := AllocTensor(OutT, 3, ShapeOut);
  if Result <> PGPU_SUCCESS then Exit;
  for b := 0 to Batch - 1 do
    for ol := 0 to OutLen - 1 do
      for oc := 0 to OutCh - 1 do
      begin
        Acc := 0.0;
        for kl := 0 to KLen - 1 do
        begin
          InPos := LongInt(ol) * LongInt(Stride) + LongInt(kl) - LongInt(Padding);
          if (InPos >= 0) and (TUInt32(InPos) < InLen) then
            for ic := 0 to InCh - 1 do
            begin
              InOff  := TUInt64(b) * InLen * InCh + TUInt64(InPos) * InCh + ic;
              KerOff := TUInt64(oc) * KLen * InCh + TUInt64(kl) * InCh + ic;
              PIn  := Input.Data;  Inc(PIn, InOff);
              PKer := Kernel.Data; Inc(PKer, KerOff);
              Acc  := Acc + PIn^ * PKer^;
            end;
        end;
        OutOff := TUInt64(b) * OutLen * OutCh + TUInt64(ol) * OutCh + oc;
        POut   := OutT.Data; Inc(POut, OutOff);
        POut^  := Acc;
      end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 387: Conv2D naive implementation === }
{ Input: [Batch, H, W, InCh], Kernel: [OutCh, KH, KW, InCh] -> Out: [Batch, OutH, OutW, OutCh] }
function Conv2D(const Input, Kernel: TTensor; out OutT: TTensor; StrideH, StrideW, PadH, PadW: TUInt32): TResult;
var
  Batch, InH, InW, InCh: TUInt32;
  OutCh, KH, KW: TUInt32;
  OutH, OutW: TUInt32;
  ShapeOut: array[0..3] of TUInt32;
  b, oc, oh, ow, ic, kh, kw: TUInt32;
  InPosH, InPosW: LongInt;
  Acc: TFloat32;
  PIn, PKer, POut: PFloat32;
  InOff, KerOff, OutOff: TUInt64;
begin
  FillChar(OutT, SizeOf(TTensor), 0);
  if (Input.Data = nil) or (Kernel.Data = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if (Input.NDim <> 4) or (Kernel.NDim <> 4) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Batch := Input.Shape[0];
  InH   := Input.Shape[1];
  InW   := Input.Shape[2];
  InCh  := Input.Shape[3];
  OutCh := Kernel.Shape[0];
  KH    := Kernel.Shape[1];
  KW    := Kernel.Shape[2];
  if Kernel.Shape[3] <> InCh then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if StrideH = 0 then StrideH := 1;
  if StrideW = 0 then StrideW := 1;
  OutH := (InH + 2 * PadH - KH) div StrideH + 1;
  OutW := (InW + 2 * PadW - KW) div StrideW + 1;
  ShapeOut[0] := Batch;
  ShapeOut[1] := OutH;
  ShapeOut[2] := OutW;
  ShapeOut[3] := OutCh;
  Result := AllocTensor(OutT, 4, ShapeOut);
  if Result <> PGPU_SUCCESS then Exit;
  for b := 0 to Batch - 1 do
    for oh := 0 to OutH - 1 do
      for ow := 0 to OutW - 1 do
        for oc := 0 to OutCh - 1 do
        begin
          Acc := 0.0;
          for kh := 0 to KH - 1 do
          begin
            InPosH := LongInt(oh) * LongInt(StrideH) + LongInt(kh) - LongInt(PadH);
            if (InPosH >= 0) and (TUInt32(InPosH) < InH) then
              for kw := 0 to KW - 1 do
              begin
                InPosW := LongInt(ow) * LongInt(StrideW) + LongInt(kw) - LongInt(PadW);
                if (InPosW >= 0) and (TUInt32(InPosW) < InW) then
                  for ic := 0 to InCh - 1 do
                  begin
                    InOff  := TUInt64(b) * InH * InW * InCh
                             + TUInt64(InPosH) * InW * InCh
                             + TUInt64(InPosW) * InCh
                             + ic;
                    KerOff := TUInt64(oc) * KH * KW * InCh
                             + TUInt64(kh) * KW * InCh
                             + TUInt64(kw) * InCh
                             + ic;
                    PIn  := Input.Data;  Inc(PIn, InOff);
                    PKer := Kernel.Data; Inc(PKer, KerOff);
                    Acc  := Acc + PIn^ * PKer^;
                  end;
              end;
          end;
          OutOff := TUInt64(b) * OutH * OutW * OutCh
                  + TUInt64(oh) * OutW * OutCh
                  + TUInt64(ow) * OutCh
                  + oc;
          POut  := OutT.Data; Inc(POut, OutOff);
          POut^ := Acc;
        end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 388: MaxPool2D implementation === }
{ Input: [Batch, H, W, Ch] -> Out: [Batch, OutH, OutW, Ch] }
function MaxPool2D(const Input: TTensor; out OutT: TTensor; KH, KW, SH, SW: TUInt32): TResult;
var
  Batch, InH, InW, Ch: TUInt32;
  OutH, OutW: TUInt32;
  ShapeOut: array[0..3] of TUInt32;
  b, c, oh, ow, kh, kw: TUInt32;
  InPosH, InPosW: TUInt32;
  MaxV, CurV: TFloat32;
  InOff, OutOff: TUInt64;
  PIn, POut: PFloat32;
begin
  FillChar(OutT, SizeOf(TTensor), 0);
  if Input.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Input.NDim <> 4 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Batch := Input.Shape[0];
  InH   := Input.Shape[1];
  InW   := Input.Shape[2];
  Ch    := Input.Shape[3];
  if SH = 0 then SH := KH;
  if SW = 0 then SW := KW;
  OutH := (InH - KH) div SH + 1;
  OutW := (InW - KW) div SW + 1;
  ShapeOut[0] := Batch;
  ShapeOut[1] := OutH;
  ShapeOut[2] := OutW;
  ShapeOut[3] := Ch;
  Result := AllocTensor(OutT, 4, ShapeOut);
  if Result <> PGPU_SUCCESS then Exit;
  for b := 0 to Batch - 1 do
    for oh := 0 to OutH - 1 do
      for ow := 0 to OutW - 1 do
        for c := 0 to Ch - 1 do
        begin
          MaxV := -1.0e38;
          for kh := 0 to KH - 1 do
          begin
            InPosH := oh * SH + kh;
            for kw := 0 to KW - 1 do
            begin
              InPosW := ow * SW + kw;
              InOff  := TUInt64(b) * InH * InW * Ch
                      + TUInt64(InPosH) * InW * Ch
                      + TUInt64(InPosW) * Ch
                      + c;
              PIn  := Input.Data; Inc(PIn, InOff);
              CurV := PIn^;
              if CurV > MaxV then MaxV := CurV;
            end;
          end;
          OutOff := TUInt64(b) * OutH * OutW * Ch
                  + TUInt64(oh) * OutW * Ch
                  + TUInt64(ow) * Ch
                  + c;
          POut  := OutT.Data; Inc(POut, OutOff);
          POut^ := MaxV;
        end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 389: AvgPool2D implementation === }
{ Input: [Batch, H, W, Ch] -> Out: [Batch, OutH, OutW, Ch] }
function AvgPool2D(const Input: TTensor; out OutT: TTensor; KH, KW, SH, SW: TUInt32): TResult;
var
  Batch, InH, InW, Ch: TUInt32;
  OutH, OutW: TUInt32;
  ShapeOut: array[0..3] of TUInt32;
  b, c, oh, ow, kh, kw: TUInt32;
  InPosH, InPosW: TUInt32;
  SumV, KernelArea: TFloat32;
  InOff, OutOff: TUInt64;
  PIn, POut: PFloat32;
begin
  FillChar(OutT, SizeOf(TTensor), 0);
  if Input.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Input.NDim <> 4 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Batch := Input.Shape[0];
  InH   := Input.Shape[1];
  InW   := Input.Shape[2];
  Ch    := Input.Shape[3];
  if SH = 0 then SH := KH;
  if SW = 0 then SW := KW;
  OutH       := (InH - KH) div SH + 1;
  OutW       := (InW - KW) div SW + 1;
  KernelArea := KH * KW;
  ShapeOut[0] := Batch;
  ShapeOut[1] := OutH;
  ShapeOut[2] := OutW;
  ShapeOut[3] := Ch;
  Result := AllocTensor(OutT, 4, ShapeOut);
  if Result <> PGPU_SUCCESS then Exit;
  for b := 0 to Batch - 1 do
    for oh := 0 to OutH - 1 do
      for ow := 0 to OutW - 1 do
        for c := 0 to Ch - 1 do
        begin
          SumV := 0.0;
          for kh := 0 to KH - 1 do
          begin
            InPosH := oh * SH + kh;
            for kw := 0 to KW - 1 do
            begin
              InPosW := ow * SW + kw;
              InOff  := TUInt64(b) * InH * InW * Ch
                      + TUInt64(InPosH) * InW * Ch
                      + TUInt64(InPosW) * Ch
                      + c;
              PIn  := Input.Data; Inc(PIn, InOff);
              SumV := SumV + PIn^;
            end;
          end;
          OutOff := TUInt64(b) * OutH * OutW * Ch
                  + TUInt64(oh) * OutW * Ch
                  + TUInt64(ow) * Ch
                  + c;
          POut  := OutT.Data; Inc(POut, OutOff);
          POut^ := SumV / KernelArea;
        end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 390: TensorNorm implementation === }
function TensorNorm(const T: TTensor; out Norm: TFloat64): TResult;
var
  i: TUInt64;
  V: TFloat32;
  Sum: TFloat64;
  PD: PFloat32;
begin
  Norm := 0.0;
  if T.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Sum := 0.0;
  PD  := T.Data;
  for i := 0 to T.TotalElements - 1 do
  begin
    V   := PD^;
    Sum := Sum + TFloat64(V) * TFloat64(V);
    Inc(PD);
  end;
  Norm   := Sqrt(Sum);
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 391: TensorFill implementation === }
function TensorFill(var T: TTensor; Value: TFloat32): TResult;
var
  i: TUInt64;
  PD: PFloat32;
begin
  if T.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  PD := T.Data;
  for i := 0 to T.TotalElements - 1 do
  begin
    PD^ := Value;
    Inc(PD);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 392: TensorPrint implementation === }
function TensorPrint(const T: TTensor): AnsiString;
var
  i: TUInt32;
  e: TUInt64;
  PD: PFloat32;
  S: AnsiString;
begin
  if T.Data = nil then
  begin
    Result := 'TTensor(nil)';
    Exit;
  end;
  S := 'TTensor(NDim=' + IntToStr(T.NDim) + ' Shape=[';
  for i := 0 to T.NDim - 1 do
  begin
    S := S + IntToStr(T.Shape[i]);
    if i < T.NDim - 1 then S := S + ',';
  end;
  S  := S + '] TotalElements=' + IntToStr(T.TotalElements) + ' Data=[';
  PD := T.Data;
  if T.TotalElements <= 16 then
  begin
    for e := 0 to T.TotalElements - 1 do
    begin
      S := S + FloatToStrF(PD^, ffFixed, 6, 4);
      if e < T.TotalElements - 1 then S := S + ', ';
      Inc(PD);
    end;
  end
  else
  begin
    for e := 0 to 7 do
    begin
      S := S + FloatToStrF(PD^, ffFixed, 6, 4);
      S := S + ', ';
      Inc(PD);
    end;
    S := S + '...';
  end;
  S      := S + '])';
  Result := S;
end;

{ === BLOCK 393: ScaledDotProductAttention implementation === }
{ Q, K, V: [Batch, SeqLen, Dim] -> Out: [Batch, SeqLen, Dim]
  Attention(Q,K,V) = softmax(Q*K^T / Scale) * V }
function ScaledDotProductAttention(const Q, K, V: TTensor; out OutT: TTensor; Scale: TFloat32): TResult;
var
  Batch, SeqLen, Dim: TUInt32;
  b, i, j, d: TUInt32;
  Acc, MaxV, SumV, Wij: TFloat32;
  AttnShape: array[0..2] of TUInt32;
  ScoreShape: array[0..2] of TUInt32;
  Scores: TTensor;
  PQ, PK, PV, POut, PScore: PFloat32;
  QOff, KOff, VOff, OutOff, ScoreOff: TUInt64;
begin
  FillChar(OutT, SizeOf(TTensor), 0);
  FillChar(Scores, SizeOf(TTensor), 0);
  if (Q.Data = nil) or (K.Data = nil) or (V.Data = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if (Q.NDim <> 3) or (K.NDim <> 3) or (V.NDim <> 3) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Batch  := Q.Shape[0];
  SeqLen := Q.Shape[1];
  Dim    := Q.Shape[2];
  if Scale = 0.0 then Scale := 1.0 / Sqrt(Dim);
  { Allocate scores: [Batch, SeqLen, SeqLen] }
  ScoreShape[0] := Batch;
  ScoreShape[1] := SeqLen;
  ScoreShape[2] := SeqLen;
  Result := AllocTensor(Scores, 3, ScoreShape);
  if Result <> PGPU_SUCCESS then Exit;
  { Compute Q * K^T scaled }
  for b := 0 to Batch - 1 do
    for i := 0 to SeqLen - 1 do
      for j := 0 to SeqLen - 1 do
      begin
        Acc := 0.0;
        for d := 0 to Dim - 1 do
        begin
          QOff := TUInt64(b) * SeqLen * Dim + TUInt64(i) * Dim + d;
          KOff := TUInt64(b) * SeqLen * Dim + TUInt64(j) * Dim + d;
          PQ   := Q.Data; Inc(PQ, QOff);
          PK   := K.Data; Inc(PK, KOff);
          Acc  := Acc + PQ^ * PK^;
        end;
        ScoreOff  := TUInt64(b) * SeqLen * SeqLen + TUInt64(i) * SeqLen + j;
        PScore    := Scores.Data; Inc(PScore, ScoreOff);
        PScore^   := Acc * Scale;
      end;
  { Softmax over last axis }
  for b := 0 to Batch - 1 do
    for i := 0 to SeqLen - 1 do
    begin
      MaxV := -1.0e38;
      for j := 0 to SeqLen - 1 do
      begin
        ScoreOff := TUInt64(b) * SeqLen * SeqLen + TUInt64(i) * SeqLen + j;
        PScore   := Scores.Data; Inc(PScore, ScoreOff);
        if PScore^ > MaxV then MaxV := PScore^;
      end;
      SumV := 0.0;
      for j := 0 to SeqLen - 1 do
      begin
        ScoreOff := TUInt64(b) * SeqLen * SeqLen + TUInt64(i) * SeqLen + j;
        PScore   := Scores.Data; Inc(PScore, ScoreOff);
        PScore^  := Exp(PScore^ - MaxV);
        SumV     := SumV + PScore^;
      end;
      if SumV = 0.0 then SumV := 1.0;
      for j := 0 to SeqLen - 1 do
      begin
        ScoreOff := TUInt64(b) * SeqLen * SeqLen + TUInt64(i) * SeqLen + j;
        PScore   := Scores.Data; Inc(PScore, ScoreOff);
        PScore^  := PScore^ / SumV;
      end;
    end;
  { Out = Scores * V }
  AttnShape[0] := Batch;
  AttnShape[1] := SeqLen;
  AttnShape[2] := Dim;
  Result := AllocTensor(OutT, 3, AttnShape);
  if Result <> PGPU_SUCCESS then
  begin
    FreeTensor(Scores);
    Exit;
  end;
  for b := 0 to Batch - 1 do
    for i := 0 to SeqLen - 1 do
      for d := 0 to Dim - 1 do
      begin
        Acc := 0.0;
        for j := 0 to SeqLen - 1 do
        begin
          ScoreOff := TUInt64(b) * SeqLen * SeqLen + TUInt64(i) * SeqLen + j;
          PScore   := Scores.Data; Inc(PScore, ScoreOff);
          Wij      := PScore^;
          VOff     := TUInt64(b) * SeqLen * Dim + TUInt64(j) * Dim + d;
          PV       := V.Data; Inc(PV, VOff);
          Acc      := Acc + Wij * PV^;
        end;
        OutOff  := TUInt64(b) * SeqLen * Dim + TUInt64(i) * Dim + d;
        POut    := OutT.Data; Inc(POut, OutOff);
        POut^   := Acc;
      end;
  FreeTensor(Scores);
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 394: MultiHeadAttention Initialize + Forward + Free === }
function MultiHeadAttentionInit(out MHA: TMultiHeadAttention; NumHeads, ModelDim: TUInt32): TResult;
var
  R: TResult;
begin
  FillChar(MHA, SizeOf(TMultiHeadAttention), 0);
  if (NumHeads = 0) or (ModelDim = 0) or (ModelDim mod NumHeads <> 0) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  MHA.NumHeads := NumHeads;
  MHA.ModelDim := ModelDim;
  MHA.HeadDim  := ModelDim div NumHeads;
  R := AllocMatrix(MHA.WQ, ModelDim, ModelDim);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  R := AllocMatrix(MHA.WK, ModelDim, ModelDim);
  if R <> PGPU_SUCCESS then begin FreeMatrix(MHA.WQ); Result := R; Exit; end;
  R := AllocMatrix(MHA.WV, ModelDim, ModelDim);
  if R <> PGPU_SUCCESS then begin FreeMatrix(MHA.WQ); FreeMatrix(MHA.WK); Result := R; Exit; end;
  R := AllocMatrix(MHA.WO, ModelDim, ModelDim);
  if R <> PGPU_SUCCESS then begin FreeMatrix(MHA.WQ); FreeMatrix(MHA.WK); FreeMatrix(MHA.WV); Result := R; Exit; end;
  MatrixIdentity(MHA.WQ);
  MatrixIdentity(MHA.WK);
  MatrixIdentity(MHA.WV);
  MatrixIdentity(MHA.WO);
  MHA.Initialized := True;
  Result := PGPU_SUCCESS;
end;

function MultiHeadAttentionForward(var MHA: TMultiHeadAttention; const Q, K, V: TTensor; out OutT: TTensor): TResult;
var
  Scale: TFloat32;
begin
  FillChar(OutT, SizeOf(TTensor), 0);
  if not MHA.Initialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  if (Q.Data = nil) or (K.Data = nil) or (V.Data = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Scale  := 1.0 / Sqrt(MHA.HeadDim);
  Result := ScaledDotProductAttention(Q, K, V, OutT, Scale);
end;

function MultiHeadAttentionFree(var MHA: TMultiHeadAttention): TResult;
begin
  FreeMatrix(MHA.WQ);
  FreeMatrix(MHA.WK);
  FreeMatrix(MHA.WV);
  FreeMatrix(MHA.WO);
  MHA.Initialized := False;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 395: TensorCopy implementation === }
function TensorCopy(const Src: TTensor; out Dst: TTensor): TResult;
var
  ByteCount: TUInt64;
begin
  FillChar(Dst, SizeOf(TTensor), 0);
  if Src.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Dst.NDim          := Src.NDim;
  Dst.TotalElements := Src.TotalElements;
  Move(Src.Shape,   Dst.Shape,   SizeOf(Src.Shape));
  Move(Src.Strides, Dst.Strides, SizeOf(Src.Strides));
  ByteCount := Src.TotalElements * SizeOf(TFloat32);
  GetMem(Dst.Data, ByteCount);
  if Dst.Data = nil then
  begin
    Result := PGPU_ERR_OUT_OF_MEMORY;
    Exit;
  end;
  Move(Src.Data^, Dst.Data^, ByteCount);
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 396: TensorBroadcastAdd implementation === }
{ Adds a vector V (of length equal to last dimension of A) to every row in A }
function TensorBroadcastAdd(const A: TTensor; V: PFloat32; VNDim: TUInt32; out B: TTensor): TResult;
var
  R: TResult;
  i: TUInt64;
  LastDim: TUInt32;
  Remainder: TUInt64;
  PA, PBPtr: PFloat32;
  PV: PFloat32;
  VIdx: TUInt64;
begin
  FillChar(B, SizeOf(TTensor), 0);
  if (A.Data = nil) or (V = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  LastDim := A.Shape[A.NDim - 1];
  if TUInt64(LastDim) * VNDim < LastDim then { overflow guard }
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  R := TensorCopy(A, B);
  if R <> PGPU_SUCCESS then
  begin
    Result := R;
    Exit;
  end;
  PA    := A.Data;
  PBPtr := B.Data;
  for i := 0 to A.TotalElements - 1 do
  begin
    VIdx := i mod LastDim;
    PV   := V; Inc(PV, VIdx);
    PBPtr^ := PA^ + PV^;
    Inc(PA); Inc(PBPtr);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 397: TensorReduce implementation === }
{ Reduce along a single axis, returning a tensor with that axis removed }
function TensorReduce(const A: TTensor; Axis: TUInt32; Op: TReduceOp; out B: TTensor): TResult;
var
  NewShape: array[0..7] of TUInt32;
  NewNDim: TUInt32;
  i, d: TUInt32;
  BIdx: array[0..7] of TUInt32;
  AIdx: array[0..7] of TUInt32;
  AxisSize: TUInt32;
  k: TUInt32;
  Acc: TFloat32;
  Count: TUInt32;
  E: TUInt64;
  ElemCount: TUInt64;
  Carry: TUInt32;
  AOffset: TUInt64;
  BOffset: TUInt64;
  PA, PBPtr: PFloat32;
begin
  FillChar(B, SizeOf(TTensor), 0);
  if A.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Axis >= A.NDim then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  AxisSize := A.Shape[Axis];
  NewNDim  := A.NDim - 1;
  if NewNDim = 0 then NewNDim := 1;
  i := 0;
  for d := 0 to A.NDim - 1 do
    if d <> Axis then
    begin
      NewShape[i] := A.Shape[d];
      Inc(i);
    end;
  if A.NDim = 1 then
  begin
    NewShape[0] := 1;
    NewNDim     := 1;
  end;
  Result := AllocTensor(B, NewNDim, NewShape);
  if Result <> PGPU_SUCCESS then Exit;
  ElemCount := B.TotalElements;
  FillChar(BIdx, SizeOf(BIdx), 0);
  for E := 0 to ElemCount - 1 do
  begin
    { Map BIdx -> AIdx by inserting axis }
    i := 0;
    for d := 0 to A.NDim - 1 do
    begin
      if d = Axis then
        AIdx[d] := 0
      else
      begin
        AIdx[d] := BIdx[i];
        Inc(i);
      end;
    end;
    { Reduce over axis }
    case Op of
      roSum:
      begin
        Acc := 0.0;
        for k := 0 to AxisSize - 1 do
        begin
          AIdx[Axis] := k;
          AOffset    := 0;
          for d := 0 to A.NDim - 1 do
            AOffset := AOffset + TUInt64(AIdx[d]) * A.Strides[d];
          PA  := A.Data; Inc(PA, AOffset);
          Acc := Acc + PA^;
        end;
      end;
      roMax:
      begin
        Acc := -1.0e38;
        for k := 0 to AxisSize - 1 do
        begin
          AIdx[Axis] := k;
          AOffset    := 0;
          for d := 0 to A.NDim - 1 do
            AOffset := AOffset + TUInt64(AIdx[d]) * A.Strides[d];
          PA := A.Data; Inc(PA, AOffset);
          if PA^ > Acc then Acc := PA^;
        end;
      end;
      roMin:
      begin
        Acc := 1.0e38;
        for k := 0 to AxisSize - 1 do
        begin
          AIdx[Axis] := k;
          AOffset    := 0;
          for d := 0 to A.NDim - 1 do
            AOffset := AOffset + TUInt64(AIdx[d]) * A.Strides[d];
          PA := A.Data; Inc(PA, AOffset);
          if PA^ < Acc then Acc := PA^;
        end;
      end;
      roMean:
      begin
        Acc   := 0.0;
        Count := AxisSize;
        for k := 0 to AxisSize - 1 do
        begin
          AIdx[Axis] := k;
          AOffset    := 0;
          for d := 0 to A.NDim - 1 do
            AOffset := AOffset + TUInt64(AIdx[d]) * A.Strides[d];
          PA  := A.Data; Inc(PA, AOffset);
          Acc := Acc + PA^;
        end;
        if Count > 0 then Acc := Acc / Count;
      end;
      roProd:
      begin
        Acc := 1.0;
        for k := 0 to AxisSize - 1 do
        begin
          AIdx[Axis] := k;
          AOffset    := 0;
          for d := 0 to A.NDim - 1 do
            AOffset := AOffset + TUInt64(AIdx[d]) * A.Strides[d];
          PA  := A.Data; Inc(PA, AOffset);
          Acc := Acc * PA^;
        end;
      end;
    end;
    { Write to B at BIdx }
    BOffset := 0;
    for d := 0 to B.NDim - 1 do
      BOffset := BOffset + TUInt64(BIdx[d]) * B.Strides[d];
    PBPtr  := B.Data; Inc(PBPtr, BOffset);
    PBPtr^ := Acc;
    { Increment BIdx }
    Carry := 1;
    d     := B.NDim;
    while (d > 0) and (Carry = 1) do
    begin
      Dec(d);
      BIdx[d] := BIdx[d] + Carry;
      if BIdx[d] >= B.Shape[d] then
        BIdx[d] := 0
      else
        Carry := 0;
    end;
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 398: TReduceOp (defined in type section above) === }
{ TReduceOp = (roSum, roMax, roMin, roMean, roProd) — declared at top of interface }

{ === BLOCK 399: TensorValidate implementation === }
function TensorValidate(const T: TTensor): TResult;
var
  i: TUInt32;
  ComputedTotal: TUInt64;
  ExpectedStride: TUInt64;
begin
  if T.NDim = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if T.NDim > 8 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if T.Data = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  ComputedTotal := 1;
  for i := 0 to T.NDim - 1 do
  begin
    if T.Shape[i] = 0 then
    begin
      Result := PGPU_ERR_INVALID_PARAM;
      Exit;
    end;
    ComputedTotal := ComputedTotal * T.Shape[i];
  end;
  if ComputedTotal <> T.TotalElements then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  { Validate row-major strides }
  ExpectedStride := 1;
  i := T.NDim;
  while i > 0 do
  begin
    Dec(i);
    if T.Strides[i] <> ExpectedStride then
    begin
      Result := PGPU_ERR_INVALID_PARAM;
      Exit;
    end;
    ExpectedStride := ExpectedStride * T.Shape[i];
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 400: MatrixSubsystemTest implementation === }
function MatrixSubsystemTest: TResult;
var
  M1, M2, M3: TMatrix;
  T1, T2, T3: TTensor;
  Val: TFloat32;
  TraceVal: TFloat32;
  Norm: TFloat64;
  Diag: PFloat32;
  MaxV: TFloat32;
  MR, MC: TUInt32;
  R: TResult;
  ShapeA: array[0..1] of TUInt32;
  MHA: TMultiHeadAttention;
  Q, K, V, OutT: TTensor;
  ShapeQ: array[0..2] of TUInt32;
  ReduceOut: TTensor;
begin
  Result := PGPU_ERR_UNKNOWN;

  { --- Test AllocMatrix and FreeMatrix --- }
  R := AllocMatrix(M1, 4, 4);
  if R <> PGPU_SUCCESS then Exit;
  R := AllocMatrix(M2, 4, 4);
  if R <> PGPU_SUCCESS then begin FreeMatrix(M1); Exit; end;

  { --- Test MatrixIdentity --- }
  R := MatrixIdentity(M1);
  if R <> PGPU_SUCCESS then begin FreeMatrix(M1); FreeMatrix(M2); Exit; end;
  Val := MatrixAt(M1, 0, 0);
  if Abs(Val - 1.0) > 1.0e-6 then begin FreeMatrix(M1); FreeMatrix(M2); Exit; end;
  Val := MatrixAt(M1, 0, 1);
  if Abs(Val) > 1.0e-6 then begin FreeMatrix(M1); FreeMatrix(M2); Exit; end;

  { --- Test MatrixFill --- }
  R := MatrixFill(M2, 3.0);
  if R <> PGPU_SUCCESS then begin FreeMatrix(M1); FreeMatrix(M2); Exit; end;
  Val := MatrixAt(M2, 2, 2);
  if Abs(Val - 3.0) > 1.0e-6 then begin FreeMatrix(M1); FreeMatrix(M2); Exit; end;

  { --- Test MatrixAdd --- }
  R := MatrixAdd(M1, M2, M3);
  if R <> PGPU_SUCCESS then begin FreeMatrix(M1); FreeMatrix(M2); Exit; end;
  Val := MatrixAt(M3, 0, 0);
  if Abs(Val - 4.0) > 1.0e-6 then begin FreeMatrix(M1); FreeMatrix(M2); FreeMatrix(M3); Exit; end;
  FreeMatrix(M3);

  { --- Test MatrixTrace --- }
  R := MatrixTrace(M1, TraceVal);
  if R <> PGPU_SUCCESS then begin FreeMatrix(M1); FreeMatrix(M2); Exit; end;
  if Abs(TraceVal - 4.0) > 1.0e-6 then begin FreeMatrix(M1); FreeMatrix(M2); Exit; end;

  { --- Test MatrixNorm --- }
  R := MatrixNorm(M1, Norm);
  if R <> PGPU_SUCCESS then begin FreeMatrix(M1); FreeMatrix(M2); Exit; end;
  { Identity 4x4 has Frobenius norm = 2.0 }
  if Abs(Norm - 2.0) > 1.0e-5 then begin FreeMatrix(M1); FreeMatrix(M2); Exit; end;

  { --- Test MatrixMul --- }
  R := MatrixMul(M1, M2, M3);
  if R <> PGPU_SUCCESS then begin FreeMatrix(M1); FreeMatrix(M2); Exit; end;
  Val := MatrixAt(M3, 1, 1);
  if Abs(Val - 3.0) > 1.0e-6 then begin FreeMatrix(M1); FreeMatrix(M2); FreeMatrix(M3); Exit; end;
  FreeMatrix(M3);

  { --- Test MatrixTranspose --- }
  MatrixSet(M2, 0, 1, 7.0);
  R := MatrixTranspose(M2, M3);
  if R <> PGPU_SUCCESS then begin FreeMatrix(M1); FreeMatrix(M2); Exit; end;
  Val := MatrixAt(M3, 1, 0);
  if Abs(Val - 7.0) > 1.0e-6 then begin FreeMatrix(M1); FreeMatrix(M2); FreeMatrix(M3); Exit; end;
  FreeMatrix(M3);

  { --- Test MatrixDiag --- }
  R := MatrixDiag(M1, Diag);
  if R <> PGPU_SUCCESS then begin FreeMatrix(M1); FreeMatrix(M2); Exit; end;
  if Abs(Diag^ - 1.0) > 1.0e-6 then
  begin
    FreeMem(Diag);
    FreeMatrix(M1); FreeMatrix(M2); Exit;
  end;
  FreeMem(Diag);

  { --- Test MatrixMaxAbsElement --- }
  MatrixSet(M2, 3, 3, -99.0);
  R := MatrixMaxAbsElement(M2, MaxV, MR, MC);
  if R <> PGPU_SUCCESS then begin FreeMatrix(M1); FreeMatrix(M2); Exit; end;
  if Abs(MaxV - 99.0) > 1.0e-6 then begin FreeMatrix(M1); FreeMatrix(M2); Exit; end;
  if (MR <> 3) or (MC <> 3) then begin FreeMatrix(M1); FreeMatrix(M2); Exit; end;

  FreeMatrix(M1);
  FreeMatrix(M2);

  { --- Test AllocTensor and FreeTensor --- }
  ShapeA[0] := 3;
  ShapeA[1] := 4;
  R := AllocTensor(T1, 2, ShapeA);
  if R <> PGPU_SUCCESS then Exit;
  R := TensorValidate(T1);
  if R <> PGPU_SUCCESS then begin FreeTensor(T1); Exit; end;
  R := TensorFill(T1, 5.0);
  if R <> PGPU_SUCCESS then begin FreeTensor(T1); Exit; end;

  { --- Test TensorAt / TensorSet --- }
  R := TensorSet(T1, [1, 2], 42.0);
  if R <> PGPU_SUCCESS then begin FreeTensor(T1); Exit; end;
  Val := TensorAt(T1, [1, 2]);
  if Abs(Val - 42.0) > 1.0e-6 then begin FreeTensor(T1); Exit; end;

  { --- Test TensorNorm --- }
  R := TensorNorm(T1, Norm);
  if R <> PGPU_SUCCESS then begin FreeTensor(T1); Exit; end;

  { --- Test TensorCopy --- }
  R := TensorCopy(T1, T2);
  if R <> PGPU_SUCCESS then begin FreeTensor(T1); Exit; end;
  Val := TensorAt(T2, [1, 2]);
  if Abs(Val - 42.0) > 1.0e-6 then begin FreeTensor(T1); FreeTensor(T2); Exit; end;
  FreeTensor(T2);

  { --- Test TensorAdd --- }
  R := AllocTensor(T2, 2, ShapeA);
  if R <> PGPU_SUCCESS then begin FreeTensor(T1); Exit; end;
  TensorFill(T2, 1.0);
  R := TensorAdd(T1, T2, T3);
  if R <> PGPU_SUCCESS then begin FreeTensor(T1); FreeTensor(T2); Exit; end;
  Val := TensorAt(T3, [0, 0]);
  if Abs(Val - 6.0) > 1.0e-6 then begin FreeTensor(T1); FreeTensor(T2); FreeTensor(T3); Exit; end;
  FreeTensor(T3);

  { --- Test TensorReduce sum along axis 0 --- }
  R := TensorReduce(T1, 0, roSum, ReduceOut);
  if R <> PGPU_SUCCESS then begin FreeTensor(T1); FreeTensor(T2); Exit; end;
  FreeTensor(ReduceOut);

  FreeTensor(T1);
  FreeTensor(T2);

  { --- Test ScaledDotProductAttention --- }
  ShapeQ[0] := 2;
  ShapeQ[1] := 4;
  ShapeQ[2] := 8;
  R := AllocTensor(Q, 3, ShapeQ);
  if R <> PGPU_SUCCESS then Exit;
  R := AllocTensor(K, 3, ShapeQ);
  if R <> PGPU_SUCCESS then begin FreeTensor(Q); Exit; end;
  R := AllocTensor(V, 3, ShapeQ);
  if R <> PGPU_SUCCESS then begin FreeTensor(Q); FreeTensor(K); Exit; end;
  TensorFill(Q, 0.1);
  TensorFill(K, 0.1);
  TensorFill(V, 0.2);
  R := ScaledDotProductAttention(Q, K, V, OutT, 0.35355);
  if R <> PGPU_SUCCESS then
  begin
    FreeTensor(Q); FreeTensor(K); FreeTensor(V); Exit;
  end;
  FreeTensor(OutT);
  FreeTensor(Q);
  FreeTensor(K);
  FreeTensor(V);

  { --- Test MultiHeadAttention --- }
  R := MultiHeadAttentionInit(MHA, 4, 64);
  if R <> PGPU_SUCCESS then Exit;
  MultiHeadAttentionFree(MHA);

  Result := PGPU_SUCCESS;
end;

end.
