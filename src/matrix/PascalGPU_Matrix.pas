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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-398
  Block              : TReduceOp enumeration
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:9346655b6f3b7bd78912ec7584b38422f75120d4cbe952f978d581a72939beea
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 398: TReduceOp enumeration === }
type
  TReduceOp = (roSum, roMax, roMin, roMean, roProd);

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-351
  Block              : TMatrix record
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:1167998d7d3397643a07ab866bc3e336ee42e5a6aea970313dbf8a2d37eac37e
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-376
  Block              : TTensor record
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:be3405e85c39943357f0615c2084f3760970625f90d759b013c16545c2ea49e2
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-394
  Block              : MultiHeadAttention record
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:e738d7aace8ff384b73076c10fded0198d073c0a8676ccf54ef753196e6622f5
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-352
  Block              : AllocMatrix
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:4a05f2f128f9f1f33d64591df731b92052a217dd8985d6cbefbfa66fe86d21aa
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 352: AllocMatrix === }
function AllocMatrix(out M: TMatrix; Rows, Cols: TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-353
  Block              : FreeMatrix
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:cabf2c33ee89282fa7d8a8e2fc113bda63710eea6d8a97874f8346fb42a6d251
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 353: FreeMatrix === }
function FreeMatrix(var M: TMatrix): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-354
  Block              : MatrixAt
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2bf12019b057a56478d318e31b747af7ddc488bcdaa58d93922a7c976e06a4ac
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 354: MatrixAt === }
function MatrixAt(const M: TMatrix; Row, Col: TUInt32): TFloat32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-355
  Block              : MatrixSet
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:95f8e8c3cba76f12a7db5d9d542965c4e5b4047c8d44c51a070bdbc4cdf03637
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 355: MatrixSet === }
function MatrixSet(var M: TMatrix; Row, Col: TUInt32; Value: TFloat32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-356
  Block              : MatrixFill
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c78859158cde49975ef36eef85975cf8c2e95bc0907b3247c2b0962d54c96925
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 356: MatrixFill === }
function MatrixFill(var M: TMatrix; Value: TFloat32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-357
  Block              : MatrixZero
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:b7c01256cff840674914ef647303ca12a3b41863b86f1c7db886ceedbb818808
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 357: MatrixZero === }
function MatrixZero(var M: TMatrix): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-358
  Block              : MatrixIdentity
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c0e5fc5cbbedc878462b827d13a9d7f88a443d7998a9ecfa7d5f48290e7e0adb
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 358: MatrixIdentity === }
function MatrixIdentity(var M: TMatrix): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-359
  Block              : MatrixCopy
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:6181bb441b9080f4e134449133f5701994b64e2d7a7713ba8801a7229af11660
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 359: MatrixCopy === }
function MatrixCopy(const Src: TMatrix; out Dst: TMatrix): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-360
  Block              : MatrixTranspose
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:b813b0cedf758fd090043f3ec2c9848f8c72a33a4a8236035c04ea31fc09a0da
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 360: MatrixTranspose === }
function MatrixTranspose(const A: TMatrix; out B: TMatrix): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-361
  Block              : MatrixAdd
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:01f8a82885da603c594d0ed864f943a67d0617e76bde54ed0374d3fe6e387cb6
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 361: MatrixAdd === }
function MatrixAdd(const A, B: TMatrix; out C: TMatrix): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-362
  Block              : MatrixSub
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:309a41731983a983689ff202c13797d28949662e516ab1ff88e571cecff989a5
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 362: MatrixSub === }
function MatrixSub(const A, B: TMatrix; out C: TMatrix): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-363
  Block              : MatrixScale
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:03cea0fb119ef17597e60594732c0fc340b840291d6e149528d3afca57827c8a
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 363: MatrixScale === }
function MatrixScale(const A: TMatrix; Scalar: TFloat32; out B: TMatrix): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-364
  Block              : MatrixMul (naive O(n^3))
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2b4bc9c2e7616b59db26ded184f261cf3adf2ea91e0700b5f6dd12609119b247
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 364: MatrixMul (naive O(n^3)) === }
function MatrixMul(const A, B: TMatrix; out C: TMatrix): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-365
  Block              : MatrixMulTiled
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:e113299ae91af8c8a9f66659b8442e8e4313577b860264a0e85ab3a450cbe738
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 365: MatrixMulTiled === }
function MatrixMulTiled(const A, B: TMatrix; out C: TMatrix; TileSize: TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-366
  Block              : PascalGEMM
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:025acb26498ac4278e96af98f301ac863beaf33d11b4cb2d596fbde8c7f4a614
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 366: PascalGEMM === }
function PascalGEMM(Alpha: TFloat32; const A, B: TMatrix; Beta: TFloat32; var C: TMatrix): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-367
  Block              : MatrixMulTransposeB
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:0e5635265774f4e7c75647794f6a22caca0765e52676f1078881440521948478
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 367: MatrixMulTransposeB === }
function MatrixMulTransposeB(const A, B: TMatrix; out C: TMatrix): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-368
  Block              : VectorMatrixMul
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:831917be1c0f15c117883a2175d60916bee537345275b9748b1e82a7b25530c2
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 368: VectorMatrixMul === }
function VectorMatrixMul(V: PFloat32; const M: TMatrix; OutVec: PFloat32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-369
  Block              : MatrixVectorMul
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:ef6ac1f078ecc1df205e34216d1ca9780c4c337607a36bc14074f25509dc6ba5
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 369: MatrixVectorMul === }
function MatrixVectorMul(const M: TMatrix; V: PFloat32; OutVec: PFloat32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-370
  Block              : MatrixTrace
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:cddf9b50955e3e7bf951fad6e6e5c0c64e9b3c1df81b724795bb3c752fc0ad99
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 370: MatrixTrace === }
function MatrixTrace(const M: TMatrix; out Trace: TFloat32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-371
  Block              : MatrixDiag
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:ae3c710c59e3e1de11f602c5a572a07b9190baba46e9be6de841ad098fee1e79
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 371: MatrixDiag === }
function MatrixDiag(const M: TMatrix; out Diag: PFloat32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-372
  Block              : MatrixNorm (Frobenius)
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:eac01596cb1b3239bd1a43107a4417a4c85e85f65c1fb7054aedf824f9347e77
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 372: MatrixNorm (Frobenius) === }
function MatrixNorm(const M: TMatrix; out Norm: TFloat64): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-373
  Block              : MatrixMaxAbsElement
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:cb01e46d3ca1c545672aaec2a042625829aff882ee9b0d30173366a6685c2da7
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 373: MatrixMaxAbsElement === }
function MatrixMaxAbsElement(const M: TMatrix; out MaxVal: TFloat32; out Row, Col: TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-374
  Block              : MatrixSoftmax
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:1415ef8d643eccf81c8b2c1e4215e5e626eea26e02735c69a3bd3735215c96e4
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 374: MatrixSoftmax === }
function MatrixSoftmax(const A: TMatrix; out B: TMatrix; Axis: TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-375
  Block              : MatrixLayerNorm
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:3bd3bb8a8c7f04a38dae91475a591a91c4cfdc1b09d241a9876d6ef5eefbde27
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 375: MatrixLayerNorm === }
function MatrixLayerNorm(const A: TMatrix; Gamma, Beta: PFloat32; Epsilon: TFloat32; out B: TMatrix): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-377
  Block              : AllocTensor
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:4a64e5ef95894988c3a86055bfa9d1cd2dd52940a3c1dae85d62de46af361518
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 377: AllocTensor === }
function AllocTensor(out T: TTensor; NDim: TUInt32; const Shape: array of TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-378
  Block              : FreeTensor
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f32e0e818cfec476ca1074033d15b95ec6a47b633fc4d3c538df40b91b132c8c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 378: FreeTensor === }
function FreeTensor(var T: TTensor): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-379
  Block              : TensorAt
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:da0b4ae5f8c54d0761356ac6b4e3b3896bfb4ec299c4ad704b1c3594625dac1c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 379: TensorAt === }
function TensorAt(const T: TTensor; const Indices: array of TUInt32): TFloat32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-380
  Block              : TensorSet
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c737b4ca2d9fcf832aedadc41e4aa04ad31d479fb854c89c7903cd39b87525ec
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 380: TensorSet === }
function TensorSet(var T: TTensor; const Indices: array of TUInt32; Value: TFloat32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-381
  Block              : TensorReshape
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c768e39a299e39f59153ddfc787ed554f77d2972e6b533591612a7cfcf225a10
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 381: TensorReshape === }
function TensorReshape(const A: TTensor; out B: TTensor; const NewShape: array of TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-382
  Block              : TensorSlice
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:97aa3e0d4a6e4308f6734f50ab8d2af355da555fcede7bac45459fcc49aeab14
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 382: TensorSlice === }
function TensorSlice(const A: TTensor; Dim, Start, Length: TUInt32; out B: TTensor): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-383
  Block              : TensorAdd
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:982481c18a979746128dc4eda455acb6f2da4d22a47b69c6e8b87c0ac988b231
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 383: TensorAdd === }
function TensorAdd(const A, B: TTensor; out C: TTensor): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-384
  Block              : TensorMul (element-wise)
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2880283c2d465619a134c0e3e97e5f06334faab3e8c5024ac104743144437a67
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 384: TensorMul (element-wise) === }
function TensorMul(const A, B: TTensor; out C: TTensor): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-385
  Block              : TensorBatchedMatMul
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:9d08f9a3959a49af095da44dab89ee503dc2c52f1266631a13fc06af8a091fca
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 385: TensorBatchedMatMul === }
function TensorBatchedMatMul(const A, B: TTensor; out C: TTensor): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-386
  Block              : Conv1D
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:5f3f19772c9eb52a6cd640092e65f276d2738ef426feb1e851007a3b853beb71
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 386: Conv1D === }
function Conv1D(const Input, Kernel: TTensor; out OutT: TTensor; Stride, Padding: TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-387
  Block              : Conv2D
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:bed0c9f8f292e1f8facd111f0ad6d705a4eb605f17c9690b3cea3cc6387bd5b4
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 387: Conv2D === }
function Conv2D(const Input, Kernel: TTensor; out OutT: TTensor; StrideH, StrideW, PadH, PadW: TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-388
  Block              : MaxPool2D
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:0e64bab53b5421d4eb2f9575b032fda11779e4b839719e7b3582789ab1f78d10
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 388: MaxPool2D === }
function MaxPool2D(const Input: TTensor; out OutT: TTensor; KH, KW, SH, SW: TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-389
  Block              : AvgPool2D
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:84d652ab6828578493e2ebc89476e201b245731deffd52c3d14543df91a09e7e
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 389: AvgPool2D === }
function AvgPool2D(const Input: TTensor; out OutT: TTensor; KH, KW, SH, SW: TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-390
  Block              : TensorNorm
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:67938913113f9e71fffa2f49a7e68903b6c5656c8cc43d402dbcb050bbf4a023
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 390: TensorNorm === }
function TensorNorm(const T: TTensor; out Norm: TFloat64): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-391
  Block              : TensorFill
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:afff5a3b84958decadbb73883e7295b913f1635c82198d32adb8ba3b104003f1
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 391: TensorFill === }
function TensorFill(var T: TTensor; Value: TFloat32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-392
  Block              : TensorPrint
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:040caac0a9eb4a3a23a862fa68fead553c06acc32dd258247db35243b2b49499
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 392: TensorPrint === }
function TensorPrint(const T: TTensor): AnsiString;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-393
  Block              : ScaledDotProductAttention
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2f2fbb7eee6ece9e7f01add91e490fa6220fe89528a957e162bcb1189d25225c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 393: ScaledDotProductAttention === }
function ScaledDotProductAttention(const Q, K, V: TTensor; out OutT: TTensor; Scale: TFloat32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-394
  Block              : MultiHeadAttention signatures
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:dbccc6caca8daf1b5ae28440f587703bcde9b5905f5de4114bcd92b422fe2dda
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 394: MultiHeadAttention signatures === }
function MultiHeadAttentionInit(out MHA: TMultiHeadAttention; NumHeads, ModelDim: TUInt32): TResult;
function MultiHeadAttentionForward(var MHA: TMultiHeadAttention; const Q, K, V: TTensor; out OutT: TTensor): TResult;
function MultiHeadAttentionFree(var MHA: TMultiHeadAttention): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-395
  Block              : TensorCopy
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:27ae6ba688292f84ebacea976cd2ae3ff86be901a712ad88e55d4ce7349f53d6
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 395: TensorCopy === }
function TensorCopy(const Src: TTensor; out Dst: TTensor): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-396
  Block              : TensorBroadcastAdd
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:acd43a344b3d75fdf12a3313f91c5e977c4d8d2745cf9bc012338ae0acd6e801
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 396: TensorBroadcastAdd === }
function TensorBroadcastAdd(const A: TTensor; V: PFloat32; VNDim: TUInt32; out B: TTensor): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-397
  Block              : TensorReduce
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2e2679300d2ec9d2b84cfce8a42a79bb5ab9b717ea817f34f62adb15c7d4bd78
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 397: TensorReduce === }
function TensorReduce(const A: TTensor; Axis: TUInt32; Op: TReduceOp; out B: TTensor): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-399
  Block              : TensorValidate
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:3245a30f9cd5d3784373848b5bbf68768d9fe55fb587d01c7bfc7ac503e0c261
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 399: TensorValidate === }
function TensorValidate(const T: TTensor): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-400
  Block              : MatrixSubsystemTest
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:9ae95e419d413d6de66a02a23dd52131fafec5cf10d4a9d9de5c52436f582be0
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 400: MatrixSubsystemTest === }
function MatrixSubsystemTest: TResult;

implementation

{ ============================================================
  MATRIX IMPLEMENTATIONS
  ============================================================ }

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-352
  Block              : AllocMatrix implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:d1fbf5dc1b27e1c523a9177ae6268397c61849a1914df903d7e105ef89bb1eea
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-353
  Block              : FreeMatrix implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2dd182c94253d72c3cbc0da4ca18fa0c5017a8f8bd958eab19334c2058288682
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-354
  Block              : MatrixAt implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:8de237295ec91783233426925d5f0c360aa6c73c80ba5826f5d25727db114cbc
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-355
  Block              : MatrixSet implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:5d000ce78e04d797bba2e8a5941aa08287fa82cf2720315ad6cac4e2bf0208db
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-356
  Block              : MatrixFill implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:aa7077d05316d9a67705fcbba7a581f9a41459b2634100ca56721866908cb5c5
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-357
  Block              : MatrixZero implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:974843bf7f2790969dd05cecc0b44dc57a05a1fcc3c87fb74ddcab482e5a8372
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-358
  Block              : MatrixIdentity implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:6d25788e2a52fa3617d313208324ca87eae83d410e09afb7935cda420a5aee9a
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-359
  Block              : MatrixCopy implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:4c65fcf07bd64aa65e2c41f376c8324d2211fca1a3417be4533bcdbf8f32c78b
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-360
  Block              : MatrixTranspose implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:eeea03eedeb3b46068f7267566714d552f88e4e9ec50430dec2b44c93f5b9d40
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-361
  Block              : MatrixAdd implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:1d55af9014d4a124b4f39ca5de701192724236f4867f773495a506e3c732788a
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-362
  Block              : MatrixSub implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f836079ab7eda9fd765141b11f4f4d1d433f5dffb26f8731f030b9ffa09f7cfe
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-363
  Block              : MatrixScale implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:aca563223f0598a693b695939c18c2551f3bc6f22749d7183b9dff581c5bc121
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-364
  Block              : MatrixMul naive O(n^3) implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:84026074e7e20c89484abd1d29a7c80481ff0b6fae4088fa5b0439976e9245ab
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-365
  Block              : MatrixMulTiled implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:bf45f096a27c1ba434e2d67d5114d8dbb1ceb7cea9bb4cba64b5d8127a124e35
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-366
  Block              : PascalGEMM implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:ecfef4e49460a654e18555ee3e78f9c6343fe782e9746ef9c5aa89e25d91ad44
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-367
  Block              : MatrixMulTransposeB implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:a7d26579641b2dcb91dba35c20deb522bebd7c8df5bfbcf6373f1cdc3518d639
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-368
  Block              : VectorMatrixMul implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:e546268de6f1cffd4afb713b2527708f667606e3e0ef7f9447e2377dfaec15b1
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-369
  Block              : MatrixVectorMul implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:8a66b9d35ff766a0d591110d2374fef6d0060660a0868efce177f7c7c2b37f6c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-370
  Block              : MatrixTrace implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:94d7de609750857acbff32a2880a6cbab7cfc39725cec793eae382b39ec20cde
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-371
  Block              : MatrixDiag implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:5f8daf9fcc81b134cdad17a40391e8d7576b91b45ad3108f397655393fe4859b
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-372
  Block              : MatrixNorm (Frobenius) implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:a4a6907b15055df62275ab667776c609130bba7665276c23ff753174ab419815
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-373
  Block              : MatrixMaxAbsElement implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:d0af6d6cd2cd751acc7ad4c380a19587b05804bf313c2a1a48b6bfd74856751c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-374
  Block              : MatrixSoftmax implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:21a92527a2e5f64308bcfef3249b25ae57d5dbb8b5df2a44e0cdab1421ce32ca
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-375
  Block              : MatrixLayerNorm implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:1198d5ab00557a1ea86d808761cdc1458becfa10909eab119a8eb4df743040d9
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-377
  Block              : AllocTensor implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:5a99363593f1d7a9bac75b1ad10f58a7ce92009ccc66508bb791ec9a443858b7
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-378
  Block              : FreeTensor implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:e53ab025ef0480b5e0f27ed8fbc09a997af6be743f2d15420412b35bd3897a47
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-379
  Block              : TensorAt implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:3c4724ae5e379f0d81f76c478c85bb4b795963ff9510d89a3fa411a8074d05b5
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-380
  Block              : TensorSet implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:26604ee5238a36cafddc5241d2da8657b1b80afeb37e6479d8a682c0fbfef377
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-381
  Block              : TensorReshape implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:4ae2ab0b74686c699e4d3869c54a9d9d97e6b5477adcde76fe042714e3420f4a
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-382
  Block              : TensorSlice implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:d7f7d125b7c72e6f5195f6a58e4bc5c96811650be58bdd6471bb36d815aed337
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-383
  Block              : TensorAdd implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:cfb9ca1c3da09569b8357b6b98e4a3a8c95adde245b1451f2959727b9eb8239f
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-384
  Block              : TensorMul element-wise implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:813512348a5594ce0bb3cc8ba89b3d29a30f1a77c97efc772807096b2ab2e86e
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-385
  Block              : TensorBatchedMatMul implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:b21f40e9de6aa7ec8cb1ba4bf8b843e2b483e8a5228dfb7521d048a8faa1028b
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-386
  Block              : Conv1D implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f8ff14f6ee10e1ed856b31a6666e0dab278d87fe6b2fe2a37aba4b582055e048
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-387
  Block              : Conv2D naive implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:62593e099bf5352e95dfa3be47a10c72c89d91c7b34d866c2c8fb34872c2a911
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-388
  Block              : MaxPool2D implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:6e60f89ad4749d8ac8a6272a8910fbf7446f6f2f33d23abe58cbec39a0531947
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-389
  Block              : AvgPool2D implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:76b8cc0653904df7a026d2634acab6017eef06e07aecd66e374286e050ed2c8f
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-390
  Block              : TensorNorm implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:a7ce726972e87936bca29fc6576d3e2ad1a24a8ec5233c223eb52897a6deab53
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-391
  Block              : TensorFill implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2548d5d699e4ab826ea7fb03e199c21686fc512ac75b9021b702c0aa0f1ac219
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-392
  Block              : TensorPrint implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:4f9e14338333d59f4b83b2711d2eab9ed6c79514c406cf50b7d163e3544ae77b
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-393
  Block              : ScaledDotProductAttention implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:75b45acbe10d0a0c540207e9b6193cab99ef34362091bdeff5a068ac75e09d40
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-394
  Block              : MultiHeadAttention Initialize + Forward + Free
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:332902f95f44b71cc17056b2ab22813e3035ed78bb1f172e1ffa991e56de82f1
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-395
  Block              : TensorCopy implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:cdc895b1ef42f718976236b5a2308ae9e466a7293192f0d8a6ff1e7642be0f68
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-396
  Block              : TensorBroadcastAdd implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:ba97df222601a045499a071fd08b1b217b41f58847add3663c13024100f62297
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-397
  Block              : TensorReduce implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:62967e38d0f93132cae64c9ea21e3dda240cf13fd7287f7c89e551bd9928f15f
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-398
  Block              : TReduceOp (defined in type section above)
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:7419e05b33bd0ae8dbde3ea474be0cbaa7345962fddff82cbdc3c6288016b43b
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 398: TReduceOp (defined in type section above) === }
{ TReduceOp = (roSum, roMax, roMin, roMean, roProd) — declared at top of interface }

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-399
  Block              : TensorValidate implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:185e121c7f89d030d0180c7748d1f6bc41417b51b99f2a9cf2a5d7ffa5581e86
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-006-BLK-400
  Block              : MatrixSubsystemTest implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:b5dc5e699cc44d34b58a30c0f445c239dc92069d8cba6a0a43fef7e0f314b44c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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
