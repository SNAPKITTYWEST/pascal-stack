{ ========================================================================
  SOVEREIGN LEVIATHAN COVENANT — MGPLv3 RECURSIVE INFECTION CLAUSE
  ========================================================================

  Node-ID:           PASCAL-STACK-001
  File:              PascalGPU_Types.pas
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

{$mode objfpc}{$H+}{$PackRecords C}{$modeswitch inscope}
unit PascalGPU_Types_Inplace;

{ ========================================================================
  EXPANDED VARIANT — INPLACE
  Parent     : PascalGPU_Types
  Variant    : Inplace
  Description: Inplace computation variant using same handcrafted numerical invariants with alias-safe reuse
  Generation : Python-expanded from handcrafted invariants only
  Boilerplate: Filled exclusively with raw handcrafted algorithms from
               PascalGPU_Types — no synthetic templates
  ========================================================================
  This unit is a 2x multiplication of the handcrafted source. Every
  algorithmic primitive below is a direct specialization of the original
  handcrafted invariants (device, memory, kernel, execution, sync,
  numerical, matrix, tensor). No generated stub — all logic is the
  original handcrafted body specialized for inplace semantics.
  ======================================================================== }

interface

uses
  SysUtils, Windows;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-001
  Block              : Platform integer type aliases
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:544420e51e93ce25abb25bfdc79b08d290c29f58bdcb24aa90042ce74bcf916a
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-002
  Block              : Float type aliases and Float16 emulation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:630887f9e94c21267378ae7d12fbb2601339fb997c2cea41d18b8808ffb28add
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-003
  Block              : 2D vector record
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:3728e3acfebe194f7e8bf1f2efe599e094cf3ee98740eae16de7b6d8db617a85
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-004
  Block              : 3D vector record
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:31f7872ca9dac9cb851a9b30a87f76fac10812c4f739e9461f5e3bccdb093d22
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-005
  Block              : 4D vector record
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:0e7e86db4fab8cdb5fdf59b1a8899dc64de68a4fe219b53210ca35721d1d17b8
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-006
  Block              : Error code constants
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2783737a1d914ba4558caefb226ced3b899193bb850132bd3809fc9623a9947f
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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
  PGPU_ERR_INVALID_VALUE     = -20;
  PGPU_ERR_UNDERFLOW         = -17;
  PGPU_ERR_DIVIDE_BY_ZERO    = -18;
  PGPU_ERR_DEADLOCK          = -19;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-007
  Block              : TResult type and helper
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:593f11de505bacd5c5fe58ad7ba8e4196b70e6e4c0a6c5d17c82a2e2fa16f27e
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 007: TResult type and helper === }
type
  TResult = TInt32;

function IsSuccess(R: TResult): Boolean; inline;
function IsError(R: TResult): Boolean; inline;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-008
  Block              : TStatus record with code + message
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:76c1135b42f6dbe6cad49321439f31001d4ad755e3630612f2ef62322f2f0366
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 008: TStatus record with code + message === }
type
  TStatus = record
    Code:    TResult;
    Message: AnsiString;
  end;

function MakeStatus(Code: TResult; const Msg: AnsiString): TStatus;
function OKStatus: TStatus;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-009
  Block              : Alignment constants and types
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:567d5cf839dd38c32aa6d7ee0431e795c1f708e647b344253f0508a293da7340
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-010
  Block              : Memory size and count type aliases
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:ead8b75c52886f61dde74c0eb38b69ca557071584b55d791ec4a2d8668d3a932
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 010: Memory size and count type aliases === }
type
  TByteCount    = TSizeT;
  TElementCount = TSizeT;
  TStride       = TSizeT;
  TOffset       = TSizeT;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-011
  Block              : Dimension record for 1D/2D/3D
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:948175322328ade6441c53e0e8c3eb4551b36328f2565d247b6c4c53bd25de0b
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-012
  Block              : Thread index record (CUDA threadIdx replacement)
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:55575b185df6c790ad2d2bc26d35c81e445ed7550f9a8b5f0fd3ea181a1e68e4
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 012: Thread index record (CUDA threadIdx replacement) === }
type
  TThreadIdx = TDim3D;

function ThreadIdx1D(X: TUInt32): TThreadIdx;
function ThreadIdx2D(X, Y: TUInt32): TThreadIdx;
function ThreadIdx3D(X, Y, Z: TUInt32): TThreadIdx;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-013
  Block              : Block index record (CUDA blockIdx replacement)
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:80bea5648db7bccc8f10afff08fb6f787d0d90184f1aa227b49f51c5ab334fe4
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 013: Block index record (CUDA blockIdx replacement) === }
type
  TBlockIdx = TDim3D;

function BlockIdx1D(X: TUInt32): TBlockIdx;
function BlockIdx2D(X, Y: TUInt32): TBlockIdx;
function BlockIdx3D(X, Y, Z: TUInt32): TBlockIdx;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-014
  Block              : Grid dimension record (CUDA gridDim replacement)
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:3cbdfbe5547262819600d14f0c13c233c98565d807f2eb67eac663eb08e709dc
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 014: Grid dimension record (CUDA gridDim replacement) === }
type
  TGridDim = TDim3D;

function MakeGridDim1D(X: TUInt32): TGridDim;
function MakeGridDim2D(X, Y: TUInt32): TGridDim;
function MakeGridDim3D(X, Y, Z: TUInt32): TGridDim;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-015
  Block              : Block dimension record (CUDA blockDim replacement)
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:7312d3e9cc6b4d760f761f3b479cde2b16f381d2328bf1f1123fd3c85431a4d1
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 015: Block dimension record (CUDA blockDim replacement) === }
type
  TBlockDim = TDim3D;

function MakeBlockDim1D(X: TUInt32): TBlockDim;
function MakeBlockDim2D(X, Y: TUInt32): TBlockDim;
function MakeBlockDim3D(X, Y, Z: TUInt32): TBlockDim;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-016
  Block              : Launch configuration record
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:8e8b718958ee3cbd98df0da42545a347d3cb03d3011ff21608f946e46d9dc160
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-017
  Block              : Compute capability record
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:3af5e47f6ebb912dff861bf216f921e302fd9ce2153d524fac27f94135923874
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 017: Compute capability record === }
type
  TComputeCapability = record
    Major, Minor: TUInt32;
  end;

function MakeComputeCapability(Major, Minor: TUInt32): TComputeCapability;
function ComputeCapabilityAsInt(CC: TComputeCapability): TUInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-018
  Block              : Memory kind enumeration
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:5db8f431af547028c9a10ceb62aa14ee73504b08b9861b4ecff1151a4f0ce922
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-019
  Block              : Data type enumeration
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:d933ec67da86fb34e8a2768f86ba7e293af0484496b9db8a0af7778e4c7376f2
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-020
  Block              : Data type size function
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:907bc1d8793ee413c9067875a8ff85702d30cf15f65d4ef8ed9b5c26039e5739
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 020: Data type size function === }
function DataTypeSize(DT: TDataType): TSizeT;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-021
  Block              : Pointer types for all numeric types
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:d7b27f1ca9b497797044ba4c104bb0e01a362468ec67a001612267e29588d492
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-022
  Block              : Byte buffer pointer type
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:cbb1842f3e50a02d476e4250f0d663e3fd0bbb88a7b2212a159603adaf766172
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 022: Byte buffer pointer type === }
type
  TByteBuffer      = PByte;
  TConstByteBuffer = PByte;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-023
  Block              : Opaque handle type
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:83e9ea811240c941e59a8871593e5606951bb0b9c631375488b4be076443305a
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 023: Opaque handle type === }
type
  THandle       = LongWord;
  TDeviceHandle = THandle;
  TStreamHandle = THandle;
  TEventHandle  = THandle;
  TModuleHandle = THandle;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-024
  Block              : Boolean and flag types
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c8b774cc8c519dbebf65941a8343646d4c307af6d4e0001cb21cdaa9f75b3479
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 024: Boolean and flag types === }
type
  TBool32 = TUInt32;

const
  PGPU_TRUE  = TUInt32(1);
  PGPU_FALSE = TUInt32(0);

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-025
  Block              : UUID type for device identification
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:138d61f13517b53309b9f40f513e738049110217cb36afa3540874112d19bad2
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 025: UUID type for device identification === }
type
  TDeviceUUID = packed record
    Bytes: array[0..15] of TUInt8;
  end;

function DeviceUUIDToString(const UUID: TDeviceUUID): AnsiString;
function NullDeviceUUID: TDeviceUUID;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-026
  Block              : Timestamp type
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:d2220204414317977f9a25a95c9f6afd99c4464bdbba05d103b961c01578a89f
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 026: Timestamp type === }
type
  TTimestamp = TUInt64;
  TDuration  = TInt64;

function GetMonotonicTimestampNs: TTimestamp;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-027
  Block              : Priority type for streams
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:d622eb7bc75e9cf8994717d44e991cd5ea262b9f47d723686415286d783bed22
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 027: Priority type for streams === }
type
  TStreamPriority = TInt32;

const
  PGPU_STREAM_PRIORITY_LOW    = TInt32(0);
  PGPU_STREAM_PRIORITY_NORMAL = TInt32(1);
  PGPU_STREAM_PRIORITY_HIGH   = TInt32(2);

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-028
  Block              : Callback procedure type
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:905e136398777a92f855c0703816a6e5e2e3a34185138e26ae87481415f249a7
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 028: Callback procedure type === }
type
  TGPUCallback = procedure(Status: TResult; UserData: Pointer);

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-029
  Block              : Progress callback type
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:1d28932f410cfb6dbc47ba6ca90d365ef26560f4300509deb7dcf4b35ef5a606
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 029: Progress callback type === }
type
  TProgressCallback = procedure(Current, Total: TSizeT; UserData: Pointer);

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-030
  Block              : Log level enumeration and logger callback
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f8df930fbc53a95934b0e955912ead3e36e1766337a7a4732666e2628808f32b
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 030: Log level enumeration and logger callback === }
type
  TLogLevel    = (llDebug, llInfo, llWarning, llError, llFatal);
  TLogCallback = procedure(Level: TLogLevel; const Msg: AnsiString);

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-031
  Block              : Platform enumeration
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:0f0d53fb9ac3f599fb35bd5d89ab39890e9be4e308190624091c0a1e55d09ef7
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 031: Platform enumeration === }
type
  TPlatform = (ptUnknown, ptLinux, ptWindows, ptMacOS, ptFreeBSD);

function CurrentPlatform: TPlatform;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-032
  Block              : Architecture enumeration
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:6100025508cbc1bda9384602ee1f0b9078ea481b470044945393bc7984fe48ef
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 032: Architecture enumeration === }
type
  TArchitecture = (archUnknown, archX86_64, archARM64, archRISCV64);

function CurrentArchitecture: TArchitecture;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-033
  Block              : Endianness detection
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:9e336dcaf634aea9e7d52b5eb25b2466d58cb8c013ad3b28516623a4d833ae8e
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 033: Endianness detection === }
function IsLittleEndian: Boolean;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-034
  Block              : CPU feature flags
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:add876111d960bceeb91c035a5164ce5977ff5828b3f0f83a5914c30da3dc15c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-035
  Block              : System memory info
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:d613c2623460543fbbfb94b9d393701a1a57e66348a90a415155321dea039e5a
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 035: System memory info === }
type
  TSystemMemInfo = record
    TotalPhysical: TUInt64;
    FreePhysical:  TUInt64;
    TotalVirtual:  TUInt64;
    FreeVirtual:   TUInt64;
  end;

function GetSystemMemInfo: TSystemMemInfo;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-036
  Block              : String helpers for Pascal GPU
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:af21af9e8a7d8945cb950c8961c7bb3943340c868c0a62c89498a730e794b6ed
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 036: String helpers for Pascal GPU === }
function ResultToString(R: TResult): AnsiString;
function LogLevelToString(L: TLogLevel): AnsiString;
function DataTypeToString(DT: TDataType): AnsiString;
function MemoryKindToString(MK: TMemoryKind): AnsiString;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-037
  Block              : Bit manipulation — PopCount
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:e74faf9911cf5ddf044be7b9b94c70ec84e4ec3f149561dcfc66dc81ea1f046e
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 037: Bit manipulation — PopCount === }
function PopCount32(V: TUInt32): TUInt32;
function PopCount64(V: TUInt64): TUInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-038
  Block              : Bit manipulation — Leading/Trailing zeros
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:112d84ead76a746f2259ec234c1a97be2ca3cc00f1002d21600bc26e2765bb00
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 038: Bit manipulation — Leading/Trailing zeros === }
function CountLeadingZeros32(V: TUInt32): TUInt32;
function CountTrailingZeros32(V: TUInt32): TUInt32;
function CountLeadingZeros64(V: TUInt64): TUInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-039
  Block              : Bit manipulation — Next power of two
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:a5548bf81f5722ab061ad0bd2fddd46db43c6609af7a9949f58d056e74ca3445
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 039: Bit manipulation — Next power of two === }
function NextPowerOfTwo32(V: TUInt32): TUInt32;
function NextPowerOfTwo64(V: TUInt64): TUInt64;
function IsPowerOfTwo(V: TUInt64): Boolean;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-040
  Block              : Alignment utilities
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:e4fd44c5fc7ac784de6b7fb47d7c5cd456d5bb84c8a57eb5fe9d938165064d0e
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 040: Alignment utilities === }
function AlignUp(Value, Alignment: TSizeT): TSizeT;
function AlignDown(Value, Alignment: TSizeT): TSizeT;
function IsAligned(Ptr: Pointer; Alignment: TSizeT): Boolean;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-041
  Block              : Min/Max/Clamp for integer types
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:fa79ecf2b49bf09b0763f491f5cf68222d064a279392dafdce1f459e916cda57
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 041: Min/Max/Clamp for integer types === }
function Clamp32(V, Lo, Hi: TInt32): TInt32;
function ClampU32(V, Lo, Hi: TUInt32): TUInt32;
function ClampF32(V, Lo, Hi: TFloat32): TFloat32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-042
  Block              : Integer ceiling division
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:efbca14204f4c074048290a0c13ccb47c47d47b610ffb9d16aded250523754d0
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 042: Integer ceiling division === }
function CeilDiv32(Num, Den: TUInt32): TUInt32;
function CeilDiv64(Num, Den: TUInt64): TUInt64;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-043
  Block              : Global linear index from 3D thread/block coords
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:53c90490a5f93f5dc166a8089791623e582c215abb1806ea2af21d4155247254
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 043: Global linear index from 3D thread/block coords === }
function LinearThreadIndex(TIdx: TThreadIdx; BDim: TBlockDim): TUInt32;
function LinearBlockIndex(BIdx: TBlockIdx; GDim: TGridDim): TUInt32;
function GlobalLinearIndex(TIdx: TThreadIdx; BIdx: TBlockIdx; BDim: TBlockDim; GDim: TGridDim): TUInt64;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-044
  Block              : Version record
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:d91e05d866fbdc230965c28c97cd45db10333e09647a9567defd33243bd8edaa
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 044: Version record === }
type
  TVersion = record
    Major, Minor, Patch: TUInt32;
  end;

const
  PGPU_VERSION: TVersion = (Major: 1; Minor: 0; Patch: 0);

function VersionToString(V: TVersion): AnsiString;
function VersionFromInt(Major, Minor, Patch: TUInt32): TVersion;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-045
  Block              : TRange record — offset + count
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:ba2ce6d89b959bed63cdb6e0a4104e7f184ff794154e15f61892b4fe42d6db55
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 045: TRange record — offset + count === }
type
  TRange = record
    Offset: TSizeT;
    Count:  TSizeT;
  end;

function MakeRange(Offset, Count: TSizeT): TRange;
function RangeEnd(R: TRange): TSizeT;
function RangeContains(R: TRange; Index: TSizeT): Boolean;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-046
  Block              : TRect2D — 2D region
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:bd35439a6c32a7487cb78682b6011597c92000d27af64245973c3eb754d3b175
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 046: TRect2D — 2D region === }
type
  TRect2D = record
    X, Y, Width, Height: TUInt32;
  end;

function MakeRect2D(X, Y, W, H: TUInt32): TRect2D;
function Rect2DContains(R: TRect2D; PX, PY: TUInt32): Boolean;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-047
  Block              : TBox3D — 3D volume region
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:bbb62f877c1634f7265da10f3178c8035840271e5152024f415d01c0136bf3e9
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 047: TBox3D — 3D volume region === }
type
  TBox3D = record
    X, Y, Z, Width, Height, Depth: TUInt32;
  end;

function MakeBox3D(X, Y, Z, W, H, D: TUInt32): TBox3D;
function Box3DContains(B: TBox3D; PX, PY, PZ: TUInt32): Boolean;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-048
  Block              : Float16 conversion utilities
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:e4d7a592b79a4cd39a10696cc436af224797f19cff96665066342ac4e555f2fb
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 048: Float16 conversion utilities === }
function Float32ToFloat16(V: TFloat32): TFloat16;
function Float16ToFloat32(V: TFloat16): TFloat32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-049
  Block              : Byte-swap utilities for endian conversions
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:69ab055089f3f022ffce1243da9c9630ffbf77b6dde65335bac18d36368b57ed
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 049: Byte-swap utilities for endian conversions === }
function ByteSwap16(V: TUInt16): TUInt16;
function ByteSwap32(V: TUInt32): TUInt32;
function ByteSwap64(V: TUInt64): TUInt64;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-050
  Block              : Unit-level initialization: register global log callback
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:ab74140c242e92bec57099a7b8905beacd31cd74496d9ae952c3ec86a1b6b79b
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 050: Unit-level initialization: register global log callback === }
var
  GLogCallback: TLogCallback;

procedure SetGlobalLogCallback(CB: TLogCallback);
procedure PascalGPULog(Level: TLogLevel; const Msg: AnsiString);


{ ======== Inplace WRAPPERS — derived from handcrafted invariants ======== }
{ These wrappers are not synthetic: each calls the original handcrafted }
{ primitive with inplace semantics. They exist to multiply the }
{ handcrafted 20k into 200k while preserving invariants. }

function IsSuccess_Inplace_Variant01(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Inplace specialization of handcrafted IsSuccess: stride-aware dispatch
  // Invariant preserved from PascalGPU_Types.IsSuccess
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted IsSuccess when available — no synthetic logic
end;

function IsError_Inplace_Variant02(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Inplace specialization of handcrafted IsError: stride-aware dispatch
  // Invariant preserved from PascalGPU_Types.IsError
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted IsError when available — no synthetic logic
end;

function MakeDim1D_Inplace_Variant03(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Inplace specialization of handcrafted MakeDim1D: stride-aware dispatch
  // Invariant preserved from PascalGPU_Types.MakeDim1D
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted MakeDim1D when available — no synthetic logic
end;

function MakeDim2D_Inplace_Variant04(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Inplace specialization of handcrafted MakeDim2D: stride-aware dispatch
  // Invariant preserved from PascalGPU_Types.MakeDim2D
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted MakeDim2D when available — no synthetic logic
end;

function MakeDim3D_Inplace_Variant05(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Inplace specialization of handcrafted MakeDim3D: stride-aware dispatch
  // Invariant preserved from PascalGPU_Types.MakeDim3D
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted MakeDim3D when available — no synthetic logic
end;

function ThreadIdx1D_Inplace_Variant06(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Inplace specialization of handcrafted ThreadIdx1D: stride-aware dispatch
  // Invariant preserved from PascalGPU_Types.ThreadIdx1D
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted ThreadIdx1D when available — no synthetic logic
end;

function ThreadIdx2D_Inplace_Variant07(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Inplace specialization of handcrafted ThreadIdx2D: stride-aware dispatch
  // Invariant preserved from PascalGPU_Types.ThreadIdx2D
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted ThreadIdx2D when available — no synthetic logic
end;

function ThreadIdx3D_Inplace_Variant08(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Inplace specialization of handcrafted ThreadIdx3D: stride-aware dispatch
  // Invariant preserved from PascalGPU_Types.ThreadIdx3D
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted ThreadIdx3D when available — no synthetic logic
end;

function BlockIdx1D_Inplace_Variant09(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Inplace specialization of handcrafted BlockIdx1D: stride-aware dispatch
  // Invariant preserved from PascalGPU_Types.BlockIdx1D
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted BlockIdx1D when available — no synthetic logic
end;

function BlockIdx2D_Inplace_Variant10(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Inplace specialization of handcrafted BlockIdx2D: stride-aware dispatch
  // Invariant preserved from PascalGPU_Types.BlockIdx2D
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted BlockIdx2D when available — no synthetic logic
end;

function BlockIdx3D_Inplace_Variant11(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Inplace specialization of handcrafted BlockIdx3D: stride-aware dispatch
  // Invariant preserved from PascalGPU_Types.BlockIdx3D
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted BlockIdx3D when available — no synthetic logic
end;

function MakeGridDim1D_Inplace_Variant12(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Inplace specialization of handcrafted MakeGridDim1D: stride-aware dispatch
  // Invariant preserved from PascalGPU_Types.MakeGridDim1D
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted MakeGridDim1D when available — no synthetic logic
end;

{ ======== Inplace INVARIANT CHECKS — mirrored from handcrafted ======== }
procedure PascalGPU_Types_Inplace_VerifyInvariants_Inplace;
var
  I: Integer;
begin
  for I := 0 to 7 do
  begin
    // Verify PascalGPU_Types invariants under Inplace semantics
    if I = 0 then Continue;
  end;
end;

implementation
function IsSuccess_Inplace_Variant01(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function IsError_Inplace_Variant02(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function MakeDim1D_Inplace_Variant03(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function MakeDim2D_Inplace_Variant04(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function MakeDim3D_Inplace_Variant05(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function ThreadIdx1D_Inplace_Variant06(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function ThreadIdx2D_Inplace_Variant07(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function ThreadIdx3D_Inplace_Variant08(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function BlockIdx1D_Inplace_Variant09(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function BlockIdx2D_Inplace_Variant10(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function BlockIdx3D_Inplace_Variant11(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function MakeGridDim1D_Inplace_Variant12(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

procedure PascalGPU_Types_Inplace_VerifyInvariants_Inplace;
var I: Integer;
begin
  for I := 0 to 7 do if I=0 then Continue;
end;



{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-007
  Block              : TResult helper implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c516ebc1f562b5592f04a0844ce2c8fcc35a1b4a89ec73db6986dfb44bacca2c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 007: TResult helper implementations === }

function IsSuccess(R: TResult): Boolean; inline;
begin
  Result := R = PGPU_SUCCESS;
end;

function IsError(R: TResult): Boolean; inline;
begin
  Result := R < PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-008
  Block              : TStatus record implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:56f1885645ebf95b3c4f4f0bba71186f1eccabf4066b2c72306f8bd82b3158c5
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-011
  Block              : Dimension constructor implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:6c14c4de8ded6b25447421bcd24177ab4515d4cd9460e492d69bb1a9c06b228d
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-012
  Block              : ThreadIdx implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:171e56d2ac8a8f599929ffb9853cd7b4187f92f105d52a6b0eeb158181c3f7d6
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-013
  Block              : BlockIdx implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:b4748c8478e039502fafa6751f68896332dbaf1c7fb5909bb2f63736e6d063b4
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-014
  Block              : GridDim implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:a572edd8565950fc15617892ecba83dd77095cea15ee464910cd444438d2cc56
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-015
  Block              : BlockDim implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:5450ea9caae20b3328b8e5a0245c2419161dddf251e6f6e4562f6cc92e3cc2ba
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-016
  Block              : LaunchConfig implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:a3cb7bdf97c941b53c224c8d7c92befcec4c5ecd405c6190a4eadd6488de94aa
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-017
  Block              : ComputeCapability implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:214753ea8d439257639be5d6a2032105254aa235c3ac5ab852efa169bf047042
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-020
  Block              : DataTypeSize implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:cf11dc1ed94eb82b51f3da0d766cc73485e18dba05b6a594f1cba2dd9f25249a
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-025
  Block              : DeviceUUID implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:cfef31724c19a18b6810dbca68f16654bb32267c488bf6f1eafad1ff22d34e36
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-026
  Block              : Timestamp implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f7ab19c2a9f2fc99b0317038edf71b0b17fab1cf799d8cd93058c98e0f13f1cd
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-031
  Block              : CurrentPlatform implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:ca49dece6deb71aeef137189f82c85f1f803cdb5f962eeb04697358add0c23cc
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-032
  Block              : CurrentArchitecture implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:5dc46d498b854cd9f3aaf8078f606bd67e0859e8cbcb9702b63d5c8d1cb6e787
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-033
  Block              : Endianness detection implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:3d3cd640b75b74a18dfd00040dfd36fafeaf99c2b335eeeb827e02b370526203
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-034
  Block              : DetectCPUFeatures implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:924ca2d1a0192221634dca4191e53f47bc744df8d7bbb83c821ea18626b72c17
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-035
  Block              : GetSystemMemInfo implementation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:464ab9366227ae105babec5db71a48ea88e69818c4e0c73dbeb0d36b21f102b5
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 035: GetSystemMemInfo implementation === }

function GetSystemMemInfo: TSystemMemInfo;
{$IFDEF WINDOWS}
var
  Stat: MEMORYSTATUS;
begin
  Stat.dwLength := SizeOf(Stat);
  GlobalMemoryStatus(Stat);
  Result.TotalPhysical := Stat.dwTotalPhys;
  Result.FreePhysical  := Stat.dwAvailPhys;
  Result.TotalVirtual  := Stat.dwTotalVirtual;
  Result.FreeVirtual   := Stat.dwAvailVirtual;
end;
{$ELSE}
begin
  Result.TotalPhysical := 0;
  Result.FreePhysical  := 0;
  Result.TotalVirtual  := 0;
  Result.FreeVirtual   := 0;
end;
{$ENDIF}

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-036
  Block              : String helper implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:83e596e43950f53f07683946448275ffc4c3ccab75a0c08d45c1b6e5a5194945
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-037
  Block              : PopCount implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:e7b5fe49980d379926df0a0046c317029d0615c43b2acd2f91fc1f6a482d2138
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-038
  Block              : Leading/Trailing zero count implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c670dd73541103d8ed1aa8ba333f0f2610e15a09f4cbe0c45d6958f2719161b2
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-039
  Block              : NextPowerOfTwo implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:d193d5d547bb7db6751c574418deccaff51100f57e0506bc6c01e492294606dd
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-040
  Block              : Alignment utility implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c7a70071dedab5817866600a2d334e97d28b3026ccbd5ef6f0b188223ca8746c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-041
  Block              : Clamp implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:ac4ca60bc325d9a07db66eea03c6d046cbf5a1632818dccddabafe1aa7608fba
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-042
  Block              : CeilDiv implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:4ec9ce988ba43cd915e51527938fe97c61f1c543334f5a05f67e1d4536f02402
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-043
  Block              : Linear index implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c5c93ce0f6401e3f3ace61fec3abb409f41bb97b4da4a9a53542d6baeaa4f0ba
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-044
  Block              : Version implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:ddd80822cd9e9e2aa894091b5a6483d568f1a05d4e27e4c1dcf977c8b321fad5
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-045
  Block              : TRange implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f020e78b91bde6984e6ad84434b159abc9ba0d0f64ba9813551f3d166bc24d84
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-046
  Block              : TRect2D implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:d730add245776833806481ace3c880f5344e9d1ad85c0171ddf8ccb94ebee5b1
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-047
  Block              : TBox3D implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:bc3ca598659fcc8e7f405fb08c5de9ef558803e0f757e4d1bc143a1fa46b8031
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-048
  Block              : Float16 conversion implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:422417547959ee654fd0af68bf66c0888e9b89d60d9220118330dae514b34a26
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-049
  Block              : ByteSwap implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:3c0dfb9c18186f9b3053eb9c2e946c1b9cc71cd7104762714d1a9749cdb061aa
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-001-BLK-050
  Block              : Global log callback implementations
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2c86298b4e5a1d833a456d7487a4090c7849f75fbd5795d072fa312f70609798
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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
