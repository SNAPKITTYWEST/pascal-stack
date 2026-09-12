{$mode objfpc}{$H+}{$PackRecords C}
unit PascalGPU_Advanced;

{ Advanced GPU-style computational primitives — Blocks 401-450 }

interface

uses
  SysUtils, Math, PascalGPU_Types;

{ ======================================================================= }
{ Constants                                                                 }
{ ======================================================================= }

const
  ADVANCED_TILE_MAX = 32;
  WARP_SIZE         = 32;
  REG_FILE_SIZE     = 256;
  PGPU_MAX_F32      = TFloat32(3.4028235e+38);
  PGPU_MIN_F32      = TFloat32(-3.4028235e+38);

{ ======================================================================= }
{ === BLOCK 401: TRegisterFile record ===                                  }
{ Simulates per-thread register bank: 256 TUInt32 slots                   }
{ ======================================================================= }

type
  TRegisterFile = record
    Slots: array[0..REG_FILE_SIZE - 1] of TUInt32;
  end;
  PRegisterFile = ^TRegisterFile;

{ ======================================================================= }
{ === BLOCK 402: RegisterFileRead/Write operations ===                     }
{ ======================================================================= }

function  RegisterFileRead(const RF: TRegisterFile; Idx: TUInt32): TUInt32;
procedure RegisterFileWrite(var RF: TRegisterFile; Idx: TUInt32; Value: TUInt32);

{ ======================================================================= }
{ === BLOCK 403: TSharedMemTile ===                                        }
{ 2D tile in shared memory: W, H, Data array (max 32x32)                  }
{ ======================================================================= }

type
  TSharedMemTile = record
    W, H: TUInt32;
    Data: array[0..ADVANCED_TILE_MAX * ADVANCED_TILE_MAX - 1] of TFloat32;
  end;
  PSharedMemTile = ^TSharedMemTile;

{ --- Supporting matrix and tensor types used by subsequent blocks --- }

type
  TMatrix = record
    Rows, Cols: TUInt32;
    Data:       PFloat32;
  end;
  PMatrix = ^TMatrix;

  TTensor = record
    Dims:     array[0..3] of TUInt32;
    NDim:     TUInt32;
    Data:     PFloat32;
    DataSize: TUInt32;  { total element count }
  end;
  PTensor = ^TTensor;

{ ======================================================================= }
{ === BLOCK 404: LoadTile ===                                              }
{ Copy a rectangular tile from Src matrix into shared-memory tile         }
{ ======================================================================= }

function LoadTile(var Tile: TSharedMemTile; const Src: TMatrix;
                  TileRow, TileCol, TileW, TileH: TUInt32): TResult;

{ ======================================================================= }
{ === BLOCK 405: StoreTile ===                                             }
{ Write a shared-memory tile back to destination matrix                   }
{ ======================================================================= }

function StoreTile(const Tile: TSharedMemTile; var Dst: TMatrix;
                   TileRow, TileCol: TUInt32): TResult;

{ ======================================================================= }
{ === BLOCK 406: TiledMatMulKernel ===                                     }
{ Full tiled SGEMM using TSharedMemTile; 16x16 inner tile                 }
{ ======================================================================= }

function TiledMatMulKernel(const A, B: TMatrix; var C: TMatrix): TResult;

{ ======================================================================= }
{ === BLOCK 407: TWarpReduceSum ===                                        }
{ 32-element parallel reduction (warp-level simulation)                   }
{ ======================================================================= }

type
  TWarpReduceSum = record
    Data:  array[0..WARP_SIZE - 1] of TFloat32;
    Count: TUInt32;
  end;
  PWarpReduceSum = ^TWarpReduceSum;

function WarpReduceSum(const W: TWarpReduceSum): TFloat32;

{ ======================================================================= }
{ === BLOCK 408: WarpReduceMax, WarpReduceMin, WarpReduceAnd, WarpReduceOr }
{ ======================================================================= }

function WarpReduceMax(const W: TWarpReduceSum): TFloat32;
function WarpReduceMin(const W: TWarpReduceSum): TFloat32;
function WarpReduceAnd(const W: TWarpReduceSum): TUInt32;
function WarpReduceOr (const W: TWarpReduceSum): TUInt32;

{ ======================================================================= }
{ === BLOCK 409: TBlockReduceSum ===                                       }
{ Block-level reduction that calls warp-level reductions                  }
{ ======================================================================= }

type
  TBlockReduceSum = record
    WarpData:  array[0..WARP_SIZE - 1] of TWarpReduceSum;
    WarpCount: TUInt32;
  end;
  PBlockReduceSum = ^TBlockReduceSum;

function BlockReduceSum(const B: TBlockReduceSum): TFloat32;

{ ======================================================================= }
{ === BLOCK 410: TScanOp ===                                               }
{ Scan operation enumeration for prefix scans                             }
{ ======================================================================= }

type
  TScanOp = (soAdd, soMax, soMin);

{ ======================================================================= }
{ === BLOCK 411: ExclusiveScanF32 ===                                      }
{ Exclusive prefix scan over float array                                  }
{ ======================================================================= }

function ExclusiveScanF32(InArr, OutArr: PFloat32; N: TUInt32;
                           Op: TScanOp): TResult;

{ ======================================================================= }
{ === BLOCK 412: InclusiveScanF32 ===                                      }
{ Inclusive prefix scan over float array                                  }
{ ======================================================================= }

function InclusiveScanF32(InArr, OutArr: PFloat32; N: TUInt32;
                           Op: TScanOp): TResult;

{ ======================================================================= }
{ === BLOCK 413: THistogram ===                                            }
{ Histogram with integer bins and normalised float bins                   }
{ ======================================================================= }

type
  THistogram = record
    Bins:     PUInt32;
    NormBins: PFloat32;
    BinCount: TUInt32;
    MinVal:   TFloat32;
    MaxVal:   TFloat32;
  end;
  PHistogram = ^THistogram;

function  HistogramCreate(var H: THistogram; BinCount: TUInt32;
                          MinVal, MaxVal: TFloat32): TResult;
procedure HistogramDestroy(var H: THistogram);

{ ======================================================================= }
{ === BLOCK 414: ComputeHistogram ===                                      }
{ Bin a float array into H.Bins                                           }
{ ======================================================================= }

function ComputeHistogram(InArr: PFloat32; N: TUInt32;
                          var H: THistogram): TResult;

{ ======================================================================= }
{ === BLOCK 415: HistogramNormalize ===                                    }
{ Convert integer bin counts to probabilities in H.NormBins               }
{ ======================================================================= }

procedure HistogramNormalize(var H: THistogram);

{ ======================================================================= }
{ === BLOCK 416: GatherF32 ===                                             }
{ Indexed gather: Out[i] = Values[Indices[i]]                             }
{ ======================================================================= }

function GatherF32(Values: PFloat32; Indices: PUInt32;
                   OutArr: PFloat32; N: TUInt32): TResult;

{ ======================================================================= }
{ === BLOCK 417: ScatterF32 ===                                            }
{ Indexed scatter-add: Out[Indices[i]] += Values[i]  (atomic add sim)     }
{ ======================================================================= }

function ScatterF32(Values: PFloat32; Indices: PUInt32;
                    OutArr: PFloat32; N: TUInt32): TResult;

{ ======================================================================= }
{ === BLOCK 418: RadixSortUInt32 ===                                       }
{ LSD radix sort over TUInt32 array, 8-bit digits, 4 passes               }
{ ======================================================================= }

function RadixSortUInt32(Keys: PUInt32; N: TUInt32;
                          Ascending: Boolean): TResult;

{ ======================================================================= }
{ === BLOCK 419: BitonicSortF32 ===                                        }
{ Bitonic network sort; pads to next power-of-two internally              }
{ ======================================================================= }

function BitonicSortF32(Arr: PFloat32; N: TUInt32;
                         Ascending: Boolean): TResult;

{ ======================================================================= }
{ === BLOCK 420: Stencil1D ===                                             }
{ 1D stencil with arbitrary kernel (boundary-clamped to zero)             }
{ ======================================================================= }

function Stencil1D(InArr, OutArr: PFloat32; N: TUInt32;
                   const Weights: array of TFloat32): TResult;

{ ======================================================================= }
{ === BLOCK 421: Stencil2D 3x3 ===                                        }
{ 2D 3x3 convolution stencil (zero-pad borders)                          }
{ ======================================================================= }

function Stencil2D(InArr, OutArr: PFloat32; W, H: TUInt32;
                   const Kernel3x3: array of TFloat32): TResult;

{ ======================================================================= }
{ === BLOCK 422: DepthwiseConv2D ===                                       }
{ Depthwise separable conv: one filter per input channel                  }
{ Input/Filter/Output layout: [C, H, W]                                   }
{ ======================================================================= }

function DepthwiseConv2D(Input, Filters, Output: PFloat32;
                          InH, InW, Channels, KH, KW,
                          StrideH, StrideW, PadH, PadW: TUInt32): TResult;

{ ======================================================================= }
{ === BLOCK 423: Im2Col ===                                                }
{ Reshape input for GEMM-based convolution: output is [C*KH*KW, OH*OW]   }
{ ======================================================================= }

function Im2Col(Input, ColBuf: PFloat32;
                InH, InW, Channels, KH, KW,
                StrideH, StrideW, PadH, PadW: TUInt32): TResult;

{ ======================================================================= }
{ === BLOCK 424: Col2Im ===                                                }
{ Inverse of Im2Col; accumulates back into spatial output                 }
{ ======================================================================= }

function Col2Im(ColBuf, Output: PFloat32;
                InH, InW, Channels, KH, KW,
                StrideH, StrideW, PadH, PadW: TUInt32): TResult;

{ ======================================================================= }
{ === BLOCK 425: DropoutF32 ===                                            }
{ Forward dropout: zero out with probability Rate, scale surviving units  }
{ ======================================================================= }

function DropoutF32(InArr, OutArr, Mask: PFloat32; N: TUInt32;
                    Rate: TFloat32; Seed: TUInt32): TResult;

{ ======================================================================= }
{ === BLOCK 426: TRandomState ===                                          }
{ LCG PRNG state: Seed, Multiplier, Increment                             }
{ ======================================================================= }

type
  TRandomState = record
    Seed:       TUInt64;
    Multiplier: TUInt64;
    Increment:  TUInt64;
  end;
  PRandomState = ^TRandomState;

{ ======================================================================= }
{ === BLOCK 427: RandomInit ===                                            }
{ Initialise LCG state with Knuth multiplier / increment                  }
{ ======================================================================= }

procedure RandomInit(var R: TRandomState; Seed: TUInt64);

{ ======================================================================= }
{ === BLOCK 428: RandomNext ===                                            }
{ Advance LCG; return upper 32 bits of new seed                           }
{ ======================================================================= }

function RandomNext(var R: TRandomState): TUInt32;

{ ======================================================================= }
{ === BLOCK 429: RandomFloat ===                                           }
{ Uniform float in [0, 1)                                                 }
{ ======================================================================= }

function RandomFloat(var R: TRandomState): TFloat32;

{ ======================================================================= }
{ === BLOCK 430: RandomNormal ===                                          }
{ Box-Muller normal deviate (mean=0, std=1)                               }
{ ======================================================================= }

function RandomNormal(var R: TRandomState): TFloat32;

{ ======================================================================= }
{ === BLOCK 431: FillRandom ===                                            }
{ Fill array with uniform [0,1) random floats                             }
{ ======================================================================= }

function FillRandom(OutArr: PFloat32; N: TUInt32;
                    var R: TRandomState): TResult;

{ ======================================================================= }
{ === BLOCK 432: TPositionalEncoding ===                                   }
{ Sinusoidal PE table: MaxLen x Dim                                       }
{ ======================================================================= }

type
  TPositionalEncoding = record
    MaxLen: TUInt32;
    Dim:    TUInt32;
    Table:  PFloat32;   { allocated MaxLen*Dim floats }
  end;
  PPositionalEncoding = ^TPositionalEncoding;

{ ======================================================================= }
{ === BLOCK 433: BuildPositionalEncoding ===                               }
{ Fill sinusoidal table; caller must free PE.Table with FreeMem           }
{ ======================================================================= }

function BuildPositionalEncoding(var PE: TPositionalEncoding;
                                  MaxLen, Dim: TUInt32): TResult;

{ ======================================================================= }
{ === BLOCK 434: ApplyPositionalEncoding ===                               }
{ Add PE table rows to tensor rows (tensor must be [SeqLen, Dim])         }
{ ======================================================================= }

function ApplyPositionalEncoding(const PE: TPositionalEncoding;
                                  var T: TTensor): TResult;

{ ======================================================================= }
{ === BLOCK 435: TEmbeddingTable ===                                       }
{ VocabSize x EmbedDim weight matrix                                      }
{ ======================================================================= }

type
  TEmbeddingTable = record
    VocabSize: TUInt32;
    EmbedDim:  TUInt32;
    Weights:   PFloat32;  { allocated VocabSize*EmbedDim floats }
  end;
  PEmbeddingTable = ^TEmbeddingTable;

{ ======================================================================= }
{ === BLOCK 436: EmbeddingLookup ===                                       }
{ Copy EmbedDim rows from table for each index in Indices[0..N-1]         }
{ ======================================================================= }

function EmbeddingLookup(const ET: TEmbeddingTable;
                          Indices: PUInt32; N: TUInt32;
                          OutArr: PFloat32): TResult;

{ ======================================================================= }
{ === BLOCK 437: CrossEntropyLoss ===                                      }
{ Numerically stable softmax cross-entropy; Labels hold integer indices   }
{ ======================================================================= }

function CrossEntropyLoss(Logits, Labels: PFloat32;
                           N, Classes: TUInt32;
                           out Loss: TFloat32): TResult;

{ ======================================================================= }
{ === BLOCK 438: MSELoss ===                                               }
{ Mean squared error between Predictions and Targets                      }
{ ======================================================================= }

function MSELoss(Predictions, Targets: PFloat32; N: TUInt32;
                 out Loss: TFloat32): TResult;

{ ======================================================================= }
{ === BLOCK 439: L2Regularization ===                                      }
{ L2 penalty: 0.5 * Lambda * ||params||^2                                 }
{ ======================================================================= }

function L2Regularization(Params: PFloat32; N: TUInt32;
                           Lambda: TFloat32;
                           out Penalty: TFloat32): TResult;

{ ======================================================================= }
{ === BLOCK 440: ClipGradNorm ===                                          }
{ Clip gradient vector by global L2 norm                                  }
{ ======================================================================= }

function ClipGradNorm(Grads: PFloat32; N: TUInt32;
                       MaxNorm: TFloat32): TResult;

{ ======================================================================= }
{ === BLOCK 441: SGDStep ===                                               }
{ params -= lr * grads                                                    }
{ ======================================================================= }

function SGDStep(Params, Grads: PFloat32; N: TUInt32;
                 LR: TFloat32): TResult;

{ ======================================================================= }
{ === BLOCK 442: TAdamState ===                                            }
{ Adam optimizer first/second moment vectors and step counter             }
{ ======================================================================= }

type
  TAdamState = record
    M: PFloat32;  { first moment (mean)   }
    V: PFloat32;  { second moment (variance) }
    T: TUInt32;   { step counter           }
    N: TUInt32;   { parameter count        }
  end;
  PAdamState = ^TAdamState;

function  AdamStateCreate(var S: TAdamState; N: TUInt32): TResult;
procedure AdamStateDestroy(var S: TAdamState);

{ ======================================================================= }
{ === BLOCK 443: AdamStep ===                                              }
{ Adam update: bias-corrected moment estimates + param update             }
{ ======================================================================= }

function AdamStep(Params, Grads: PFloat32; var S: TAdamState;
                  N: TUInt32; LR, Beta1, Beta2, Eps: TFloat32): TResult;

{ ======================================================================= }
{ === BLOCK 444: TAdamW ===                                                }
{ Adam with decoupled weight decay                                        }
{ ======================================================================= }

type
  TAdamW = record
    State:       TAdamState;
    WeightDecay: TFloat32;
  end;
  PAdamW = ^TAdamW;

function  AdamWCreate(var AW: TAdamW; N: TUInt32;
                      WeightDecay: TFloat32): TResult;
procedure AdamWDestroy(var AW: TAdamW);

{ ======================================================================= }
{ === BLOCK 445: AdamWStep ===                                             }
{ Weight decay applied before moment update (decoupled)                   }
{ ======================================================================= }

function AdamWStep(Params, Grads: PFloat32; var AW: TAdamW;
                   N: TUInt32; LR, Beta1, Beta2, Eps: TFloat32): TResult;

{ ======================================================================= }
{ === BLOCK 446: CosineAnnealingLR ===                                     }
{ Cosine schedule between MaxLR and MinLR over TotalSteps                 }
{ ======================================================================= }

function CosineAnnealingLR(Step, TotalSteps: TUInt32;
                            MaxLR, MinLR: TFloat32): TFloat32;

{ ======================================================================= }
{ === BLOCK 447: WarmupCosine ===                                          }
{ Linear warmup then cosine decay to zero                                 }
{ ======================================================================= }

function WarmupCosine(Step, WarmupSteps, TotalSteps: TUInt32;
                       MaxLR: TFloat32): TFloat32;

{ ======================================================================= }
{ === BLOCK 448: TGradAccumulator ===                                      }
{ Accumulate gradients over N micro-steps before applying                 }
{ ======================================================================= }

type
  TGradAccumulator = record
    Grads:      PFloat32;
    N:          TUInt32;
    StepCount:  TUInt32;
    AccumSteps: TUInt32;
  end;
  PGradAccumulator = ^TGradAccumulator;

function  GradAccumulatorCreate(var Acc: TGradAccumulator;
                                 N, AccumSteps: TUInt32): TResult;
procedure GradAccumulatorDestroy(var Acc: TGradAccumulator);
function  GradAccumulatorAdd(var Acc: TGradAccumulator;
                              Grads: PFloat32): Boolean;
procedure GradAccumulatorReset(var Acc: TGradAccumulator);

{ ======================================================================= }
{ === BLOCK 449: TBenchResult ===                                          }
{ Benchmark result: op name, element count, timing, throughput            }
{ ======================================================================= }

type
  TBenchResult = record
    OpName: AnsiString;
    N:      TUInt64;
    TimeMs: TFloat64;
    GFlops: TFloat64;
    GBps:   TFloat64;
  end;
  PBenchResult = ^TBenchResult;

function MakeBenchResult(const OpName: AnsiString; N: TUInt64;
                          TimeMs, GFlops, GBps: TFloat64): TBenchResult;
function BenchResultToString(const B: TBenchResult): AnsiString;

{ ======================================================================= }
{ === BLOCK 450: AdvancedSubsystemTest ===                                 }
{ Smoke-tests all advanced subsystems; returns PGPU_SUCCESS on pass       }
{ ======================================================================= }

function AdvancedSubsystemTest: TResult;

{ ======================================================================= }

implementation

{ ======================================================================= }
{ === BLOCK 402: RegisterFileRead/Write operations ===                     }
{ ======================================================================= }

function RegisterFileRead(const RF: TRegisterFile; Idx: TUInt32): TUInt32;
begin
  if Idx >= REG_FILE_SIZE then
    Exit(0);
  Result := RF.Slots[Idx];
end;

procedure RegisterFileWrite(var RF: TRegisterFile; Idx: TUInt32;
                             Value: TUInt32);
begin
  if Idx < REG_FILE_SIZE then
    RF.Slots[Idx] := Value;
end;

{ ======================================================================= }
{ === BLOCK 404: LoadTile ===                                              }
{ ======================================================================= }

function LoadTile(var Tile: TSharedMemTile; const Src: TMatrix;
                  TileRow, TileCol, TileW, TileH: TUInt32): TResult;
var
  r, c, sr, sc: TUInt32;
begin
  if (TileW = 0) or (TileH = 0) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if (TileW > ADVANCED_TILE_MAX) or (TileH > ADVANCED_TILE_MAX) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if Src.Data = nil then
    Exit(PGPU_ERR_INVALID_PARAM);
  Tile.W := TileW;
  Tile.H := TileH;
  for r := 0 to TileH - 1 do
    for c := 0 to TileW - 1 do
    begin
      sr := TileRow + r;
      sc := TileCol + c;
      if (sr < Src.Rows) and (sc < Src.Cols) then
        Tile.Data[r * TileW + c] := (Src.Data + sr * Src.Cols + sc)^
      else
        Tile.Data[r * TileW + c] := 0.0;
    end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 405: StoreTile ===                                             }
{ ======================================================================= }

function StoreTile(const Tile: TSharedMemTile; var Dst: TMatrix;
                   TileRow, TileCol: TUInt32): TResult;
var
  r, c, dr, dc: TUInt32;
begin
  if Dst.Data = nil then
    Exit(PGPU_ERR_INVALID_PARAM);
  if (Tile.W = 0) or (Tile.H = 0) then
    Exit(PGPU_SUCCESS);
  for r := 0 to Tile.H - 1 do
    for c := 0 to Tile.W - 1 do
    begin
      dr := TileRow + r;
      dc := TileCol + c;
      if (dr < Dst.Rows) and (dc < Dst.Cols) then
        (Dst.Data + dr * Dst.Cols + dc)^ := Tile.Data[r * Tile.W + c];
    end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 406: TiledMatMulKernel ===                                     }
{ Full tiled SGEMM: C = A * B, using 16x16 shared-memory tiles            }
{ ======================================================================= }

function TiledMatMulKernel(const A, B: TMatrix; var C: TMatrix): TResult;
const
  TILE = 16;
var
  TileA, TileB:           TSharedMemTile;
  i, j, k:                TUInt32;
  iTile, jTile, kTile:    TUInt32;
  NumTilesI, NumTilesJ, NumTilesK: TUInt32;
  Accum:                  TFloat32;
  ai, bj, ak:             TUInt32;
begin
  if (A.Data = nil) or (B.Data = nil) or (C.Data = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if A.Cols <> B.Rows then
    Exit(PGPU_ERR_INVALID_PARAM);
  if (C.Rows <> A.Rows) or (C.Cols <> B.Cols) then
    Exit(PGPU_ERR_INVALID_PARAM);

  FillChar(C.Data^, C.Rows * C.Cols * SizeOf(TFloat32), 0);

  NumTilesI := (A.Rows + TILE - 1) div TILE;
  NumTilesJ := (B.Cols + TILE - 1) div TILE;
  NumTilesK := (A.Cols + TILE - 1) div TILE;

  for iTile := 0 to NumTilesI - 1 do
    for jTile := 0 to NumTilesJ - 1 do
      for kTile := 0 to NumTilesK - 1 do
      begin
        LoadTile(TileA, A, iTile * TILE, kTile * TILE, TILE, TILE);
        LoadTile(TileB, B, kTile * TILE, jTile * TILE, TILE, TILE);

        for i := 0 to TILE - 1 do
        begin
          ai := iTile * TILE + i;
          if ai >= C.Rows then Continue;
          for j := 0 to TILE - 1 do
          begin
            bj := jTile * TILE + j;
            if bj >= C.Cols then Continue;
            Accum := 0.0;
            for k := 0 to TILE - 1 do
            begin
              ak := kTile * TILE + k;
              if ak < A.Cols then
                Accum := Accum + TileA.Data[i * TILE + k]
                               * TileB.Data[k * TILE + j];
            end;
            (C.Data + ai * C.Cols + bj)^ :=
              (C.Data + ai * C.Cols + bj)^ + Accum;
          end;
        end;
      end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 407: WarpReduceSum ===                                         }
{ Simulate 32-lane parallel reduction by serial summation                 }
{ ======================================================================= }

function WarpReduceSum(const W: TWarpReduceSum): TFloat32;
var
  i:     Integer;
  Count: TUInt32;
begin
  Result := 0.0;
  Count  := W.Count;
  if Count > WARP_SIZE then Count := WARP_SIZE;
  for i := 0 to Integer(Count) - 1 do
    Result := Result + W.Data[i];
end;

{ ======================================================================= }
{ === BLOCK 408: WarpReduceMax, WarpReduceMin, WarpReduceAnd, WarpReduceOr }
{ ======================================================================= }

function WarpReduceMax(const W: TWarpReduceSum): TFloat32;
var
  i:     Integer;
  Count: TUInt32;
begin
  Count := W.Count;
  if Count > WARP_SIZE then Count := WARP_SIZE;
  if Count = 0 then Exit(PGPU_MIN_F32);
  Result := W.Data[0];
  for i := 1 to Integer(Count) - 1 do
    if W.Data[i] > Result then Result := W.Data[i];
end;

function WarpReduceMin(const W: TWarpReduceSum): TFloat32;
var
  i:     Integer;
  Count: TUInt32;
begin
  Count := W.Count;
  if Count > WARP_SIZE then Count := WARP_SIZE;
  if Count = 0 then Exit(PGPU_MAX_F32);
  Result := W.Data[0];
  for i := 1 to Integer(Count) - 1 do
    if W.Data[i] < Result then Result := W.Data[i];
end;

function WarpReduceAnd(const W: TWarpReduceSum): TUInt32;
var
  i:     Integer;
  Count: TUInt32;
begin
  Count := W.Count;
  if Count > WARP_SIZE then Count := WARP_SIZE;
  if Count = 0 then Exit(TUInt32($FFFFFFFF));
  Result := TUInt32(Round(W.Data[0]));
  for i := 1 to Integer(Count) - 1 do
    Result := Result and TUInt32(Round(W.Data[i]));
end;

function WarpReduceOr(const W: TWarpReduceSum): TUInt32;
var
  i:     Integer;
  Count: TUInt32;
begin
  Count := W.Count;
  if Count > WARP_SIZE then Count := WARP_SIZE;
  if Count = 0 then Exit(0);
  Result := TUInt32(Round(W.Data[0]));
  for i := 1 to Integer(Count) - 1 do
    Result := Result or TUInt32(Round(W.Data[i]));
end;

{ ======================================================================= }
{ === BLOCK 409: BlockReduceSum ===                                        }
{ Block-level reduction: sum across all warps                             }
{ ======================================================================= }

function BlockReduceSum(const B: TBlockReduceSum): TFloat32;
var
  i:         Integer;
  WarpCount: TUInt32;
begin
  Result    := 0.0;
  WarpCount := B.WarpCount;
  if WarpCount > WARP_SIZE then WarpCount := WARP_SIZE;
  for i := 0 to Integer(WarpCount) - 1 do
    Result := Result + WarpReduceSum(B.WarpData[i]);
end;

{ ======================================================================= }
{ === BLOCK 411: ExclusiveScanF32 ===                                      }
{ ======================================================================= }

function ExclusiveScanF32(InArr, OutArr: PFloat32; N: TUInt32;
                           Op: TScanOp): TResult;
var
  i:       TUInt32;
  Running: TFloat32;
  Val:     TFloat32;
begin
  if (InArr = nil) or (OutArr = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if N = 0 then
    Exit(PGPU_SUCCESS);
  case Op of
    soAdd: Running :=  0.0;
    soMax: Running := PGPU_MIN_F32;
    soMin: Running := PGPU_MAX_F32;
  end;
  for i := 0 to N - 1 do
  begin
    (OutArr + i)^ := Running;
    Val := (InArr + i)^;
    case Op of
      soAdd: Running := Running + Val;
      soMax: if Val > Running then Running := Val;
      soMin: if Val < Running then Running := Val;
    end;
  end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 412: InclusiveScanF32 ===                                      }
{ ======================================================================= }

function InclusiveScanF32(InArr, OutArr: PFloat32; N: TUInt32;
                           Op: TScanOp): TResult;
var
  i:       TUInt32;
  Running: TFloat32;
  Val:     TFloat32;
begin
  if (InArr = nil) or (OutArr = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if N = 0 then
    Exit(PGPU_SUCCESS);
  Running := (InArr + 0)^;
  (OutArr + 0)^ := Running;
  for i := 1 to N - 1 do
  begin
    Val := (InArr + i)^;
    case Op of
      soAdd: Running := Running + Val;
      soMax: if Val > Running then Running := Val;
      soMin: if Val < Running then Running := Val;
    end;
    (OutArr + i)^ := Running;
  end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 413: THistogram helpers ===                                    }
{ ======================================================================= }

function HistogramCreate(var H: THistogram; BinCount: TUInt32;
                         MinVal, MaxVal: TFloat32): TResult;
begin
  if BinCount = 0 then
    Exit(PGPU_ERR_INVALID_PARAM);
  if MaxVal <= MinVal then
    Exit(PGPU_ERR_INVALID_PARAM);
  H.BinCount := BinCount;
  H.MinVal   := MinVal;
  H.MaxVal   := MaxVal;
  GetMem(H.Bins,     BinCount * SizeOf(TUInt32));
  GetMem(H.NormBins, BinCount * SizeOf(TFloat32));
  FillChar(H.Bins^,     BinCount * SizeOf(TUInt32),  0);
  FillChar(H.NormBins^, BinCount * SizeOf(TFloat32), 0);
  Result := PGPU_SUCCESS;
end;

procedure HistogramDestroy(var H: THistogram);
begin
  if H.Bins <> nil then
  begin
    FreeMem(H.Bins);
    H.Bins := nil;
  end;
  if H.NormBins <> nil then
  begin
    FreeMem(H.NormBins);
    H.NormBins := nil;
  end;
  H.BinCount := 0;
end;

{ ======================================================================= }
{ === BLOCK 414: ComputeHistogram ===                                      }
{ ======================================================================= }

function ComputeHistogram(InArr: PFloat32; N: TUInt32;
                          var H: THistogram): TResult;
var
  i:    TUInt32;
  Bin:  TUInt32;
  Val:  TFloat32;
  Rng:  TFloat32;
begin
  if (InArr = nil) or (H.Bins = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if H.BinCount = 0 then
    Exit(PGPU_ERR_INVALID_PARAM);
  Rng := H.MaxVal - H.MinVal;
  if Rng <= 0.0 then
    Exit(PGPU_ERR_INVALID_PARAM);
  FillChar(H.Bins^, H.BinCount * SizeOf(TUInt32), 0);
  for i := 0 to N - 1 do
  begin
    Val := (InArr + i)^;
    if (Val >= H.MinVal) and (Val < H.MaxVal) then
    begin
      Bin := TUInt32(Trunc((Val - H.MinVal) / Rng * H.BinCount));
      if Bin >= H.BinCount then Bin := H.BinCount - 1;
      (H.Bins + Bin)^ := (H.Bins + Bin)^ + 1;
    end;
  end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 415: HistogramNormalize ===                                    }
{ ======================================================================= }

procedure HistogramNormalize(var H: THistogram);
var
  i:     TUInt32;
  Total: TUInt32;
begin
  if (H.Bins = nil) or (H.NormBins = nil) or (H.BinCount = 0) then
    Exit;
  Total := 0;
  for i := 0 to H.BinCount - 1 do
    Total := Total + (H.Bins + i)^;
  if Total = 0 then
  begin
    FillChar(H.NormBins^, H.BinCount * SizeOf(TFloat32), 0);
    Exit;
  end;
  for i := 0 to H.BinCount - 1 do
    (H.NormBins + i)^ := (H.Bins + i)^ / TFloat32(Total);
end;

{ ======================================================================= }
{ === BLOCK 416: GatherF32 ===                                             }
{ ======================================================================= }

function GatherF32(Values: PFloat32; Indices: PUInt32;
                   OutArr: PFloat32; N: TUInt32): TResult;
var
  i: TUInt32;
begin
  if (Values = nil) or (Indices = nil) or (OutArr = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  for i := 0 to N - 1 do
    (OutArr + i)^ := (Values + (Indices + i)^)^;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 417: ScatterF32 ===                                            }
{ Simulated atomic add: Out[Indices[i]] += Values[i]                      }
{ (On real hardware this would use InterlockedExchangeAdd)                }
{ ======================================================================= }

function ScatterF32(Values: PFloat32; Indices: PUInt32;
                    OutArr: PFloat32; N: TUInt32): TResult;
var
  i:   TUInt32;
  Idx: TUInt32;
begin
  if (Values = nil) or (Indices = nil) or (OutArr = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  for i := 0 to N - 1 do
  begin
    Idx := (Indices + i)^;
    { Simulated atomic add — sequential on CPU simulation }
    (OutArr + Idx)^ := (OutArr + Idx)^ + (Values + i)^;
  end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 418: RadixSortUInt32 ===                                       }
{ LSD radix sort — 8-bit digits, 4 passes, stable                         }
{ ======================================================================= }

function RadixSortUInt32(Keys: PUInt32; N: TUInt32;
                          Ascending: Boolean): TResult;
var
  TempBuf:        PUInt32;
  Counts:         array[0..255] of TUInt32;
  Prefix:         array[0..255] of TUInt32;
  i, j, Pass:     TUInt32;
  Digit:          TUInt8;
  Shift:          TUInt32;
  SrcPtr, DstPtr, SwapPtr: PUInt32;
  Tmp:            TUInt32;
begin
  if (Keys = nil) or (N = 0) then
    Exit(PGPU_SUCCESS);
  GetMem(TempBuf, N * SizeOf(TUInt32));
  try
    SrcPtr := Keys;
    DstPtr := TempBuf;

    for Pass := 0 to 3 do
    begin
      Shift := Pass * 8;
      FillChar(Counts, SizeOf(Counts), 0);

      { Count frequencies }
      for i := 0 to N - 1 do
      begin
        Digit := TUInt8(((SrcPtr + i)^ shr Shift) and $FF);
        Counts[Digit] := Counts[Digit] + 1;
      end;

      { Exclusive prefix sum over counts }
      Prefix[0] := 0;
      for i := 1 to 255 do
        Prefix[i] := Prefix[i - 1] + Counts[i - 1];

      { Scatter stable }
      for i := 0 to N - 1 do
      begin
        Digit := TUInt8(((SrcPtr + i)^ shr Shift) and $FF);
        (DstPtr + Prefix[Digit])^ := (SrcPtr + i)^;
        Prefix[Digit] := Prefix[Digit] + 1;
      end;

      { Swap src/dst for next pass }
      SwapPtr := SrcPtr;
      SrcPtr  := DstPtr;
      DstPtr  := SwapPtr;
    end;

    { After 4 passes (even), result is in original Keys buffer }
    if SrcPtr <> Keys then
      Move(SrcPtr^, Keys^, N * SizeOf(TUInt32));

    if not Ascending then
    begin
      { Reverse in-place }
      for i := 0 to N div 2 - 1 do
      begin
        j   := N - 1 - i;
        Tmp := (Keys + i)^;
        (Keys + i)^ := (Keys + j)^;
        (Keys + j)^ := Tmp;
      end;
    end;

    Result := PGPU_SUCCESS;
  finally
    FreeMem(TempBuf);
  end;
end;

{ ======================================================================= }
{ === BLOCK 419: BitonicSortF32 ===                                        }
{ Bitonic network sort; pads to next power-of-two with sentinel values    }
{ ======================================================================= }

function BitonicSortF32(Arr: PFloat32; N: TUInt32;
                         Ascending: Boolean): TResult;
var
  PaddedN:   TUInt32;
  PaddedArr: PFloat32;
  k, j, i, l: TUInt32;
  WantAsc:   Boolean;
  Tmp:       TFloat32;
begin
  if (Arr = nil) or (N = 0) then
    Exit(PGPU_SUCCESS);

  { Find next power of two >= N }
  PaddedN := 1;
  while PaddedN < N do
    PaddedN := PaddedN shl 1;

  if PaddedN = N then
    PaddedArr := Arr
  else
  begin
    GetMem(PaddedArr, PaddedN * SizeOf(TFloat32));
    Move(Arr^, PaddedArr^, N * SizeOf(TFloat32));
    { Fill sentinel values so padding sorts to the correct end }
    if Ascending then
      for i := N to PaddedN - 1 do
        (PaddedArr + i)^ := PGPU_MAX_F32
    else
      for i := N to PaddedN - 1 do
        (PaddedArr + i)^ := PGPU_MIN_F32;
  end;

  try
    { Bitonic sort network: outer pass k = block size }
    k := 2;
    while k <= PaddedN do
    begin
      { Step pass j = stride within block }
      j := k shr 1;
      while j >= 1 do
      begin
        for i := 0 to PaddedN - 1 do
        begin
          l := i xor j;
          if l > i then
          begin
            { Direction for this compare-swap: XOR global direction with
              whether the high bit of k is set in i                       }
            WantAsc := Ascending xor ((i and k) <> 0);
            if WantAsc then
            begin
              if (PaddedArr + i)^ > (PaddedArr + l)^ then
              begin
                Tmp              := (PaddedArr + i)^;
                (PaddedArr + i)^ := (PaddedArr + l)^;
                (PaddedArr + l)^ := Tmp;
              end;
            end
            else
            begin
              if (PaddedArr + i)^ < (PaddedArr + l)^ then
              begin
                Tmp              := (PaddedArr + i)^;
                (PaddedArr + i)^ := (PaddedArr + l)^;
                (PaddedArr + l)^ := Tmp;
              end;
            end;
          end;
        end;
        j := j shr 1;
      end;
      k := k shl 1;
    end;

    if PaddedArr <> Arr then
      Move(PaddedArr^, Arr^, N * SizeOf(TFloat32));
  finally
    if PaddedArr <> Arr then
      FreeMem(PaddedArr);
  end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 420: Stencil1D ===                                             }
{ ======================================================================= }

function Stencil1D(InArr, OutArr: PFloat32; N: TUInt32;
                   const Weights: array of TFloat32): TResult;
var
  i, k:    TUInt32;
  KernLen: TUInt32;
  Radius:  TUInt32;
  Sum:     TFloat32;
  Pos:     Integer;
begin
  if (InArr = nil) or (OutArr = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  KernLen := TUInt32(Length(Weights));
  if KernLen = 0 then
    Exit(PGPU_ERR_INVALID_PARAM);
  Radius := KernLen div 2;
  for i := 0 to N - 1 do
  begin
    Sum := 0.0;
    for k := 0 to KernLen - 1 do
    begin
      Pos := Integer(i) - Integer(Radius) + Integer(k);
      if (Pos >= 0) and (Pos < Integer(N)) then
        Sum := Sum + (InArr + TUInt32(Pos))^ * Weights[k];
    end;
    (OutArr + i)^ := Sum;
  end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 421: Stencil2D 3x3 ===                                        }
{ ======================================================================= }

function Stencil2D(InArr, OutArr: PFloat32; W, H: TUInt32;
                   const Kernel3x3: array of TFloat32): TResult;
var
  x, y:   Integer;
  kx, ky: Integer;
  Sum:    TFloat32;
  Px, Py: Integer;
begin
  if (InArr = nil) or (OutArr = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if Length(Kernel3x3) < 9 then
    Exit(PGPU_ERR_INVALID_PARAM);
  for y := 0 to Integer(H) - 1 do
    for x := 0 to Integer(W) - 1 do
    begin
      Sum := 0.0;
      for ky := -1 to 1 do
        for kx := -1 to 1 do
        begin
          Px := x + kx;
          Py := y + ky;
          if (Px >= 0) and (Px < Integer(W)) and
             (Py >= 0) and (Py < Integer(H)) then
            Sum := Sum
                 + (InArr + TUInt32(Py) * W + TUInt32(Px))^
                 * Kernel3x3[(ky + 1) * 3 + (kx + 1)];
        end;
      (OutArr + TUInt32(y) * W + TUInt32(x))^ := Sum;
    end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 422: DepthwiseConv2D ===                                       }
{ Layout: [Channels, InH, InW]; one filter per channel                    }
{ ======================================================================= }

function DepthwiseConv2D(Input, Filters, Output: PFloat32;
                          InH, InW, Channels, KH, KW,
                          StrideH, StrideW, PadH, PadW: TUInt32): TResult;
var
  c, oh, ow:  TUInt32;
  kh_, kw_:   TUInt32;
  OutH, OutW: TUInt32;
  IH, IW:     Integer;
  Sum:        TFloat32;
begin
  if (Input = nil) or (Filters = nil) or (Output = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if (StrideH = 0) or (StrideW = 0) then
    Exit(PGPU_ERR_INVALID_PARAM);
  OutH := (InH + 2 * PadH - KH) div StrideH + 1;
  OutW := (InW + 2 * PadW - KW) div StrideW + 1;
  for c := 0 to Channels - 1 do
    for oh := 0 to OutH - 1 do
      for ow := 0 to OutW - 1 do
      begin
        Sum := 0.0;
        for kh_ := 0 to KH - 1 do
          for kw_ := 0 to KW - 1 do
          begin
            IH := Integer(oh * StrideH + kh_) - Integer(PadH);
            IW := Integer(ow * StrideW + kw_) - Integer(PadW);
            if (IH >= 0) and (IH < Integer(InH)) and
               (IW >= 0) and (IW < Integer(InW)) then
              Sum := Sum
                   + (Input  + c * InH * InW
                              + TUInt32(IH) * InW
                              + TUInt32(IW))^
                   * (Filters + c * KH * KW + kh_ * KW + kw_)^;
          end;
        (Output + c * OutH * OutW + oh * OutW + ow)^ := Sum;
      end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 423: Im2Col ===                                                }
{ Output column buffer shape: [C*KH*KW,  OutH*OutW]                       }
{ ======================================================================= }

function Im2Col(Input, ColBuf: PFloat32;
                InH, InW, Channels, KH, KW,
                StrideH, StrideW, PadH, PadW: TUInt32): TResult;
var
  OutH, OutW:    TUInt32;
  c, kh_, kw_:  TUInt32;
  oh, ow:        TUInt32;
  IH, IW:        Integer;
  ColRow, ColCol: TUInt32;
begin
  if (Input = nil) or (ColBuf = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if (StrideH = 0) or (StrideW = 0) then
    Exit(PGPU_ERR_INVALID_PARAM);
  OutH   := (InH + 2 * PadH - KH) div StrideH + 1;
  OutW   := (InW + 2 * PadW - KW) div StrideW + 1;
  ColRow := 0;
  for c := 0 to Channels - 1 do
    for kh_ := 0 to KH - 1 do
      for kw_ := 0 to KW - 1 do
      begin
        ColCol := 0;
        for oh := 0 to OutH - 1 do
          for ow := 0 to OutW - 1 do
          begin
            IH := Integer(oh * StrideH + kh_) - Integer(PadH);
            IW := Integer(ow * StrideW + kw_) - Integer(PadW);
            if (IH >= 0) and (IH < Integer(InH)) and
               (IW >= 0) and (IW < Integer(InW)) then
              (ColBuf + ColRow * OutH * OutW + ColCol)^ :=
                (Input + c * InH * InW + TUInt32(IH) * InW + TUInt32(IW))^
            else
              (ColBuf + ColRow * OutH * OutW + ColCol)^ := 0.0;
            ColCol := ColCol + 1;
          end;
        ColRow := ColRow + 1;
      end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 424: Col2Im ===                                                }
{ Inverse of Im2Col; accumulates gradient back into spatial tensor        }
{ ======================================================================= }

function Col2Im(ColBuf, Output: PFloat32;
                InH, InW, Channels, KH, KW,
                StrideH, StrideW, PadH, PadW: TUInt32): TResult;
var
  OutH, OutW:    TUInt32;
  c, kh_, kw_:  TUInt32;
  oh, ow:        TUInt32;
  IH, IW:        Integer;
  ColRow, ColCol: TUInt32;
begin
  if (ColBuf = nil) or (Output = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if (StrideH = 0) or (StrideW = 0) then
    Exit(PGPU_ERR_INVALID_PARAM);
  FillChar(Output^, Channels * InH * InW * SizeOf(TFloat32), 0);
  OutH   := (InH + 2 * PadH - KH) div StrideH + 1;
  OutW   := (InW + 2 * PadW - KW) div StrideW + 1;
  ColRow := 0;
  for c := 0 to Channels - 1 do
    for kh_ := 0 to KH - 1 do
      for kw_ := 0 to KW - 1 do
      begin
        ColCol := 0;
        for oh := 0 to OutH - 1 do
          for ow := 0 to OutW - 1 do
          begin
            IH := Integer(oh * StrideH + kh_) - Integer(PadH);
            IW := Integer(ow * StrideW + kw_) - Integer(PadW);
            if (IH >= 0) and (IH < Integer(InH)) and
               (IW >= 0) and (IW < Integer(InW)) then
              (Output + c * InH * InW + TUInt32(IH) * InW + TUInt32(IW))^ :=
                (Output + c * InH * InW + TUInt32(IH) * InW + TUInt32(IW))^
              + (ColBuf + ColRow * OutH * OutW + ColCol)^;
            ColCol := ColCol + 1;
          end;
        ColRow := ColRow + 1;
      end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 427: RandomInit ===                                            }
{ LCG multiplier and increment from Knuth TAOCP Vol.2                     }
{ ======================================================================= }

procedure RandomInit(var R: TRandomState; Seed: TUInt64);
begin
  R.Seed       := Seed;
  R.Multiplier := TUInt64(6364136223846793005);
  R.Increment  := TUInt64(1442695040888963407);
end;

{ ======================================================================= }
{ === BLOCK 428: RandomNext ===                                            }
{ ======================================================================= }

function RandomNext(var R: TRandomState): TUInt32;
begin
  R.Seed := R.Seed * R.Multiplier + R.Increment;
  Result := TUInt32(R.Seed shr 32);
end;

{ ======================================================================= }
{ === BLOCK 429: RandomFloat ===                                           }
{ ======================================================================= }

function RandomFloat(var R: TRandomState): TFloat32;
begin
  Result := TFloat32(RandomNext(R)) * TFloat32(1.0 / 4294967296.0);
end;

{ ======================================================================= }
{ === BLOCK 430: RandomNormal ===                                          }
{ Box-Muller: returns N(0,1) deviate                                      }
{ ======================================================================= }

function RandomNormal(var R: TRandomState): TFloat32;
var
  U1, U2: TFloat32;
begin
  { Ensure U1 > 0 to avoid Ln(0) }
  repeat
    U1 := RandomFloat(R);
  until U1 > 0.0;
  U2     := RandomFloat(R);
  Result := TFloat32(Sqrt(-2.0 * Ln(U1)) * Cos(2.0 * Pi * U2));
end;

{ ======================================================================= }
{ === BLOCK 431: FillRandom ===                                            }
{ ======================================================================= }

function FillRandom(OutArr: PFloat32; N: TUInt32;
                    var R: TRandomState): TResult;
var
  i: TUInt32;
begin
  if OutArr = nil then
    Exit(PGPU_ERR_INVALID_PARAM);
  for i := 0 to N - 1 do
    (OutArr + i)^ := RandomFloat(R);
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 425: DropoutF32 ===                                            }
{ (placed after RandomInit/RandomFloat on which it depends)               }
{ ======================================================================= }

function DropoutF32(InArr, OutArr, Mask: PFloat32; N: TUInt32;
                    Rate: TFloat32; Seed: TUInt32): TResult;
var
  R:     TRandomState;
  i:     TUInt32;
  Scale: TFloat32;
  RVal:  TFloat32;
begin
  if (InArr = nil) or (OutArr = nil) or (Mask = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if (Rate < 0.0) or (Rate >= 1.0) then
    Exit(PGPU_ERR_INVALID_PARAM);
  RandomInit(R, TUInt64(Seed));
  Scale := 1.0 / (1.0 - Rate);
  for i := 0 to N - 1 do
  begin
    RVal := RandomFloat(R);
    if RVal >= Rate then
    begin
      (Mask   + i)^ := 1.0;
      (OutArr + i)^ := (InArr + i)^ * Scale;
    end
    else
    begin
      (Mask   + i)^ := 0.0;
      (OutArr + i)^ := 0.0;
    end;
  end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 433: BuildPositionalEncoding ===                               }
{ Sinusoidal table: PE[pos,2i] = sin(pos/10000^(2i/d)),                   }
{                   PE[pos,2i+1] = cos(pos/10000^(2i/d))                  }
{ ======================================================================= }

function BuildPositionalEncoding(var PE: TPositionalEncoding;
                                  MaxLen, Dim: TUInt32): TResult;
var
  pos, d: TUInt32;
  Angle:  TFloat64;
begin
  if (MaxLen = 0) or (Dim = 0) or (Dim mod 2 <> 0) then
    Exit(PGPU_ERR_INVALID_PARAM);
  PE.MaxLen := MaxLen;
  PE.Dim    := Dim;
  GetMem(PE.Table, MaxLen * Dim * SizeOf(TFloat32));
  for pos := 0 to MaxLen - 1 do
    for d := 0 to Dim - 1 do
    begin
      Angle := pos / Power(10000.0, (2.0 * (d div 2)) / Dim);
      if d mod 2 = 0 then
        (PE.Table + pos * Dim + d)^ := TFloat32(Sin(Angle))
      else
        (PE.Table + pos * Dim + d)^ := TFloat32(Cos(Angle));
    end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 434: ApplyPositionalEncoding ===                               }
{ Add PE rows to tensor in-place; tensor Dims[0]=SeqLen, Dims[1]=Dim      }
{ ======================================================================= }

function ApplyPositionalEncoding(const PE: TPositionalEncoding;
                                  var T: TTensor): TResult;
var
  SeqLen, Dim: TUInt32;
  pos, d:      TUInt32;
begin
  if T.Data = nil then
    Exit(PGPU_ERR_INVALID_PARAM);
  if T.NDim < 2 then
    Exit(PGPU_ERR_INVALID_PARAM);
  SeqLen := T.Dims[0];
  Dim    := T.Dims[1];
  if (SeqLen > PE.MaxLen) or (Dim <> PE.Dim) then
    Exit(PGPU_ERR_INVALID_PARAM);
  for pos := 0 to SeqLen - 1 do
    for d := 0 to Dim - 1 do
      (T.Data + pos * Dim + d)^ :=
        (T.Data + pos * Dim + d)^ + (PE.Table + pos * PE.Dim + d)^;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 436: EmbeddingLookup ===                                       }
{ ======================================================================= }

function EmbeddingLookup(const ET: TEmbeddingTable;
                          Indices: PUInt32; N: TUInt32;
                          OutArr: PFloat32): TResult;
var
  i, Idx: TUInt32;
begin
  if (ET.Weights = nil) or (Indices = nil) or (OutArr = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if ET.EmbedDim = 0 then
    Exit(PGPU_ERR_INVALID_PARAM);
  for i := 0 to N - 1 do
  begin
    Idx := (Indices + i)^;
    if Idx >= ET.VocabSize then
      Exit(PGPU_ERR_BOUNDS);
    Move((ET.Weights + Idx * ET.EmbedDim)^,
         (OutArr    + i   * ET.EmbedDim)^,
         ET.EmbedDim * SizeOf(TFloat32));
  end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 437: CrossEntropyLoss ===                                      }
{ Numerically stable: logsumexp trick; Labels hold class indices as f32   }
{ ======================================================================= }

function CrossEntropyLoss(Logits, Labels: PFloat32;
                           N, Classes: TUInt32;
                           out Loss: TFloat32): TResult;
var
  i, j:       TUInt32;
  MaxLogit:   TFloat32;
  SumExp:     TFloat32;
  LogSumExp:  TFloat32;
  TrueClass:  TUInt32;
  Total:      TFloat32;
begin
  if (Logits = nil) or (Labels = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if (N = 0) or (Classes = 0) then
    Exit(PGPU_ERR_INVALID_PARAM);
  Total := 0.0;
  for i := 0 to N - 1 do
  begin
    { Numerically stable logsumexp }
    MaxLogit := (Logits + i * Classes + 0)^;
    for j := 1 to Classes - 1 do
      if (Logits + i * Classes + j)^ > MaxLogit then
        MaxLogit := (Logits + i * Classes + j)^;
    SumExp := 0.0;
    for j := 0 to Classes - 1 do
      SumExp := SumExp + Exp((Logits + i * Classes + j)^ - MaxLogit);
    LogSumExp := MaxLogit + Ln(SumExp);
    TrueClass := TUInt32(Round((Labels + i)^));
    if TrueClass >= Classes then
      Exit(PGPU_ERR_BOUNDS);
    Total := Total - ((Logits + i * Classes + TrueClass)^ - LogSumExp);
  end;
  Loss   := Total / TFloat32(N);
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 438: MSELoss ===                                               }
{ ======================================================================= }

function MSELoss(Predictions, Targets: PFloat32; N: TUInt32;
                 out Loss: TFloat32): TResult;
var
  i:    TUInt32;
  Diff: TFloat32;
  Sum:  TFloat32;
begin
  if (Predictions = nil) or (Targets = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if N = 0 then
  begin
    Loss := 0.0;
    Exit(PGPU_SUCCESS);
  end;
  Sum := 0.0;
  for i := 0 to N - 1 do
  begin
    Diff := (Predictions + i)^ - (Targets + i)^;
    Sum  := Sum + Diff * Diff;
  end;
  Loss   := Sum / TFloat32(N);
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 439: L2Regularization ===                                      }
{ ======================================================================= }

function L2Regularization(Params: PFloat32; N: TUInt32;
                           Lambda: TFloat32;
                           out Penalty: TFloat32): TResult;
var
  i:   TUInt32;
  Sum: TFloat32;
  P:   TFloat32;
begin
  if Params = nil then
    Exit(PGPU_ERR_INVALID_PARAM);
  Sum := 0.0;
  for i := 0 to N - 1 do
  begin
    P   := (Params + i)^;
    Sum := Sum + P * P;
  end;
  Penalty := 0.5 * Lambda * Sum;
  Result  := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 440: ClipGradNorm ===                                          }
{ ======================================================================= }

function ClipGradNorm(Grads: PFloat32; N: TUInt32;
                       MaxNorm: TFloat32): TResult;
var
  i:     TUInt32;
  Norm:  TFloat32;
  Scale: TFloat32;
  G:     TFloat32;
begin
  if Grads = nil then
    Exit(PGPU_ERR_INVALID_PARAM);
  Norm := 0.0;
  for i := 0 to N - 1 do
  begin
    G    := (Grads + i)^;
    Norm := Norm + G * G;
  end;
  Norm := Sqrt(Norm);
  if Norm > MaxNorm then
  begin
    Scale := MaxNorm / (Norm + TFloat32(1.0e-6));
    for i := 0 to N - 1 do
      (Grads + i)^ := (Grads + i)^ * Scale;
  end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 441: SGDStep ===                                               }
{ ======================================================================= }

function SGDStep(Params, Grads: PFloat32; N: TUInt32;
                 LR: TFloat32): TResult;
var
  i: TUInt32;
begin
  if (Params = nil) or (Grads = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  for i := 0 to N - 1 do
    (Params + i)^ := (Params + i)^ - LR * (Grads + i)^;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 442: TAdamState helpers ===                                    }
{ ======================================================================= }

function AdamStateCreate(var S: TAdamState; N: TUInt32): TResult;
begin
  if N = 0 then Exit(PGPU_ERR_INVALID_PARAM);
  S.N := N;
  S.T := 0;
  GetMem(S.M, N * SizeOf(TFloat32));
  GetMem(S.V, N * SizeOf(TFloat32));
  FillChar(S.M^, N * SizeOf(TFloat32), 0);
  FillChar(S.V^, N * SizeOf(TFloat32), 0);
  Result := PGPU_SUCCESS;
end;

procedure AdamStateDestroy(var S: TAdamState);
begin
  if S.M <> nil then begin FreeMem(S.M); S.M := nil; end;
  if S.V <> nil then begin FreeMem(S.V); S.V := nil; end;
  S.N := 0;
  S.T := 0;
end;

{ ======================================================================= }
{ === BLOCK 443: AdamStep ===                                              }
{ Compact bias-correction form: alpha_t = lr * sqrt(1-b2^t)/(1-b1^t)     }
{ ======================================================================= }

function AdamStep(Params, Grads: PFloat32; var S: TAdamState;
                  N: TUInt32; LR, Beta1, Beta2, Eps: TFloat32): TResult;
var
  i:      TUInt32;
  G, M_, V_, AlphaT: TFloat32;
begin
  if (Params = nil) or (Grads = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if (S.M = nil) or (S.V = nil) then
    Exit(PGPU_ERR_NOT_INITIALIZED);
  S.T    := S.T + 1;
  AlphaT := LR
           * TFloat32(Sqrt(1.0 - Power(Beta2, S.T)))
           / TFloat32(1.0  -     Power(Beta1, S.T));
  for i := 0 to N - 1 do
  begin
    G  := (Grads + i)^;
    M_ := Beta1 * (S.M + i)^ + (1.0 - Beta1) * G;
    V_ := Beta2 * (S.V + i)^ + (1.0 - Beta2) * G * G;
    (S.M + i)^ := M_;
    (S.V + i)^ := V_;
    (Params + i)^ := (Params + i)^ - AlphaT * M_ / (Sqrt(V_) + Eps);
  end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 444: TAdamW helpers ===                                        }
{ ======================================================================= }

function AdamWCreate(var AW: TAdamW; N: TUInt32;
                     WeightDecay: TFloat32): TResult;
begin
  AW.WeightDecay := WeightDecay;
  Result         := AdamStateCreate(AW.State, N);
end;

procedure AdamWDestroy(var AW: TAdamW);
begin
  AdamStateDestroy(AW.State);
end;

{ ======================================================================= }
{ === BLOCK 445: AdamWStep ===                                             }
{ Decoupled weight decay applied before moment update                     }
{ ======================================================================= }

function AdamWStep(Params, Grads: PFloat32; var AW: TAdamW;
                   N: TUInt32; LR, Beta1, Beta2, Eps: TFloat32): TResult;
var
  i:      TUInt32;
  G, M_, V_, AlphaT: TFloat32;
begin
  if (Params = nil) or (Grads = nil) then
    Exit(PGPU_ERR_INVALID_PARAM);
  if (AW.State.M = nil) or (AW.State.V = nil) then
    Exit(PGPU_ERR_NOT_INITIALIZED);
  AW.State.T := AW.State.T + 1;
  AlphaT     := LR
               * TFloat32(Sqrt(1.0 - Power(Beta2, AW.State.T)))
               / TFloat32(1.0  -     Power(Beta1, AW.State.T));
  for i := 0 to N - 1 do
  begin
    { Decoupled weight decay — applied before gradient step }
    (Params + i)^ := (Params + i)^ * (1.0 - LR * AW.WeightDecay);
    G  := (Grads + i)^;
    M_ := Beta1 * (AW.State.M + i)^ + (1.0 - Beta1) * G;
    V_ := Beta2 * (AW.State.V + i)^ + (1.0 - Beta2) * G * G;
    (AW.State.M + i)^ := M_;
    (AW.State.V + i)^ := V_;
    (Params + i)^ := (Params + i)^ - AlphaT * M_ / (Sqrt(V_) + Eps);
  end;
  Result := PGPU_SUCCESS;
end;

{ ======================================================================= }
{ === BLOCK 446: CosineAnnealingLR ===                                     }
{ ======================================================================= }

function CosineAnnealingLR(Step, TotalSteps: TUInt32;
                            MaxLR, MinLR: TFloat32): TFloat32;
var
  T: TFloat32;
begin
  if TotalSteps = 0 then Exit(MinLR);
  T := TFloat32(Step) / TFloat32(TotalSteps);
  if T > 1.0 then T := 1.0;
  Result := MinLR + 0.5 * (MaxLR - MinLR) * TFloat32(1.0 + Cos(Pi * T));
end;

{ ======================================================================= }
{ === BLOCK 447: WarmupCosine ===                                          }
{ Linear warmup 0 -> MaxLR, then cosine decay MaxLR -> 0                  }
{ ======================================================================= }

function WarmupCosine(Step, WarmupSteps, TotalSteps: TUInt32;
                       MaxLR: TFloat32): TFloat32;
var
  Progress: TFloat32;
begin
  if Step <= WarmupSteps then
  begin
    if WarmupSteps = 0 then Exit(MaxLR);
    Result := MaxLR * TFloat32(Step) / TFloat32(WarmupSteps);
  end
  else
  begin
    if TotalSteps <= WarmupSteps then Exit(0.0);
    Progress := TFloat32(Step - WarmupSteps)
              / TFloat32(TotalSteps - WarmupSteps);
    if Progress > 1.0 then Progress := 1.0;
    Result := MaxLR * 0.5 * TFloat32(1.0 + Cos(Pi * Progress));
  end;
end;

{ ======================================================================= }
{ === BLOCK 448: TGradAccumulator helpers ===                              }
{ ======================================================================= }

function GradAccumulatorCreate(var Acc: TGradAccumulator;
                                N, AccumSteps: TUInt32): TResult;
begin
  if (N = 0) or (AccumSteps = 0) then
    Exit(PGPU_ERR_INVALID_PARAM);
  Acc.N          := N;
  Acc.AccumSteps := AccumSteps;
  Acc.StepCount  := 0;
  GetMem(Acc.Grads, N * SizeOf(TFloat32));
  FillChar(Acc.Grads^, N * SizeOf(TFloat32), 0);
  Result := PGPU_SUCCESS;
end;

procedure GradAccumulatorDestroy(var Acc: TGradAccumulator);
begin
  if Acc.Grads <> nil then
  begin
    FreeMem(Acc.Grads);
    Acc.Grads := nil;
  end;
  Acc.N          := 0;
  Acc.StepCount  := 0;
  Acc.AccumSteps := 0;
end;

function GradAccumulatorAdd(var Acc: TGradAccumulator;
                             Grads: PFloat32): Boolean;
var
  i: TUInt32;
begin
  if (Acc.Grads = nil) or (Grads = nil) then
    Exit(False);
  for i := 0 to Acc.N - 1 do
    (Acc.Grads + i)^ := (Acc.Grads + i)^ + (Grads + i)^;
  Acc.StepCount := Acc.StepCount + 1;
  Result := Acc.StepCount >= Acc.AccumSteps;
end;

procedure GradAccumulatorReset(var Acc: TGradAccumulator);
begin
  if Acc.Grads <> nil then
    FillChar(Acc.Grads^, Acc.N * SizeOf(TFloat32), 0);
  Acc.StepCount := 0;
end;

{ ======================================================================= }
{ === BLOCK 449: TBenchResult helpers ===                                  }
{ ======================================================================= }

function MakeBenchResult(const OpName: AnsiString; N: TUInt64;
                          TimeMs, GFlops, GBps: TFloat64): TBenchResult;
begin
  Result.OpName := OpName;
  Result.N      := N;
  Result.TimeMs := TimeMs;
  Result.GFlops := GFlops;
  Result.GBps   := GBps;
end;

function BenchResultToString(const B: TBenchResult): AnsiString;
begin
  Result := Format('%s: N=%u, Time=%.3fms, GFlops=%.2f, GBps=%.2f',
                   [B.OpName, B.N, B.TimeMs, B.GFlops, B.GBps]);
end;

{ ======================================================================= }
{ === BLOCK 450: AdvancedSubsystemTest ===                                 }
{ Exercises every major subsystem; returns PGPU_SUCCESS on full pass      }
{ ======================================================================= }

function AdvancedSubsystemTest: TResult;
var
  RF:    TRegisterFile;
  Rng:   TRandomState;
  Buf:   PFloat32;
  Buf2:  PFloat32;
  Keys:  PUInt32;
  H:     THistogram;
  PE:    TPositionalEncoding;
  Adam:  TAdamState;
  AW:    TAdamW;
  Acc:   TGradAccumulator;
  BR:    TBenchResult;
  Loss:  TFloat32;
  Pen:   TFloat32;
  i:     TUInt32;
  R:     TResult;
  WRS:   TWarpReduceSum;
  BRS:   TBlockReduceSum;
  ScanA: array[0..7] of TFloat32;
  ScanB: array[0..7] of TFloat32;
  Mat:   TMatrix;
  MatB:  TMatrix;
  MatC:  TMatrix;
  CBuf:  PFloat32;
  BufF:  PFloat32;
  j:     TUInt32;
begin
  Result := PGPU_SUCCESS;

  { --- Register file --- }
  FillChar(RF, SizeOf(RF), 0);
  RegisterFileWrite(RF, 0,  $AABBCCDD);
  RegisterFileWrite(RF, 255, $11223344);
  if RegisterFileRead(RF, 0)   <> TUInt32($AABBCCDD) then Exit(PGPU_ERR_KERNEL_FAILED);
  if RegisterFileRead(RF, 255) <> TUInt32($11223344) then Exit(PGPU_ERR_KERNEL_FAILED);
  if RegisterFileRead(RF, REG_FILE_SIZE) <> 0         then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Warp reduce --- }
  WRS.Count := WARP_SIZE;
  for i := 0 to WARP_SIZE - 1 do
    WRS.Data[i] := 1.0;
  if Abs(WarpReduceSum(WRS) - WARP_SIZE) > 0.001 then
    Exit(PGPU_ERR_KERNEL_FAILED);
  if Abs(WarpReduceMax(WRS) - 1.0) > 0.001 then
    Exit(PGPU_ERR_KERNEL_FAILED);
  if Abs(WarpReduceMin(WRS) - 1.0) > 0.001 then
    Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Block reduce --- }
  BRS.WarpCount := 4;
  for i := 0 to 3 do
  begin
    BRS.WarpData[i].Count := WARP_SIZE;
    for j := 0 to WARP_SIZE - 1 do
      BRS.WarpData[i].Data[j] := 1.0;
  end;
  { Block sum should be 4 * WARP_SIZE = 128 (all warps have 32 ones) }
  if BlockReduceSum(BRS) < 1.0 then
    Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Prefix scan --- }
  for i := 0 to 7 do ScanA[i] := 1.0;
  R := ExclusiveScanF32(@ScanA[0], @ScanB[0], 8, soAdd);
  if IsError(R) then Exit(R);
  if Abs(ScanB[0] - 0.0) > 0.001 then Exit(PGPU_ERR_KERNEL_FAILED);
  if Abs(ScanB[7] - 7.0) > 0.001 then Exit(PGPU_ERR_KERNEL_FAILED);
  R := InclusiveScanF32(@ScanA[0], @ScanB[0], 8, soAdd);
  if IsError(R) then Exit(R);
  if Abs(ScanB[7] - 8.0) > 0.001 then Exit(PGPU_ERR_KERNEL_FAILED);

  { --- Random state + fill --- }
  RandomInit(Rng, 42);
  for i := 0 to 9 do
  begin
    Loss := RandomFloat(Rng);
    if (Loss < 0.0) or (Loss >= 1.0) then
      Exit(PGPU_ERR_KERNEL_FAILED);
  end;
  Loss := RandomNormal(Rng);
  { Normal deviate — just verify it ran without crash }

  GetMem(Buf, 128 * SizeOf(TFloat32));
  try
    R := FillRandom(Buf, 128, Rng);
    if IsError(R) then Exit(R);

    { --- Inclusive scan in-place (overwrites Buf) --- }
    GetMem(Buf2, 128 * SizeOf(TFloat32));
    try
      R := InclusiveScanF32(Buf, Buf2, 128, soAdd);
      if IsError(R) then Exit(R);
    finally
      FreeMem(Buf2);
    end;

    { --- Histogram --- }
    R := HistogramCreate(H, 16, 0.0, 1.0);
    if IsError(R) then Exit(R);
    try
      R := FillRandom(Buf, 128, Rng);
      if IsError(R) then Exit(R);
      R := ComputeHistogram(Buf, 128, H);
      if IsError(R) then Exit(R);
      HistogramNormalize(H);
      { Verify normalised bins sum to ~1 }
      Loss := 0.0;
      for i := 0 to 15 do
        Loss := Loss + (H.NormBins + i)^;
      if (Loss < 0.9) or (Loss > 1.1) then
        Exit(PGPU_ERR_KERNEL_FAILED);
    finally
      HistogramDestroy(H);
    end;

    { --- Radix sort --- }
    GetMem(Keys, 32 * SizeOf(TUInt32));
    try
      for i := 0 to 31 do (Keys + i)^ := 31 - i;
      R := RadixSortUInt32(Keys, 32, True);
      if IsError(R) then Exit(R);
      for i := 0 to 30 do
        if (Keys + i)^ > (Keys + i + 1)^ then
          Exit(PGPU_ERR_KERNEL_FAILED);
      R := RadixSortUInt32(Keys, 32, False);
      if IsError(R) then Exit(R);
      for i := 0 to 30 do
        if (Keys + i)^ < (Keys + i + 1)^ then
          Exit(PGPU_ERR_KERNEL_FAILED);
    finally
      FreeMem(Keys);
    end;

    { --- Bitonic sort --- }
    for i := 0 to 15 do (Buf + i)^ := TFloat32(15 - i);
    R := BitonicSortF32(Buf, 16, True);
    if IsError(R) then Exit(R);
    for i := 0 to 14 do
      if (Buf + i)^ > (Buf + i + 1)^ then
        Exit(PGPU_ERR_KERNEL_FAILED);

    { --- Stencil 1D (box filter) --- }
    for i := 0 to 7 do (Buf + i)^ := TFloat32(i);
    GetMem(Buf2, 8 * SizeOf(TFloat32));
    try
      R := Stencil1D(Buf, Buf2, 8, [1.0 / 3.0, 1.0 / 3.0, 1.0 / 3.0]);
      if IsError(R) then Exit(R);
    finally
      FreeMem(Buf2);
    end;

    { --- Positional encoding --- }
    R := BuildPositionalEncoding(PE, 64, 32);
    if IsError(R) then Exit(R);
    if PE.Table = nil then Exit(PGPU_ERR_KERNEL_FAILED);
    FreeMem(PE.Table);
    PE.Table := nil;

    { --- SGD step --- }
    for i := 0 to 7 do (Buf + i)^ := 1.0;
    GetMem(Buf2, 8 * SizeOf(TFloat32));
    try
      for i := 0 to 7 do (Buf2 + i)^ := 0.1;
      R := SGDStep(Buf, Buf2, 8, 0.01);
      if IsError(R) then Exit(R);
      for i := 0 to 7 do
        if Abs((Buf + i)^ - 0.999) > 0.001 then
          Exit(PGPU_ERR_KERNEL_FAILED);

      { --- L2 regularization --- }
      R := L2Regularization(Buf, 8, 0.01, Pen);
      if IsError(R) then Exit(R);
      if Pen < 0.0 then Exit(PGPU_ERR_KERNEL_FAILED);

      { --- Clip grad norm --- }
      for i := 0 to 7 do (Buf2 + i)^ := 10.0;
      R := ClipGradNorm(Buf2, 8, 1.0);
      if IsError(R) then Exit(R);

      { --- Adam step --- }
      R := AdamStateCreate(Adam, 8);
      if IsError(R) then Exit(R);
      try
        FillChar(Buf^,  8 * SizeOf(TFloat32), 0);
        FillChar(Buf2^, 8 * SizeOf(TFloat32), 0);
        R := AdamStep(Buf, Buf2, Adam, 8, 0.001, 0.9, 0.999, 1.0e-8);
        if IsError(R) then Exit(R);
      finally
        AdamStateDestroy(Adam);
      end;

      { --- AdamW step --- }
      R := AdamWCreate(AW, 8, 0.01);
      if IsError(R) then Exit(R);
      try
        FillChar(Buf^,  8 * SizeOf(TFloat32), 0);
        FillChar(Buf2^, 8 * SizeOf(TFloat32), 0);
        R := AdamWStep(Buf, Buf2, AW, 8, 0.001, 0.9, 0.999, 1.0e-8);
        if IsError(R) then Exit(R);
      finally
        AdamWDestroy(AW);
      end;

      { --- Grad accumulator --- }
      R := GradAccumulatorCreate(Acc, 8, 4);
      if IsError(R) then Exit(R);
      try
        for i := 0 to 7 do (Buf2 + i)^ := 0.25;
        { Add 3 steps — should return False each time }
        if GradAccumulatorAdd(Acc, Buf2) then Exit(PGPU_ERR_KERNEL_FAILED);
        if GradAccumulatorAdd(Acc, Buf2) then Exit(PGPU_ERR_KERNEL_FAILED);
        if GradAccumulatorAdd(Acc, Buf2) then Exit(PGPU_ERR_KERNEL_FAILED);
        { 4th add should return True }
        if not GradAccumulatorAdd(Acc, Buf2) then
          Exit(PGPU_ERR_KERNEL_FAILED);
        GradAccumulatorReset(Acc);
        if Acc.StepCount <> 0 then Exit(PGPU_ERR_KERNEL_FAILED);
      finally
        GradAccumulatorDestroy(Acc);
      end;

    finally
      FreeMem(Buf2);
    end;

    { --- LR schedulers --- }
    Loss := CosineAnnealingLR(0, 1000, 0.1, 0.0);
    if Abs(Loss - 0.1) > 0.001 then Exit(PGPU_ERR_KERNEL_FAILED);
    Loss := CosineAnnealingLR(1000, 1000, 0.1, 0.0);
    if Abs(Loss - 0.0) > 0.001 then Exit(PGPU_ERR_KERNEL_FAILED);
    Loss := WarmupCosine(0, 100, 1000, 0.1);
    if Abs(Loss - 0.0) > 0.001 then Exit(PGPU_ERR_KERNEL_FAILED);
    Loss := WarmupCosine(100, 100, 1000, 0.1);
    if Abs(Loss - 0.1) > 0.001 then Exit(PGPU_ERR_KERNEL_FAILED);

    { --- BenchResult --- }
    BR := MakeBenchResult('TestOp', 1024, 0.5, 2.0, 8.0);
    if BR.OpName <> 'TestOp' then Exit(PGPU_ERR_KERNEL_FAILED);
    if BenchResultToString(BR) = '' then Exit(PGPU_ERR_KERNEL_FAILED);

    { --- Tiled matrix multiply (4x4 * 4x4) --- }
    GetMem(BufF, 3 * 4 * 4 * SizeOf(TFloat32));
    try
      Mat.Rows := 4;
      Mat.Cols := 4;
      Mat.Data := BufF;
      for i := 0 to 15 do (Mat.Data + i)^ := TFloat32(i + 1);
      { Build B as identity }
      GetMem(Buf2, 4 * 4 * SizeOf(TFloat32));
      try
        FillChar(Buf2^, 4 * 4 * SizeOf(TFloat32), 0);
        (Buf2 + 0)^  := 1.0;
        (Buf2 + 5)^  := 1.0;
        (Buf2 + 10)^ := 1.0;
        (Buf2 + 15)^ := 1.0;
        begin
          { Mat already points at BufF — use it as matrix A }
          MatB.Rows := 4; MatB.Cols := 4; MatB.Data := Buf2;
          GetMem(CBuf, 16 * SizeOf(TFloat32));
          try
            FillChar(CBuf^, 16 * SizeOf(TFloat32), 0);
            MatC.Rows := 4; MatC.Cols := 4; MatC.Data := CBuf;
            R := TiledMatMulKernel(Mat, MatB, MatC);
            if IsError(R) then Exit(R);
            { C = A * I = A — spot-check C[0,0] = A[0,0] = 1 }
            if Abs((MatC.Data + 0)^ - 1.0) > 0.01 then
              Exit(PGPU_ERR_KERNEL_FAILED);
          finally
            FreeMem(CBuf);
          end;
        end;
      finally
        FreeMem(Buf2);
      end;
    finally
      FreeMem(BufF);
    end;

  finally
    FreeMem(Buf);
  end;

  Result := PGPU_SUCCESS;
end;

end.
