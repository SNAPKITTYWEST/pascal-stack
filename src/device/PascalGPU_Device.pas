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
unit PascalGPU_Device;
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

{ === BLOCK 124: TDeviceRegistry — singleton list of available devices === }
type
  TDeviceArray    = array of TDevice;
  TDeviceRegistry = record
    Devices: TDeviceArray;
    Count:   TInt32;
  end;

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

{ === BLOCK 114: CreateDevice === }
function CreateDevice(DeviceID: TInt32; Backend: IDeviceBackend; out Device: TDevice): TResult;

{ === BLOCK 115: DestroyDevice === }
function DestroyDevice(var Device: TDevice): TResult;

{ === BLOCK 116: DeviceInitialize === }
function DeviceInitialize(var Device: TDevice): TResult;

{ === BLOCK 117: DeviceFinalize === }
function DeviceFinalize(var Device: TDevice): TResult;

{ === BLOCK 118: DeviceGetProperties === }
function DeviceGetProperties(const Device: TDevice; out Props: TDeviceProperties): TResult;

{ === BLOCK 119: DeviceAllocMemory === }
function DeviceAllocMemory(var Device: TDevice; Bytes: TSizeT; out Mem: TDeviceMemory): TResult;

{ === BLOCK 120: DeviceFreeMemory === }
function DeviceFreeMemory(var Device: TDevice; var Mem: TDeviceMemory): TResult;

{ === BLOCK 121: DeviceSynchronize === }
function DeviceSynchronize(var Device: TDevice): TResult;

{ === BLOCK 122: DeviceGetState === }
function DeviceGetState(const Device: TDevice): TDeviceState;

{ === BLOCK 123: DeviceSetState === }
procedure DeviceSetState(var Device: TDevice; State: TDeviceState);

{ === BLOCK 125: RegisterDevice === }
function RegisterDevice(var Reg: TDeviceRegistry; var Dev: TDevice): TResult;

{ === BLOCK 126: GetDevice === }
function GetDevice(const Reg: TDeviceRegistry; ID: TInt32; out Dev: TDevice): TResult;

{ === BLOCK 127: EnumerateDevices === }
function EnumerateDevices(const Reg: TDeviceRegistry): AnsiString;

{ === BLOCK 128: DeviceCount === }
function DeviceCount(const Reg: TDeviceRegistry): TInt32;

{ === BLOCK 129: DefaultDeviceID global var + SetDefaultDevice/GetDefaultDevice === }
procedure SetDefaultDevice(DeviceID: TInt32);
function  GetDefaultDevice: TInt32;

{ === BLOCK 131: DeviceSupportsCapability === }
function DeviceSupportsCapability(const Props: TDeviceProperties;
  Flag: TDeviceCapabilityFlag): Boolean;

{ === BLOCK 133: QueryDevicesByMemory === }
function QueryDevicesByMemory(MinMemoryGB: TFloat32;
  out IDs: TInt32DynArray): TInt32;

{ === BLOCK 134: QueryDevicesByCompute === }
function QueryDevicesByCompute(MinMajor, MinMinor: TUInt32;
  out IDs: TInt32DynArray): TInt32;

{ === BLOCK 136: CreateDeviceContext === }
function CreateDeviceContext(DeviceID: TInt32; out Ctx: TDeviceContext): TResult;

{ === BLOCK 137: DestroyDeviceContext === }
function DestroyDeviceContext(var Ctx: TDeviceContext): TResult;

{ === BLOCK 138: SetCurrentContext === }
function SetCurrentContext(var Ctx: TDeviceContext): TResult;

{ === BLOCK 139: GetCurrentContext === }
function GetCurrentContext(out Ctx: TDeviceContext): TResult;

{ === BLOCK 140: ContextSynchronize === }
function ContextSynchronize(var Ctx: TDeviceContext): TResult;

{ === BLOCK 145: RegisterBackend === }
procedure RegisterBackend(const Name: AnsiString; Factory: IBackendFactory);

{ === BLOCK 146: CreateBackendByName === }
function CreateBackendByName(const Name: AnsiString;
  out Backend: IDeviceBackend): TResult;

{ === BLOCK 147: DeviceMemoryUsage === }
function DeviceMemoryUsage(const Device: TDevice;
  out Used, Total: TUInt64): TResult;

{ === BLOCK 148: DeviceMemoryFill === }
function DeviceMemoryFill(var Device: TDevice; var Mem: TDeviceMemory;
  Value: TUInt8; Bytes: TSizeT): TResult;

{ === BLOCK 149: DeviceSubsystemTest === }
function DeviceSubsystemTest: TResult;

var
  { === BLOCK 129: DefaultDeviceID global variable === }
  DefaultDeviceID:  TInt32;
  { Global device registry used by QueryDevicesByMemory / QueryDevicesByCompute }
  GDeviceRegistry:  TDeviceRegistry;
  { Global backend factory registry used by RegisterBackend / CreateBackendByName }
  GBackendRegistry: TBackendRegistry;

implementation

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

{ === BLOCK 122: DeviceGetState === }

function DeviceGetState(const Device: TDevice): TDeviceState;
begin
  Result := Device.State;
end;

{ === BLOCK 123: DeviceSetState === }

procedure DeviceSetState(var Device: TDevice; State: TDeviceState);
begin
  Device.State := State;
end;

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

{ === BLOCK 128: DeviceCount === }

function DeviceCount(const Reg: TDeviceRegistry): TInt32;
begin
  Result := Reg.Count;
end;

{ === BLOCK 129: SetDefaultDevice / GetDefaultDevice === }

procedure SetDefaultDevice(DeviceID: TInt32);
begin
  DefaultDeviceID := DeviceID;
end;

function GetDefaultDevice: TInt32;
begin
  Result := DefaultDeviceID;
end;

{ === BLOCK 131: DeviceSupportsCapability === }

function DeviceSupportsCapability(const Props: TDeviceProperties;
  Flag: TDeviceCapabilityFlag): Boolean;
begin
  Result := Flag in Props.CapabilityFlags;
end;

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
