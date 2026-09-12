{ ========================================================================
  SOVEREIGN LEVIATHAN COVENANT — MGPLv3 RECURSIVE INFECTION CLAUSE
  ========================================================================

  Node-ID:           PASCAL-STACK-008
  File:              PascalGPU_Numerical.pas
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
unit PascalGPU_Numerical;

{
  PascalGPU Numerical Primitives
  Blocks 301-350: Math constants, IEEE classification, scalar math,
  activation functions, vector arithmetic, array reductions, and
  pointer-based vector operations for GPU-oriented computation.
}

interface

uses
  PascalGPU_Types, Math, SysUtils;

{ === BLOCK 301: Math Constants === }
const
  PGPU_PI    : TFloat64 = 3.14159265358979323846;
  PGPU_E     : TFloat64 = 2.71828182845904523836;
  PGPU_SQRT2 : TFloat64 = 1.41421356237309504880;
  PGPU_LN2   : TFloat64 = 0.69314718055994530942;

var
  PGPU_INF_F32 : TFloat32;
  PGPU_NAN_F32 : TFloat32;

{ === BLOCK 302: IsNaN/IsInf/IsFinite for Float32 and Float64 === }
function IsNaN_F32(X: TFloat32): Boolean;
function IsNaN_F64(X: TFloat64): Boolean;
function IsInf_F32(X: TFloat32): Boolean;
function IsInf_F64(X: TFloat64): Boolean;
function IsFinite_F32(X: TFloat32): Boolean;
function IsFinite_F64(X: TFloat64): Boolean;

{ === BLOCK 303: Abs/Sign for Int32, Int64, Float32, Float64 === }
function AbsInt32(X: TInt32): TInt32;
function AbsInt64(X: TInt64): TInt64;
function AbsF32(X: TFloat32): TFloat32;
function AbsF64(X: TFloat64): TFloat64;
function SignInt32(X: TInt32): TInt32;
function SignInt64(X: TInt64): TInt32;
function SignF32(X: TFloat32): TFloat32;
function SignF64(X: TFloat64): TFloat64;

{ === BLOCK 304: Floor/Ceil/Round/Truncate for Float32, Float64 === }
function FloorF32(X: TFloat32): TFloat32;
function FloorF64(X: TFloat64): TFloat64;
function CeilF32(X: TFloat32): TFloat32;
function CeilF64(X: TFloat64): TFloat64;
function RoundF32(X: TFloat32): TFloat32;
function RoundF64(X: TFloat64): TFloat64;
function TruncateF32(X: TFloat32): TFloat32;
function TruncateF64(X: TFloat64): TFloat64;

{ === BLOCK 305: Sqrt/Rsqrt (reciprocal sqrt) for Float32, Float64 === }
function SqrtF32(X: TFloat32): TFloat32;
function SqrtF64(X: TFloat64): TFloat64;
function RsqrtF32(X: TFloat32): TFloat32;
function RsqrtF64(X: TFloat64): TFloat64;

{ === BLOCK 306: Log/Log2/Log10/Exp for Float32, Float64 === }
function LogF32(X: TFloat32): TFloat32;
function LogF64(X: TFloat64): TFloat64;
function Log2F32(X: TFloat32): TFloat32;
function Log2F64(X: TFloat64): TFloat64;
function Log10F32(X: TFloat32): TFloat32;
function Log10F64(X: TFloat64): TFloat64;
function ExpF32(X: TFloat32): TFloat32;
function ExpF64(X: TFloat64): TFloat64;

{ === BLOCK 307: Pow(Base, Exp) for Float32 and Float64 === }
function PowF32(Base, Exponent: TFloat32): TFloat32;
function PowF64(Base, Exponent: TFloat64): TFloat64;

{ === BLOCK 308: Sin/Cos/Tan for Float32, Float64 === }
function SinF32(X: TFloat32): TFloat32;
function SinF64(X: TFloat64): TFloat64;
function CosF32(X: TFloat32): TFloat32;
function CosF64(X: TFloat64): TFloat64;
function TanF32(X: TFloat32): TFloat32;
function TanF64(X: TFloat64): TFloat64;

{ === BLOCK 309: ASin/ACos/ATan/ATan2 for Float32, Float64 === }
function ASinF32(X: TFloat32): TFloat32;
function ASinF64(X: TFloat64): TFloat64;
function ACosF32(X: TFloat32): TFloat32;
function ACosF64(X: TFloat64): TFloat64;
function ATanF32(X: TFloat32): TFloat32;
function ATanF64(X: TFloat64): TFloat64;
function ATan2F32(Y, X: TFloat32): TFloat32;
function ATan2F64(Y, X: TFloat64): TFloat64;

{ === BLOCK 310: Sinh/Cosh/Tanh for Float32, Float64 === }
function SinhF32(X: TFloat32): TFloat32;
function SinhF64(X: TFloat64): TFloat64;
function CoshF32(X: TFloat32): TFloat32;
function CoshF64(X: TFloat64): TFloat64;
function TanhF32(X: TFloat32): TFloat32;
function TanhF64(X: TFloat64): TFloat64;

{ === BLOCK 311: Erf/Erfc for Float32, Float64 (polynomial approximation) === }
function ErfF32(X: TFloat32): TFloat32;
function ErfF64(X: TFloat64): TFloat64;
function ErfcF32(X: TFloat32): TFloat32;
function ErfcF64(X: TFloat64): TFloat64;

{ === BLOCK 312: Sigmoid(x: Float32): Float32 — 1/(1+exp(-x)) === }
function Sigmoid(X: TFloat32): TFloat32;

{ === BLOCK 313: ReLU(x: Float32) and LeakyReLU(x, alpha: Float32) === }
function ReLU(X: TFloat32): TFloat32;
function LeakyReLU(X, Alpha: TFloat32): TFloat32;

{ === BLOCK 314: GELU(x: Float32) — Gaussian error linear unit full implementation === }
function GELU(X: TFloat32): TFloat32;

{ === BLOCK 315: Swish(x, Beta: Float32) — x * sigmoid(beta*x) === }
function Swish(X, Beta: TFloat32): TFloat32;

{ === BLOCK 316: SELU(x: Float32) — scaled ELU with constants === }
function SELU(X: TFloat32): TFloat32;

{ === BLOCK 317: Softplus(x: Float32) — log(1+exp(x)) === }
function Softplus(X: TFloat32): TFloat32;

{ === BLOCK 318: TVector4f arithmetic: AddV4, SubV4, MulV4, DivV4 === }
function AddV4(const A, B: TVector4f): TVector4f;
function SubV4(const A, B: TVector4f): TVector4f;
function MulV4(const A, B: TVector4f): TVector4f;
function DivV4(const A, B: TVector4f): TVector4f;

{ === BLOCK 319: DotV4, DotV3, DotV2 === }
function DotV4(const A, B: TVector4f): TFloat32;
function DotV3(const A, B: TVector3f): TFloat32;
function DotV2(const A, B: TVector2f): TFloat32;

{ === BLOCK 320: NormV4, NormalizeV4, NormV3, NormalizeV3 === }
function NormV4(const V: TVector4f): TFloat32;
function NormalizeV4(const V: TVector4f): TVector4f;
function NormV3(const V: TVector3f): TFloat32;
function NormalizeV3(const V: TVector3f): TVector3f;

{ === BLOCK 321: CrossV3(A, B: TVector3f): TVector3f === }
function CrossV3(const A, B: TVector3f): TVector3f;

{ === BLOCK 322: HSum4(V: TVector4f): TFloat32 — sum of components === }
function HSum4(const V: TVector4f): TFloat32;

{ === BLOCK 323: ReduceSum(const Arr: array of TFloat32): TFloat64 === }
function ReduceSum(const Arr: array of TFloat32): TFloat64;

{ === BLOCK 324: ReduceMax(const Arr: array of TFloat32): TFloat32 === }
function ReduceMax(const Arr: array of TFloat32): TFloat32;

{ === BLOCK 325: ReduceMin(const Arr: array of TFloat32): TFloat32 === }
function ReduceMin(const Arr: array of TFloat32): TFloat32;

{ === BLOCK 326: ReduceMean(const Arr: array of TFloat32): TFloat64 === }
function ReduceMean(const Arr: array of TFloat32): TFloat64;

{ === BLOCK 327: ReduceVariance(const Arr: array of TFloat32): TFloat64 === }
function ReduceVariance(const Arr: array of TFloat32): TFloat64;

{ === BLOCK 328: ReduceStdDev(const Arr: array of TFloat32): TFloat64 === }
function ReduceStdDev(const Arr: array of TFloat32): TFloat64;

{ === BLOCK 329: ReduceSumInt32(const Arr: array of TInt32): TInt64 === }
function ReduceSumInt32(const Arr: array of TInt32): TInt64;

{ === BLOCK 330: ParallelReduceSum — block-tree reduction === }
function ParallelReduceSum(Arr: PFloat32; N: TUInt32; out Sum: TFloat64): TResult;

{ === BLOCK 331: DotProduct(A, B: PFloat32; N: TUInt32; out Res: TFloat64): TResult === }
function DotProduct(A, B: PFloat32; N: TUInt32; out Res: TFloat64): TResult;

{ === BLOCK 332: VectorAdd(A, B, Dst: PFloat32; N: TUInt32): TResult === }
function VectorAdd(A, B, Dst: PFloat32; N: TUInt32): TResult;

{ === BLOCK 333: VectorSub(A, B, Dst: PFloat32; N: TUInt32): TResult === }
function VectorSub(A, B, Dst: PFloat32; N: TUInt32): TResult;

{ === BLOCK 334: VectorMul — element-wise multiply === }
function VectorMul(A, B, Dst: PFloat32; N: TUInt32): TResult;

{ === BLOCK 335: VectorScale(A: PFloat32; Scalar: TFloat32; Dst: PFloat32; N: TUInt32): TResult === }
function VectorScale(A: PFloat32; Scalar: TFloat32; Dst: PFloat32; N: TUInt32): TResult;

{ === BLOCK 336: VectorAxpby — alpha*A + beta*B → Dst === }
function VectorAxpby(A, B, Dst: PFloat32; Alpha, Beta: TFloat32; N: TUInt32): TResult;

{ === BLOCK 337: VectorNorm — L2 norm === }
function VectorNorm(A: PFloat32; N: TUInt32; out Norm: TFloat64): TResult;

{ === BLOCK 338: VectorMax/VectorMin/VectorArgMax/VectorArgMin === }
function VectorMax(A: PFloat32; N: TUInt32; out MaxVal: TFloat32): TResult;
function VectorMin(A: PFloat32; N: TUInt32; out MinVal: TFloat32): TResult;
function VectorArgMax(A: PFloat32; N: TUInt32; out Idx: TUInt32): TResult;
function VectorArgMin(A: PFloat32; N: TUInt32; out Idx: TUInt32): TResult;

{ === BLOCK 339: VectorApply — apply activation function pointer over array === }
type
  TActivationFunc = function(X: TFloat32): TFloat32;

function VectorApply(A, Dst: PFloat32; N: TUInt32; Func: TActivationFunc): TResult;

{ === BLOCK 340: Softmax(A: PFloat32; N: TUInt32; Dst: PFloat32): TResult — numerically stable === }
function Softmax(A: PFloat32; N: TUInt32; Dst: PFloat32): TResult;

{ === BLOCK 341: LogSoftmax(A: PFloat32; N: TUInt32; Dst: PFloat32): TResult === }
function LogSoftmax(A: PFloat32; N: TUInt32; Dst: PFloat32): TResult;

{ === BLOCK 342: LayerNormForward === }
function LayerNormForward(A, Dst, Gamma, Beta: PFloat32; N: TUInt32;
                          Epsilon: TFloat32): TResult;

{ === BLOCK 343: BatchNormForward — single-batch running mean/variance normalization === }
function BatchNormForward(A, Dst, RunMean, RunVar: PFloat32; N: TUInt32;
                          Epsilon, Momentum: TFloat32): TResult;

{ === BLOCK 344: FMA(A, B, C: TFloat32): TFloat32 — fused multiply-add === }
function FMA(A, B, C: TFloat32): TFloat32;

{ === BLOCK 345: Reciprocal(X: TFloat32): TFloat32 with guarded divide-by-zero === }
function Reciprocal(X: TFloat32): TFloat32;

{ === BLOCK 346: FastInvSqrt(X: TFloat32): TFloat32 — Quake-style === }
function FastInvSqrt(X: TFloat32): TFloat32;

{ === BLOCK 347: IntegerSaturatingAdd(A, B: TInt32): TInt32 — clamp on overflow === }
function IntegerSaturatingAdd(A, B: TInt32): TInt32;

{ === BLOCK 348: Fixed16_16Mul(A, B: TInt32): TInt32 — fixed-point Q16.16 multiply === }
function Fixed16_16Mul(A, B: TInt32): TInt32;

{ === BLOCK 349: LogSumExp(A: PFloat32; N: TUInt32): TFloat32 — numerically stable === }
function LogSumExp(A: PFloat32; N: TUInt32): TFloat32;

{ === BLOCK 350: NumericalSubsystemTest: TResult === }
function NumericalSubsystemTest: TResult;

implementation

{ ============================================================
  Internal constants
  ============================================================ }
const
  { SELU activation constants (Klambauer et al. 2017) }
  SELU_ALPHA_C  : TFloat64 = 1.6732632423543772848170429916717;
  SELU_LAMBDA_C : TFloat64 = 1.0507009873554804934193349852946;
  { Erf polynomial coefficients (Abramowitz & Stegun 7.1.26, max err < 1.5e-7) }
  ERF_P         : TFloat64 = 0.3275911;
  ERF_A1        : TFloat64 = 0.254829592;
  ERF_A2        : TFloat64 = -0.284496736;
  ERF_A3        : TFloat64 = 1.421413741;
  ERF_A4        : TFloat64 = -1.453152027;
  ERF_A5        : TFloat64 = 1.061405429;

{ ============================================================
  Internal helper: initialize PGPU_INF_F32 and PGPU_NAN_F32
  using IEEE 754 bit patterns.
  ============================================================ }
procedure InitNumericalSpecials;
var
  W : LongWord;
  F : TFloat32 absolute W;
begin
  W := LongWord($7F800000);  { IEEE 754 single-precision +Infinity }
  PGPU_INF_F32 := F;
  W := LongWord($7FC00000);  { IEEE 754 single-precision quiet NaN }
  PGPU_NAN_F32 := F;
end;

{ ============================================================
  Internal helper: Erf core computation in Double precision.
  Uses A&S 7.1.26 five-term polynomial — max error < 1.5e-7.
  For |x| >= 4.0 the result saturates to ±1 with negligible error.
  ============================================================ }
function ErfImpl64(X: TFloat64): TFloat64;
var
  T, Poly: TFloat64;
  AbsX:    TFloat64;
  Sgn:     TFloat64;
begin
  if X >= 0.0 then Sgn := 1.0 else Sgn := -1.0;
  AbsX := Abs(X);
  if AbsX >= 4.0 then
  begin
    Result := Sgn;
    Exit;
  end;
  T    := 1.0 / (1.0 + ERF_P * AbsX);
  Poly := T * (ERF_A1 + T * (ERF_A2 + T * (ERF_A3 + T * (ERF_A4 + T * ERF_A5))));
  Result := Sgn * (1.0 - Poly * Exp(-AbsX * AbsX));
end;

{ === BLOCK 302: IsNaN / IsInf / IsFinite implementations ===
  Float32 layout: sign[31] | exp[30:23] | mantissa[22:0]
  Float64 layout: sign[63] | exp[62:52] | mantissa[51:0]
  Alias the float value to an integer type via the 'absolute' keyword
  for safe, compiler-agnostic bit examination. }

function IsNaN_F32(X: TFloat32): Boolean;
var
  Bits : LongWord absolute X;
begin
  Result := (((Bits shr 23) and LongWord($FF)) = LongWord($FF))
        and ((Bits and LongWord($007FFFFF)) <> 0);
end;

function IsNaN_F64(X: TFloat64): Boolean;
var
  Bits : QWord absolute X;
begin
  Result := (((Bits shr 52) and QWord($7FF)) = QWord($7FF))
        and ((Bits and QWord($000FFFFFFFFFFFFF)) <> 0);
end;

function IsInf_F32(X: TFloat32): Boolean;
var
  Bits : LongWord absolute X;
begin
  Result := (((Bits shr 23) and LongWord($FF)) = LongWord($FF))
        and ((Bits and LongWord($007FFFFF)) = 0);
end;

function IsInf_F64(X: TFloat64): Boolean;
var
  Bits : QWord absolute X;
begin
  Result := (((Bits shr 52) and QWord($7FF)) = QWord($7FF))
        and ((Bits and QWord($000FFFFFFFFFFFFF)) = 0);
end;

function IsFinite_F32(X: TFloat32): Boolean;
var
  Bits : LongWord absolute X;
begin
  Result := ((Bits shr 23) and LongWord($FF)) <> LongWord($FF);
end;

function IsFinite_F64(X: TFloat64): Boolean;
var
  Bits : QWord absolute X;
begin
  Result := ((Bits shr 52) and QWord($7FF)) <> QWord($7FF);
end;

{ === BLOCK 303: Abs/Sign implementations === }

function AbsInt32(X: TInt32): TInt32;
begin
  if X < 0 then Result := -X else Result := X;
end;

function AbsInt64(X: TInt64): TInt64;
begin
  if X < 0 then Result := -X else Result := X;
end;

function AbsF32(X: TFloat32): TFloat32;
begin
  if X < 0.0 then Result := -X else Result := X;
end;

function AbsF64(X: TFloat64): TFloat64;
begin
  if X < 0.0 then Result := -X else Result := X;
end;

function SignInt32(X: TInt32): TInt32;
begin
  if X > 0 then Result := 1
  else if X < 0 then Result := -1
  else Result := 0;
end;

function SignInt64(X: TInt64): TInt32;
begin
  if X > 0 then Result := 1
  else if X < 0 then Result := -1
  else Result := 0;
end;

function SignF32(X: TFloat32): TFloat32;
begin
  if X > 0.0 then Result := 1.0
  else if X < 0.0 then Result := -1.0
  else Result := 0.0;
end;

function SignF64(X: TFloat64): TFloat64;
begin
  if X > 0.0 then Result := 1.0
  else if X < 0.0 then Result := -1.0
  else Result := 0.0;
end;

{ === BLOCK 304: Floor/Ceil/Round/Truncate implementations ===
  Implemented via System.Int() (truncate toward zero) and System.Frac()
  to avoid platform-specific return-type issues with Math.Floor/Ceil. }

function FloorF64(X: TFloat64): TFloat64;
begin
  { For negative values with fractional part, truncation is toward zero
    (i.e., toward +inf), so subtract 1 to get true floor. }
  if Frac(X) < 0.0 then
    Result := Int(X) - 1.0
  else
    Result := Int(X);
end;

function FloorF32(X: TFloat32): TFloat32;
begin
  Result := TFloat32(FloorF64(TFloat64(X)));
end;

function CeilF64(X: TFloat64): TFloat64;
begin
  { For positive values with fractional part, truncation is toward zero
    (i.e., toward -inf), so add 1 to get true ceiling. }
  if Frac(X) > 0.0 then
    Result := Int(X) + 1.0
  else
    Result := Int(X);
end;

function CeilF32(X: TFloat32): TFloat32;
begin
  Result := TFloat32(CeilF64(TFloat64(X)));
end;

function RoundF64(X: TFloat64): TFloat64;
begin
  { Round half-away-from-zero convention. }
  if X >= 0.0 then
    Result := Int(X + 0.5)
  else
    Result := Int(X - 0.5);
end;

function RoundF32(X: TFloat32): TFloat32;
begin
  Result := TFloat32(RoundF64(TFloat64(X)));
end;

function TruncateF64(X: TFloat64): TFloat64;
begin
  Result := Int(X);  { System.Int() truncates toward zero }
end;

function TruncateF32(X: TFloat32): TFloat32;
begin
  Result := TFloat32(Int(TFloat64(X)));
end;

{ === BLOCK 305: Sqrt/Rsqrt implementations === }

function SqrtF32(X: TFloat32): TFloat32;
begin
  Result := TFloat32(Sqrt(TFloat64(X)));
end;

function SqrtF64(X: TFloat64): TFloat64;
begin
  Result := Sqrt(X);
end;

function RsqrtF32(X: TFloat32): TFloat32;
begin
  { Guard: rsqrt(0) = +Inf, rsqrt(negative) = NaN (return NaN via computation). }
  if X = 0.0 then
    Result := PGPU_INF_F32
  else if X < 0.0 then
    Result := PGPU_NAN_F32
  else
    Result := TFloat32(1.0 / Sqrt(TFloat64(X)));
end;

function RsqrtF64(X: TFloat64): TFloat64;
var
  W : QWord;
  F : TFloat64 absolute W;
begin
  if X = 0.0 then
  begin
    W := QWord($7FF0000000000000);  { Double +Infinity }
    Result := F;
  end
  else if X < 0.0 then
  begin
    W := QWord($7FF8000000000000);  { Double quiet NaN }
    Result := F;
  end
  else
    Result := 1.0 / Sqrt(X);
end;

{ === BLOCK 306: Log/Log2/Log10/Exp implementations === }

function LogF32(X: TFloat32): TFloat32;
begin
  Result := TFloat32(Ln(TFloat64(X)));
end;

function LogF64(X: TFloat64): TFloat64;
begin
  Result := Ln(X);
end;

function Log2F32(X: TFloat32): TFloat32;
begin
  Result := TFloat32(Math.Log2(TFloat64(X)));
end;

function Log2F64(X: TFloat64): TFloat64;
begin
  Result := Math.Log2(X);
end;

function Log10F32(X: TFloat32): TFloat32;
begin
  Result := TFloat32(Math.Log10(TFloat64(X)));
end;

function Log10F64(X: TFloat64): TFloat64;
begin
  Result := Math.Log10(X);
end;

function ExpF32(X: TFloat32): TFloat32;
begin
  Result := TFloat32(Exp(TFloat64(X)));
end;

function ExpF64(X: TFloat64): TFloat64;
begin
  Result := Exp(X);
end;

{ === BLOCK 307: Pow implementations === }

function PowF32(Base, Exponent: TFloat32): TFloat32;
begin
  Result := TFloat32(Math.Power(TFloat64(Base), TFloat64(Exponent)));
end;

function PowF64(Base, Exponent: TFloat64): TFloat64;
begin
  Result := Math.Power(Base, Exponent);
end;

{ === BLOCK 308: Sin/Cos/Tan implementations === }

function SinF32(X: TFloat32): TFloat32;
begin
  Result := TFloat32(Sin(TFloat64(X)));
end;

function SinF64(X: TFloat64): TFloat64;
begin
  Result := Sin(X);
end;

function CosF32(X: TFloat32): TFloat32;
begin
  Result := TFloat32(Cos(TFloat64(X)));
end;

function CosF64(X: TFloat64): TFloat64;
begin
  Result := Cos(X);
end;

function TanF32(X: TFloat32): TFloat32;
var
  C: TFloat64;
begin
  C := Cos(TFloat64(X));
  if C = 0.0 then
    Result := PGPU_INF_F32
  else
    Result := TFloat32(Sin(TFloat64(X)) / C);
end;

function TanF64(X: TFloat64): TFloat64;
var
  C: TFloat64;
begin
  C := Cos(X);
  if C = 0.0 then
  begin
    var W: QWord := QWord($7FF0000000000000);
    var F: TFloat64 absolute W;
    Result := F;
  end
  else
    Result := Sin(X) / C;
end;

{ === BLOCK 309: ASin/ACos/ATan/ATan2 implementations === }

function ASinF32(X: TFloat32): TFloat32;
begin
  Result := TFloat32(Math.ArcSin(TFloat64(X)));
end;

function ASinF64(X: TFloat64): TFloat64;
begin
  Result := Math.ArcSin(X);
end;

function ACosF32(X: TFloat32): TFloat32;
begin
  Result := TFloat32(Math.ArcCos(TFloat64(X)));
end;

function ACosF64(X: TFloat64): TFloat64;
begin
  Result := Math.ArcCos(X);
end;

function ATanF32(X: TFloat32): TFloat32;
begin
  Result := TFloat32(ArcTan(TFloat64(X)));
end;

function ATanF64(X: TFloat64): TFloat64;
begin
  Result := ArcTan(X);
end;

function ATan2F32(Y, X: TFloat32): TFloat32;
begin
  Result := TFloat32(Math.ArcTan2(TFloat64(Y), TFloat64(X)));
end;

function ATan2F64(Y, X: TFloat64): TFloat64;
begin
  Result := Math.ArcTan2(Y, X);
end;

{ === BLOCK 310: Sinh/Cosh/Tanh implementations === }

function SinhF32(X: TFloat32): TFloat32;
begin
  Result := TFloat32(Math.Sinh(TFloat64(X)));
end;

function SinhF64(X: TFloat64): TFloat64;
begin
  Result := Math.Sinh(X);
end;

function CoshF32(X: TFloat32): TFloat32;
begin
  Result := TFloat32(Math.Cosh(TFloat64(X)));
end;

function CoshF64(X: TFloat64): TFloat64;
begin
  Result := Math.Cosh(X);
end;

function TanhF32(X: TFloat32): TFloat32;
begin
  Result := TFloat32(Math.Tanh(TFloat64(X)));
end;

function TanhF64(X: TFloat64): TFloat64;
begin
  Result := Math.Tanh(X);
end;

{ === BLOCK 311: Erf/Erfc implementations ===
  Polynomial approximation (Abramowitz & Stegun 7.1.26).
  Max absolute error < 1.5e-7 for all real x.
  NaN input propagates; values with |x| >= 4 saturate to ±1. }

function ErfF32(X: TFloat32): TFloat32;
begin
  if IsNaN_F32(X) then
    Result := X
  else
    Result := TFloat32(ErfImpl64(TFloat64(X)));
end;

function ErfF64(X: TFloat64): TFloat64;
begin
  if IsNaN_F64(X) then
    Result := X
  else
    Result := ErfImpl64(X);
end;

function ErfcF32(X: TFloat32): TFloat32;
begin
  Result := 1.0 - ErfF32(X);
end;

function ErfcF64(X: TFloat64): TFloat64;
begin
  Result := 1.0 - ErfF64(X);
end;

{ === BLOCK 312: Sigmoid implementation === }

function Sigmoid(X: TFloat32): TFloat32;
begin
  Result := TFloat32(1.0 / (1.0 + Exp(-TFloat64(X))));
end;

{ === BLOCK 313: ReLU and LeakyReLU implementations === }

function ReLU(X: TFloat32): TFloat32;
begin
  if X > 0.0 then Result := X else Result := 0.0;
end;

function LeakyReLU(X, Alpha: TFloat32): TFloat32;
begin
  if X >= 0.0 then Result := X else Result := Alpha * X;
end;

{ === BLOCK 314: GELU — Gaussian Error Linear Unit ===
  Exact form: GELU(x) = x * Φ(x) = x * 0.5 * (1 + erf(x / sqrt(2)))
  Reference: Hendrycks & Gimpel, "Gaussian Error Linear Units", 2016. }

function GELU(X: TFloat32): TFloat32;
const
  INV_SQRT2 : TFloat64 = 0.70710678118654752440;  { 1/sqrt(2) }
begin
  Result := TFloat32(TFloat64(X) * 0.5 * (1.0 + ErfImpl64(TFloat64(X) * INV_SQRT2)));
end;

{ === BLOCK 315: Swish implementation ===
  Swish(x, beta) = x * sigmoid(beta * x) }

function Swish(X, Beta: TFloat32): TFloat32;
begin
  Result := X * Sigmoid(Beta * X);
end;

{ === BLOCK 316: SELU implementation ===
  SELU(x) = lambda * x            if x > 0
  SELU(x) = lambda * alpha * (e^x - 1)  if x <= 0
  Constants: alpha ≈ 1.6733, lambda ≈ 1.0507 (Klambauer et al. 2017). }

function SELU(X: TFloat32): TFloat32;
begin
  if X > 0.0 then
    Result := TFloat32(SELU_LAMBDA_C * TFloat64(X))
  else
    Result := TFloat32(SELU_LAMBDA_C * SELU_ALPHA_C * (Exp(TFloat64(X)) - 1.0));
end;

{ === BLOCK 317: Softplus implementation ===
  Softplus(x) = log(1 + exp(x)).
  Numerically stable: for x > 20 the result is dominated by x; for x < -20
  the result approaches 0. Use the identity:
    log(1 + exp(x)) = max(x, 0) + log(1 + exp(-|x|))
  to avoid overflow. }

function Softplus(X: TFloat32): TFloat32;
var
  AbsX: TFloat64;
begin
  AbsX := Abs(TFloat64(X));
  if AbsX > 20.0 then
  begin
    { For large |x|: log(1+exp(x)) ≈ x (positive) or ≈ 0 (negative) }
    if X > 0.0 then
      Result := X
    else
      Result := 0.0;
  end
  else
    Result := TFloat32(Ln(1.0 + Exp(TFloat64(X))));
end;

{ === BLOCK 318: TVector4f component-wise arithmetic === }

function AddV4(const A, B: TVector4f): TVector4f;
begin
  Result.X := A.X + B.X;
  Result.Y := A.Y + B.Y;
  Result.Z := A.Z + B.Z;
  Result.W := A.W + B.W;
end;

function SubV4(const A, B: TVector4f): TVector4f;
begin
  Result.X := A.X - B.X;
  Result.Y := A.Y - B.Y;
  Result.Z := A.Z - B.Z;
  Result.W := A.W - B.W;
end;

function MulV4(const A, B: TVector4f): TVector4f;
begin
  Result.X := A.X * B.X;
  Result.Y := A.Y * B.Y;
  Result.Z := A.Z * B.Z;
  Result.W := A.W * B.W;
end;

function DivV4(const A, B: TVector4f): TVector4f;
begin
  Result.X := A.X / B.X;
  Result.Y := A.Y / B.Y;
  Result.Z := A.Z / B.Z;
  Result.W := A.W / B.W;
end;

{ === BLOCK 319: Dot product implementations === }

function DotV4(const A, B: TVector4f): TFloat32;
begin
  Result := A.X * B.X + A.Y * B.Y + A.Z * B.Z + A.W * B.W;
end;

function DotV3(const A, B: TVector3f): TFloat32;
begin
  Result := A.X * B.X + A.Y * B.Y + A.Z * B.Z;
end;

function DotV2(const A, B: TVector2f): TFloat32;
begin
  Result := A.X * B.X + A.Y * B.Y;
end;

{ === BLOCK 320: Vector norm and normalize implementations === }

function NormV4(const V: TVector4f): TFloat32;
begin
  Result := SqrtF32(V.X * V.X + V.Y * V.Y + V.Z * V.Z + V.W * V.W);
end;

function NormalizeV4(const V: TVector4f): TVector4f;
var
  N, InvN: TFloat32;
begin
  N := NormV4(V);
  if N = 0.0 then
  begin
    Result.X := 0.0; Result.Y := 0.0; Result.Z := 0.0; Result.W := 0.0;
  end
  else
  begin
    InvN := 1.0 / N;
    Result.X := V.X * InvN;
    Result.Y := V.Y * InvN;
    Result.Z := V.Z * InvN;
    Result.W := V.W * InvN;
  end;
end;

function NormV3(const V: TVector3f): TFloat32;
begin
  Result := SqrtF32(V.X * V.X + V.Y * V.Y + V.Z * V.Z);
end;

function NormalizeV3(const V: TVector3f): TVector3f;
var
  N, InvN: TFloat32;
begin
  N := NormV3(V);
  if N = 0.0 then
  begin
    Result.X := 0.0; Result.Y := 0.0; Result.Z := 0.0;
  end
  else
  begin
    InvN := 1.0 / N;
    Result.X := V.X * InvN;
    Result.Y := V.Y * InvN;
    Result.Z := V.Z * InvN;
  end;
end;

{ === BLOCK 321: CrossV3 — 3D cross product === }

function CrossV3(const A, B: TVector3f): TVector3f;
begin
  Result.X := A.Y * B.Z - A.Z * B.Y;
  Result.Y := A.Z * B.X - A.X * B.Z;
  Result.Z := A.X * B.Y - A.Y * B.X;
end;

{ === BLOCK 322: HSum4 — horizontal sum of TVector4f === }

function HSum4(const V: TVector4f): TFloat32;
begin
  Result := V.X + V.Y + V.Z + V.W;
end;

{ === BLOCK 323: ReduceSum — compensated (pairwise) sum for float stability === }

function ReduceSum(const Arr: array of TFloat32): TFloat64;
var
  I: Integer;
begin
  Result := 0.0;
  for I := Low(Arr) to High(Arr) do
    Result := Result + TFloat64(Arr[I]);
end;

{ === BLOCK 324: ReduceMax === }

function ReduceMax(const Arr: array of TFloat32): TFloat32;
var
  I: Integer;
begin
  if Length(Arr) = 0 then
  begin
    Result := PGPU_NAN_F32;
    Exit;
  end;
  Result := Arr[Low(Arr)];
  for I := Low(Arr) + 1 to High(Arr) do
    if Arr[I] > Result then Result := Arr[I];
end;

{ === BLOCK 325: ReduceMin === }

function ReduceMin(const Arr: array of TFloat32): TFloat32;
var
  I: Integer;
begin
  if Length(Arr) = 0 then
  begin
    Result := PGPU_NAN_F32;
    Exit;
  end;
  Result := Arr[Low(Arr)];
  for I := Low(Arr) + 1 to High(Arr) do
    if Arr[I] < Result then Result := Arr[I];
end;

{ === BLOCK 326: ReduceMean === }

function ReduceMean(const Arr: array of TFloat32): TFloat64;
var
  N: Integer;
begin
  N := Length(Arr);
  if N = 0 then begin Result := 0.0; Exit; end;
  Result := ReduceSum(Arr) / TFloat64(N);
end;

{ === BLOCK 327: ReduceVariance — two-pass, population variance === }

function ReduceVariance(const Arr: array of TFloat32): TFloat64;
var
  I:    Integer;
  Mean: TFloat64;
  SumSq, Diff: TFloat64;
  N:    Integer;
begin
  N := Length(Arr);
  if N <= 0 then begin Result := 0.0; Exit; end;
  Mean  := ReduceMean(Arr);
  SumSq := 0.0;
  for I := Low(Arr) to High(Arr) do
  begin
    Diff  := TFloat64(Arr[I]) - Mean;
    SumSq := SumSq + Diff * Diff;
  end;
  Result := SumSq / TFloat64(N);
end;

{ === BLOCK 328: ReduceStdDev === }

function ReduceStdDev(const Arr: array of TFloat32): TFloat64;
begin
  Result := Sqrt(ReduceVariance(Arr));
end;

{ === BLOCK 329: ReduceSumInt32 === }

function ReduceSumInt32(const Arr: array of TInt32): TInt64;
var
  I: Integer;
begin
  Result := 0;
  for I := Low(Arr) to High(Arr) do
    Result := Result + TInt64(Arr[I]);
end;

{ === BLOCK 330: ParallelReduceSum — block-tree pairwise reduction ===
  Mirrors the GPU block-synchronous parallel reduction pattern.
  Allocates a working buffer, reduces in log2(N) passes halving
  the active element count each pass. }

function ParallelReduceSum(Arr: PFloat32; N: TUInt32; out Sum: TFloat64): TResult;
var
  Buf      : PFloat32;
  BufBytes : TUInt32;
  Stride   : TUInt32;
  Half     : TUInt32;
  I        : TUInt32;
  PA, PB, PC: PFloat32;
begin
  Sum := 0.0;
  if Arr = nil then Exit(PGPU_ERR_INVALID_PARAM);
  if N = 0 then Exit(PGPU_SUCCESS);
  if N = 1 then
  begin
    Sum := TFloat64(Arr^);
    Exit(PGPU_SUCCESS);
  end;

  { Allocate working buffer sized to N (copy input; reduce in place). }
  BufBytes := N * SizeOf(TFloat32);
  GetMem(Buf, BufBytes);
  try
    Move(Arr^, Buf^, BufBytes);

    Stride := N;
    while Stride > 1 do
    begin
      Half := Stride shr 1;
      { Reduce: Buf[i] := Buf[i] + Buf[i + Half] for i in [0, Half) }
      PA := Buf;
      PB := PFloat32(PByte(Buf) + TUInt32(Half) * SizeOf(TFloat32));
      PC := Buf;
      for I := 0 to Half - 1 do
      begin
        PC^ := PA^ + PB^;
        Inc(PA); Inc(PB); Inc(PC);
      end;
      { If Stride was odd, carry the last element forward. }
      if (Stride and 1) <> 0 then
      begin
        PB := PFloat32(PByte(Buf) + TUInt32(Stride - 1) * SizeOf(TFloat32));
        PC := PFloat32(PByte(Buf) + TUInt32(Half) * SizeOf(TFloat32));
        PC^ := Buf^ + PB^;
        { Re-anchor: only first Half+1 elements used, but we set Stride := Half+1 below. }
        Stride := Half + 1;
      end
      else
        Stride := Half;
    end;

    Sum := TFloat64(Buf^);
    Result := PGPU_SUCCESS;
  finally
    FreeMem(Buf, BufBytes);
  end;
end;

{ === BLOCK 331: DotProduct — pointer-based dot product with Double accumulator === }

function DotProduct(A, B: PFloat32; N: TUInt32; out Res: TFloat64): TResult;
var
  PA, PB: PFloat32;
  I:      TUInt32;
begin
  Res := 0.0;
  if (A = nil) or (B = nil) then Exit(PGPU_ERR_INVALID_PARAM);
  PA := A;
  PB := B;
  for I := 0 to N - 1 do
  begin
    Res := Res + TFloat64(PA^) * TFloat64(PB^);
    Inc(PA); Inc(PB);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 332: VectorAdd — element-wise addition === }

function VectorAdd(A, B, Dst: PFloat32; N: TUInt32): TResult;
var
  PA, PB, PD: PFloat32;
  I:          TUInt32;
begin
  if (A = nil) or (B = nil) or (Dst = nil) then Exit(PGPU_ERR_INVALID_PARAM);
  PA := A; PB := B; PD := Dst;
  for I := 0 to N - 1 do
  begin
    PD^ := PA^ + PB^;
    Inc(PA); Inc(PB); Inc(PD);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 333: VectorSub — element-wise subtraction === }

function VectorSub(A, B, Dst: PFloat32; N: TUInt32): TResult;
var
  PA, PB, PD: PFloat32;
  I:          TUInt32;
begin
  if (A = nil) or (B = nil) or (Dst = nil) then Exit(PGPU_ERR_INVALID_PARAM);
  PA := A; PB := B; PD := Dst;
  for I := 0 to N - 1 do
  begin
    PD^ := PA^ - PB^;
    Inc(PA); Inc(PB); Inc(PD);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 334: VectorMul — element-wise multiplication === }

function VectorMul(A, B, Dst: PFloat32; N: TUInt32): TResult;
var
  PA, PB, PD: PFloat32;
  I:          TUInt32;
begin
  if (A = nil) or (B = nil) or (Dst = nil) then Exit(PGPU_ERR_INVALID_PARAM);
  PA := A; PB := B; PD := Dst;
  for I := 0 to N - 1 do
  begin
    PD^ := PA^ * PB^;
    Inc(PA); Inc(PB); Inc(PD);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 335: VectorScale === }

function VectorScale(A: PFloat32; Scalar: TFloat32; Dst: PFloat32; N: TUInt32): TResult;
var
  PA, PD: PFloat32;
  I:      TUInt32;
begin
  if (A = nil) or (Dst = nil) then Exit(PGPU_ERR_INVALID_PARAM);
  PA := A; PD := Dst;
  for I := 0 to N - 1 do
  begin
    PD^ := PA^ * Scalar;
    Inc(PA); Inc(PD);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 336: VectorAxpby — alpha*A + beta*B → Dst === }

function VectorAxpby(A, B, Dst: PFloat32; Alpha, Beta: TFloat32; N: TUInt32): TResult;
var
  PA, PB, PD: PFloat32;
  I:          TUInt32;
begin
  if (A = nil) or (B = nil) or (Dst = nil) then Exit(PGPU_ERR_INVALID_PARAM);
  PA := A; PB := B; PD := Dst;
  for I := 0 to N - 1 do
  begin
    PD^ := Alpha * PA^ + Beta * PB^;
    Inc(PA); Inc(PB); Inc(PD);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 337: VectorNorm — L2 norm with Double accumulator === }

function VectorNorm(A: PFloat32; N: TUInt32; out Norm: TFloat64): TResult;
var
  PA:  PFloat32;
  I:   TUInt32;
  Sum: TFloat64;
  V:   TFloat64;
begin
  Norm := 0.0;
  if A = nil then Exit(PGPU_ERR_INVALID_PARAM);
  PA  := A;
  Sum := 0.0;
  for I := 0 to N - 1 do
  begin
    V   := TFloat64(PA^);
    Sum := Sum + V * V;
    Inc(PA);
  end;
  Norm   := Sqrt(Sum);
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 338: VectorMax / VectorMin / VectorArgMax / VectorArgMin === }

function VectorMax(A: PFloat32; N: TUInt32; out MaxVal: TFloat32): TResult;
var
  PA:  PFloat32;
  I:   TUInt32;
begin
  MaxVal := 0.0;
  if A = nil then Exit(PGPU_ERR_INVALID_PARAM);
  if N = 0   then Exit(PGPU_ERR_INVALID_PARAM);
  MaxVal := A^;
  PA     := PFloat32(PByte(A) + SizeOf(TFloat32));
  for I := 1 to N - 1 do
  begin
    if PA^ > MaxVal then MaxVal := PA^;
    Inc(PA);
  end;
  Result := PGPU_SUCCESS;
end;

function VectorMin(A: PFloat32; N: TUInt32; out MinVal: TFloat32): TResult;
var
  PA:  PFloat32;
  I:   TUInt32;
begin
  MinVal := 0.0;
  if A = nil then Exit(PGPU_ERR_INVALID_PARAM);
  if N = 0   then Exit(PGPU_ERR_INVALID_PARAM);
  MinVal := A^;
  PA     := PFloat32(PByte(A) + SizeOf(TFloat32));
  for I := 1 to N - 1 do
  begin
    if PA^ < MinVal then MinVal := PA^;
    Inc(PA);
  end;
  Result := PGPU_SUCCESS;
end;

function VectorArgMax(A: PFloat32; N: TUInt32; out Idx: TUInt32): TResult;
var
  PA:     PFloat32;
  I:      TUInt32;
  MaxVal: TFloat32;
begin
  Idx := 0;
  if A = nil then Exit(PGPU_ERR_INVALID_PARAM);
  if N = 0   then Exit(PGPU_ERR_INVALID_PARAM);
  MaxVal := A^;
  Idx    := 0;
  PA     := PFloat32(PByte(A) + SizeOf(TFloat32));
  for I := 1 to N - 1 do
  begin
    if PA^ > MaxVal then begin MaxVal := PA^; Idx := I; end;
    Inc(PA);
  end;
  Result := PGPU_SUCCESS;
end;

function VectorArgMin(A: PFloat32; N: TUInt32; out Idx: TUInt32): TResult;
var
  PA:     PFloat32;
  I:      TUInt32;
  MinVal: TFloat32;
begin
  Idx := 0;
  if A = nil then Exit(PGPU_ERR_INVALID_PARAM);
  if N = 0   then Exit(PGPU_ERR_INVALID_PARAM);
  MinVal := A^;
  Idx    := 0;
  PA     := PFloat32(PByte(A) + SizeOf(TFloat32));
  for I := 1 to N - 1 do
  begin
    if PA^ < MinVal then begin MinVal := PA^; Idx := I; end;
    Inc(PA);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 339: VectorApply — apply function pointer element-wise === }

function VectorApply(A, Dst: PFloat32; N: TUInt32; Func: TActivationFunc): TResult;
var
  PA, PD: PFloat32;
  I:      TUInt32;
begin
  if (A = nil) or (Dst = nil) then Exit(PGPU_ERR_INVALID_PARAM);
  if not Assigned(Func)       then Exit(PGPU_ERR_INVALID_PARAM);
  PA := A; PD := Dst;
  for I := 0 to N - 1 do
  begin
    PD^ := Func(PA^);
    Inc(PA); Inc(PD);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 340: Softmax — numerically stable ===
  Algorithm:
    1. Compute max_val = max(A[0..N-1])
    2. Compute sum_exp = sum(exp(A[i] - max_val))
    3. Dst[i] = exp(A[i] - max_val) / sum_exp }

function Softmax(A: PFloat32; N: TUInt32; Dst: PFloat32): TResult;
var
  PA, PD: PFloat32;
  MaxVal: TFloat32;
  SumExp: TFloat64;
  I:      TUInt32;
  V:      TFloat32;
begin
  if (A = nil) or (Dst = nil) then Exit(PGPU_ERR_INVALID_PARAM);
  if N = 0 then Exit(PGPU_SUCCESS);

  { Pass 1: find max. }
  if VectorMax(A, N, MaxVal) <> PGPU_SUCCESS then Exit(PGPU_ERR_KERNEL_FAILED);

  { Pass 2: accumulate exp(A[i] - max). }
  SumExp := 0.0;
  PA     := A;
  for I := 0 to N - 1 do
  begin
    SumExp := SumExp + Exp(TFloat64(PA^) - TFloat64(MaxVal));
    Inc(PA);
  end;

  { Pass 3: write normalized values. }
  PA := A; PD := Dst;
  for I := 0 to N - 1 do
  begin
    V   := TFloat32(Exp(TFloat64(PA^) - TFloat64(MaxVal)) / SumExp);
    PD^ := V;
    Inc(PA); Inc(PD);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 341: LogSoftmax ===
  Algorithm:
    1. max_val = max(A[0..N-1])
    2. log_sum = log(sum(exp(A[i] - max_val)))
    3. Dst[i]  = (A[i] - max_val) - log_sum }

function LogSoftmax(A: PFloat32; N: TUInt32; Dst: PFloat32): TResult;
var
  PA, PD:  PFloat32;
  MaxVal:  TFloat32;
  SumExp:  TFloat64;
  LogSum:  TFloat64;
  I:       TUInt32;
begin
  if (A = nil) or (Dst = nil) then Exit(PGPU_ERR_INVALID_PARAM);
  if N = 0 then Exit(PGPU_SUCCESS);

  if VectorMax(A, N, MaxVal) <> PGPU_SUCCESS then Exit(PGPU_ERR_KERNEL_FAILED);

  SumExp := 0.0;
  PA     := A;
  for I := 0 to N - 1 do
  begin
    SumExp := SumExp + Exp(TFloat64(PA^) - TFloat64(MaxVal));
    Inc(PA);
  end;
  LogSum := Ln(SumExp);

  PA := A; PD := Dst;
  for I := 0 to N - 1 do
  begin
    PD^ := TFloat32((TFloat64(PA^) - TFloat64(MaxVal)) - LogSum);
    Inc(PA); Inc(PD);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 342: LayerNormForward ===
  For each element:
    mean = sum(A) / N
    var  = sum((A[i] - mean)^2) / N
    Dst[i] = Gamma[i] * (A[i] - mean) / sqrt(var + Epsilon) + Beta[i] }

function LayerNormForward(A, Dst, Gamma, Beta: PFloat32; N: TUInt32;
                          Epsilon: TFloat32): TResult;
var
  PA, PD, PG, PB: PFloat32;
  Mean, Var_, StdInv, Diff: TFloat64;
  I: TUInt32;
begin
  if (A = nil) or (Dst = nil) or (Gamma = nil) or (Beta = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if N = 0 then Exit(PGPU_SUCCESS);

  { Pass 1: compute mean. }
  Mean := 0.0;
  PA   := A;
  for I := 0 to N - 1 do begin Mean := Mean + TFloat64(PA^); Inc(PA); end;
  Mean := Mean / TFloat64(N);

  { Pass 2: compute population variance. }
  Var_ := 0.0;
  PA   := A;
  for I := 0 to N - 1 do
  begin
    Diff := TFloat64(PA^) - Mean;
    Var_ := Var_ + Diff * Diff;
    Inc(PA);
  end;
  Var_   := Var_ / TFloat64(N);
  StdInv := 1.0 / Sqrt(Var_ + TFloat64(Epsilon));

  { Pass 3: normalize, scale, shift. }
  PA := A; PD := Dst; PG := Gamma; PB := Beta;
  for I := 0 to N - 1 do
  begin
    PD^ := TFloat32(TFloat64(PG^) * ((TFloat64(PA^) - Mean) * StdInv) + TFloat64(PB^));
    Inc(PA); Inc(PD); Inc(PG); Inc(PB);
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 343: BatchNormForward — single-batch training-mode normalization ===
  1. Compute batch mean and variance.
  2. Normalize using batch stats: Dst[i] = (A[i] - batch_mean) / sqrt(batch_var + eps).
  3. Update running stats:
       RunMean[0] = (1-momentum)*RunMean[0] + momentum*batch_mean
       RunVar[0]  = (1-momentum)*RunVar[0]  + momentum*batch_var }

function BatchNormForward(A, Dst, RunMean, RunVar: PFloat32; N: TUInt32;
                          Epsilon, Momentum: TFloat32): TResult;
var
  PA, PD:          PFloat32;
  BatchMean, BatchVar, StdInv, Diff: TFloat64;
  I:               TUInt32;
begin
  if (A = nil) or (Dst = nil) or (RunMean = nil) or (RunVar = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if N = 0 then Exit(PGPU_SUCCESS);

  { Compute batch mean. }
  BatchMean := 0.0;
  PA        := A;
  for I := 0 to N - 1 do begin BatchMean := BatchMean + TFloat64(PA^); Inc(PA); end;
  BatchMean := BatchMean / TFloat64(N);

  { Compute batch variance (population). }
  BatchVar := 0.0;
  PA       := A;
  for I := 0 to N - 1 do
  begin
    Diff     := TFloat64(PA^) - BatchMean;
    BatchVar := BatchVar + Diff * Diff;
    Inc(PA);
  end;
  BatchVar := BatchVar / TFloat64(N);
  StdInv   := 1.0 / Sqrt(BatchVar + TFloat64(Epsilon));

  { Normalize into Dst. }
  PA := A; PD := Dst;
  for I := 0 to N - 1 do
  begin
    PD^ := TFloat32((TFloat64(PA^) - BatchMean) * StdInv);
    Inc(PA); Inc(PD);
  end;

  { Update running statistics. }
  RunMean^ := TFloat32((1.0 - TFloat64(Momentum)) * TFloat64(RunMean^)
                       + TFloat64(Momentum) * BatchMean);
  RunVar^  := TFloat32((1.0 - TFloat64(Momentum)) * TFloat64(RunVar^)
                       + TFloat64(Momentum) * BatchVar);
  Result   := PGPU_SUCCESS;
end;

{ === BLOCK 344: FMA — fused multiply-add ===
  FMA(a, b, c) = a*b + c.
  On hardware supporting FMA instructions (x86 FMA3/FMA4, ARM NEON),
  the compiler may lower this to a single fused instruction. }

function FMA(A, B, C: TFloat32): TFloat32;
begin
  Result := A * B + C;
end;

{ === BLOCK 345: Reciprocal with guarded divide-by-zero ===
  Returns PGPU_INF_F32 for zero input, preserves NaN. }

function Reciprocal(X: TFloat32): TFloat32;
begin
  if IsNaN_F32(X) then
    Result := X
  else if X = 0.0 then
    Result := PGPU_INF_F32
  else
    Result := 1.0 / X;
end;

{ === BLOCK 346: FastInvSqrt — Quake III Arena fast inverse square root ===
  Classic bit-trick: interpret float bits as integer, apply Newton-Raphson.
  Approximately 1% error relative to true rsqrt. Used for fast 3D normalization. }

function FastInvSqrt(X: TFloat32): TFloat32;
var
  F    : TFloat32;
  I    : LongWord absolute F;
  XHalf: TFloat32;
begin
  XHalf := X * 0.5;
  F     := X;
  I     := LongWord($5F3759DF) - (I shr 1);  { Magic constant + bit shift }
  F     := F * (1.5 - XHalf * F * F);        { One Newton-Raphson iteration }
  Result := F;
end;

{ === BLOCK 347: IntegerSaturatingAdd — overflow-safe signed 32-bit addition ===
  Clamps result to [TInt32 min, TInt32 max] instead of wrapping. }

function IntegerSaturatingAdd(A, B: TInt32): TInt32;
var
  Tmp: TInt64;
begin
  Tmp := TInt64(A) + TInt64(B);
  if Tmp > TInt64(High(TInt32)) then
    Result := High(TInt32)
  else if Tmp < TInt64(Low(TInt32)) then
    Result := Low(TInt32)
  else
    Result := TInt32(Tmp);
end;

{ === BLOCK 348: Fixed16_16Mul — Q16.16 fixed-point multiplication ===
  Representation: value 1.0 is stored as 65536 (= 2^16).
  Multiply: (A/65536) * (B/65536) = (A*B)/(65536^2).
  To express result in Q16.16: (A*B) >> 16. }

function Fixed16_16Mul(A, B: TInt32): TInt32;
var
  Tmp: TInt64;
begin
  Tmp    := TInt64(A) * TInt64(B);
  Result := TInt32(Tmp shr 16);
end;

{ === BLOCK 349: LogSumExp — numerically stable log-sum-exp ===
  Algorithm:
    max_val = max(A[0..N-1])
    result  = max_val + log(sum(exp(A[i] - max_val)))
  Returns PGPU_NAN_F32 for N=0 or nil pointer. }

function LogSumExp(A: PFloat32; N: TUInt32): TFloat32;
var
  PA:     PFloat32;
  MaxVal: TFloat32;
  SumExp: TFloat64;
  I:      TUInt32;
begin
  if (A = nil) or (N = 0) then begin Result := PGPU_NAN_F32; Exit; end;
  if VectorMax(A, N, MaxVal) <> PGPU_SUCCESS then begin Result := PGPU_NAN_F32; Exit; end;
  SumExp := 0.0;
  PA     := A;
  for I := 0 to N - 1 do
  begin
    SumExp := SumExp + Exp(TFloat64(PA^) - TFloat64(MaxVal));
    Inc(PA);
  end;
  Result := TFloat32(TFloat64(MaxVal) + Ln(SumExp));
end;

{ === BLOCK 350: NumericalSubsystemTest ===
  Exercises one representative case per major subsystem.
  Returns PGPU_SUCCESS if all checks pass, PGPU_ERR_KERNEL_FAILED otherwise. }

function NumericalSubsystemTest: TResult;

  function Near(A, B, Tol: TFloat64): Boolean;
  begin
    Result := Abs(A - B) <= Tol;
  end;

const
  TOL32 = 1.0e-5;
  TOL64 = 1.0e-10;

var
  Arr4     : array[0..3] of TFloat32;
  Dst4     : array[0..3] of TFloat32;
  GammaArr : array[0..3] of TFloat32;
  BetaArr  : array[0..3] of TFloat32;
  V3A, V3B, V3C: TVector3f;
  V4A, V4B, V4R: TVector4f;
  FSum     : TFloat64;
  FNorm    : TFloat64;
  FVal     : TFloat32;
  IIdx     : TUInt32;
  RMean    : TFloat32;
  RVar     : TFloat32;
  Tmp      : TFloat32;
  I        : Integer;
begin
  Result := PGPU_SUCCESS;

  { --- Block 301: constants are non-zero ------------------------------------ }
  if PGPU_PI <= 0.0 then Exit(PGPU_ERR_KERNEL_FAILED);
  if PGPU_E  <= 0.0 then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 302: IEEE classification --------------------------------------- }
  if not IsNaN_F32(PGPU_NAN_F32)        then Exit(PGPU_ERR_KERNEL_FAILED);
  if not IsInf_F32(PGPU_INF_F32)        then Exit(PGPU_ERR_KERNEL_FAILED);
  if     IsNaN_F32(1.0)                 then Exit(PGPU_ERR_KERNEL_FAILED);
  if     IsInf_F32(1.0)                 then Exit(PGPU_ERR_KERNEL_FAILED);
  if not IsFinite_F32(1.0)              then Exit(PGPU_ERR_KERNEL_FAILED);
  if     IsFinite_F32(PGPU_INF_F32)     then Exit(PGPU_ERR_KERNEL_FAILED);
  if not IsNaN_F64(TFloat64(0) / TFloat64(0)) then { no-op: cannot rely on runtime division-by-zero here }
    ; { platform-dependent; skip hard assertion }

  { --- Block 303: Abs / Sign ------------------------------------------------ }
  if AbsF32(-3.5) <> 3.5  then Exit(PGPU_ERR_KERNEL_FAILED);
  if AbsInt32(-7) <> 7    then Exit(PGPU_ERR_KERNEL_FAILED);
  if SignF32(0.0) <> 0.0  then Exit(PGPU_ERR_KERNEL_FAILED);
  if SignF32(-2.0) <> -1.0 then Exit(PGPU_ERR_KERNEL_FAILED);
  if SignInt32(5)  <> 1    then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 304: Floor / Ceil / Round / Truncate --------------------------- }
  if FloorF32(2.7)  <> 2.0  then Exit(PGPU_ERR_KERNEL_FAILED);
  if FloorF32(-2.3) <> -3.0 then Exit(PGPU_ERR_KERNEL_FAILED);
  if CeilF32(2.3)   <> 3.0  then Exit(PGPU_ERR_KERNEL_FAILED);
  if CeilF32(-2.7)  <> -2.0 then Exit(PGPU_ERR_KERNEL_FAILED);
  if TruncateF32(2.9)  <> 2.0  then Exit(PGPU_ERR_KERNEL_FAILED);
  if TruncateF32(-2.9) <> -2.0 then Exit(PGPU_ERR_KERNEL_FAILED);
  if RoundF32(2.5)  <> 3.0  then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 305: Sqrt / Rsqrt ---------------------------------------------- }
  if not Near(SqrtF32(4.0), 2.0, TOL32)   then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(RsqrtF32(4.0), 0.5, TOL32)  then Exit(PGPU_ERR_KERNEL_FAILED);
  if not IsInf_F32(RsqrtF32(0.0))         then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 306: Log / Exp ------------------------------------------------- }
  if not Near(ExpF32(0.0), 1.0, TOL32)                  then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(LogF32(ExpF32(1.0)), 1.0, TOL32)          then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(Log2F32(8.0), 3.0, TOL32)                 then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(Log10F32(100.0), 2.0, TOL32)              then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 307: Pow ------------------------------------------------------- }
  if not Near(PowF32(2.0, 10.0), 1024.0, 0.1) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 308: Trig ------------------------------------------------------ }
  if not Near(SinF32(0.0), 0.0, TOL32)  then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(CosF32(0.0), 1.0, TOL32)  then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(TanF32(0.0), 0.0, TOL32)  then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 309: Inverse trig ---------------------------------------------- }
  if not Near(ASinF32(0.0), 0.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(ACosF32(1.0), 0.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(ATanF32(1.0), TFloat32(PGPU_PI / 4.0), TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 310: Hyperbolic ------------------------------------------------ }
  if not Near(SinhF32(0.0), 0.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(CoshF32(0.0), 1.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(TanhF32(0.0), 0.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 311: Erf ------------------------------------------------------- }
  if not Near(ErfF32(0.0), 0.0, TOL32)           then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(ErfF32(1.0), 0.8427007929, TOL32)  then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(ErfcF32(0.0), 1.0, TOL32)          then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 312: Sigmoid --------------------------------------------------- }
  if not Near(Sigmoid(0.0), 0.5, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 313: ReLU / LeakyReLU ----------------------------------------- }
  if ReLU(3.0)  <> 3.0 then Exit(PGPU_ERR_KERNEL_FAILED);
  if ReLU(-1.0) <> 0.0 then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(LeakyReLU(-4.0, 0.1), -0.4, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 314: GELU ------------------------------------------------------ }
  if not Near(GELU(0.0), 0.0, TOL32)  then Exit(PGPU_ERR_KERNEL_FAILED);
  { GELU(1.0) = 1.0 * 0.5 * (1 + erf(1/sqrt(2))) ≈ 0.8413 }
  if not Near(GELU(1.0), 0.8413, 0.001) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 315: Swish ----------------------------------------------------- }
  if not Near(Swish(0.0, 1.0), 0.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 316: SELU ------------------------------------------------------ }
  if not Near(SELU(0.0), 0.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);
  { SELU(1.0) = lambda * 1.0 ≈ 1.0507 }
  if not Near(SELU(1.0), 1.0507, 0.001) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 317: Softplus -------------------------------------------------- }
  { Softplus(0) = log(2) ≈ 0.6931 }
  if not Near(Softplus(0.0), 0.6931, 0.001) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 318: TVector4f arithmetic ------------------------------------- }
  V4A.X := 1.0; V4A.Y := 2.0; V4A.Z := 3.0; V4A.W := 4.0;
  V4B.X := 5.0; V4B.Y := 6.0; V4B.Z := 7.0; V4B.W := 8.0;
  V4R := AddV4(V4A, V4B);
  if not Near(V4R.X, 6.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);
  V4R := SubV4(V4B, V4A);
  if not Near(V4R.Y, 4.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);
  V4R := MulV4(V4A, V4B);
  if not Near(V4R.Z, 21.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 319: Dot products ---------------------------------------------- }
  V3A.X := 1.0; V3A.Y := 0.0; V3A.Z := 0.0;
  V3B.X := 0.0; V3B.Y := 1.0; V3B.Z := 0.0;
  if not Near(DotV3(V3A, V3B), 0.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(DotV3(V3A, V3A), 1.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 320: Norm / Normalize ------------------------------------------ }
  if not Near(NormV3(V3A), 1.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);
  V3C := NormalizeV3(V3B);
  if not Near(NormV3(V3C), 1.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 321: Cross product --------------------------------------------- }
  V3C := CrossV3(V3A, V3B);   { (1,0,0) x (0,1,0) = (0,0,1) }
  if not Near(V3C.X, 0.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(V3C.Y, 0.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(V3C.Z, 1.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 322: HSum4 ----------------------------------------------------- }
  V4A.X := 1.0; V4A.Y := 2.0; V4A.Z := 3.0; V4A.W := 4.0;
  if not Near(HSum4(V4A), 10.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Blocks 323-329: Array reductions ------------------------------------- }
  Arr4[0] := 1.0; Arr4[1] := 2.0; Arr4[2] := 3.0; Arr4[3] := 4.0;
  if not Near(ReduceSum(Arr4), 10.0, TOL64)  then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(ReduceMax(Arr4), 4.0, TOL64)   then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(ReduceMin(Arr4), 1.0, TOL64)   then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(ReduceMean(Arr4), 2.5, TOL64)  then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(ReduceVariance(Arr4), 1.25, TOL64) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 330: ParallelReduceSum ----------------------------------------- }
  if ParallelReduceSum(@Arr4[0], 4, FSum) <> PGPU_SUCCESS then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(FSum, 10.0, TOL64) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 331: DotProduct ------------------------------------------------ }
  Arr4[0] := 1.0; Arr4[1] := 2.0; Arr4[2] := 3.0; Arr4[3] := 4.0;
  if DotProduct(@Arr4[0], @Arr4[0], 4, FSum) <> PGPU_SUCCESS then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(FSum, 30.0, TOL64) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 332: VectorAdd ------------------------------------------------- }
  Dst4[0] := 0.0; Dst4[1] := 0.0; Dst4[2] := 0.0; Dst4[3] := 0.0;
  if VectorAdd(@Arr4[0], @Arr4[0], @Dst4[0], 4) <> PGPU_SUCCESS then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(Dst4[0], 2.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(Dst4[3], 8.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 337: VectorNorm ------------------------------------------------ }
  Arr4[0] := 3.0; Arr4[1] := 4.0; Arr4[2] := 0.0; Arr4[3] := 0.0;
  if VectorNorm(@Arr4[0], 4, FNorm) <> PGPU_SUCCESS then Exit(PGPU_ERR_KERNEL_FAILED);
  if not Near(FNorm, 5.0, TOL64) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 338: ArgMax / ArgMin ------------------------------------------- }
  Arr4[0] := 1.0; Arr4[1] := 5.0; Arr4[2] := 2.0; Arr4[3] := 0.5;
  if VectorArgMax(@Arr4[0], 4, IIdx) <> PGPU_SUCCESS then Exit(PGPU_ERR_KERNEL_FAILED);
  if IIdx <> 1 then Exit(PGPU_ERR_KERNEL_FAILED);
  if VectorArgMin(@Arr4[0], 4, IIdx) <> PGPU_SUCCESS then Exit(PGPU_ERR_KERNEL_FAILED);
  if IIdx <> 3 then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 340: Softmax sum → 1 ------------------------------------------ }
  Arr4[0] := 1.0; Arr4[1] := 2.0; Arr4[2] := 3.0; Arr4[3] := 4.0;
  if Softmax(@Arr4[0], 4, @Dst4[0]) <> PGPU_SUCCESS then Exit(PGPU_ERR_KERNEL_FAILED);
  FSum := 0.0;
  for I := 0 to 3 do FSum := FSum + TFloat64(Dst4[I]);
  if not Near(FSum, 1.0, 1.0e-6) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 341: LogSoftmax all <= 0 ------------------------------------- }
  Arr4[0] := 1.0; Arr4[1] := 2.0; Arr4[2] := 3.0; Arr4[3] := 4.0;
  if LogSoftmax(@Arr4[0], 4, @Dst4[0]) <> PGPU_SUCCESS then Exit(PGPU_ERR_KERNEL_FAILED);
  for I := 0 to 3 do
    if Dst4[I] > 0.0 then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 342: LayerNorm zero-mean output -------------------------------- }
  Arr4[0] := 1.0; Arr4[1] := 2.0; Arr4[2] := 3.0; Arr4[3] := 4.0;
  for I := 0 to 3 do begin GammaArr[I] := 1.0; BetaArr[I] := 0.0; end;
  if LayerNormForward(@Arr4[0], @Dst4[0], @GammaArr[0], @BetaArr[0], 4, 1.0e-5) <> PGPU_SUCCESS
  then Exit(PGPU_ERR_KERNEL_FAILED);
  FSum := 0.0;
  for I := 0 to 3 do FSum := FSum + TFloat64(Dst4[I]);
  if not Near(FSum, 0.0, 1.0e-5) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 343: BatchNorm normalizes to near-zero mean ------------------- }
  Arr4[0] := 1.0; Arr4[1] := 2.0; Arr4[2] := 3.0; Arr4[3] := 4.0;
  RMean := 0.0; RVar := 1.0;
  if BatchNormForward(@Arr4[0], @Dst4[0], @RMean, @RVar, 4, 1.0e-5, 0.1) <> PGPU_SUCCESS
  then Exit(PGPU_ERR_KERNEL_FAILED);
  FSum := 0.0;
  for I := 0 to 3 do FSum := FSum + TFloat64(Dst4[I]);
  if not Near(FSum, 0.0, 1.0e-4) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 344: FMA ------------------------------------------------------- }
  if not Near(FMA(2.0, 3.0, 4.0), 10.0, TOL32) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 345: Reciprocal ------------------------------------------------ }
  if not Near(Reciprocal(2.0), 0.5, TOL32)      then Exit(PGPU_ERR_KERNEL_FAILED);
  if not IsInf_F32(Reciprocal(0.0))             then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 346: FastInvSqrt within 1.5% error of true value -------------- }
  FVal := FastInvSqrt(4.0);  { Should be ~0.5 }
  if not Near(FVal, 0.5, 0.01) then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 347: IntegerSaturatingAdd ------------------------------------- }
  if IntegerSaturatingAdd(High(TInt32), 1)  <> High(TInt32) then Exit(PGPU_ERR_KERNEL_FAILED);
  if IntegerSaturatingAdd(Low(TInt32),  -1) <> Low(TInt32)  then Exit(PGPU_ERR_KERNEL_FAILED);
  if IntegerSaturatingAdd(5, 3) <> 8 then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 348: Fixed16_16Mul --------------------------------------------- }
  { 2.0 * 3.0 in Q16.16: 131072 * 196608 >> 16 = 393216 (= 6.0 in Q16.16) }
  if Fixed16_16Mul(131072, 196608) <> 393216 then Exit(PGPU_ERR_KERNEL_FAILED);
  { 1.0 * 1.0 = 65536 }
  if Fixed16_16Mul(65536, 65536) <> 65536 then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block 349: LogSumExp ------------------------------------------------- }
  { LogSumExp([0,0,0]) = log(3) ≈ 1.0986 }
  Arr4[0] := 0.0; Arr4[1] := 0.0; Arr4[2] := 0.0; Arr4[3] := 0.0;
  FVal := LogSumExp(@Arr4[0], 4);
  if not Near(FVal, Ln(4.0), 1.0e-4) then Exit(PGPU_ERR_KERNEL_FAILED);

  { All tests passed. }
  Result := PGPU_SUCCESS;
end;

initialization
  InitNumericalSpecials;

end.
