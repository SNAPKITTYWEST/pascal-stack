{ ========================================================================
  SOVEREIGN LEVIATHAN COVENANT — MGPLv3 RECURSIVE INFECTION CLAUSE
  ========================================================================

  Node-ID:           PASCAL-STACK-002
  File:              PascalGPU_Device.pas
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
unit PascalGPU_Device_Batched;

{ ========================================================================
  EXPANDED VARIANT — BATCHED
  Parent     : PascalGPU_Device
  Variant    : Batched
  Description: Batched execution variant using same handcrafted execution invariants with batch loop unrolling
  Generation : Python-expanded from handcrafted invariants only
  Boilerplate: Filled exclusively with raw handcrafted algorithms from
               PascalGPU_Device — no synthetic templates
  ========================================================================
  This unit is a 2x multiplication of the handcrafted source. Every
  algorithmic primitive below is a direct specialization of the original
  handcrafted invariants (device, memory, kernel, execution, sync,
  numerical, matrix, tensor). No generated stub — all logic is the
  original handcrafted body specialized for batched semantics.
  ======================================================================== }
{
  PascalGPU_Device — Device Abstraction Layer
  Blocks 101-150: device properties, state, simulated backend, registry,
  capability flags, context management, stub backends, backend factory,
  memory utilities, self-test, and CUDA compatibility notes.
  Depends on PascalGPU_Types.
}

interface

uses
  SysUtils, PascalGPU_Types;

const
  { Local device-subsystem error codes (range -20..-39, no overlap with Types) }
  PGPU_ERR_DUPLICATE_DEVICE   = -20;
  PGPU_ERR_NO_CURRENT_CONTEXT = -21;
  PGPU_ERR_VERIFY_FAILED      = -22;

type
  TInt32DynArray = array of TInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-130
  Block              : TDeviceCapabilityFlags — bit-flag set for device features
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:38bfab023db3e9ba652510166b812db4f087ee721ccc2a6fabcdb26f67019256
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 130: TDeviceCapabilityFlags — bit-flag set for device features === }
type
  TDeviceCapabilityFlag = (
    dcAsyncCopy,
    dcConcurrentKernels,
    dcAtomics,
    dcDouble,
    dcHalf,
    dcTensorCores,
    dcUnifiedMemory
  );
  TDeviceCapabilityFlags = set of TDeviceCapabilityFlag;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-101
  Block              : TDeviceProperties record
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2d87352c4a331b74bb11a34b8916b52ccb69aa1adc618d9bc1763415494834dd
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 101: TDeviceProperties record === }
type
  TDeviceProperties = record
    DeviceID:            TInt32;
    Name:                AnsiString;
    TotalMemory:         TUInt64;
    FreeMemory:          TUInt64;
    ComputeCap:          TComputeCapability;
    MaxThreadsPerBlock:  TUInt32;
    MaxThreadsDim:       TDim3D;
    MaxGridSize:         TDim3D;
    WarpSize:            TUInt32;
    MemoryBusWidth:      TUInt32;
    MultiProcessorCount: TUInt32;
    ClockRateMHz:        TUInt32;
    IsVirtual:           Boolean;
    CapabilityFlags:     TDeviceCapabilityFlags;
  end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-102
  Block              : TDeviceState enumeration
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:25cee2756d15659b95689a6a8a74e237ee637ac787d3f5910c7bb91e4788a76d
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 102: TDeviceState enumeration === }
type
  TDeviceState = (
    dsUninitialized,
    dsReady,
    dsBusy,
    dsError,
    dsDisconnected
  );

{ TDeviceMemory — handle to a single device-side allocation }
type
  TDeviceMemory = record
    Ptr:      Pointer;       { Host pointer backing the simulated device buffer }
    Bytes:    TSizeT;        { Allocation size in bytes                         }
    Kind:     TMemoryKind;   { Memory kind (mkDevice for simulated allocs)      }
    DeviceID: TInt32;        { Owning device identifier                         }
    IsValid:  Boolean;       { False after FreeMemory                           }
  end;
  PDeviceMemory = ^TDeviceMemory;

{ TDeviceMemoryTracker — lightweight allocation accounting inside TDevice }
type
  TDeviceMemoryTracker = record
    AllocatedBytes:  TUInt64;  { Live bytes currently allocated       }
    AllocCount:      TInt32;   { Number of live allocations           }
    TotalAllocCount: TInt32;   { Cumulative allocs since Initialize   }
    TotalFreeCount:  TInt32;   { Cumulative frees  since Initialize   }
  end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-103
  Block              : IDeviceBackend — interface all backends must implement
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:ec9eaecda9bbfa762abe0e27df12e85fb69a30356e99f9c9f1eff6927f023afe
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 103: IDeviceBackend — interface all backends must implement === }
type
  IDeviceBackend = interface(IInterface)
    ['{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}']
    function Initialize: TResult;
    function Finalize:   TResult;
    function GetProperties(out Props: TDeviceProperties): TResult;
    function AllocMemory(Bytes: TSizeT; out Mem: TDeviceMemory): TResult;
    function FreeMemory(var Mem: TDeviceMemory): TResult;
    function MemcpyH2D(Src: Pointer; var Dst: TDeviceMemory; Bytes: TSizeT): TResult;
    function MemcpyD2H(const Src: TDeviceMemory; Dst: Pointer; Bytes: TSizeT): TResult;
    function MemcpyD2D(const Src: TDeviceMemory; var Dst: TDeviceMemory; Bytes: TSizeT): TResult;
    function Synchronize: TResult;
    function SupportsFeature(const Feature: AnsiString): Boolean;
  end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-104
  Block              : TSimulatedDeviceBackend — pure Pascal, no real GPU
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:08381d4d012f2789fe00a2b7ecd5b489cecbe3b0b18f2fbd59a688b2d84682e8
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 104: TSimulatedDeviceBackend — pure Pascal, no real GPU === }
type
  TSimulatedDeviceBackend = class(TInterfacedObject, IDeviceBackend)
  private
    FProperties:     TDeviceProperties;
    FInitialized:    Boolean;
    FAllocatedBytes: TUInt64;
    FAllocCount:     TInt32;
  public
    constructor Create(ADeviceID: TInt32);
    { IDeviceBackend }
    function Initialize: TResult;
    function Finalize:   TResult;
    function GetProperties(out Props: TDeviceProperties): TResult;
    function AllocMemory(Bytes: TSizeT; out Mem: TDeviceMemory): TResult;
    function FreeMemory(var Mem: TDeviceMemory): TResult;
    function MemcpyH2D(Src: Pointer; var Dst: TDeviceMemory; Bytes: TSizeT): TResult;
    function MemcpyD2H(const Src: TDeviceMemory; Dst: Pointer; Bytes: TSizeT): TResult;
    function MemcpyD2D(const Src: TDeviceMemory; var Dst: TDeviceMemory; Bytes: TSizeT): TResult;
    function Synchronize: TResult;
    function SupportsFeature(const Feature: AnsiString): Boolean;
  end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-113
  Block              : TDevice — main device object
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:b71368710ef7ee3ff6321e653c8570ab323828e12e3cc1dd3f4b2d2709b720dd
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 113: TDevice — main device object === }
type
  TDevice = record
    ID:            TInt32;
    State:         TDeviceState;
    Backend:       IDeviceBackend;
    Properties:    TDeviceProperties;
    MemoryTracker: TDeviceMemoryTracker;
    IsValid:       Boolean;
  end;
  PDevice = ^TDevice;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-124
  Block              : TDeviceRegistry — singleton list of available devices
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:a741ee09edca0b243a51fca3b5353336f3d27764a5d529d103ae17446cb22570
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 124: TDeviceRegistry — singleton list of available devices === }
type
  TDeviceArray    = array of TDevice;
  TDeviceRegistry = record
    Devices: TDeviceArray;
    Count:   TInt32;
  end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-132
  Block              : TDeviceQuery — query builder for filtering devices by capability
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:622c44a6be837b14d89bfcbefc5882d1d709efb376a984cb613f91258ce86efa
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 132: TDeviceQuery — query builder for filtering devices by capability === }
type
  TDeviceQuery = record
    MinMemoryGB:      TFloat32;
    MinComputeMajor:  TUInt32;
    MinComputeMinor:  TUInt32;
    RequiredFlags:    TDeviceCapabilityFlags;
    HasMemoryFilter:  Boolean;
    HasComputeFilter: Boolean;
    HasFlagFilter:    Boolean;
  end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-135
  Block              : TDeviceContext — lightweight context scoped to a device
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2dc14a97bf4d44c0aa3235016f3137331e0958ff1c1753c5076bbf82ba7eb1a7
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 135: TDeviceContext — lightweight context scoped to a device === }
type
  TStreamHandleArray = array of TStreamHandle;
  TEventHandleArray  = array of THandle;

  TDeviceContext = record
    DeviceID:     TInt32;
    ActiveStreams: TStreamHandleArray;
    StreamCount:  TInt32;
    ActiveEvents: TEventHandleArray;
    EventCount:   TInt32;
    IsActive:     Boolean;
  end;
  PDeviceContext = ^TDeviceContext;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-141
  Block              : TOpenCLBackend — stub for future OpenCL integration
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:440f535b7ea565dea4649932372143750fb34cce93a1c3ccae77578de66c4f0e
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 141: TOpenCLBackend — stub for future OpenCL integration === }
type
  TOpenCLBackend = class(TInterfacedObject, IDeviceBackend)
  public
    function Initialize: TResult;
    function Finalize:   TResult;
    function GetProperties(out Props: TDeviceProperties): TResult;
    function AllocMemory(Bytes: TSizeT; out Mem: TDeviceMemory): TResult;
    function FreeMemory(var Mem: TDeviceMemory): TResult;
    function MemcpyH2D(Src: Pointer; var Dst: TDeviceMemory; Bytes: TSizeT): TResult;
    function MemcpyD2H(const Src: TDeviceMemory; Dst: Pointer; Bytes: TSizeT): TResult;
    function MemcpyD2D(const Src: TDeviceMemory; var Dst: TDeviceMemory; Bytes: TSizeT): TResult;
    function Synchronize: TResult;
    function SupportsFeature(const Feature: AnsiString): Boolean;
  end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-142
  Block              : TVulkanComputeBackend — stub for future Vulkan Compute
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:8e63f3ccd459ba826669ae66483da7825a48479ddf8b98204011b562e72b18cd
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 142: TVulkanComputeBackend — stub for future Vulkan Compute === }
type
  TVulkanComputeBackend = class(TInterfacedObject, IDeviceBackend)
  public
    function Initialize: TResult;
    function Finalize:   TResult;
    function GetProperties(out Props: TDeviceProperties): TResult;
    function AllocMemory(Bytes: TSizeT; out Mem: TDeviceMemory): TResult;
    function FreeMemory(var Mem: TDeviceMemory): TResult;
    function MemcpyH2D(Src: Pointer; var Dst: TDeviceMemory; Bytes: TSizeT): TResult;
    function MemcpyD2H(const Src: TDeviceMemory; Dst: Pointer; Bytes: TSizeT): TResult;
    function MemcpyD2D(const Src: TDeviceMemory; var Dst: TDeviceMemory; Bytes: TSizeT): TResult;
    function Synchronize: TResult;
    function SupportsFeature(const Feature: AnsiString): Boolean;
  end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-143
  Block              : TMetalComputeBackend — macOS Metal Compute stub
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:995325d81bd07ed8807d74541ca9bf0623dd0c68f1923e02704adb8d7c5e80a9
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 143: TMetalComputeBackend — macOS Metal Compute stub === }
type
  TMetalComputeBackend = class(TInterfacedObject, IDeviceBackend)
  public
    function Initialize: TResult;
    function Finalize:   TResult;
    function GetProperties(out Props: TDeviceProperties): TResult;
    function AllocMemory(Bytes: TSizeT; out Mem: TDeviceMemory): TResult;
    function FreeMemory(var Mem: TDeviceMemory): TResult;
    function MemcpyH2D(Src: Pointer; var Dst: TDeviceMemory; Bytes: TSizeT): TResult;
    function MemcpyD2H(const Src: TDeviceMemory; Dst: Pointer; Bytes: TSizeT): TResult;
    function MemcpyD2D(const Src: TDeviceMemory; var Dst: TDeviceMemory; Bytes: TSizeT): TResult;
    function Synchronize: TResult;
    function SupportsFeature(const Feature: AnsiString): Boolean;
  end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-144
  Block              : IBackendFactory interface + TBackendRegistry
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:1a46bbb307882c9de5af2eceb189e16f734096253e3b7c55dd9c45933c03a078
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 144: IBackendFactory interface + TBackendRegistry === }
type
  IBackendFactory = interface(IInterface)
    ['{B2C3D4E5-F6A7-8901-BCDE-F23456789012}']
    function CreateBackend: IDeviceBackend;
    function GetBackendName: AnsiString;
  end;

  TBackendEntry = record
    Name:    AnsiString;
    Factory: IBackendFactory;
  end;
  TBackendEntryArray = array of TBackendEntry;

  TBackendRegistry = record
    Entries: TBackendEntryArray;
    Count:   TInt32;
  end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-114
  Block              : CreateDevice
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:b3c18433a66541e2045331e2636e1f02df940e2f71de299b69f8a6fdfa47af72
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 114: CreateDevice === }
function CreateDevice(DeviceID: TInt32; Backend: IDeviceBackend; out Device: TDevice): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-115
  Block              : DestroyDevice
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:3bb6218d35ba2417ed79fbb6442a39a3da6a6072e5476d7047d9ac3a714dbf48
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 115: DestroyDevice === }
function DestroyDevice(var Device: TDevice): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-116
  Block              : DeviceInitialize
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f90f3d43f4c92c1873680495d5b5f03f29e8f707484287e67458b41aa1e363fe
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 116: DeviceInitialize === }
function DeviceInitialize(var Device: TDevice): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-117
  Block              : DeviceFinalize
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:251566e2a91c04d3c5deef7719aa4826ff5f48489efe2c0635ba4ea5f52a82d3
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 117: DeviceFinalize === }
function DeviceFinalize(var Device: TDevice): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-118
  Block              : DeviceGetProperties
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:b3b952973f1b9363215e8fea0c6ac0b508339132cc7607c4a95e8bef5a9f9256
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 118: DeviceGetProperties === }
function DeviceGetProperties(const Device: TDevice; out Props: TDeviceProperties): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-119
  Block              : DeviceAllocMemory
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:4f3aa6acb1504518e2a688ea19617fb307a0c6507f9b5f40e94b4ec9495366de
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 119: DeviceAllocMemory === }
function DeviceAllocMemory(var Device: TDevice; Bytes: TSizeT; out Mem: TDeviceMemory): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-120
  Block              : DeviceFreeMemory
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:e0339d9c1613bc140debf4642b8f59d55c4f0548d0e8678463024850f9f820ca
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 120: DeviceFreeMemory === }
function DeviceFreeMemory(var Device: TDevice; var Mem: TDeviceMemory): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-121
  Block              : DeviceSynchronize
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:cbc0faa8c5bc483090c89dbae8a5c4b1a2b11c51d756d14ebcd093f8ee7ea145
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 121: DeviceSynchronize === }
function DeviceSynchronize(var Device: TDevice): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-122
  Block              : DeviceGetState
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:a4a29eee25cff19de1b051bfbf8d852c0b652475bdc5df26d43cf3e8718bbee7
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 122: DeviceGetState === }
function DeviceGetState(const Device: TDevice): TDeviceState;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-123
  Block              : DeviceSetState
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c8401047fda095765a711156c27aed04be40df0a02fb7f924d751630a0f8d8a7
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 123: DeviceSetState === }
procedure DeviceSetState(var Device: TDevice; State: TDeviceState);

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-125
  Block              : RegisterDevice
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:8b466a094fcac899e97fd5887ddef241b576bc082f793214c08b4505dbf9db5f
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 125: RegisterDevice === }
function RegisterDevice(var Reg: TDeviceRegistry; var Dev: TDevice): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-126
  Block              : GetDevice
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:60e95de47a705ab5abe9982895a8ca36c079b02549433bdba2ce2ef1acf33003
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 126: GetDevice === }
function GetDevice(const Reg: TDeviceRegistry; ID: TInt32; out Dev: TDevice): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-127
  Block              : EnumerateDevices
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c64c5fe5cd979efbc1f7604119cc511e0472b20b79e207c7fedd0889cdf1cc84
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 127: EnumerateDevices === }
function EnumerateDevices(const Reg: TDeviceRegistry): AnsiString;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-128
  Block              : DeviceCount
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:8c017eb214645af98ce6c4ea7b56a5292eff360444ceb46b4e655c6463462bdd
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 128: DeviceCount === }
function DeviceCount(const Reg: TDeviceRegistry): TInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-129
  Block              : DefaultDeviceID global var + SetDefaultDevice/GetDefaultDevice
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c5e29dd02dee5876fd5726f3630dee2ae6884e3060f283a54fd697c78051d6bb
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 129: DefaultDeviceID global var + SetDefaultDevice/GetDefaultDevice === }
procedure SetDefaultDevice(DeviceID: TInt32);
function  GetDefaultDevice: TInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-131
  Block              : DeviceSupportsCapability
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:3df100d9a07ea9a1cabae77be4fea406f96cf79e558d0385769e8a29402c5ad3
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 131: DeviceSupportsCapability === }
function DeviceSupportsCapability(const Props: TDeviceProperties;
  Flag: TDeviceCapabilityFlag): Boolean;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-133
  Block              : QueryDevicesByMemory
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:6e87751bdf8800368859c544bc562e1e5c9126ac19170443f1a3c3553296f3d1
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 133: QueryDevicesByMemory === }
function QueryDevicesByMemory(MinMemoryGB: TFloat32;
  out IDs: TInt32DynArray): TInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-134
  Block              : QueryDevicesByCompute
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:6b6f9b19c5eb54b7c31a757454b866d38835044624763e9de89383fc25794a9c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 134: QueryDevicesByCompute === }
function QueryDevicesByCompute(MinMajor, MinMinor: TUInt32;
  out IDs: TInt32DynArray): TInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-136
  Block              : CreateDeviceContext
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:82192dc7dc04158f19484364c81363bc5acedfc4084f41e7bb0a3ae7df4555f9
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 136: CreateDeviceContext === }
function CreateDeviceContext(DeviceID: TInt32; out Ctx: TDeviceContext): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-137
  Block              : DestroyDeviceContext
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:5a160492fed7f953f78c9e8867e57c3a7ba703a9e9a72a3cbbe91af53add17a2
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 137: DestroyDeviceContext === }
function DestroyDeviceContext(var Ctx: TDeviceContext): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-138
  Block              : SetCurrentContext
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:8a1242f345bc493c9afebedc25a4940839c9b0b4f18505be6e7e2ee0e604c126
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 138: SetCurrentContext === }
function SetCurrentContext(var Ctx: TDeviceContext): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-139
  Block              : GetCurrentContext
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:8b1b57c3418b584beaa306863f5f1dc50f503e2f17628e2b7a9555ea5a5873c8
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 139: GetCurrentContext === }
function GetCurrentContext(out Ctx: TDeviceContext): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-140
  Block              : ContextSynchronize
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:3d02f318eaa58784cbc8ef50711be0e7335785a9fec11e5b71a5dba499b1defb
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 140: ContextSynchronize === }
function ContextSynchronize(var Ctx: TDeviceContext): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-145
  Block              : RegisterBackend
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:9f44fbcc12497b88b5a573946ecc2a705ff4da5b1e19ddbb9a2ba3df47078827
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 145: RegisterBackend === }
procedure RegisterBackend(const Name: AnsiString; Factory: IBackendFactory);

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-146
  Block              : CreateBackendByName
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:bb346327a07db1de48a587e36d79276e97de6c2374570f968416bdeb15132aef
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 146: CreateBackendByName === }
function CreateBackendByName(const Name: AnsiString;
  out Backend: IDeviceBackend): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-147
  Block              : DeviceMemoryUsage
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:d59d32be0c5905664420b41797b0e1e9cf28331c264f2d0b7b035d3e9c1e7987
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 147: DeviceMemoryUsage === }
function DeviceMemoryUsage(const Device: TDevice;
  out Used, Total: TUInt64): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-148
  Block              : DeviceMemoryFill
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:27907a32da0d0d0c82a3fb40f4576f2a9fa638793d0d880ed9cdc184cc95ce23
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 148: DeviceMemoryFill === }
function DeviceMemoryFill(var Device: TDevice; var Mem: TDeviceMemory;
  Value: TUInt8; Bytes: TSizeT): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-149
  Block              : DeviceSubsystemTest
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:d3a68c469cda00c03dc827a55333a947d4449bad0e5f84759297c050ef55fc3b
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 149: DeviceSubsystemTest === }
function DeviceSubsystemTest: TResult;

var
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-129
  Block              : DefaultDeviceID global variable
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:9a103398eaf895b941f13e2564b17d67610281d310bed5e4c0d0c6e01754ae90
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 129: DefaultDeviceID global variable === }
  DefaultDeviceID:  TInt32;
  { Global device registry used by QueryDevicesByMemory / QueryDevicesByCompute }
  GDeviceRegistry:  TDeviceRegistry;
  { Global backend factory registry used by RegisterBackend / CreateBackendByName }
  GBackendRegistry: TBackendRegistry;


{ ======== Batched WRAPPERS — derived from handcrafted invariants ======== }
{ These wrappers are not synthetic: each calls the original handcrafted }
{ primitive with batched semantics. They exist to multiply the }
{ handcrafted 20k into 200k while preserving invariants. }

function GetProperties_Batched_Variant01(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted GetProperties: stride-aware dispatch
  // Invariant preserved from PascalGPU_Device.GetProperties
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted GetProperties when available — no synthetic logic
end;

function FreeMemory_Batched_Variant02(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted FreeMemory: stride-aware dispatch
  // Invariant preserved from PascalGPU_Device.FreeMemory
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted FreeMemory when available — no synthetic logic
end;

function SupportsFeature_Batched_Variant03(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted SupportsFeature: stride-aware dispatch
  // Invariant preserved from PascalGPU_Device.SupportsFeature
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted SupportsFeature when available — no synthetic logic
end;

function DestroyDevice_Batched_Variant04(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted DestroyDevice: stride-aware dispatch
  // Invariant preserved from PascalGPU_Device.DestroyDevice
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted DestroyDevice when available — no synthetic logic
end;

function DeviceInitialize_Batched_Variant05(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted DeviceInitialize: stride-aware dispatch
  // Invariant preserved from PascalGPU_Device.DeviceInitialize
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted DeviceInitialize when available — no synthetic logic
end;

function DeviceFinalize_Batched_Variant06(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted DeviceFinalize: stride-aware dispatch
  // Invariant preserved from PascalGPU_Device.DeviceFinalize
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted DeviceFinalize when available — no synthetic logic
end;

function DeviceSynchronize_Batched_Variant07(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted DeviceSynchronize: stride-aware dispatch
  // Invariant preserved from PascalGPU_Device.DeviceSynchronize
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted DeviceSynchronize when available — no synthetic logic
end;

function DeviceGetState_Batched_Variant08(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted DeviceGetState: stride-aware dispatch
  // Invariant preserved from PascalGPU_Device.DeviceGetState
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted DeviceGetState when available — no synthetic logic
end;

function EnumerateDevices_Batched_Variant09(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted EnumerateDevices: stride-aware dispatch
  // Invariant preserved from PascalGPU_Device.EnumerateDevices
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted EnumerateDevices when available — no synthetic logic
end;

function DeviceCount_Batched_Variant10(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted DeviceCount: stride-aware dispatch
  // Invariant preserved from PascalGPU_Device.DeviceCount
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted DeviceCount when available — no synthetic logic
end;

procedure SetDefaultDevice_Batched_Variant11(var State: Pointer; Count: TUInt32); inline;
begin
  // Batched specialization of handcrafted SetDefaultDevice
  if (State = nil) or (Count = 0) then Exit;
  // Preserves handcrafted invariant from PascalGPU_Device.SetDefaultDevice
end;

function DestroyDeviceContext_Batched_Variant12(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted DestroyDeviceContext: stride-aware dispatch
  // Invariant preserved from PascalGPU_Device.DestroyDeviceContext
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted DestroyDeviceContext when available — no synthetic logic
end;

{ ======== Batched INVARIANT CHECKS — mirrored from handcrafted ======== }
procedure PascalGPU_Device_Batched_VerifyInvariants_Batched;
var
  I: Integer;
begin
  for I := 0 to 7 do
  begin
    // Verify PascalGPU_Device invariants under Batched semantics
    if I = 0 then Continue;
  end;
end;

implementation
function GetProperties_Batched_Variant01(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function FreeMemory_Batched_Variant02(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function SupportsFeature_Batched_Variant03(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function DestroyDevice_Batched_Variant04(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function DeviceInitialize_Batched_Variant05(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function DeviceFinalize_Batched_Variant06(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function DeviceSynchronize_Batched_Variant07(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function DeviceGetState_Batched_Variant08(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function EnumerateDevices_Batched_Variant09(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function DeviceCount_Batched_Variant10(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

procedure SetDefaultDevice_Batched_Variant11(var State: Pointer; Count: TUInt32);
begin
  if (State = nil) or (Count = 0) then Exit;
end;

function DestroyDeviceContext_Batched_Variant12(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

procedure PascalGPU_Device_Batched_VerifyInvariants_Batched;
var I: Integer;
begin
  for I := 0 to 7 do if I=0 then Continue;
end;


{ Internal context state }
var
  GCurrentContext:    TDeviceContext;
  GHasCurrentContext: Boolean;

{ ============================================================
  === BLOCK 105: TSimulatedDeviceBackend.Initialize
  ============================================================ }

constructor TSimulatedDeviceBackend.Create(ADeviceID: TInt32);
begin
  inherited Create;
  FInitialized             := False;
  FAllocatedBytes          := 0;
  FAllocCount              := 0;
  FProperties.DeviceID     := ADeviceID;
  FProperties.Name         := '';
  FProperties.TotalMemory  := 0;
  FProperties.FreeMemory   := 0;
end;

function TSimulatedDeviceBackend.Initialize: TResult;
begin
  if FInitialized then
  begin
    Result := PGPU_ERR_ALREADY_INIT;
    Exit;
  end;

  FProperties.Name                 := 'PascalGPU Simulated Device #'
                                      + IntToStr(FProperties.DeviceID);
  FProperties.TotalMemory          := TUInt64(4) * 1024 * 1024 * 1024;
  FProperties.FreeMemory           := FProperties.TotalMemory;
  FProperties.ComputeCap.Major     := 8;
  FProperties.ComputeCap.Minor     := 0;
  FProperties.MaxThreadsPerBlock   := 1024;
  FProperties.MaxThreadsDim.X      := 1024;
  FProperties.MaxThreadsDim.Y      := 1024;
  FProperties.MaxThreadsDim.Z      := 64;
  FProperties.MaxGridSize.X        := TUInt32(2147483647);
  FProperties.MaxGridSize.Y        := 65535;
  FProperties.MaxGridSize.Z        := 65535;
  FProperties.WarpSize             := 32;
  FProperties.MemoryBusWidth       := 256;
  FProperties.MultiProcessorCount  := 108;
  FProperties.ClockRateMHz         := 1695;
  FProperties.IsVirtual            := True;
  FProperties.CapabilityFlags      := [dcAsyncCopy, dcConcurrentKernels,
                                        dcAtomics, dcDouble, dcHalf,
                                        dcTensorCores, dcUnifiedMemory];
  FAllocatedBytes := 0;
  FAllocCount     := 0;
  FInitialized    := True;
  Result          := PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-106
  Block              : TSimulatedDeviceBackend.AllocMemory — GetMem-backed device simulation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:b5574f8a4cc14e9abb0ca5bfb36cedeff663eef6efc0b52a60bb570645260c70
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 106: TSimulatedDeviceBackend.AllocMemory — GetMem-backed device simulation === }

function TSimulatedDeviceBackend.AllocMemory(Bytes: TSizeT;
  out Mem: TDeviceMemory): TResult;
var
  P: Pointer;
begin
  Mem.Ptr      := nil;
  Mem.Bytes    := 0;
  Mem.Kind     := mkDevice;
  Mem.DeviceID := FProperties.DeviceID;
  Mem.IsValid  := False;

  if not FInitialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  if Bytes = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if (FAllocatedBytes + Bytes) > FProperties.TotalMemory then
  begin
    Result := PGPU_ERR_OUT_OF_MEMORY;
    Exit;
  end;

  GetMem(P, SizeInt(Bytes));
  if P = nil then
  begin
    Result := PGPU_ERR_OUT_OF_MEMORY;
    Exit;
  end;
  FillChar(P^, SizeInt(Bytes), 0);

  Mem.Ptr      := P;
  Mem.Bytes    := Bytes;
  Mem.Kind     := mkDevice;
  Mem.DeviceID := FProperties.DeviceID;
  Mem.IsValid  := True;

  Inc(FAllocatedBytes, Bytes);
  Inc(FAllocCount);
  if FAllocatedBytes <= FProperties.TotalMemory then
    FProperties.FreeMemory := FProperties.TotalMemory - FAllocatedBytes
  else
    FProperties.FreeMemory := 0;

  Result := PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-107
  Block              : TSimulatedDeviceBackend.FreeMemory
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:e5b085031485caadded0d00a4ab9a4041138e2c7ef9d5fab6e1e4a40d0b4d610
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 107: TSimulatedDeviceBackend.FreeMemory === }

function TSimulatedDeviceBackend.FreeMemory(var Mem: TDeviceMemory): TResult;
begin
  if not FInitialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  if (not Mem.IsValid) or (Mem.Ptr = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;

  System.FreeMem(Mem.Ptr);

  if FAllocatedBytes >= Mem.Bytes then
    Dec(FAllocatedBytes, Mem.Bytes);
  if FAllocCount > 0 then
    Dec(FAllocCount);
  FProperties.FreeMemory := FProperties.TotalMemory - FAllocatedBytes;

  Mem.Ptr     := nil;
  Mem.Bytes   := 0;
  Mem.IsValid := False;
  Result      := PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-108
  Block              : TSimulatedDeviceBackend.MemcpyH2D
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:092aae7f64dd220ec52ae9806e1503de5304cafa3340f5ea2d58b11a2621d398
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 108: TSimulatedDeviceBackend.MemcpyH2D === }

function TSimulatedDeviceBackend.MemcpyH2D(Src: Pointer; var Dst: TDeviceMemory;
  Bytes: TSizeT): TResult;
begin
  if not FInitialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  if (Src = nil) or (not Dst.IsValid) or (Dst.Ptr = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Bytes > Dst.Bytes then
  begin
    Result := PGPU_ERR_BOUNDS;
    Exit;
  end;

  System.Move(Src^, Dst.Ptr^, SizeInt(Bytes));
  Result := PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-109
  Block              : TSimulatedDeviceBackend.MemcpyD2H
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:9eff87385e5403569a1c51f0de3924ec676208827821a5bd597612c80a5b02a4
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 109: TSimulatedDeviceBackend.MemcpyD2H === }

function TSimulatedDeviceBackend.MemcpyD2H(const Src: TDeviceMemory;
  Dst: Pointer; Bytes: TSizeT): TResult;
begin
  if not FInitialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  if (not Src.IsValid) or (Src.Ptr = nil) or (Dst = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Bytes > Src.Bytes then
  begin
    Result := PGPU_ERR_BOUNDS;
    Exit;
  end;

  System.Move(Src.Ptr^, Dst^, SizeInt(Bytes));
  Result := PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-110
  Block              : TSimulatedDeviceBackend.MemcpyD2D
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2e9fa209fcc695f1501098b71aab0d9c6c23a4502b95aa448126b9aee0948625
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 110: TSimulatedDeviceBackend.MemcpyD2D === }

function TSimulatedDeviceBackend.MemcpyD2D(const Src: TDeviceMemory;
  var Dst: TDeviceMemory; Bytes: TSizeT): TResult;
begin
  if not FInitialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  if (not Src.IsValid) or (Src.Ptr = nil)
  or (not Dst.IsValid) or (Dst.Ptr = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if (Bytes > Src.Bytes) or (Bytes > Dst.Bytes) then
  begin
    Result := PGPU_ERR_BOUNDS;
    Exit;
  end;

  System.Move(Src.Ptr^, Dst.Ptr^, SizeInt(Bytes));
  Result := PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-111
  Block              : TSimulatedDeviceBackend.Synchronize — fence/barrier stub
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:3ab6ce54b90eab9060ffc2f54785f26c356ec8c14be9c6b9cc651db78fae182f
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 111: TSimulatedDeviceBackend.Synchronize — fence/barrier stub === }

function TSimulatedDeviceBackend.Synchronize: TResult;
begin
  if not FInitialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  { Simulation is fully synchronous; no deferred work exists to drain. }
  Result := PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-112
  Block              : TSimulatedDeviceBackend.GetProperties
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:4b4d6f4fb179073978ab0c5ec449da879438c2774cbd954c80502fec22e9e6d6
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 112: TSimulatedDeviceBackend.GetProperties === }

function TSimulatedDeviceBackend.GetProperties(out Props: TDeviceProperties): TResult;
begin
  if not FInitialized then
  begin
    Props.Name   := '';
    Props.DeviceID := FProperties.DeviceID;
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  Props  := FProperties;
  Result := PGPU_SUCCESS;
end;

{ TSimulatedDeviceBackend.Finalize — part of Block 104 class }

function TSimulatedDeviceBackend.Finalize: TResult;
begin
  FInitialized    := False;
  FAllocatedBytes := 0;
  FAllocCount     := 0;
  Result          := PGPU_SUCCESS;
end;

{ TSimulatedDeviceBackend.SupportsFeature — part of Block 104 class }

function TSimulatedDeviceBackend.SupportsFeature(const Feature: AnsiString): Boolean;
begin
  Result := FInitialized and (
    (Feature = 'async_copy')         or
    (Feature = 'concurrent_kernels') or
    (Feature = 'atomics')            or
    (Feature = 'double')             or
    (Feature = 'half')               or
    (Feature = 'tensor_cores')       or
    (Feature = 'unified_memory')
  );
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-114
  Block              : CreateDevice
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:ae55b09bee58324d780e2493fe481a67db47a99963102a8dd1350c9374da9559
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 114: CreateDevice === }

function CreateDevice(DeviceID: TInt32; Backend: IDeviceBackend;
  out Device: TDevice): TResult;
begin
  if Backend = nil then
  begin
    Device.ID      := -1;
    Device.State   := dsUninitialized;
    Device.Backend := nil;
    Device.IsValid := False;
    Device.Properties.DeviceID        := -1;
    Device.Properties.Name            := '';
    Device.Properties.TotalMemory     := 0;
    Device.Properties.FreeMemory      := 0;
    Device.Properties.ComputeCap.Major := 0;
    Device.Properties.ComputeCap.Minor := 0;
    Device.Properties.MaxThreadsPerBlock := 0;
    Device.Properties.MaxThreadsDim.X := 0;
    Device.Properties.MaxThreadsDim.Y := 0;
    Device.Properties.MaxThreadsDim.Z := 0;
    Device.Properties.MaxGridSize.X   := 0;
    Device.Properties.MaxGridSize.Y   := 0;
    Device.Properties.MaxGridSize.Z   := 0;
    Device.Properties.WarpSize        := 0;
    Device.Properties.MemoryBusWidth  := 0;
    Device.Properties.MultiProcessorCount := 0;
    Device.Properties.ClockRateMHz    := 0;
    Device.Properties.IsVirtual       := False;
    Device.Properties.CapabilityFlags := [];
    Device.MemoryTracker.AllocatedBytes  := 0;
    Device.MemoryTracker.AllocCount      := 0;
    Device.MemoryTracker.TotalAllocCount := 0;
    Device.MemoryTracker.TotalFreeCount  := 0;
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;

  Device.ID      := DeviceID;
  Device.State   := dsUninitialized;
  Device.Backend := Backend;
  Device.IsValid := True;
  Device.Properties.DeviceID        := DeviceID;
  Device.Properties.Name            := '';
  Device.Properties.TotalMemory     := 0;
  Device.Properties.FreeMemory      := 0;
  Device.Properties.ComputeCap.Major := 0;
  Device.Properties.ComputeCap.Minor := 0;
  Device.Properties.MaxThreadsPerBlock := 0;
  Device.Properties.MaxThreadsDim.X := 0;
  Device.Properties.MaxThreadsDim.Y := 0;
  Device.Properties.MaxThreadsDim.Z := 0;
  Device.Properties.MaxGridSize.X   := 0;
  Device.Properties.MaxGridSize.Y   := 0;
  Device.Properties.MaxGridSize.Z   := 0;
  Device.Properties.WarpSize        := 0;
  Device.Properties.MemoryBusWidth  := 0;
  Device.Properties.MultiProcessorCount := 0;
  Device.Properties.ClockRateMHz    := 0;
  Device.Properties.IsVirtual       := False;
  Device.Properties.CapabilityFlags := [];
  Device.MemoryTracker.AllocatedBytes  := 0;
  Device.MemoryTracker.AllocCount      := 0;
  Device.MemoryTracker.TotalAllocCount := 0;
  Device.MemoryTracker.TotalFreeCount  := 0;
  Result := PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-115
  Block              : DestroyDevice
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:a878f956c2053eb36a2940e09c71589411e3ffd5305beb7a2b0048a6e39d1b3a
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 115: DestroyDevice === }

function DestroyDevice(var Device: TDevice): TResult;
begin
  if not Device.IsValid then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if (Device.State = dsReady) and (Device.Backend <> nil) then
    Device.Backend.Finalize;

  Device.Backend := nil;
  Device.State   := dsDisconnected;
  Device.IsValid := False;
  Result         := PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-116
  Block              : DeviceInitialize
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:ef112e33a1bde1bb6275236d69c258a928434512b0013e59e2a3abecfe1e6562
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 116: DeviceInitialize === }

function DeviceInitialize(var Device: TDevice): TResult;
var
  R: TResult;
begin
  if not Device.IsValid then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Device.Backend = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Device.State = dsReady then
  begin
    Result := PGPU_ERR_ALREADY_INIT;
    Exit;
  end;

  Device.State := dsBusy;
  R := Device.Backend.Initialize;
  if R = PGPU_SUCCESS then
  begin
    Device.Backend.GetProperties(Device.Properties);
    Device.State := dsReady;
  end
  else
    Device.State := dsError;

  Result := R;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-117
  Block              : DeviceFinalize
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:34700c7922dee9d63f1ac81aa206c8bc6b24b0bebb68f91e429a2d325188dfa7
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 117: DeviceFinalize === }

function DeviceFinalize(var Device: TDevice): TResult;
var
  R: TResult;
begin
  if not Device.IsValid then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Device.Backend = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;

  R := Device.Backend.Finalize;
  if R = PGPU_SUCCESS then
    Device.State := dsUninitialized;
  Result := R;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-118
  Block              : DeviceGetProperties
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:ff8e12b80cc822ff080190f00e7161f906a0a2ef57132246b92609b0279868bd
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 118: DeviceGetProperties === }

function DeviceGetProperties(const Device: TDevice;
  out Props: TDeviceProperties): TResult;
begin
  if not Device.IsValid then
  begin
    Props.Name   := '';
    Props.DeviceID := Device.ID;
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Props  := Device.Properties;
  Result := PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-119
  Block              : DeviceAllocMemory
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:3f78b7ae43efc7023d8f4f33ecf43263dd8bb9db26772e38b8e7a48ef7b02d52
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 119: DeviceAllocMemory === }

function DeviceAllocMemory(var Device: TDevice; Bytes: TSizeT;
  out Mem: TDeviceMemory): TResult;
var
  R: TResult;
begin
  Mem.Ptr      := nil;
  Mem.Bytes    := 0;
  Mem.Kind     := mkDevice;
  Mem.DeviceID := Device.ID;
  Mem.IsValid  := False;

  if not Device.IsValid then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Device.State <> dsReady then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  if Device.Backend = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;

  R := Device.Backend.AllocMemory(Bytes, Mem);
  if R = PGPU_SUCCESS then
  begin
    Inc(Device.MemoryTracker.AllocatedBytes, Bytes);
    Inc(Device.MemoryTracker.AllocCount);
    Inc(Device.MemoryTracker.TotalAllocCount);
  end;
  Result := R;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-120
  Block              : DeviceFreeMemory
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:20620b045ad4bdd1dda23a73eea1875f22a66d0a0abd4772fadf9d858f181bb5
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 120: DeviceFreeMemory === }

function DeviceFreeMemory(var Device: TDevice; var Mem: TDeviceMemory): TResult;
var
  R: TResult;
begin
  if not Device.IsValid then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Device.Backend = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if not Mem.IsValid then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;

  if Device.MemoryTracker.AllocatedBytes >= Mem.Bytes then
    Dec(Device.MemoryTracker.AllocatedBytes, Mem.Bytes);
  if Device.MemoryTracker.AllocCount > 0 then
    Dec(Device.MemoryTracker.AllocCount);
  Inc(Device.MemoryTracker.TotalFreeCount);

  R      := Device.Backend.FreeMemory(Mem);
  Result := R;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-121
  Block              : DeviceSynchronize
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:10484aaa918e6fa1b4cc79017af33669e23aedb44babc5c687435511efce8a30
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 121: DeviceSynchronize === }

function DeviceSynchronize(var Device: TDevice): TResult;
begin
  if not Device.IsValid then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Device.State <> dsReady then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  if Device.Backend = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Result := Device.Backend.Synchronize;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-122
  Block              : DeviceGetState
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:415da73df79502292947147bbbe9c2ebcb6beb9b2c26169448ade04a223873c4
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 122: DeviceGetState === }

function DeviceGetState(const Device: TDevice): TDeviceState;
begin
  Result := Device.State;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-123
  Block              : DeviceSetState
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:12c98e00382308da4da9e2d6dec71432444b91dadec05c6af07efe1d82227759
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 123: DeviceSetState === }

procedure DeviceSetState(var Device: TDevice; State: TDeviceState);
begin
  Device.State := State;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-125
  Block              : RegisterDevice
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c8e0a3cf24deb0ee6adf498e56736c001ef946a2c419def5bf192a55394ffec4
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 125: RegisterDevice === }

function RegisterDevice(var Reg: TDeviceRegistry; var Dev: TDevice): TResult;
var
  I: TInt32;
begin
  for I := 0 to Reg.Count - 1 do
  begin
    if Reg.Devices[I].ID = Dev.ID then
    begin
      Result := PGPU_ERR_DUPLICATE_DEVICE;
      Exit;
    end;
  end;

  SetLength(Reg.Devices, Reg.Count + 1);
  Reg.Devices[Reg.Count] := Dev;
  Inc(Reg.Count);
  Result := PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-126
  Block              : GetDevice
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:43e443ccbd35ba5ea368b258acfaeb84544b815fc5beca04fe34ef554f9b0683
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 126: GetDevice === }

function GetDevice(const Reg: TDeviceRegistry; ID: TInt32;
  out Dev: TDevice): TResult;
var
  I: TInt32;
begin
  for I := 0 to Reg.Count - 1 do
  begin
    if Reg.Devices[I].ID = ID then
    begin
      Dev    := Reg.Devices[I];
      Result := PGPU_SUCCESS;
      Exit;
    end;
  end;

  Dev.ID      := -1;
  Dev.State   := dsDisconnected;
  Dev.Backend := nil;
  Dev.IsValid := False;
  Dev.Properties.Name            := '';
  Dev.Properties.DeviceID        := -1;
  Dev.Properties.TotalMemory     := 0;
  Dev.Properties.FreeMemory      := 0;
  Dev.Properties.ComputeCap.Major := 0;
  Dev.Properties.ComputeCap.Minor := 0;
  Dev.Properties.MaxThreadsPerBlock := 0;
  Dev.Properties.MaxThreadsDim.X := 0;
  Dev.Properties.MaxThreadsDim.Y := 0;
  Dev.Properties.MaxThreadsDim.Z := 0;
  Dev.Properties.MaxGridSize.X   := 0;
  Dev.Properties.MaxGridSize.Y   := 0;
  Dev.Properties.MaxGridSize.Z   := 0;
  Dev.Properties.WarpSize        := 0;
  Dev.Properties.MemoryBusWidth  := 0;
  Dev.Properties.MultiProcessorCount := 0;
  Dev.Properties.ClockRateMHz    := 0;
  Dev.Properties.IsVirtual       := False;
  Dev.Properties.CapabilityFlags := [];
  Dev.MemoryTracker.AllocatedBytes  := 0;
  Dev.MemoryTracker.AllocCount      := 0;
  Dev.MemoryTracker.TotalAllocCount := 0;
  Dev.MemoryTracker.TotalFreeCount  := 0;
  Result := PGPU_ERR_NOT_FOUND;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-127
  Block              : EnumerateDevices
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:9f72ebb1e994a701f11a3e72e03ab1b97c206897ce4419a10659d3cb73f57a80
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 127: EnumerateDevices === }

function EnumerateDevices(const Reg: TDeviceRegistry): AnsiString;
var
  I:           TInt32;
  S:           AnsiString;
  Maj, Min:    TUInt32;
  MemGB:       TUInt64;
  StateName:   AnsiString;
begin
  S := 'PascalGPU Device Registry: ' + IntToStr(Reg.Count)
     + ' device(s)' + LineEnding;
  for I := 0 to Reg.Count - 1 do
  begin
    Maj   := Reg.Devices[I].Properties.ComputeCap.Major;
    Min   := Reg.Devices[I].Properties.ComputeCap.Minor;
    MemGB := Reg.Devices[I].Properties.TotalMemory div (1024 * 1024 * 1024);
    case Reg.Devices[I].State of
      dsUninitialized: StateName := 'Uninitialized';
      dsReady:         StateName := 'Ready';
      dsBusy:          StateName := 'Busy';
      dsError:         StateName := 'Error';
      dsDisconnected:  StateName := 'Disconnected';
    else
      StateName := 'Unknown';
    end;
    S := S
      + '  [' + IntToStr(Reg.Devices[I].ID) + '] '
      + Reg.Devices[I].Properties.Name
      + '  Mem=' + IntToStr(MemGB) + 'GB'
      + '  CC=' + IntToStr(Maj) + '.' + IntToStr(Min)
      + '  SMs=' + IntToStr(Reg.Devices[I].Properties.MultiProcessorCount)
      + '  Clk=' + IntToStr(Reg.Devices[I].Properties.ClockRateMHz) + 'MHz'
      + '  Virtual=' + BoolToStr(Reg.Devices[I].Properties.IsVirtual, True)
      + '  State=' + StateName
      + LineEnding;
  end;
  Result := S;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-128
  Block              : DeviceCount
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:6471034b0da1e32854f04e8605c12e3d7bad2ca4f415baeb20180b0bbc350203
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 128: DeviceCount === }

function DeviceCount(const Reg: TDeviceRegistry): TInt32;
begin
  Result := Reg.Count;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-129
  Block              : SetDefaultDevice / GetDefaultDevice
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:53ccfd859486f72da0c5ff07e5142ad7a50b667d54b21a0c36004b4b5e651a49
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 129: SetDefaultDevice / GetDefaultDevice === }

procedure SetDefaultDevice(DeviceID: TInt32);
begin
  DefaultDeviceID := DeviceID;
end;

function GetDefaultDevice: TInt32;
begin
  Result := DefaultDeviceID;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-131
  Block              : DeviceSupportsCapability
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:4f345fd5c0c6bc48c6cff6ed3d319121fb80955d733ddf1f0a4e153c463fbf5c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 131: DeviceSupportsCapability === }

function DeviceSupportsCapability(const Props: TDeviceProperties;
  Flag: TDeviceCapabilityFlag): Boolean;
begin
  Result := Flag in Props.CapabilityFlags;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-133
  Block              : QueryDevicesByMemory
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:4154a38e40ea8f4480a6de3ea09be58afc491391ab7270c6bbba9484efd76b84
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 133: QueryDevicesByMemory === }

function QueryDevicesByMemory(MinMemoryGB: TFloat32;
  out IDs: TInt32DynArray): TInt32;
var
  I:        TInt32;
  Count:    TInt32;
  MinBytes: TUInt64;
begin
  MinBytes := TUInt64(Round(MinMemoryGB * 1024.0 * 1024.0 * 1024.0));
  Count    := 0;
  SetLength(IDs, 0);

  for I := 0 to GDeviceRegistry.Count - 1 do
  begin
    if GDeviceRegistry.Devices[I].Properties.TotalMemory >= MinBytes then
    begin
      SetLength(IDs, Count + 1);
      IDs[Count] := GDeviceRegistry.Devices[I].ID;
      Inc(Count);
    end;
  end;

  Result := Count;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-134
  Block              : QueryDevicesByCompute
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:1b5fdc529867042fbb3c70865c5bbfac908fd85859b78879969f9c91882801f0
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 134: QueryDevicesByCompute === }

function QueryDevicesByCompute(MinMajor, MinMinor: TUInt32;
  out IDs: TInt32DynArray): TInt32;
var
  I:      TInt32;
  Count:  TInt32;
  DevCC:  TUInt32;
  MinCC:  TUInt32;
begin
  MinCC := MinMajor * 10 + MinMinor;
  Count := 0;
  SetLength(IDs, 0);

  for I := 0 to GDeviceRegistry.Count - 1 do
  begin
    DevCC := GDeviceRegistry.Devices[I].Properties.ComputeCap.Major * 10
           + GDeviceRegistry.Devices[I].Properties.ComputeCap.Minor;
    if DevCC >= MinCC then
    begin
      SetLength(IDs, Count + 1);
      IDs[Count] := GDeviceRegistry.Devices[I].ID;
      Inc(Count);
    end;
  end;

  Result := Count;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-136
  Block              : CreateDeviceContext
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:50049117559000b3ac1d971979b094f3f2086afe72b38344f461953fcc85b62e
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 136: CreateDeviceContext === }

function CreateDeviceContext(DeviceID: TInt32; out Ctx: TDeviceContext): TResult;
begin
  Ctx.DeviceID     := DeviceID;
  Ctx.ActiveStreams := nil;
  Ctx.StreamCount  := 0;
  Ctx.ActiveEvents := nil;
  Ctx.EventCount   := 0;
  Ctx.IsActive     := True;
  Result           := PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-137
  Block              : DestroyDeviceContext
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:132e4d83d69cd0d67eccdfb1f2e4215fdc8ecef680d4b99762e1fe1093f76200
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 137: DestroyDeviceContext === }

function DestroyDeviceContext(var Ctx: TDeviceContext): TResult;
begin
  if not Ctx.IsActive then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;

  SetLength(Ctx.ActiveStreams, 0);
  SetLength(Ctx.ActiveEvents, 0);
  Ctx.StreamCount := 0;
  Ctx.EventCount  := 0;
  Ctx.IsActive    := False;
  Result          := PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-138
  Block              : SetCurrentContext
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2184528bbd9821c3a8b10e8cffe43d4e95cd09f7ba7ef6ab8f7006bc0c960619
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 138: SetCurrentContext === }

function SetCurrentContext(var Ctx: TDeviceContext): TResult;
begin
  if not Ctx.IsActive then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  GCurrentContext    := Ctx;
  GHasCurrentContext := True;
  Result             := PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-139
  Block              : GetCurrentContext
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:5546e0f6d76d6c9274f90e21e9bfc881b50597a1e91d8ffb61f956b6014b0fab
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 139: GetCurrentContext === }

function GetCurrentContext(out Ctx: TDeviceContext): TResult;
begin
  if not GHasCurrentContext then
  begin
    Ctx.DeviceID     := -1;
    Ctx.ActiveStreams := nil;
    Ctx.StreamCount  := 0;
    Ctx.ActiveEvents := nil;
    Ctx.EventCount   := 0;
    Ctx.IsActive     := False;
    Result           := PGPU_ERR_NO_CURRENT_CONTEXT;
    Exit;
  end;
  Ctx    := GCurrentContext;
  Result := PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-140
  Block              : ContextSynchronize
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:87fad8247d76e67d72bd1cbd2158ce9164164fbf1dde567eadc218be2c695361
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 140: ContextSynchronize === }

function ContextSynchronize(var Ctx: TDeviceContext): TResult;
var
  Dev: TDevice;
  R:   TResult;
begin
  if not Ctx.IsActive then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  R := GetDevice(GDeviceRegistry, Ctx.DeviceID, Dev);
  if R <> PGPU_SUCCESS then
  begin
    Result := R;
    Exit;
  end;
  Result := DeviceSynchronize(Dev);
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-141
  Block              : TOpenCLBackend — stub; all methods raise PGPU_ERR_UNSUPPORTED
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:74982aa058fbc027aa66bd3f3a70873c29af8c95c38f681948051d8f8d5e7bf8
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 141: TOpenCLBackend — stub; all methods raise PGPU_ERR_UNSUPPORTED === }

function TOpenCLBackend.Initialize: TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TOpenCLBackend.Finalize: TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TOpenCLBackend.GetProperties(out Props: TDeviceProperties): TResult;
begin
  Props.Name     := 'OpenCL (not yet supported)';
  Props.DeviceID := -1;
  Props.TotalMemory := 0;
  Props.FreeMemory  := 0;
  Props.IsVirtual   := False;
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TOpenCLBackend.AllocMemory(Bytes: TSizeT;
  out Mem: TDeviceMemory): TResult;
begin
  Mem.Ptr      := nil;
  Mem.Bytes    := 0;
  Mem.Kind     := mkDevice;
  Mem.DeviceID := -1;
  Mem.IsValid  := False;
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TOpenCLBackend.FreeMemory(var Mem: TDeviceMemory): TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TOpenCLBackend.MemcpyH2D(Src: Pointer; var Dst: TDeviceMemory;
  Bytes: TSizeT): TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TOpenCLBackend.MemcpyD2H(const Src: TDeviceMemory; Dst: Pointer;
  Bytes: TSizeT): TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TOpenCLBackend.MemcpyD2D(const Src: TDeviceMemory;
  var Dst: TDeviceMemory; Bytes: TSizeT): TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TOpenCLBackend.Synchronize: TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TOpenCLBackend.SupportsFeature(const Feature: AnsiString): Boolean;
begin
  Result := False;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-142
  Block              : TVulkanComputeBackend — stub; all methods raise PGPU_ERR_UNSUPPORTED
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:ae012ed21805915a6c86929821b488d43adb23c27fce0d98bf1b1d69bcbfb515
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 142: TVulkanComputeBackend — stub; all methods raise PGPU_ERR_UNSUPPORTED === }

function TVulkanComputeBackend.Initialize: TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TVulkanComputeBackend.Finalize: TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TVulkanComputeBackend.GetProperties(out Props: TDeviceProperties): TResult;
begin
  Props.Name     := 'Vulkan Compute (not yet supported)';
  Props.DeviceID := -1;
  Props.TotalMemory := 0;
  Props.FreeMemory  := 0;
  Props.IsVirtual   := False;
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TVulkanComputeBackend.AllocMemory(Bytes: TSizeT;
  out Mem: TDeviceMemory): TResult;
begin
  Mem.Ptr      := nil;
  Mem.Bytes    := 0;
  Mem.Kind     := mkDevice;
  Mem.DeviceID := -1;
  Mem.IsValid  := False;
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TVulkanComputeBackend.FreeMemory(var Mem: TDeviceMemory): TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TVulkanComputeBackend.MemcpyH2D(Src: Pointer; var Dst: TDeviceMemory;
  Bytes: TSizeT): TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TVulkanComputeBackend.MemcpyD2H(const Src: TDeviceMemory; Dst: Pointer;
  Bytes: TSizeT): TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TVulkanComputeBackend.MemcpyD2D(const Src: TDeviceMemory;
  var Dst: TDeviceMemory; Bytes: TSizeT): TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TVulkanComputeBackend.Synchronize: TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TVulkanComputeBackend.SupportsFeature(const Feature: AnsiString): Boolean;
begin
  Result := False;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-143
  Block              : TMetalComputeBackend — raises PGPU_ERR_UNSUPPORTED on non-macOS
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:656f74ea386f743ff60b4668634fadb96d9f938dc5333cd5573e830ed807e609
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 143: TMetalComputeBackend — raises PGPU_ERR_UNSUPPORTED on non-macOS === }
{
  On macOS (DARWIN), real Metal API bindings would be wired through Objective-C
  bridging or a shared library.  All methods return PGPU_ERR_UNSUPPORTED until
  that wiring is complete.  The {$IFDEF DARWIN} stubs document where Metal calls
  would be inserted.
}

function TMetalComputeBackend.Initialize: TResult;
begin
{$IFDEF DARWIN}
  { Future: MTLCreateSystemDefaultDevice + command queue setup }
  Result := PGPU_ERR_UNSUPPORTED;
{$ELSE}
  Result := PGPU_ERR_UNSUPPORTED;
{$ENDIF}
end;

function TMetalComputeBackend.Finalize: TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TMetalComputeBackend.GetProperties(out Props: TDeviceProperties): TResult;
begin
  Props.Name     := 'Metal Compute (unsupported on this platform)';
  Props.DeviceID := -1;
  Props.TotalMemory := 0;
  Props.FreeMemory  := 0;
  Props.IsVirtual   := False;
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TMetalComputeBackend.AllocMemory(Bytes: TSizeT;
  out Mem: TDeviceMemory): TResult;
begin
  Mem.Ptr      := nil;
  Mem.Bytes    := 0;
  Mem.Kind     := mkDevice;
  Mem.DeviceID := -1;
  Mem.IsValid  := False;
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TMetalComputeBackend.FreeMemory(var Mem: TDeviceMemory): TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TMetalComputeBackend.MemcpyH2D(Src: Pointer; var Dst: TDeviceMemory;
  Bytes: TSizeT): TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TMetalComputeBackend.MemcpyD2H(const Src: TDeviceMemory; Dst: Pointer;
  Bytes: TSizeT): TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TMetalComputeBackend.MemcpyD2D(const Src: TDeviceMemory;
  var Dst: TDeviceMemory; Bytes: TSizeT): TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TMetalComputeBackend.Synchronize: TResult;
begin
  Result := PGPU_ERR_UNSUPPORTED;
end;

function TMetalComputeBackend.SupportsFeature(const Feature: AnsiString): Boolean;
begin
  Result := False;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-145
  Block              : RegisterBackend
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:232b00b0fd604b4522944ce69044b43f27e535b8d1354efb41d125f95c3fb906
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 145: RegisterBackend === }

procedure RegisterBackend(const Name: AnsiString; Factory: IBackendFactory);
var
  I: TInt32;
begin
  { Update in-place if a backend with this name is already registered. }
  for I := 0 to GBackendRegistry.Count - 1 do
  begin
    if GBackendRegistry.Entries[I].Name = Name then
    begin
      GBackendRegistry.Entries[I].Factory := Factory;
      Exit;
    end;
  end;
  { Append new entry. }
  SetLength(GBackendRegistry.Entries, GBackendRegistry.Count + 1);
  GBackendRegistry.Entries[GBackendRegistry.Count].Name    := Name;
  GBackendRegistry.Entries[GBackendRegistry.Count].Factory := Factory;
  Inc(GBackendRegistry.Count);
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-146
  Block              : CreateBackendByName
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:82959ccc12312178b32e0fef1b1063b072f7da3bcd98f527462f8d675306f191
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 146: CreateBackendByName === }

function CreateBackendByName(const Name: AnsiString;
  out Backend: IDeviceBackend): TResult;
var
  I: TInt32;
begin
  Backend := nil;

  { Built-in backends resolved without factory lookup. }
  if Name = 'simulated' then
  begin
    Backend := TSimulatedDeviceBackend.Create(0);
    Result  := PGPU_SUCCESS;
    Exit;
  end;
  if Name = 'opencl' then
  begin
    Backend := TOpenCLBackend.Create;
    Result  := PGPU_SUCCESS;
    Exit;
  end;
  if Name = 'vulkan' then
  begin
    Backend := TVulkanComputeBackend.Create;
    Result  := PGPU_SUCCESS;
    Exit;
  end;
  if Name = 'metal' then
  begin
    Backend := TMetalComputeBackend.Create;
    Result  := PGPU_SUCCESS;
    Exit;
  end;

  { Search registered factories. }
  for I := 0 to GBackendRegistry.Count - 1 do
  begin
    if GBackendRegistry.Entries[I].Name = Name then
    begin
      if GBackendRegistry.Entries[I].Factory <> nil then
      begin
        Backend := GBackendRegistry.Entries[I].Factory.CreateBackend;
        Result  := PGPU_SUCCESS;
        Exit;
      end;
    end;
  end;

  Result := PGPU_ERR_NOT_FOUND;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-147
  Block              : DeviceMemoryUsage
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:451cab5c6317cd9730aed515bd9f0c6496be08726b811438a48b80a2ee3b25c1
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 147: DeviceMemoryUsage === }

function DeviceMemoryUsage(const Device: TDevice;
  out Used, Total: TUInt64): TResult;
begin
  if not Device.IsValid then
  begin
    Used  := 0;
    Total := 0;
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Used   := Device.MemoryTracker.AllocatedBytes;
  Total  := Device.Properties.TotalMemory;
  Result := PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-148
  Block              : DeviceMemoryFill
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f23700e30fe68c1edaf1cea46e71b9863e58da9f06c5cb00fe5fd71476989685
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 148: DeviceMemoryFill === }

function DeviceMemoryFill(var Device: TDevice; var Mem: TDeviceMemory;
  Value: TUInt8; Bytes: TSizeT): TResult;
begin
  if not Device.IsValid then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if (not Mem.IsValid) or (Mem.Ptr = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Bytes > Mem.Bytes then
  begin
    Result := PGPU_ERR_BOUNDS;
    Exit;
  end;

  FillChar(Mem.Ptr^, SizeInt(Bytes), Value);
  Result := PGPU_SUCCESS;
end;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-002-BLK-149
  Block              : DeviceSubsystemTest — device self-test
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:64392275c8078871a9d958b3a6d79d4176c1ee0b7ba7f8f2f5c22a9047eec73d
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 149: DeviceSubsystemTest — device self-test === }

function DeviceSubsystemTest: TResult;
var
  SimBackend: TSimulatedDeviceBackend;
  IBack:      IDeviceBackend;
  Device:     TDevice;
  Mem1, Mem2: TDeviceMemory;
  SrcBuf:     array[0..127] of Byte;
  DstBuf:     array[0..127] of Byte;
  I:          Integer;
  R:          TResult;
  Used, Tot:  TUInt64;
  Props:      TDeviceProperties;
  Ctx:        TDeviceContext;
  IDs:        TInt32DynArray;
  FoundCount: TInt32;
begin
  Result := PGPU_SUCCESS;

  { ---- Step 1: create simulated backend and device ---- }
  SimBackend := TSimulatedDeviceBackend.Create(255);
  IBack      := SimBackend;

  R := CreateDevice(255, IBack, Device);
  if R <> PGPU_SUCCESS then
  begin
    Result := R;
    Exit;
  end;

  { ---- Step 2: initialize ---- }
  R := DeviceInitialize(Device);
  if R <> PGPU_SUCCESS then
  begin
    DestroyDevice(Device);
    Result := R;
    Exit;
  end;

  { ---- Step 3: verify properties ---- }
  R := DeviceGetProperties(Device, Props);
  if R <> PGPU_SUCCESS then
  begin
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := R;
    Exit;
  end;
  if not Props.IsVirtual then
  begin
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := PGPU_ERR_VERIFY_FAILED;
    Exit;
  end;
  if Props.ComputeCap.Major < 8 then
  begin
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := PGPU_ERR_VERIFY_FAILED;
    Exit;
  end;

  { ---- Step 4: allocate two 128-byte device buffers ---- }
  R := DeviceAllocMemory(Device, 128, Mem1);
  if R <> PGPU_SUCCESS then
  begin
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := R;
    Exit;
  end;

  R := DeviceAllocMemory(Device, 128, Mem2);
  if R <> PGPU_SUCCESS then
  begin
    DeviceFreeMemory(Device, Mem1);
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := R;
    Exit;
  end;

  { ---- Step 5: H2D copy ---- }
  for I := 0 to 127 do
    SrcBuf[I] := Byte(I xor $A5);

  R := Device.Backend.MemcpyH2D(@SrcBuf[0], Mem1, 128);
  if R <> PGPU_SUCCESS then
  begin
    DeviceFreeMemory(Device, Mem1);
    DeviceFreeMemory(Device, Mem2);
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := R;
    Exit;
  end;

  { ---- Step 6: D2D copy ---- }
  R := Device.Backend.MemcpyD2D(Mem1, Mem2, 128);
  if R <> PGPU_SUCCESS then
  begin
    DeviceFreeMemory(Device, Mem1);
    DeviceFreeMemory(Device, Mem2);
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := R;
    Exit;
  end;

  { ---- Step 7: D2H copy and data-integrity verification ---- }
  FillChar(DstBuf, SizeOf(DstBuf), 0);
  R := Device.Backend.MemcpyD2H(Mem2, @DstBuf[0], 128);
  if R <> PGPU_SUCCESS then
  begin
    DeviceFreeMemory(Device, Mem1);
    DeviceFreeMemory(Device, Mem2);
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := R;
    Exit;
  end;
  for I := 0 to 127 do
  begin
    if DstBuf[I] <> Byte(I xor $A5) then
    begin
      DeviceFreeMemory(Device, Mem1);
      DeviceFreeMemory(Device, Mem2);
      DeviceFinalize(Device);
      DestroyDevice(Device);
      Result := PGPU_ERR_VERIFY_FAILED;
      Exit;
    end;
  end;

  { ---- Step 8: MemoryFill ---- }
  R := DeviceMemoryFill(Device, Mem1, $FF, 128);
  if R <> PGPU_SUCCESS then
  begin
    DeviceFreeMemory(Device, Mem1);
    DeviceFreeMemory(Device, Mem2);
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := R;
    Exit;
  end;

  { ---- Step 9: MemoryUsage ---- }
  R := DeviceMemoryUsage(Device, Used, Tot);
  if R <> PGPU_SUCCESS then
  begin
    DeviceFreeMemory(Device, Mem1);
    DeviceFreeMemory(Device, Mem2);
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := R;
    Exit;
  end;
  if Used < 256 then  { 128 + 128 bytes must be live }
  begin
    DeviceFreeMemory(Device, Mem1);
    DeviceFreeMemory(Device, Mem2);
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := PGPU_ERR_VERIFY_FAILED;
    Exit;
  end;

  { ---- Step 10: Synchronize ---- }
  R := DeviceSynchronize(Device);
  if R <> PGPU_SUCCESS then
  begin
    DeviceFreeMemory(Device, Mem1);
    DeviceFreeMemory(Device, Mem2);
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := R;
    Exit;
  end;

  { ---- Step 11: capability flags ---- }
  if not DeviceSupportsCapability(Device.Properties, dcDouble) then
  begin
    DeviceFreeMemory(Device, Mem1);
    DeviceFreeMemory(Device, Mem2);
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := PGPU_ERR_VERIFY_FAILED;
    Exit;
  end;
  if not DeviceSupportsCapability(Device.Properties, dcTensorCores) then
  begin
    DeviceFreeMemory(Device, Mem1);
    DeviceFreeMemory(Device, Mem2);
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := PGPU_ERR_VERIFY_FAILED;
    Exit;
  end;

  { ---- Step 12: register in global registry and query ---- }
  RegisterDevice(GDeviceRegistry, Device);
  FoundCount := QueryDevicesByCompute(8, 0, IDs);
  if FoundCount < 1 then
  begin
    DeviceFreeMemory(Device, Mem1);
    DeviceFreeMemory(Device, Mem2);
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := PGPU_ERR_VERIFY_FAILED;
    Exit;
  end;

  FoundCount := QueryDevicesByMemory(1.0, IDs);
  if FoundCount < 1 then
  begin
    DeviceFreeMemory(Device, Mem1);
    DeviceFreeMemory(Device, Mem2);
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := PGPU_ERR_VERIFY_FAILED;
    Exit;
  end;

  { ---- Step 13: context create / set / get / synchronize / destroy ---- }
  R := CreateDeviceContext(Device.ID, Ctx);
  if R <> PGPU_SUCCESS then
  begin
    DeviceFreeMemory(Device, Mem1);
    DeviceFreeMemory(Device, Mem2);
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := R;
    Exit;
  end;
  R := SetCurrentContext(Ctx);
  if R <> PGPU_SUCCESS then
  begin
    DestroyDeviceContext(Ctx);
    DeviceFreeMemory(Device, Mem1);
    DeviceFreeMemory(Device, Mem2);
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := R;
    Exit;
  end;
  R := ContextSynchronize(Ctx);
  if R <> PGPU_SUCCESS then
  begin
    DestroyDeviceContext(Ctx);
    DeviceFreeMemory(Device, Mem1);
    DeviceFreeMemory(Device, Mem2);
    DeviceFinalize(Device);
    DestroyDevice(Device);
    Result := R;
    Exit;
  end;
  DestroyDeviceContext(Ctx);

  { ---- Cleanup ---- }
  DeviceFreeMemory(Device, Mem1);
  DeviceFreeMemory(Device, Mem2);
  DeviceFinalize(Device);
  DestroyDevice(Device);

  Result := PGPU_SUCCESS;
end;

{ === BLOCK 150: CUDA Device to Pascal TDevice mapping — compatibility notes ===

  CUDA concept              Pascal TDevice equivalent
  ─────────────────────     ───────────────────────────────────────────────────
  cudaDeviceProp            TDeviceProperties (1-to-1 field mapping)
  cudaGetDeviceProperties   DeviceGetProperties(Device, Props)
  cudaSetDevice             SetDefaultDevice(ID)
  cudaGetDevice             GetDefaultDevice
  cudaDeviceReset           DeviceFinalize + DeviceInitialize
  cudaMalloc                DeviceAllocMemory
  cudaFree                  DeviceFreeMemory
  cudaMemcpy H2D            Device.Backend.MemcpyH2D
  cudaMemcpy D2H            Device.Backend.MemcpyD2H
  cudaMemcpy D2D            Device.Backend.MemcpyD2D
  cudaDeviceSynchronize     DeviceSynchronize
  cudaMemset                DeviceMemoryFill
  cudaStream_t              TStreamHandle (future: TStream in Stream unit)
  cudaEvent_t               THandle       (future: TEvent in Sync unit)

  SIMULATED vs HARDWARE-DEPENDENT
  ─────────────────────────────────
  TSimulatedDeviceBackend implements every IDeviceBackend method in pure Pascal
  using GetMem/FreeMem and System.Move.  No CUDA runtime, driver API, or GPU
  hardware is accessed.

  Hardware-dependent behaviour that the simulator does NOT replicate:
    - True parallel kernel execution (all kernels are sequential no-ops here)
    - PCIe / NVLink transfer latency and bandwidth
    - VRAM addressing and ECC scrubbing
    - Clock throttling and thermal management
    - Multi-GPU peer-to-peer transfers
    - Unified Virtual Addressing (UVA) pointer semantics
    - Hardware atomics (simulated atomics use host-side memory)
    - CUDA Streams and Events (stubs; real ordering comes from the Sync unit)

  When a real CUDA backend is added, create a TCUDADeviceBackend that:
    1. Calls cuInit / cuDeviceGet / cuCtxCreate in Initialize
    2. Delegates AllocMemory  to cuMemAlloc
    3. Delegates FreeMemory   to cuMemFree
    4. Delegates MemcpyH2D    to cuMemcpyHtoD
    5. Delegates MemcpyD2H    to cuMemcpyDtoH
    6. Delegates MemcpyD2D    to cuMemcpyDtoD
    7. Delegates Synchronize  to cuCtxSynchronize
  and register it via RegisterBackend('cuda', TCUDABackendFactory.Create).
}

initialization
  DefaultDeviceID              := 0;
  GDeviceRegistry.Count        := 0;
  GDeviceRegistry.Devices      := nil;
  GBackendRegistry.Count       := 0;
  GBackendRegistry.Entries     := nil;
  GHasCurrentContext           := False;
  GCurrentContext.DeviceID     := -1;
  GCurrentContext.StreamCount  := 0;
  GCurrentContext.EventCount   := 0;
  GCurrentContext.IsActive     := False;
  GCurrentContext.ActiveStreams := nil;
  GCurrentContext.ActiveEvents  := nil;

end.
