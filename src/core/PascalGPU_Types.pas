{$mode objfpc}{$H+}{$PackRecords C}
unit PascalGPU_Types;

interface

uses
  SysUtils;

{ === BLOCK 001: Platform integer type aliases === }
type
  TInt8    = ShortInt;
  TInt16   = SmallInt;
  TInt32   = LongInt;
  TInt64   = Int64;
  TUInt8   = Byte;
  TUInt16  = Word;
  TUInt32  = LongWord;
  TUInt64  = QWord;
  TSizeT   = QWord;
  TPtrInt  = PtrInt;
  TPtrUInt = PtrUInt;

{ === BLOCK 002: Float type aliases and Float16 emulation === }
type
  TFloat32 = Single;
  TFloat64 = Double;
  TFloat16 = packed record
    RawBits: TUInt16;
  end;
  PFloat32 = ^TFloat32;
  PFloat64 = ^TFloat64;
  PFloat16 = ^TFloat16;

{ === BLOCK 003: 2D vector record === }
type
  TVector2f = packed record
    X, Y: TFloat32;
  end;
  TVector2i = packed record
    X, Y: TInt32;
  end;
  TVector2u = packed record
    X, Y: TUInt32;
  end;
  PVector2f = ^TVector2f;
  PVector2i = ^TVector2i;
  PVector2u = ^TVector2u;

{ === BLOCK 004: 3D vector record === }
type
  TVector3f = packed record
    X, Y, Z: TFloat32;
  end;
  TVector3i = packed record
    X, Y, Z: TInt32;
  end;
  TVector3u = packed record
    X, Y, Z: TUInt32;
  end;
  PVector3f = ^TVector3f;
  PVector3i = ^TVector3i;
  PVector3u = ^TVector3u;

{ === BLOCK 005: 4D vector record === }
type
  TVector4f = packed record
    X, Y, Z, W: TFloat32;
  end;
  TVector4i = packed record
    X, Y, Z, W: TInt32;
  end;
  TVector4u = packed record
    X, Y, Z, W: TUInt32;
  end;
  PVector4f = ^TVector4f;
  PVector4i = ^TVector4i;
  PVector4u = ^TVector4u;

{ === BLOCK 006: Error code constants === }
const
  PGPU_SUCCESS               =  0;
  PGPU_ERR_INVALID_DEVICE    = -1;
  PGPU_ERR_OUT_OF_MEMORY     = -2;
  PGPU_ERR_INVALID_PARAM     = -3;
  PGPU_ERR_NOT_INITIALIZED   = -4;
  PGPU_ERR_KERNEL_FAILED     = -5;
  PGPU_ERR_SYNC_FAILED       = -6;
  PGPU_ERR_TRANSFER_FAILED   = -7;
  PGPU_ERR_UNSUPPORTED       = -8;
  PGPU_ERR_BOUNDS            = -9;
  PGPU_ERR_ALIGNMENT         = -10;
  PGPU_ERR_TIMEOUT           = -11;
  PGPU_ERR_ALREADY_INIT      = -12;
  PGPU_ERR_DEVICE_LOST       = -13;
  PGPU_ERR_DRIVER_FAULT      = -14;
  PGPU_ERR_NOT_FOUND         = -15;
  PGPU_ERR_OVERFLOW          = -16;
  PGPU_ERR_UNDERFLOW         = -17;
  PGPU_ERR_DIVIDE_BY_ZERO    = -18;
  PGPU_ERR_DEADLOCK          = -19;

{ === BLOCK 007: TResult type and helper === }
type
  TResult = TInt32;

function IsSuccess(R: TResult): Boolean; inline;
function IsError(R: TResult): Boolean; inline;

{ === BLOCK 008: TStatus record with code + message === }
type
  TStatus = record
    Code:    TResult;
    Message: AnsiString;
  end;

function MakeStatus(Code: TResult; const Msg: AnsiString): TStatus;
function OKStatus: TStatus;

{ === BLOCK 009: Alignment constants and types === }
const
  PGPU_ALIGN_4   = 4;
  PGPU_ALIGN_8   = 8;
  PGPU_ALIGN_16  = 16;
  PGPU_ALIGN_32  = 32;
  PGPU_ALIGN_64  = 64;
  PGPU_ALIGN_128 = 128;
  PGPU_ALIGN_256 = 256;

type
  TAlignment = TUInt32;

{ === BLOCK 010: Memory size and count type aliases === }
type
  TByteCount    = TSizeT;
  TElementCount = TSizeT;
  TStride       = TSizeT;
  TOffset       = TSizeT;

{ === BLOCK 011: Dimension record for 1D/2D/3D === }
type
  TDim1D = record
    X: TUInt32;
  end;
  TDim2D = record
    X, Y: TUInt32;
  end;
  TDim3D = record
    X, Y, Z: TUInt32;
  end;

function MakeDim1D(X: TUInt32): TDim1D;
function MakeDim2D(X, Y: TUInt32): TDim2D;
function MakeDim3D(X, Y, Z: TUInt32): TDim3D;

{ === BLOCK 012: Thread index record (CUDA threadIdx replacement) === }
type
  TThreadIdx = TDim3D;

function ThreadIdx1D(X: TUInt32): TThreadIdx;
function ThreadIdx2D(X, Y: TUInt32): TThreadIdx;
function ThreadIdx3D(X, Y, Z: TUInt32): TThreadIdx;

{ === BLOCK 013: Block index record (CUDA blockIdx replacement) === }
type
  TBlockIdx = TDim3D;

function BlockIdx1D(X: TUInt32): TBlockIdx;
function BlockIdx2D(X, Y: TUInt32): TBlockIdx;
function BlockIdx3D(X, Y, Z: TUInt32): TBlockIdx;

{ === BLOCK 014: Grid dimension record (CUDA gridDim replacement) === }
type
  TGridDim = TDim3D;

function MakeGridDim1D(X: TUInt32): TGridDim;
function MakeGridDim2D(X, Y: TUInt32): TGridDim;
function MakeGridDim3D(X, Y, Z: TUInt32): TGridDim;

{ === BLOCK 015: Block dimension record (CUDA blockDim replacement) === }
type
  TBlockDim = TDim3D;

function MakeBlockDim1D(X: TUInt32): TBlockDim;
function MakeBlockDim2D(X, Y: TUInt32): TBlockDim;
function MakeBlockDim3D(X, Y, Z: TUInt32): TBlockDim;

{ === BLOCK 016: Launch configuration record === }
type
  TLaunchConfig = record
    GridDim:        TGridDim;
    BlockDim:       TBlockDim;
    SharedMemBytes: TUInt32;
    StreamID:       TInt32;
  end;

function MakeLaunchConfig1D(GridX, BlockX, SharedMem: TUInt32; Stream: TInt32): TLaunchConfig;
function MakeLaunchConfig2D(GridX, GridY, BlockX, BlockY, SharedMem: TUInt32; Stream: TInt32): TLaunchConfig;

{ === BLOCK 017: Compute capability record === }
type
  TComputeCapability = record
    Major, Minor: TUInt32;
  end;

function MakeComputeCapability(Major, Minor: TUInt32): TComputeCapability;
function ComputeCapabilityAsInt(CC: TComputeCapability): TUInt32;

{ === BLOCK 018: Memory kind enumeration === }
type
  TMemoryKind = (
    mkHost,
    mkDevice,
    mkPinned,
    mkManaged,
    mkShared,
    mkConstant
  );

{ === BLOCK 019: Data type enumeration === }
type
  TDataType = (
    dtFloat32,
    dtFloat64,
    dtFloat16,
    dtInt32,
    dtInt64,
    dtUInt8,
    dtUInt32,
    dtBool
  );

{ === BLOCK 020: Data type size function === }
function DataTypeSize(DT: TDataType): TSizeT;

{ === BLOCK 021: Pointer types for all numeric types === }
type
  PInt8   = ^TInt8;
  PInt16  = ^TInt16;
  PInt32  = ^TInt32;
  PInt64  = ^TInt64;
  PUInt8  = ^TUInt8;
  PUInt16 = ^TUInt16;
  PUInt32 = ^TUInt32;
  PUInt64 = ^TUInt64;

{ === BLOCK 022: Byte buffer pointer type === }
type
  TByteBuffer      = PByte;
  TConstByteBuffer = PByte;

{ === BLOCK 023: Opaque handle type === }
type
  THandle       = Pointer;
  TDeviceHandle = THandle;
  TStreamHandle = THandle;
  TEventHandle  = THandle;
  TModuleHandle = THandle;

{ === BLOCK 024: Boolean and flag types === }
type
  TBool32 = TUInt32;

const
  PGPU_TRUE  = TUInt32(1);
  PGPU_FALSE = TUInt32(0);

{ === BLOCK 025: UUID type for device identification === }
type
  TDeviceUUID = packed record
    Bytes: array[0..15] of TUInt8;
  end;

function DeviceUUIDToString(const UUID: TDeviceUUID): AnsiString;
function NullDeviceUUID: TDeviceUUID;

{ === BLOCK 026: Timestamp type === }
type
  TTimestamp = TUInt64;
  TDuration  = TInt64;

function GetMonotonicTimestampNs: TTimestamp;

{ === BLOCK 027: Priority type for streams === }
type
  TStreamPriority = TInt32;

const
  PGPU_STREAM_PRIORITY_LOW    = TInt32(0);
  PGPU_STREAM_PRIORITY_NORMAL = TInt32(1);
  PGPU_STREAM_PRIORITY_HIGH   = TInt32(2);

{ === BLOCK 028: Callback procedure type === }
type
  TGPUCallback = procedure(Status: TResult; UserData: Pointer);

{ === BLOCK 029: Progress callback type === }
type
  TProgressCallback = procedure(Current, Total: TSizeT; UserData: Pointer);

{ === BLOCK 030: Log level enumeration and logger callback === }
type
  TLogLevel    = (llDebug, llInfo, llWarning, llError, llFatal);
  TLogCallback = procedure(Level: TLogLevel; const Msg: AnsiString);

{ === BLOCK 031: Platform enumeration === }
type
  TPlatform = (ptUnknown, ptLinux, ptWindows, ptMacOS, ptFreeBSD);

function CurrentPlatform: TPlatform;

{ === BLOCK 032: Architecture enumeration === }
type
  TArchitecture = (archUnknown, archX86_64, archARM64, archRISCV64);

function CurrentArchitecture: TArchitecture;

{ === BLOCK 033: Endianness detection === }
function IsLittleEndian: Boolean;

{ === BLOCK 034: CPU feature flags === }
type
  TCPUFeatures = record
    HasSSE2:   Boolean;
    HasAVX:    Boolean;
    HasAVX2:   Boolean;
    HasAVX512F: Boolean;
    HasNEON:   Boolean;
  end;

function DetectCPUFeatures: TCPUFeatures;

{ === BLOCK 035: System memory info === }
type
  TSystemMemInfo = record
    TotalPhysical: TUInt64;
    FreePhysical:  TUInt64;
    TotalVirtual:  TUInt64;
    FreeVirtual:   TUInt64;
  end;

function GetSystemMemInfo: TSystemMemInfo;

{ === BLOCK 036: String helpers for Pascal GPU === }
function ResultToString(R: TResult): AnsiString;
function LogLevelToString(L: TLogLevel): AnsiString;
function DataTypeToString(DT: TDataType): AnsiString;
function MemoryKindToString(MK: TMemoryKind): AnsiString;

{ === BLOCK 037: Bit manipulation — PopCount === }
function PopCount32(V: TUInt32): TUInt32;
function PopCount64(V: TUInt64): TUInt32;

{ === BLOCK 038: Bit manipulation — Leading/Trailing zeros === }
function CountLeadingZeros32(V: TUInt32): TUInt32;
function CountTrailingZeros32(V: TUInt32): TUInt32;
function CountLeadingZeros64(V: TUInt64): TUInt32;

{ === BLOCK 039: Bit manipulation — Next power of two === }
function NextPowerOfTwo32(V: TUInt32): TUInt32;
function NextPowerOfTwo64(V: TUInt64): TUInt64;
function IsPowerOfTwo(V: TUInt64): Boolean;

{ === BLOCK 040: Alignment utilities === }
function AlignUp(Value, Alignment: TSizeT): TSizeT;
function AlignDown(Value, Alignment: TSizeT): TSizeT;
function IsAligned(Ptr: Pointer; Alignment: TSizeT): Boolean;

{ === BLOCK 041: Min/Max/Clamp for integer types === }
function Clamp32(V, Lo, Hi: TInt32): TInt32;
function ClampU32(V, Lo, Hi: TUInt32): TUInt32;
function ClampF32(V, Lo, Hi: TFloat32): TFloat32;

{ === BLOCK 042: Integer ceiling division === }
function CeilDiv32(Num, Den: TUInt32): TUInt32;
function CeilDiv64(Num, Den: TUInt64): TUInt64;

{ === BLOCK 043: Global linear index from 3D thread/block coords === }
function LinearThreadIndex(TIdx: TThreadIdx; BDim: TBlockDim): TUInt32;
function LinearBlockIndex(BIdx: TBlockIdx; GDim: TGridDim): TUInt32;
function GlobalLinearIndex(TIdx: TThreadIdx; BIdx: TBlockIdx; BDim: TBlockDim; GDim: TGridDim): TUInt64;

{ === BLOCK 044: Version record === }
type
  TVersion = record
    Major, Minor, Patch: TUInt32;
  end;

const
  PGPU_VERSION: TVersion = (Major: 1; Minor: 0; Patch: 0);

function VersionToString(V: TVersion): AnsiString;
function VersionFromInt(Major, Minor, Patch: TUInt32): TVersion;

{ === BLOCK 045: TRange record — offset + count === }
type
  TRange = record
    Offset: TSizeT;
    Count:  TSizeT;
  end;

function MakeRange(Offset, Count: TSizeT): TRange;
function RangeEnd(R: TRange): TSizeT;
function RangeContains(R: TRange; Index: TSizeT): Boolean;

{ === BLOCK 046: TRect2D — 2D region === }
type
  TRect2D = record
    X, Y, Width, Height: TUInt32;
  end;

function MakeRect2D(X, Y, W, H: TUInt32): TRect2D;
function Rect2DContains(R: TRect2D; PX, PY: TUInt32): Boolean;

{ === BLOCK 047: TBox3D — 3D volume region === }
type
  TBox3D = record
    X, Y, Z, Width, Height, Depth: TUInt32;
  end;

function MakeBox3D(X, Y, Z, W, H, D: TUInt32): TBox3D;
function Box3DContains(B: TBox3D; PX, PY, PZ: TUInt32): Boolean;

{ === BLOCK 048: Float16 conversion utilities === }
function Float32ToFloat16(V: TFloat32): TFloat16;
function Float16ToFloat32(V: TFloat16): TFloat32;

{ === BLOCK 049: Byte-swap utilities for endian conversions === }
function ByteSwap16(V: TUInt16): TUInt16;
function ByteSwap32(V: TUInt32): TUInt32;
function ByteSwap64(V: TUInt64): TUInt64;

{ === BLOCK 050: Unit-level initialization: register global log callback === }
var
  GLogCallback: TLogCallback;

procedure SetGlobalLogCallback(CB: TLogCallback);
procedure PascalGPULog(Level: TLogLevel; const Msg: AnsiString);

implementation

{$IFDEF WINDOWS}
uses
  Windows;
{$ENDIF}

{ === BLOCK 007: TResult helper implementations === }

function IsSuccess(R: TResult): Boolean; inline;
begin
  Result := R = PGPU_SUCCESS;
end;

function IsError(R: TResult): Boolean; inline;
begin
  Result := R < PGPU_SUCCESS;
end;

{ === BLOCK 008: TStatus record implementations === }

function MakeStatus(Code: TResult; const Msg: AnsiString): TStatus;
begin
  Result.Code    := Code;
  Result.Message := Msg;
end;

function OKStatus: TStatus;
begin
  Result.Code    := PGPU_SUCCESS;
  Result.Message := 'OK';
end;

{ === BLOCK 011: Dimension constructor implementations === }

function MakeDim1D(X: TUInt32): TDim1D;
begin
  Result.X := X;
end;

function MakeDim2D(X, Y: TUInt32): TDim2D;
begin
  Result.X := X;
  Result.Y := Y;
end;

function MakeDim3D(X, Y, Z: TUInt32): TDim3D;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
end;

{ === BLOCK 012: ThreadIdx implementations === }

function ThreadIdx1D(X: TUInt32): TThreadIdx;
begin
  Result.X := X;
  Result.Y := 0;
  Result.Z := 0;
end;

function ThreadIdx2D(X, Y: TUInt32): TThreadIdx;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := 0;
end;

function ThreadIdx3D(X, Y, Z: TUInt32): TThreadIdx;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
end;

{ === BLOCK 013: BlockIdx implementations === }

function BlockIdx1D(X: TUInt32): TBlockIdx;
begin
  Result.X := X;
  Result.Y := 0;
  Result.Z := 0;
end;

function BlockIdx2D(X, Y: TUInt32): TBlockIdx;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := 0;
end;

function BlockIdx3D(X, Y, Z: TUInt32): TBlockIdx;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
end;

{ === BLOCK 014: GridDim implementations === }

function MakeGridDim1D(X: TUInt32): TGridDim;
begin
  Result.X := X;
  Result.Y := 1;
  Result.Z := 1;
end;

function MakeGridDim2D(X, Y: TUInt32): TGridDim;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := 1;
end;

function MakeGridDim3D(X, Y, Z: TUInt32): TGridDim;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
end;

{ === BLOCK 015: BlockDim implementations === }

function MakeBlockDim1D(X: TUInt32): TBlockDim;
begin
  Result.X := X;
  Result.Y := 1;
  Result.Z := 1;
end;

function MakeBlockDim2D(X, Y: TUInt32): TBlockDim;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := 1;
end;

function MakeBlockDim3D(X, Y, Z: TUInt32): TBlockDim;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Z := Z;
end;

{ === BLOCK 016: LaunchConfig implementations === }

function MakeLaunchConfig1D(GridX, BlockX, SharedMem: TUInt32; Stream: TInt32): TLaunchConfig;
begin
  Result.GridDim        := MakeGridDim1D(GridX);
  Result.BlockDim       := MakeBlockDim1D(BlockX);
  Result.SharedMemBytes := SharedMem;
  Result.StreamID       := Stream;
end;

function MakeLaunchConfig2D(GridX, GridY, BlockX, BlockY, SharedMem: TUInt32; Stream: TInt32): TLaunchConfig;
begin
  Result.GridDim        := MakeGridDim2D(GridX, GridY);
  Result.BlockDim       := MakeBlockDim2D(BlockX, BlockY);
  Result.SharedMemBytes := SharedMem;
  Result.StreamID       := Stream;
end;

{ === BLOCK 017: ComputeCapability implementations === }

function MakeComputeCapability(Major, Minor: TUInt32): TComputeCapability;
begin
  Result.Major := Major;
  Result.Minor := Minor;
end;

function ComputeCapabilityAsInt(CC: TComputeCapability): TUInt32;
begin
  Result := CC.Major * 10 + CC.Minor;
end;

{ === BLOCK 020: DataTypeSize implementation === }

function DataTypeSize(DT: TDataType): TSizeT;
begin
  case DT of
    dtFloat32: Result := 4;
    dtFloat64: Result := 8;
    dtFloat16: Result := 2;
    dtInt32:   Result := 4;
    dtInt64:   Result := 8;
    dtUInt8:   Result := 1;
    dtUInt32:  Result := 4;
    dtBool:    Result := 1;
  else
    Result := 0;
  end;
end;

{ === BLOCK 025: DeviceUUID implementations === }

function DeviceUUIDToString(const UUID: TDeviceUUID): AnsiString;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to 15 do
  begin
    if (I = 4) or (I = 6) or (I = 8) or (I = 10) then
      Result := Result + '-';
    Result := Result + LowerCase(IntToHex(UUID.Bytes[I], 2));
  end;
end;

function NullDeviceUUID: TDeviceUUID;
var
  I: Integer;
begin
  for I := 0 to 15 do
    Result.Bytes[I] := 0;
end;

{ === BLOCK 026: Timestamp implementation === }

function GetMonotonicTimestampNs: TTimestamp;
{$IFDEF WINDOWS}
var
  Freq, Count: Int64;
begin
  QueryPerformanceFrequency(Freq);
  QueryPerformanceCounter(Count);
  if Freq > 0 then
    Result := TUInt64(Count) * TUInt64(1000000000) div TUInt64(Freq)
  else
    Result := 0;
end;
{$ELSE}
begin
  Result := TUInt64(GetTickCount64) * TUInt64(1000000);
end;
{$ENDIF}

{ === BLOCK 031: CurrentPlatform implementation === }

function CurrentPlatform: TPlatform;
begin
{$IFDEF WINDOWS}
  Result := ptWindows;
{$ELSE}
  {$IFDEF LINUX}
    Result := ptLinux;
  {$ELSE}
    {$IFDEF DARWIN}
      Result := ptMacOS;
    {$ELSE}
      {$IFDEF FREEBSD}
        Result := ptFreeBSD;
      {$ELSE}
        Result := ptUnknown;
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
{$ENDIF}
end;

{ === BLOCK 032: CurrentArchitecture implementation === }

function CurrentArchitecture: TArchitecture;
begin
{$IFDEF CPUX86_64}
  Result := archX86_64;
{$ELSE}
  {$IFDEF CPUAARCH64}
    Result := archARM64;
  {$ELSE}
    {$IFDEF CPURISCV64}
      Result := archRISCV64;
    {$ELSE}
      Result := archUnknown;
    {$ENDIF}
  {$ENDIF}
{$ENDIF}
end;

{ === BLOCK 033: Endianness detection implementation === }

function IsLittleEndian: Boolean;
var
  Test: TUInt32;
  B:    PByte;
begin
  Test := TUInt32($01020304);
  B    := PByte(@Test);
  Result := B^ = $04;
end;

{ === BLOCK 034: DetectCPUFeatures implementation === }

function DetectCPUFeatures: TCPUFeatures;
{$IFDEF CPUX86_64}
var
  rEAX, rEBX, rECX, rEDX: TUInt32;
begin
  Result.HasSSE2    := False;
  Result.HasAVX     := False;
  Result.HasAVX2    := False;
  Result.HasAVX512F := False;
  Result.HasNEON    := False;

  rEAX := 0; rEBX := 0; rECX := 0; rEDX := 0;
  asm
    push rbx
    mov  eax, 1
    cpuid
    mov  rEAX, eax
    mov  rEBX, ebx
    mov  rECX, ecx
    mov  rEDX, edx
    pop  rbx
  end ['rax','rcx','rdx'];

  Result.HasSSE2 := (rEDX and (TUInt32(1) shl 26)) <> 0;
  Result.HasAVX  := (rECX and (TUInt32(1) shl 28)) <> 0;

  rEAX := 0; rEBX := 0; rECX := 0; rEDX := 0;
  asm
    push rbx
    mov  eax, 7
    xor  ecx, ecx
    cpuid
    mov  rEBX, ebx
    mov  rECX, ecx
    pop  rbx
  end ['rax','rcx','rdx'];

  Result.HasAVX2    := (rEBX and (TUInt32(1) shl 5))  <> 0;
  Result.HasAVX512F := (rEBX and (TUInt32(1) shl 16)) <> 0;
end;
{$ELSE}
  {$IFDEF CPUAARCH64}
begin
  Result.HasSSE2    := False;
  Result.HasAVX     := False;
  Result.HasAVX2    := False;
  Result.HasAVX512F := False;
  Result.HasNEON    := True;
end;
  {$ELSE}
begin
  Result.HasSSE2    := False;
  Result.HasAVX     := False;
  Result.HasAVX2    := False;
  Result.HasAVX512F := False;
  Result.HasNEON    := False;
end;
  {$ENDIF}
{$ENDIF}

{ === BLOCK 035: GetSystemMemInfo implementation === }

function GetSystemMemInfo: TSystemMemInfo;
{$IFDEF WINDOWS}
var
  Stat: TMemoryStatusEx;
begin
  Stat.dwLength := SizeOf(Stat);
  GlobalMemoryStatusEx(Stat);
  Result.TotalPhysical := Stat.ullTotalPhys;
  Result.FreePhysical  := Stat.ullAvailPhys;
  Result.TotalVirtual  := Stat.ullTotalVirtual;
  Result.FreeVirtual   := Stat.ullAvailVirtual;
end;
{$ELSE}
begin
  Result.TotalPhysical := 0;
  Result.FreePhysical  := 0;
  Result.TotalVirtual  := 0;
  Result.FreeVirtual   := 0;
end;
{$ENDIF}

{ === BLOCK 036: String helper implementations === }

function ResultToString(R: TResult): AnsiString;
begin
  case R of
    PGPU_SUCCESS:             Result := 'PGPU_SUCCESS';
    PGPU_ERR_INVALID_DEVICE:  Result := 'PGPU_ERR_INVALID_DEVICE';
    PGPU_ERR_OUT_OF_MEMORY:   Result := 'PGPU_ERR_OUT_OF_MEMORY';
    PGPU_ERR_INVALID_PARAM:   Result := 'PGPU_ERR_INVALID_PARAM';
    PGPU_ERR_NOT_INITIALIZED: Result := 'PGPU_ERR_NOT_INITIALIZED';
    PGPU_ERR_KERNEL_FAILED:   Result := 'PGPU_ERR_KERNEL_FAILED';
    PGPU_ERR_SYNC_FAILED:     Result := 'PGPU_ERR_SYNC_FAILED';
    PGPU_ERR_TRANSFER_FAILED: Result := 'PGPU_ERR_TRANSFER_FAILED';
    PGPU_ERR_UNSUPPORTED:     Result := 'PGPU_ERR_UNSUPPORTED';
    PGPU_ERR_BOUNDS:          Result := 'PGPU_ERR_BOUNDS';
    PGPU_ERR_ALIGNMENT:       Result := 'PGPU_ERR_ALIGNMENT';
    PGPU_ERR_TIMEOUT:         Result := 'PGPU_ERR_TIMEOUT';
    PGPU_ERR_ALREADY_INIT:    Result := 'PGPU_ERR_ALREADY_INIT';
    PGPU_ERR_DEVICE_LOST:     Result := 'PGPU_ERR_DEVICE_LOST';
    PGPU_ERR_DRIVER_FAULT:    Result := 'PGPU_ERR_DRIVER_FAULT';
    PGPU_ERR_NOT_FOUND:       Result := 'PGPU_ERR_NOT_FOUND';
    PGPU_ERR_OVERFLOW:        Result := 'PGPU_ERR_OVERFLOW';
    PGPU_ERR_UNDERFLOW:       Result := 'PGPU_ERR_UNDERFLOW';
    PGPU_ERR_DIVIDE_BY_ZERO:  Result := 'PGPU_ERR_DIVIDE_BY_ZERO';
    PGPU_ERR_DEADLOCK:        Result := 'PGPU_ERR_DEADLOCK';
  else
    Result := 'PGPU_ERR_UNKNOWN(' + IntToStr(R) + ')';
  end;
end;

function LogLevelToString(L: TLogLevel): AnsiString;
begin
  case L of
    llDebug:   Result := 'DEBUG';
    llInfo:    Result := 'INFO';
    llWarning: Result := 'WARNING';
    llError:   Result := 'ERROR';
    llFatal:   Result := 'FATAL';
  else
    Result := 'UNKNOWN';
  end;
end;

function DataTypeToString(DT: TDataType): AnsiString;
begin
  case DT of
    dtFloat32: Result := 'float32';
    dtFloat64: Result := 'float64';
    dtFloat16: Result := 'float16';
    dtInt32:   Result := 'int32';
    dtInt64:   Result := 'int64';
    dtUInt8:   Result := 'uint8';
    dtUInt32:  Result := 'uint32';
    dtBool:    Result := 'bool';
  else
    Result := 'unknown';
  end;
end;

function MemoryKindToString(MK: TMemoryKind): AnsiString;
begin
  case MK of
    mkHost:     Result := 'Host';
    mkDevice:   Result := 'Device';
    mkPinned:   Result := 'Pinned';
    mkManaged:  Result := 'Managed';
    mkShared:   Result := 'Shared';
    mkConstant: Result := 'Constant';
  else
    Result := 'Unknown';
  end;
end;

{ === BLOCK 037: PopCount implementations === }

function PopCount32(V: TUInt32): TUInt32;
var
  N: TUInt32;
begin
  N := V;
  N := N - ((N shr 1) and TUInt32($55555555));
  N := (N and TUInt32($33333333)) + ((N shr 2) and TUInt32($33333333));
  N := (N + (N shr 4)) and TUInt32($0F0F0F0F);
  N := (N * TUInt32($01010101)) shr 24;
  Result := N;
end;

function PopCount64(V: TUInt64): TUInt32;
var
  N: TUInt64;
begin
  N := V;
  N := N - ((N shr 1) and TUInt64($5555555555555555));
  N := (N and TUInt64($3333333333333333)) + ((N shr 2) and TUInt64($3333333333333333));
  N := (N + (N shr 4)) and TUInt64($0F0F0F0F0F0F0F0F);
  N := (N * TUInt64($0101010101010101)) shr 56;
  Result := TUInt32(N);
end;

{ === BLOCK 038: Leading/Trailing zero count implementations === }

function CountLeadingZeros32(V: TUInt32): TUInt32;
var
  N: TUInt32;
  C: TUInt32;
begin
  if V = 0 then
  begin
    Result := 32;
    Exit;
  end;
  N := V;
  C := 0;
  if (N and TUInt32($FFFF0000)) = 0 then begin C := C + 16; N := N shl 16; end;
  if (N and TUInt32($FF000000)) = 0 then begin C := C + 8;  N := N shl 8;  end;
  if (N and TUInt32($F0000000)) = 0 then begin C := C + 4;  N := N shl 4;  end;
  if (N and TUInt32($C0000000)) = 0 then begin C := C + 2;  N := N shl 2;  end;
  if (N and TUInt32($80000000)) = 0 then begin C := C + 1;                  end;
  Result := C;
end;

function CountTrailingZeros32(V: TUInt32): TUInt32;
var
  N: TUInt32;
  C: TUInt32;
begin
  if V = 0 then
  begin
    Result := 32;
    Exit;
  end;
  N := V;
  C := 0;
  if (N and TUInt32($0000FFFF)) = 0 then begin C := C + 16; N := N shr 16; end;
  if (N and TUInt32($000000FF)) = 0 then begin C := C + 8;  N := N shr 8;  end;
  if (N and TUInt32($0000000F)) = 0 then begin C := C + 4;  N := N shr 4;  end;
  if (N and TUInt32($00000003)) = 0 then begin C := C + 2;  N := N shr 2;  end;
  if (N and TUInt32($00000001)) = 0 then begin C := C + 1;                  end;
  Result := C;
end;

function CountLeadingZeros64(V: TUInt64): TUInt32;
var
  Hi, Lo: TUInt32;
begin
  Hi := TUInt32(V shr 32);
  Lo := TUInt32(V and TUInt64($FFFFFFFF));
  if Hi <> 0 then
    Result := CountLeadingZeros32(Hi)
  else
    Result := 32 + CountLeadingZeros32(Lo);
end;

{ === BLOCK 039: NextPowerOfTwo implementations === }

function NextPowerOfTwo32(V: TUInt32): TUInt32;
begin
  if V = 0 then
  begin
    Result := 1;
    Exit;
  end;
  Result := V - 1;
  Result := Result or (Result shr 1);
  Result := Result or (Result shr 2);
  Result := Result or (Result shr 4);
  Result := Result or (Result shr 8);
  Result := Result or (Result shr 16);
  Result := Result + 1;
end;

function NextPowerOfTwo64(V: TUInt64): TUInt64;
begin
  if V = 0 then
  begin
    Result := 1;
    Exit;
  end;
  Result := V - 1;
  Result := Result or (Result shr 1);
  Result := Result or (Result shr 2);
  Result := Result or (Result shr 4);
  Result := Result or (Result shr 8);
  Result := Result or (Result shr 16);
  Result := Result or (Result shr 32);
  Result := Result + 1;
end;

function IsPowerOfTwo(V: TUInt64): Boolean;
begin
  Result := (V <> 0) and ((V and (V - 1)) = 0);
end;

{ === BLOCK 040: Alignment utility implementations === }

function AlignUp(Value, Alignment: TSizeT): TSizeT;
begin
  if Alignment = 0 then
  begin
    Result := Value;
    Exit;
  end;
  Result := (Value + Alignment - 1) and not (Alignment - 1);
end;

function AlignDown(Value, Alignment: TSizeT): TSizeT;
begin
  if Alignment = 0 then
  begin
    Result := Value;
    Exit;
  end;
  Result := Value and not (Alignment - 1);
end;

function IsAligned(Ptr: Pointer; Alignment: TSizeT): Boolean;
begin
  if Alignment = 0 then
  begin
    Result := True;
    Exit;
  end;
  Result := (TPtrUInt(Ptr) mod Alignment) = 0;
end;

{ === BLOCK 041: Clamp implementations === }

function Clamp32(V, Lo, Hi: TInt32): TInt32;
begin
  if V < Lo then Result := Lo
  else if V > Hi then Result := Hi
  else Result := V;
end;

function ClampU32(V, Lo, Hi: TUInt32): TUInt32;
begin
  if V < Lo then Result := Lo
  else if V > Hi then Result := Hi
  else Result := V;
end;

function ClampF32(V, Lo, Hi: TFloat32): TFloat32;
begin
  if V < Lo then Result := Lo
  else if V > Hi then Result := Hi
  else Result := V;
end;

{ === BLOCK 042: CeilDiv implementations === }

function CeilDiv32(Num, Den: TUInt32): TUInt32;
begin
  if Den = 0 then
    Result := 0
  else
    Result := (Num + Den - 1) div Den;
end;

function CeilDiv64(Num, Den: TUInt64): TUInt64;
begin
  if Den = 0 then
    Result := 0
  else
    Result := (Num + Den - 1) div Den;
end;

{ === BLOCK 043: Linear index implementations === }

function LinearThreadIndex(TIdx: TThreadIdx; BDim: TBlockDim): TUInt32;
begin
  Result := TIdx.Z * BDim.Y * BDim.X + TIdx.Y * BDim.X + TIdx.X;
end;

function LinearBlockIndex(BIdx: TBlockIdx; GDim: TGridDim): TUInt32;
begin
  Result := BIdx.Z * GDim.Y * GDim.X + BIdx.Y * GDim.X + BIdx.X;
end;

function GlobalLinearIndex(TIdx: TThreadIdx; BIdx: TBlockIdx; BDim: TBlockDim; GDim: TGridDim): TUInt64;
var
  ThreadsPerBlock: TUInt32;
begin
  ThreadsPerBlock := BDim.X * BDim.Y * BDim.Z;
  Result := TUInt64(LinearBlockIndex(BIdx, GDim)) * TUInt64(ThreadsPerBlock)
          + TUInt64(LinearThreadIndex(TIdx, BDim));
end;

{ === BLOCK 044: Version implementations === }

function VersionToString(V: TVersion): AnsiString;
begin
  Result := IntToStr(V.Major) + '.' + IntToStr(V.Minor) + '.' + IntToStr(V.Patch);
end;

function VersionFromInt(Major, Minor, Patch: TUInt32): TVersion;
begin
  Result.Major := Major;
  Result.Minor := Minor;
  Result.Patch := Patch;
end;

{ === BLOCK 045: TRange implementations === }

function MakeRange(Offset, Count: TSizeT): TRange;
begin
  Result.Offset := Offset;
  Result.Count  := Count;
end;

function RangeEnd(R: TRange): TSizeT;
begin
  Result := R.Offset + R.Count;
end;

function RangeContains(R: TRange; Index: TSizeT): Boolean;
begin
  Result := (Index >= R.Offset) and (Index < (R.Offset + R.Count));
end;

{ === BLOCK 046: TRect2D implementations === }

function MakeRect2D(X, Y, W, H: TUInt32): TRect2D;
begin
  Result.X      := X;
  Result.Y      := Y;
  Result.Width  := W;
  Result.Height := H;
end;

function Rect2DContains(R: TRect2D; PX, PY: TUInt32): Boolean;
begin
  Result := (PX >= R.X) and (PX < (R.X + R.Width))
        and (PY >= R.Y) and (PY < (R.Y + R.Height));
end;

{ === BLOCK 047: TBox3D implementations === }

function MakeBox3D(X, Y, Z, W, H, D: TUInt32): TBox3D;
begin
  Result.X      := X;
  Result.Y      := Y;
  Result.Z      := Z;
  Result.Width  := W;
  Result.Height := H;
  Result.Depth  := D;
end;

function Box3DContains(B: TBox3D; PX, PY, PZ: TUInt32): Boolean;
begin
  Result := (PX >= B.X) and (PX < (B.X + B.Width))
        and (PY >= B.Y) and (PY < (B.Y + B.Height))
        and (PZ >= B.Z) and (PZ < (B.Z + B.Depth));
end;

{ === BLOCK 048: Float16 conversion implementations === }

function Float32ToFloat16(V: TFloat32): TFloat16;
var
  F32Bits: TUInt32;
  Sign:    TUInt32;
  Exp:     TInt32;
  Mant:    TUInt32;
  F16Bits: TUInt16;
begin
  Move(V, F32Bits, SizeOf(F32Bits));
  Sign := (F32Bits shr 16) and TUInt32($8000);
  Exp  := TInt32((F32Bits shr 23) and TUInt32($FF)) - 127 + 15;
  Mant := F32Bits and TUInt32($007FFFFF);

  if Exp <= 0 then
  begin
    if Exp < -10 then
      F16Bits := TUInt16(Sign)
    else
    begin
      Mant := (Mant or TUInt32($00800000)) shr TUInt32(1 - Exp);
      F16Bits := TUInt16(Sign or (Mant shr 13));
    end;
  end
  else if Exp >= 31 then
  begin
    F16Bits := TUInt16(Sign or TUInt32($7C00));
  end
  else
  begin
    F16Bits := TUInt16(Sign or TUInt32(Exp shl 10) or (Mant shr 13));
  end;

  Result.RawBits := F16Bits;
end;

function Float16ToFloat32(V: TFloat16): TFloat32;
var
  F16Bits: TUInt16;
  Sign:    TUInt32;
  Exp:     TInt32;
  Mant:    TUInt32;
  F32Bits: TUInt32;
  Ret:     TFloat32;
begin
  F16Bits := V.RawBits;
  Sign     := TUInt32((F16Bits shr 15) and TUInt16($01)) shl 31;
  Exp      := TInt32((F16Bits shr 10) and TUInt16($1F));
  Mant     := TUInt32(F16Bits and TUInt16($03FF));

  if Exp = 0 then
  begin
    if Mant = 0 then
      F32Bits := Sign
    else
    begin
      while (Mant and TUInt32($00000400)) = 0 do
      begin
        Mant := Mant shl 1;
        Dec(Exp);
      end;
      Inc(Exp);
      Mant := Mant and not TUInt32($00000400);
      F32Bits := Sign or TUInt32((Exp + 112) shl 23) or (Mant shl 13);
    end;
  end
  else if Exp = 31 then
  begin
    if Mant = 0 then
      F32Bits := Sign or TUInt32($7F800000)
    else
      F32Bits := Sign or TUInt32($7FC00000) or (Mant shl 13);
  end
  else
  begin
    F32Bits := Sign or TUInt32((Exp + 112) shl 23) or (Mant shl 13);
  end;

  Move(F32Bits, Ret, SizeOf(Ret));
  Result := Ret;
end;

{ === BLOCK 049: ByteSwap implementations === }

function ByteSwap16(V: TUInt16): TUInt16;
begin
  Result := ((V and TUInt16($00FF)) shl 8) or ((V shr 8) and TUInt16($00FF));
end;

function ByteSwap32(V: TUInt32): TUInt32;
begin
  Result := ((V and TUInt32($000000FF)) shl 24)
         or ((V and TUInt32($0000FF00)) shl 8)
         or ((V and TUInt32($00FF0000)) shr 8)
         or ((V and TUInt32($FF000000)) shr 24);
end;

function ByteSwap64(V: TUInt64): TUInt64;
var
  Lo, Hi: TUInt32;
begin
  Lo := TUInt32(V and TUInt64($FFFFFFFF));
  Hi := TUInt32(V shr 32);
  Result := (TUInt64(ByteSwap32(Lo)) shl 32) or TUInt64(ByteSwap32(Hi));
end;

{ === BLOCK 050: Global log callback implementations === }

procedure SetGlobalLogCallback(CB: TLogCallback);
begin
  GLogCallback := CB;
end;

procedure PascalGPULog(Level: TLogLevel; const Msg: AnsiString);
begin
  if Assigned(GLogCallback) then
    GLogCallback(Level, Msg);
end;

initialization
  GLogCallback := nil;

end.
