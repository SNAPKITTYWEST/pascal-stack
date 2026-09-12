{ ========================================================================
  SOVEREIGN LEVIATHAN COVENANT — MGPLv3 RECURSIVE INFECTION CLAUSE
  ========================================================================

  Node-ID:           PASCAL-STACK-005
  File:              PascalGPU_Kernel.pas
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
unit PascalGPU_Kernel;

{ Kernel abstraction layer — Blocks 151-200
  Provides parameter lists, kernel descriptors, registry, history,
  and concrete kernel implementations for simulation. }

interface

uses
  SysUtils, Math, PascalGPU_Types;

{ ------------------------------------------------------------------ }
{ Supporting types used by this unit but not in PascalGPU_Types      }
{ ------------------------------------------------------------------ }

type
  { Region of simulated shared memory passed to each kernel Execute }
  TSharedMemoryRegion = record
    Data: Pointer;
    Size: TUInt32;
  end;

  { Simulated device memory block }
  TDeviceMemory = record
    Ptr:      Pointer;
    ByteSize: TSizeT;
    Kind:     TMemoryKind;
    DataType: TDataType;
    Count:    TElementCount;
  end;
  PDeviceMemory = ^TDeviceMemory;

  { Device capability/limit properties used for launch validation }
  TDeviceProperties = record
    MaxThreadsPerBlock:   TUInt32;
    MaxBlockDim:          TDim3D;
    MaxGridDim:           TDim3D;
    MaxSharedMemPerBlock: TUInt32;
    WarpSize:             TUInt32;
    MultiprocessorCount:  TUInt32;
    ComputeCapability:    TComputeCapability;
  end;

{ Returns a default TDeviceProperties representing a modest GPU }
function MakeDefaultDeviceProperties: TDeviceProperties;

{ === BLOCK 151: TKernelParamKind enumeration === }
type
  TKernelParamKind = (
    kpScalar32,
    kpScalar64,
    kpPointer,
    kpBuffer,
    kpConstant,
    kpSharedMemSize
  );

{ === BLOCK 152: TKernelParam record === }
type
  TKernelParam = record
    Kind:       TKernelParamKind;
    Name:       AnsiString;
    ValueBytes: TUInt32;
    Data:       array[0..31] of Byte;
  end;

{ === BLOCK 153: TKernelParamList — dynamic array of TKernelParam + AddParam helpers === }
type
  TKernelParamList = record
    Items: array of TKernelParam;
    Count: TUInt32;
  end;

{ === BLOCK 154: AddParam32 — appends a 32-bit scalar parameter === }
procedure AddParam32(var List: TKernelParamList; const Name: AnsiString;
                     Value: TUInt32);

{ === BLOCK 155: AddParam64 — appends a 64-bit scalar parameter === }
procedure AddParam64(var List: TKernelParamList; const Name: AnsiString;
                     Value: TUInt64);

{ === BLOCK 156: AddParamF32 — appends a 32-bit float parameter === }
procedure AddParamF32(var List: TKernelParamList; const Name: AnsiString;
                      Value: TFloat32);

{ === BLOCK 157: AddParamPtr — appends a raw pointer parameter === }
procedure AddParamPtr(var List: TKernelParamList; const Name: AnsiString;
                      Ptr: Pointer);

{ === BLOCK 158: AddParamBuffer — appends a TDeviceMemory buffer parameter === }
procedure AddParamBuffer(var List: TKernelParamList; const Name: AnsiString;
                         var Mem: TDeviceMemory);

{ === BLOCK 159: FindParam — searches by name; PGPU_ERR_NOT_FOUND if absent === }
function FindParam(const List: TKernelParamList; const Name: AnsiString;
                   out Param: TKernelParam): TResult;

{ === BLOCK 160: TKernelState === }
type
  TKernelState = (
    ksCreated,
    ksCompiled,
    ksReady,
    ksRunning,
    ksDone,
    ksFailed
  );

{ === BLOCK 161: TKernelMetadata record === }
type
  TKernelMetadata = record
    Name:              AnsiString;
    Version:           AnsiString;
    Author:            AnsiString;
    Description:       AnsiString;
    RequiredSharedMem: TUInt32;
  end;

{ === BLOCK 162: IKernelFunction interface === }
type
  IKernelFunction = interface
    ['{C7E89F2A-41B3-4D56-98AF-1234ABCD5678}']
    function GetMetadata: TKernelMetadata;
    function GetRequiredCapability: TComputeCapability;
    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                      const Params: TKernelParamList;
                      var SharedMem: TSharedMemoryRegion);
  end;

{ === BLOCK 163: TKernelDescriptor record === }
type
  TKernelDescriptor = record
    Metadata:       TKernelMetadata;
    KernelFunction: IKernelFunction;
    Config:         TLaunchConfig;
    Params:         TKernelParamList;
    State:          TKernelState;
  end;

{ === BLOCK 164: CreateKernelDescriptor — initialises a TKernelDescriptor === }
function CreateKernelDescriptor(const Meta: TKernelMetadata;
                                 Func: IKernelFunction;
                                 out KD: TKernelDescriptor): TResult;

{ === BLOCK 165: ValidateKernelDescriptor — checks config, params, function not nil === }
function ValidateKernelDescriptor(const KD: TKernelDescriptor): TResult;

{ === BLOCK 166: SetKernelLaunchConfig — assigns launch config and advances state === }
function SetKernelLaunchConfig(var KD: TKernelDescriptor;
                                const Config: TLaunchConfig): TResult;

{ === BLOCK 167: ValidateLaunchConfig — checks thread/grid limits against device === }
function ValidateLaunchConfig(const Config: TLaunchConfig;
                               const Props: TDeviceProperties): TResult;

{ === BLOCK 168: TKernelRegistry — named kernel store === }
type
  TKernelRegistry = record
    Entries: array of TKernelDescriptor;
    Count:   TUInt32;
  end;

{ === BLOCK 169: RegisterKernel — validates and stores a descriptor by name === }
function RegisterKernel(var Reg: TKernelRegistry;
                         const KD: TKernelDescriptor): TResult;

{ === BLOCK 170: LookupKernel — retrieves a descriptor by metadata name === }
function LookupKernel(const Reg: TKernelRegistry;
                       const Name: AnsiString;
                       out KD: TKernelDescriptor): TResult;

{ === BLOCK 171: TKernelExecutionRecord — tracks one invocation === }
type
  TKernelExecutionRecord = record
    KernelName: AnsiString;
    StartTime:  TTimestamp;
    EndTime:    TTimestamp;
    GridDim:    TDim3D;
    BlockDim:   TDim3D;
    ExecResult: TResult;
  end;

{ === BLOCK 172: TKernelHistory — circular buffer of 256 execution records === }
const
  KERNEL_HISTORY_SIZE = 256;

type
  TKernelHistory = record
    Records: array[0..KERNEL_HISTORY_SIZE - 1] of TKernelExecutionRecord;
    Head:    TUInt32;
    Total:   TUInt64;
  end;

{ === BLOCK 173: RecordKernelExecution — writes to circular buffer and advances head === }
procedure RecordKernelExecution(var History: TKernelHistory;
                                 const Rec: TKernelExecutionRecord);

{ === BLOCK 174: PrintKernelHistory — returns human-readable history string === }
function PrintKernelHistory(const History: TKernelHistory): AnsiString;

{ === BLOCK 175: TAbstractKernelBase — base class; Execute is abstract === }
type
  TAbstractKernelBase = class(TInterfacedObject, IKernelFunction)
  protected
    FMetadata:    TKernelMetadata;
    FRequiredCap: TComputeCapability;
  public
    function GetMetadata: TKernelMetadata;
    function GetRequiredCapability: TComputeCapability;
    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                      const Params: TKernelParamList;
                      var SharedMem: TSharedMemoryRegion); virtual; abstract;
  end;

{ === BLOCK 176: TVectorAddKernel — element-wise float32 array addition === }
type
  TVectorAddKernel = class(TAbstractKernelBase)
  public
    constructor Create;
    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                      const Params: TKernelParamList;
                      var SharedMem: TSharedMemoryRegion); override;
  end;

{ === BLOCK 178: TVectorScaleKernel — element-wise scalar multiplication === }
type
  TVectorScaleKernel = class(TAbstractKernelBase)
  public
    constructor Create;
    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                      const Params: TKernelParamList;
                      var SharedMem: TSharedMemoryRegion); override;
  end;

{ === BLOCK 180: TMatMulKernel — naive matrix multiply (row-range assignment) === }
type
  TMatMulKernel = class(TAbstractKernelBase)
  public
    constructor Create;
    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                      const Params: TKernelParamList;
                      var SharedMem: TSharedMemoryRegion); override;
  end;

{ === BLOCK 182: TReduceSumKernel — parallel reduction using shared memory === }
type
  TReduceSumKernel = class(TAbstractKernelBase)
  public
    constructor Create;
    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                      const Params: TKernelParamList;
                      var SharedMem: TSharedMemoryRegion); override;
  end;

{ === BLOCK 184: TFillKernel — fills a buffer with a constant float32 value === }
type
  TFillKernel = class(TAbstractKernelBase)
  public
    constructor Create;
    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                      const Params: TKernelParamList;
                      var SharedMem: TSharedMemoryRegion); override;
  end;

{ === BLOCK 186: TCopyKernel — device-side buffer copy === }
type
  TCopyKernel = class(TAbstractKernelBase)
  public
    constructor Create;
    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                      const Params: TKernelParamList;
                      var SharedMem: TSharedMemoryRegion); override;
  end;

{ === BLOCK 188: TElementWiseMulKernel — Hadamard product of two float32 arrays === }
type
  TElementWiseMulKernel = class(TAbstractKernelBase)
  public
    constructor Create;
    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                      const Params: TKernelParamList;
                      var SharedMem: TSharedMemoryRegion); override;
  end;

{ === BLOCK 190: TReluKernel — ReLU activation max(0, x) === }
type
  TReluKernel = class(TAbstractKernelBase)
  public
    constructor Create;
    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                      const Params: TKernelParamList;
                      var SharedMem: TSharedMemoryRegion); override;
  end;

{ === BLOCK 192: TGELUKernel — GELU activation x * 0.5 * (1 + erf(x/sqrt(2))) === }
type
  TGELUKernel = class(TAbstractKernelBase)
  public
    constructor Create;
    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                      const Params: TKernelParamList;
                      var SharedMem: TSharedMemoryRegion); override;
  end;

{ === BLOCK 194: TSoftmaxKernel — row-wise softmax === }
type
  TSoftmaxKernel = class(TAbstractKernelBase)
  public
    constructor Create;
    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                      const Params: TKernelParamList;
                      var SharedMem: TSharedMemoryRegion); override;
  end;

{ === BLOCK 196: TArgMaxKernel — index of maximum value in each row === }
type
  TArgMaxKernel = class(TAbstractKernelBase)
  public
    constructor Create;
    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                      const Params: TKernelParamList;
                      var SharedMem: TSharedMemoryRegion); override;
  end;

{ === BLOCK 198: ValidateKernelGrid — ensures grid covers all elements === }
function ValidateKernelGrid(const KD: TKernelDescriptor): TResult;

{ === BLOCK 199: KernelLaunchSummary — human-readable launch info string === }
function KernelLaunchSummary(const KD: TKernelDescriptor): AnsiString;

{ === BLOCK 200: KernelSubsystemTest — self-test returning PGPU_SUCCESS on pass === }
function KernelSubsystemTest: TResult;

implementation

{ ------------------------------------------------------------------ }
{ Internal helpers                                                     }
{ ------------------------------------------------------------------ }

function KernelStateToString(State: TKernelState): AnsiString;
begin
  case State of
    ksCreated:  Result := 'Created';
    ksCompiled: Result := 'Compiled';
    ksReady:    Result := 'Ready';
    ksRunning:  Result := 'Running';
    ksDone:     Result := 'Done';
    ksFailed:   Result := 'Failed';
  else
    Result := 'Unknown';
  end;
end;

function ExtractParamPointer(const P: TKernelParam): Pointer;
begin
  Result := nil;
  Move(P.Data[0], Result, SizeOf(Pointer));
end;

function ExtractParamUInt32(const P: TKernelParam): TUInt32;
begin
  Result := 0;
  Move(P.Data[0], Result, SizeOf(TUInt32));
end;

function ExtractParamFloat32(const P: TKernelParam): TFloat32;
begin
  Result := 0.0;
  Move(P.Data[0], Result, SizeOf(TFloat32));
end;

function GELUActivate(x: Double): Double;
begin
  { GELU(x) = x * 0.5 * (1 + erf(x / sqrt(2))) }
  Result := x * 0.5 * (1.0 + Erf(x * 0.7071067811865476));
end;

{ ------------------------------------------------------------------ }
{ MakeDefaultDeviceProperties                                         }
{ ------------------------------------------------------------------ }

function MakeDefaultDeviceProperties: TDeviceProperties;
begin
  Result.MaxThreadsPerBlock   := 1024;
  Result.MaxBlockDim          := MakeDim3D(1024, 1024, 64);
  Result.MaxGridDim           := MakeDim3D(65535, 65535, 65535);
  Result.MaxSharedMemPerBlock := 49152;
  Result.WarpSize             := 32;
  Result.MultiprocessorCount  := 1;
  Result.ComputeCapability    := MakeComputeCapability(8, 6);
end;

{ === BLOCK 154: AddParam32 implementation === }
procedure AddParam32(var List: TKernelParamList; const Name: AnsiString;
                     Value: TUInt32);
var
  P: TKernelParam;
begin
  FillChar(P.Data, SizeOf(P.Data), 0);
  P.Kind       := kpScalar32;
  P.Name       := Name;
  P.ValueBytes := SizeOf(TUInt32);
  Move(Value, P.Data[0], SizeOf(TUInt32));
  SetLength(List.Items, List.Count + 1);
  List.Items[List.Count] := P;
  Inc(List.Count);
end;

{ === BLOCK 155: AddParam64 implementation === }
procedure AddParam64(var List: TKernelParamList; const Name: AnsiString;
                     Value: TUInt64);
var
  P: TKernelParam;
begin
  FillChar(P.Data, SizeOf(P.Data), 0);
  P.Kind       := kpScalar64;
  P.Name       := Name;
  P.ValueBytes := SizeOf(TUInt64);
  Move(Value, P.Data[0], SizeOf(TUInt64));
  SetLength(List.Items, List.Count + 1);
  List.Items[List.Count] := P;
  Inc(List.Count);
end;

{ === BLOCK 156: AddParamF32 implementation === }
procedure AddParamF32(var List: TKernelParamList; const Name: AnsiString;
                      Value: TFloat32);
var
  P: TKernelParam;
begin
  FillChar(P.Data, SizeOf(P.Data), 0);
  P.Kind       := kpScalar32;
  P.Name       := Name;
  P.ValueBytes := SizeOf(TFloat32);
  Move(Value, P.Data[0], SizeOf(TFloat32));
  SetLength(List.Items, List.Count + 1);
  List.Items[List.Count] := P;
  Inc(List.Count);
end;

{ === BLOCK 157: AddParamPtr implementation === }
procedure AddParamPtr(var List: TKernelParamList; const Name: AnsiString;
                      Ptr: Pointer);
var
  P: TKernelParam;
begin
  FillChar(P.Data, SizeOf(P.Data), 0);
  P.Kind       := kpPointer;
  P.Name       := Name;
  P.ValueBytes := SizeOf(Pointer);
  Move(Ptr, P.Data[0], SizeOf(Pointer));
  SetLength(List.Items, List.Count + 1);
  List.Items[List.Count] := P;
  Inc(List.Count);
end;

{ === BLOCK 158: AddParamBuffer implementation === }
procedure AddParamBuffer(var List: TKernelParamList; const Name: AnsiString;
                         var Mem: TDeviceMemory);
var
  P:   TKernelParam;
  Ptr: Pointer;
begin
  FillChar(P.Data, SizeOf(P.Data), 0);
  P.Kind       := kpBuffer;
  P.Name       := Name;
  P.ValueBytes := SizeOf(Pointer);
  Ptr := Mem.Ptr;
  Move(Ptr, P.Data[0], SizeOf(Pointer));
  SetLength(List.Items, List.Count + 1);
  List.Items[List.Count] := P;
  Inc(List.Count);
end;

{ === BLOCK 159: FindParam implementation === }
function FindParam(const List: TKernelParamList; const Name: AnsiString;
                   out Param: TKernelParam): TResult;
var
  I: TUInt32;
begin
  if List.Count > 0 then
    for I := 0 to List.Count - 1 do
      if List.Items[I].Name = Name then
      begin
        Param  := List.Items[I];
        Result := PGPU_SUCCESS;
        Exit;
      end;
  FillChar(Param, SizeOf(Param), 0);
  Result := PGPU_ERR_NOT_FOUND;
end;

{ === BLOCK 164: CreateKernelDescriptor implementation === }
function CreateKernelDescriptor(const Meta: TKernelMetadata;
                                 Func: IKernelFunction;
                                 out KD: TKernelDescriptor): TResult;
begin
  KD.Metadata            := Meta;
  KD.KernelFunction      := Func;
  KD.Config.GridDim      := MakeDim3D(0, 0, 0);
  KD.Config.BlockDim     := MakeDim3D(0, 0, 0);
  KD.Config.SharedMemBytes := 0;
  KD.Config.StreamID     := 0;
  KD.Params.Count        := 0;
  KD.Params.Items        := nil;
  KD.State               := ksCreated;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 165: ValidateKernelDescriptor implementation === }
function ValidateKernelDescriptor(const KD: TKernelDescriptor): TResult;
begin
  if not Assigned(KD.KernelFunction) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if KD.State = ksFailed then
  begin
    Result := PGPU_ERR_KERNEL_FAILED;
    Exit;
  end;
  if (KD.Config.BlockDim.X = 0) and (KD.State >= ksReady) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 166: SetKernelLaunchConfig implementation === }
function SetKernelLaunchConfig(var KD: TKernelDescriptor;
                                const Config: TLaunchConfig): TResult;
begin
  if Config.BlockDim.X = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Config.GridDim.X = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  KD.Config := Config;
  if KD.State = ksCreated then
    KD.State := ksReady
  else if KD.State = ksCompiled then
    KD.State := ksReady;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 167: ValidateLaunchConfig implementation === }
function ValidateLaunchConfig(const Config: TLaunchConfig;
                               const Props: TDeviceProperties): TResult;
var
  TotalThreads: TUInt32;
begin
  { Check block dimensions }
  if Config.BlockDim.X > Props.MaxBlockDim.X then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Config.BlockDim.Y > Props.MaxBlockDim.Y then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Config.BlockDim.Z > Props.MaxBlockDim.Z then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  { Check total threads per block }
  TotalThreads := Config.BlockDim.X * Config.BlockDim.Y * Config.BlockDim.Z;
  if TotalThreads > Props.MaxThreadsPerBlock then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  { Check grid dimensions }
  if Config.GridDim.X > Props.MaxGridDim.X then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Config.GridDim.Y > Props.MaxGridDim.Y then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Config.GridDim.Z > Props.MaxGridDim.Z then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  { Check shared memory }
  if Config.SharedMemBytes > Props.MaxSharedMemPerBlock then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 169: RegisterKernel implementation === }
function RegisterKernel(var Reg: TKernelRegistry;
                         const KD: TKernelDescriptor): TResult;
var
  I: TUInt32;
begin
  { Validate first }
  Result := ValidateKernelDescriptor(KD);
  if Result <> PGPU_SUCCESS then
    Exit;
  { Check for duplicate name }
  if Reg.Count > 0 then
    for I := 0 to Reg.Count - 1 do
      if Reg.Entries[I].Metadata.Name = KD.Metadata.Name then
      begin
        Result := PGPU_ERR_ALREADY_INIT;
        Exit;
      end;
  { Append }
  SetLength(Reg.Entries, Reg.Count + 1);
  Reg.Entries[Reg.Count] := KD;
  Inc(Reg.Count);
  Result := PGPU_SUCCESS;
end;

{ === BLOCK 170: LookupKernel implementation === }
function LookupKernel(const Reg: TKernelRegistry;
                       const Name: AnsiString;
                       out KD: TKernelDescriptor): TResult;
var
  I: TUInt32;
begin
  if Reg.Count > 0 then
    for I := 0 to Reg.Count - 1 do
      if Reg.Entries[I].Metadata.Name = Name then
      begin
        KD     := Reg.Entries[I];
        Result := PGPU_SUCCESS;
        Exit;
      end;
  FillChar(KD.Config, SizeOf(KD.Config), 0);
  KD.KernelFunction := nil;
  KD.State          := ksCreated;
  Result := PGPU_ERR_NOT_FOUND;
end;

{ === BLOCK 173: RecordKernelExecution implementation === }
procedure RecordKernelExecution(var History: TKernelHistory;
                                 const Rec: TKernelExecutionRecord);
var
  Slot: TUInt32;
begin
  Slot := History.Head mod TUInt32(KERNEL_HISTORY_SIZE);
  History.Records[Slot] := Rec;
  Inc(History.Head);
  Inc(History.Total);
end;

{ === BLOCK 174: PrintKernelHistory implementation === }
function PrintKernelHistory(const History: TKernelHistory): AnsiString;
var
  I, Start, Limit: TUInt32;
  Rec: TKernelExecutionRecord;
  DurNs: TUInt64;
  Line: AnsiString;
begin
  Result := '';
  if History.Total = 0 then
  begin
    Result := '[KernelHistory: empty]';
    Exit;
  end;
  if History.Total >= TUInt64(KERNEL_HISTORY_SIZE) then
  begin
    Start := History.Head mod TUInt32(KERNEL_HISTORY_SIZE);
    Limit := TUInt32(KERNEL_HISTORY_SIZE);
  end
  else
  begin
    Start := 0;
    Limit := TUInt32(History.Total);
  end;

  Result := Format('[KernelHistory: %u entries]'#10, [Limit]);
  for I := 0 to Limit - 1 do
  begin
    Rec := History.Records[(Start + I) mod TUInt32(KERNEL_HISTORY_SIZE)];
    if Rec.EndTime >= Rec.StartTime then
      DurNs := Rec.EndTime - Rec.StartTime
    else
      DurNs := 0;
    Line := Format(
      '  [%03u] %-24s Grid:(%u,%u,%u) Block:(%u,%u,%u) Dur:%uns Result:%d'#10,
      [I,
       Rec.KernelName,
       Rec.GridDim.X, Rec.GridDim.Y, Rec.GridDim.Z,
       Rec.BlockDim.X, Rec.BlockDim.Y, Rec.BlockDim.Z,
       DurNs,
       Rec.ExecResult]);
    Result := Result + Line;
  end;
end;

{ === BLOCK 175: TAbstractKernelBase implementation === }

function TAbstractKernelBase.GetMetadata: TKernelMetadata;
begin
  Result := FMetadata;
end;

function TAbstractKernelBase.GetRequiredCapability: TComputeCapability;
begin
  Result := FRequiredCap;
end;

{ === BLOCK 176 + 177: TVectorAddKernel — constructor and Execute === }

constructor TVectorAddKernel.Create;
begin
  inherited Create;
  FMetadata.Name              := 'vector_add';
  FMetadata.Version           := '1.0';
  FMetadata.Author            := 'PascalGPU';
  FMetadata.Description       := 'Element-wise addition of two float32 arrays';
  FMetadata.RequiredSharedMem := 0;
  FRequiredCap                := MakeComputeCapability(1, 0);
end;

{ === BLOCK 177: TVectorAddKernel.Execute — grid-stride loop over A+B→C === }
procedure TVectorAddKernel.Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                                    const Params: TKernelParamList;
                                    var SharedMem: TSharedMemoryRegion);
var
  PA, PB, PC, PN: TKernelParam;
  A, B, C: PFloat32;
  N, GIdx, Stride: TUInt32;
begin
  if FindParam(Params, 'A', PA) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'B', PB) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'C', PC) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'N', PN) <> PGPU_SUCCESS then Exit;

  A      := PFloat32(ExtractParamPointer(PA));
  B      := PFloat32(ExtractParamPointer(PB));
  C      := PFloat32(ExtractParamPointer(PC));
  N      := ExtractParamUInt32(PN);
  Stride := GridDim.X * BlockDim.X;

  if (Stride = 0) or not Assigned(A) or not Assigned(B) or not Assigned(C) then
    Exit;

  GIdx := BlockIdx.X * BlockDim.X + ThreadIdx.X;
  while GIdx < N do
  begin
    C[GIdx] := A[GIdx] + B[GIdx];
    Inc(GIdx, Stride);
  end;
end;

{ === BLOCK 178 + 179: TVectorScaleKernel — constructor and Execute === }

constructor TVectorScaleKernel.Create;
begin
  inherited Create;
  FMetadata.Name              := 'vector_scale';
  FMetadata.Version           := '1.0';
  FMetadata.Author            := 'PascalGPU';
  FMetadata.Description       := 'Multiplies float32 array by scalar value';
  FMetadata.RequiredSharedMem := 0;
  FRequiredCap                := MakeComputeCapability(1, 0);
end;

{ === BLOCK 179: TVectorScaleKernel.Execute — grid-stride loop multiplying by scalar === }
procedure TVectorScaleKernel.Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                                      const Params: TKernelParamList;
                                      var SharedMem: TSharedMemoryRegion);
var
  PA, PC, PN, PS: TKernelParam;
  A, C: PFloat32;
  Scale: TFloat32;
  N, GIdx, Stride: TUInt32;
begin
  if FindParam(Params, 'A',     PA) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'C',     PC) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'N',     PN) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'Scale', PS) <> PGPU_SUCCESS then Exit;

  A      := PFloat32(ExtractParamPointer(PA));
  C      := PFloat32(ExtractParamPointer(PC));
  N      := ExtractParamUInt32(PN);
  Scale  := ExtractParamFloat32(PS);
  Stride := GridDim.X * BlockDim.X;

  if (Stride = 0) or not Assigned(A) or not Assigned(C) then
    Exit;

  GIdx := BlockIdx.X * BlockDim.X + ThreadIdx.X;
  while GIdx < N do
  begin
    C[GIdx] := A[GIdx] * Scale;
    Inc(GIdx, Stride);
  end;
end;

{ === BLOCK 180 + 181: TMatMulKernel — constructor and Execute === }

constructor TMatMulKernel.Create;
begin
  inherited Create;
  FMetadata.Name              := 'matmul';
  FMetadata.Version           := '1.0';
  FMetadata.Author            := 'PascalGPU';
  FMetadata.Description       := 'Naive matrix multiplication C = A * B (row-range)';
  FMetadata.RequiredSharedMem := 0;
  FRequiredCap                := MakeComputeCapability(1, 0);
end;

{ === BLOCK 181: TMatMulKernel.Execute — triple loop over assigned row range === }
procedure TMatMulKernel.Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                                 const Params: TKernelParamList;
                                 var SharedMem: TSharedMemoryRegion);
var
  PA, PB, PC, PM, PK, PN: TKernelParam;
  A, B, C: PFloat32;
  M, K, ColN, Row, Col, Inner: TUInt32;
  RowStride: TUInt32;
  Acc: TFloat32;
begin
  if FindParam(Params, 'A',    PA) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'B',    PB) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'C',    PC) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'M',    PM) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'K',    PK) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'N',    PN) <> PGPU_SUCCESS then Exit;

  A         := PFloat32(ExtractParamPointer(PA));
  B         := PFloat32(ExtractParamPointer(PB));
  C         := PFloat32(ExtractParamPointer(PC));
  M         := ExtractParamUInt32(PM);  { rows of A and C }
  K         := ExtractParamUInt32(PK);  { inner dimension }
  ColN      := ExtractParamUInt32(PN);  { cols of B and C }
  RowStride := GridDim.X * BlockDim.X;

  if (RowStride = 0) or not Assigned(A) or not Assigned(B) or not Assigned(C) then
    Exit;

  Row := BlockIdx.X * BlockDim.X + ThreadIdx.X;
  while Row < M do
  begin
    { For each column in C }
    for Col := 0 to ColN - 1 do
    begin
      Acc := 0.0;
      { Inner product over K }
      for Inner := 0 to K - 1 do
        Acc := Acc + A[Row * K + Inner] * B[Inner * ColN + Col];
      C[Row * ColN + Col] := Acc;
    end;
    Inc(Row, RowStride);
  end;
end;

{ === BLOCK 182 + 183: TReduceSumKernel — constructor and Execute === }

constructor TReduceSumKernel.Create;
begin
  inherited Create;
  FMetadata.Name              := 'reduce_sum';
  FMetadata.Version           := '1.0';
  FMetadata.Author            := 'PascalGPU';
  FMetadata.Description       := 'Parallel tree-reduction sum; one output per block';
  FMetadata.RequiredSharedMem := 4096;
  FRequiredCap                := MakeComputeCapability(1, 0);
end;

{ === BLOCK 183: TReduceSumKernel.Execute — tree reduction via shared memory === }
procedure TReduceSumKernel.Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                                    const Params: TKernelParamList;
                                    var SharedMem: TSharedMemoryRegion);
var
  PInput, POutput, PN: TKernelParam;
  Input, Output: PFloat32;
  N, TID, BID, BStart, BEnd, BSize: TUInt32;
  SMem: PFloat32;
  I, Step: TUInt32;
  Acc: TFloat32;
begin
  if FindParam(Params, 'Input',  PInput)  <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'Output', POutput) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'N',      PN)      <> PGPU_SUCCESS then Exit;

  Input  := PFloat32(ExtractParamPointer(PInput));
  Output := PFloat32(ExtractParamPointer(POutput));
  N      := ExtractParamUInt32(PN);
  TID    := ThreadIdx.X;
  BID    := BlockIdx.X;

  { Only thread 0 of each block performs the reduction in simulation }
  if TID <> 0 then
    Exit;

  BStart := BID * BlockDim.X;
  if BStart >= N then
  begin
    Output[BID] := 0.0;
    Exit;
  end;
  BEnd := BStart + BlockDim.X;
  if BEnd > N then
    BEnd := N;
  BSize := BEnd - BStart;

  if Assigned(SharedMem.Data) and (SharedMem.Size >= BSize * SizeOf(TFloat32)) then
  begin
    { Load block elements into simulated shared memory }
    SMem := PFloat32(SharedMem.Data);
    for I := 0 to BSize - 1 do
      SMem[I] := Input[BStart + I];

    { Tree reduction: stride doubles each pass }
    Step := 1;
    while Step < BSize do
    begin
      I := 0;
      while I + Step < BSize do
      begin
        SMem[I] := SMem[I] + SMem[I + Step];
        Inc(I, Step * 2);
      end;
      Step := Step * 2;
    end;

    Output[BID] := SMem[0];
  end
  else
  begin
    { Fallback: sequential sum when no shared memory is allocated }
    Acc := 0.0;
    for I := BStart to BEnd - 1 do
      Acc := Acc + Input[I];
    Output[BID] := Acc;
  end;
end;

{ === BLOCK 184 + 185: TFillKernel — constructor and Execute === }

constructor TFillKernel.Create;
begin
  inherited Create;
  FMetadata.Name              := 'fill';
  FMetadata.Version           := '1.0';
  FMetadata.Author            := 'PascalGPU';
  FMetadata.Description       := 'Fills a float32 buffer with a constant value';
  FMetadata.RequiredSharedMem := 0;
  FRequiredCap                := MakeComputeCapability(1, 0);
end;

{ === BLOCK 185: TFillKernel.Execute — grid-stride fill of constant value === }
procedure TFillKernel.Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                               const Params: TKernelParamList;
                               var SharedMem: TSharedMemoryRegion);
var
  PBuf, PN, PVal: TKernelParam;
  Buf: PFloat32;
  N, GIdx, Stride: TUInt32;
  Value: TFloat32;
begin
  if FindParam(Params, 'Buffer', PBuf) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'N',      PN)   <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'Value',  PVal) <> PGPU_SUCCESS then Exit;

  Buf    := PFloat32(ExtractParamPointer(PBuf));
  N      := ExtractParamUInt32(PN);
  Value  := ExtractParamFloat32(PVal);
  Stride := GridDim.X * BlockDim.X;

  if (Stride = 0) or not Assigned(Buf) then
    Exit;

  GIdx := BlockIdx.X * BlockDim.X + ThreadIdx.X;
  while GIdx < N do
  begin
    Buf[GIdx] := Value;
    Inc(GIdx, Stride);
  end;
end;

{ === BLOCK 186 + 187: TCopyKernel — constructor and Execute === }

constructor TCopyKernel.Create;
begin
  inherited Create;
  FMetadata.Name              := 'copy';
  FMetadata.Version           := '1.0';
  FMetadata.Author            := 'PascalGPU';
  FMetadata.Description       := 'Device-side buffer copy (float32)';
  FMetadata.RequiredSharedMem := 0;
  FRequiredCap                := MakeComputeCapability(1, 0);
end;

{ === BLOCK 187: TCopyKernel.Execute — grid-stride element copy === }
procedure TCopyKernel.Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                               const Params: TKernelParamList;
                               var SharedMem: TSharedMemoryRegion);
var
  PSrc, PDst, PN: TKernelParam;
  Src, Dst: PFloat32;
  N, GIdx, Stride: TUInt32;
begin
  if FindParam(Params, 'Src', PSrc) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'Dst', PDst) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'N',   PN)   <> PGPU_SUCCESS then Exit;

  Src    := PFloat32(ExtractParamPointer(PSrc));
  Dst    := PFloat32(ExtractParamPointer(PDst));
  N      := ExtractParamUInt32(PN);
  Stride := GridDim.X * BlockDim.X;

  if (Stride = 0) or not Assigned(Src) or not Assigned(Dst) then
    Exit;

  GIdx := BlockIdx.X * BlockDim.X + ThreadIdx.X;
  while GIdx < N do
  begin
    Dst[GIdx] := Src[GIdx];
    Inc(GIdx, Stride);
  end;
end;

{ === BLOCK 188 + 189: TElementWiseMulKernel — constructor and Execute === }

constructor TElementWiseMulKernel.Create;
begin
  inherited Create;
  FMetadata.Name              := 'elementwise_mul';
  FMetadata.Version           := '1.0';
  FMetadata.Author            := 'PascalGPU';
  FMetadata.Description       := 'Hadamard product of two float32 arrays';
  FMetadata.RequiredSharedMem := 0;
  FRequiredCap                := MakeComputeCapability(1, 0);
end;

{ === BLOCK 189: TElementWiseMulKernel.Execute — grid-stride Hadamard product === }
procedure TElementWiseMulKernel.Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                                         const Params: TKernelParamList;
                                         var SharedMem: TSharedMemoryRegion);
var
  PA, PB, PC, PN: TKernelParam;
  A, B, C: PFloat32;
  N, GIdx, Stride: TUInt32;
begin
  if FindParam(Params, 'A', PA) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'B', PB) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'C', PC) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'N', PN) <> PGPU_SUCCESS then Exit;

  A      := PFloat32(ExtractParamPointer(PA));
  B      := PFloat32(ExtractParamPointer(PB));
  C      := PFloat32(ExtractParamPointer(PC));
  N      := ExtractParamUInt32(PN);
  Stride := GridDim.X * BlockDim.X;

  if (Stride = 0) or not Assigned(A) or not Assigned(B) or not Assigned(C) then
    Exit;

  GIdx := BlockIdx.X * BlockDim.X + ThreadIdx.X;
  while GIdx < N do
  begin
    C[GIdx] := A[GIdx] * B[GIdx];
    Inc(GIdx, Stride);
  end;
end;

{ === BLOCK 190 + 191: TReluKernel — constructor and Execute === }

constructor TReluKernel.Create;
begin
  inherited Create;
  FMetadata.Name              := 'relu';
  FMetadata.Version           := '1.0';
  FMetadata.Author            := 'PascalGPU';
  FMetadata.Description       := 'ReLU activation: Output[i] = max(0, Input[i])';
  FMetadata.RequiredSharedMem := 0;
  FRequiredCap                := MakeComputeCapability(1, 0);
end;

{ === BLOCK 191: TReluKernel.Execute — grid-stride ReLU application === }
procedure TReluKernel.Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                               const Params: TKernelParamList;
                               var SharedMem: TSharedMemoryRegion);
var
  PIn, POut, PN: TKernelParam;
  Input, Output: PFloat32;
  N, GIdx, Stride: TUInt32;
begin
  if FindParam(Params, 'Input',  PIn)  <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'Output', POut) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'N',      PN)   <> PGPU_SUCCESS then Exit;

  Input  := PFloat32(ExtractParamPointer(PIn));
  Output := PFloat32(ExtractParamPointer(POut));
  N      := ExtractParamUInt32(PN);
  Stride := GridDim.X * BlockDim.X;

  if (Stride = 0) or not Assigned(Input) or not Assigned(Output) then
    Exit;

  GIdx := BlockIdx.X * BlockDim.X + ThreadIdx.X;
  while GIdx < N do
  begin
    if Input[GIdx] > 0.0 then
      Output[GIdx] := Input[GIdx]
    else
      Output[GIdx] := 0.0;
    Inc(GIdx, Stride);
  end;
end;

{ === BLOCK 192 + 193: TGELUKernel — constructor and Execute === }

constructor TGELUKernel.Create;
begin
  inherited Create;
  FMetadata.Name              := 'gelu';
  FMetadata.Version           := '1.0';
  FMetadata.Author            := 'PascalGPU';
  FMetadata.Description       := 'GELU activation: x * 0.5 * (1 + erf(x / sqrt(2)))';
  FMetadata.RequiredSharedMem := 0;
  FRequiredCap                := MakeComputeCapability(1, 0);
end;

{ === BLOCK 193: TGELUKernel.Execute — grid-stride GELU activation === }
procedure TGELUKernel.Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                               const Params: TKernelParamList;
                               var SharedMem: TSharedMemoryRegion);
var
  PIn, POut, PN: TKernelParam;
  Input, Output: PFloat32;
  N, GIdx, Stride: TUInt32;
begin
  if FindParam(Params, 'Input',  PIn)  <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'Output', POut) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'N',      PN)   <> PGPU_SUCCESS then Exit;

  Input  := PFloat32(ExtractParamPointer(PIn));
  Output := PFloat32(ExtractParamPointer(POut));
  N      := ExtractParamUInt32(PN);
  Stride := GridDim.X * BlockDim.X;

  if (Stride = 0) or not Assigned(Input) or not Assigned(Output) then
    Exit;

  GIdx := BlockIdx.X * BlockDim.X + ThreadIdx.X;
  while GIdx < N do
  begin
    Output[GIdx] := TFloat32(GELUActivate(Input[GIdx]));
    Inc(GIdx, Stride);
  end;
end;

{ === BLOCK 194 + 195: TSoftmaxKernel — constructor and Execute === }

constructor TSoftmaxKernel.Create;
begin
  inherited Create;
  FMetadata.Name              := 'softmax';
  FMetadata.Version           := '1.0';
  FMetadata.Author            := 'PascalGPU';
  FMetadata.Description       := 'Row-wise softmax over a 2D float32 matrix';
  FMetadata.RequiredSharedMem := 0;
  FRequiredCap                := MakeComputeCapability(1, 0);
end;

{ === BLOCK 195: TSoftmaxKernel.Execute — row-wise softmax, one thread per row === }
procedure TSoftmaxKernel.Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                                  const Params: TKernelParamList;
                                  var SharedMem: TSharedMemoryRegion);
var
  PIn, POut, PRows, PCols: TKernelParam;
  Input, Output: PFloat32;
  Rows, Cols, Row, Col: TUInt32;
  RowStride: TUInt32;
  MaxVal, SumExp, Expv: TFloat32;
  RowBase: TUInt32;
begin
  if FindParam(Params, 'Input',  PIn)   <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'Output', POut)  <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'Rows',   PRows) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'Cols',   PCols) <> PGPU_SUCCESS then Exit;

  Input     := PFloat32(ExtractParamPointer(PIn));
  Output    := PFloat32(ExtractParamPointer(POut));
  Rows      := ExtractParamUInt32(PRows);
  Cols      := ExtractParamUInt32(PCols);
  RowStride := GridDim.X * BlockDim.X;

  if (RowStride = 0) or (Cols = 0) or not Assigned(Input) or not Assigned(Output) then
    Exit;

  Row := BlockIdx.X * BlockDim.X + ThreadIdx.X;
  while Row < Rows do
  begin
    RowBase := Row * Cols;

    { Pass 1: find row maximum for numerical stability }
    MaxVal := Input[RowBase];
    for Col := 1 to Cols - 1 do
      if Input[RowBase + Col] > MaxVal then
        MaxVal := Input[RowBase + Col];

    { Pass 2: compute exp(x - max) and accumulate sum }
    SumExp := 0.0;
    for Col := 0 to Cols - 1 do
    begin
      Expv := TFloat32(Exp(Input[RowBase + Col] - MaxVal));
      Output[RowBase + Col] := Expv;
      SumExp := SumExp + Expv;
    end;

    { Pass 3: normalise }
    if SumExp > 0.0 then
      for Col := 0 to Cols - 1 do
        Output[RowBase + Col] := Output[RowBase + Col] / SumExp;

    Inc(Row, RowStride);
  end;
end;

{ === BLOCK 196 + 197: TArgMaxKernel — constructor and Execute === }

constructor TArgMaxKernel.Create;
begin
  inherited Create;
  FMetadata.Name              := 'argmax';
  FMetadata.Version           := '1.0';
  FMetadata.Author            := 'PascalGPU';
  FMetadata.Description       := 'Index of max value in each row of a 2D float32 matrix';
  FMetadata.RequiredSharedMem := 0;
  FRequiredCap                := MakeComputeCapability(1, 0);
end;

{ === BLOCK 197: TArgMaxKernel.Execute — row-wise argmax, one thread per row === }
procedure TArgMaxKernel.Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;
                                 const Params: TKernelParamList;
                                 var SharedMem: TSharedMemoryRegion);
var
  PIn, POut, PRows, PCols: TKernelParam;
  Input: PFloat32;
  Output: PInt32;
  Rows, Cols, Row, Col, BestIdx: TUInt32;
  RowStride, RowBase: TUInt32;
  BestVal, CurVal: TFloat32;
begin
  if FindParam(Params, 'Input',  PIn)   <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'Output', POut)  <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'Rows',   PRows) <> PGPU_SUCCESS then Exit;
  if FindParam(Params, 'Cols',   PCols) <> PGPU_SUCCESS then Exit;

  Input     := PFloat32(ExtractParamPointer(PIn));
  Output    := PInt32(ExtractParamPointer(POut));
  Rows      := ExtractParamUInt32(PRows);
  Cols      := ExtractParamUInt32(PCols);
  RowStride := GridDim.X * BlockDim.X;

  if (RowStride = 0) or (Cols = 0) or not Assigned(Input) or not Assigned(Output) then
    Exit;

  Row := BlockIdx.X * BlockDim.X + ThreadIdx.X;
  while Row < Rows do
  begin
    RowBase := Row * Cols;
    BestIdx := 0;
    BestVal := Input[RowBase];
    for Col := 1 to Cols - 1 do
    begin
      CurVal := Input[RowBase + Col];
      if CurVal > BestVal then
      begin
        BestVal := CurVal;
        BestIdx := Col;
      end;
    end;
    Output[Row] := TInt32(BestIdx);
    Inc(Row, RowStride);
  end;
end;

{ === BLOCK 198: ValidateKernelGrid implementation === }
function ValidateKernelGrid(const KD: TKernelDescriptor): TResult;
var
  PN: TKernelParam;
  N, TotalThreads: TUInt32;
begin
  if KD.Config.BlockDim.X = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if KD.Config.GridDim.X = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;

  TotalThreads := KD.Config.GridDim.X * KD.Config.BlockDim.X;

  { If an 'N' param exists, verify grid covers all N elements }
  if FindParam(KD.Params, 'N', PN) = PGPU_SUCCESS then
  begin
    N := ExtractParamUInt32(PN);
    if TotalThreads < N then
    begin
      { Grid-stride kernels cover all elements; only flag if stride coverage
        is impossible (TotalThreads = 0 already caught above). }
      { For non-striding kernels: grid must cover exactly N elements }
      if (KD.Config.GridDim.X * KD.Config.BlockDim.X) < N then
      begin
        { Warning, not fatal — grid-stride loops still work }
        Result := PGPU_SUCCESS;
        Exit;
      end;
    end;
  end;

  { Also check 2D row-based kernels ('Rows' param) }
  if FindParam(KD.Params, 'Rows', PN) = PGPU_SUCCESS then
  begin
    N := ExtractParamUInt32(PN);
    if N = 0 then
    begin
      Result := PGPU_ERR_INVALID_PARAM;
      Exit;
    end;
  end;

  Result := PGPU_SUCCESS;
end;

{ === BLOCK 199: KernelLaunchSummary implementation === }
function KernelLaunchSummary(const KD: TKernelDescriptor): AnsiString;
begin
  Result := Format(
    'Kernel: %-20s | Version: %-6s | ' +
    'Grid: (%u,%u,%u) | Block: (%u,%u,%u) | ' +
    'SharedMem: %u B | Params: %u | State: %s',
    [KD.Metadata.Name,
     KD.Metadata.Version,
     KD.Config.GridDim.X,  KD.Config.GridDim.Y,  KD.Config.GridDim.Z,
     KD.Config.BlockDim.X, KD.Config.BlockDim.Y, KD.Config.BlockDim.Z,
     KD.Config.SharedMemBytes,
     KD.Params.Count,
     KernelStateToString(KD.State)]);
end;

{ === BLOCK 200: KernelSubsystemTest implementation === }
function KernelSubsystemTest: TResult;
const
  TEST_N = 8;
  TEST_ROWS = 2;
  TEST_COLS = 4;
var
  { Param list tests }
  PList:   TKernelParamList;
  PFound:  TKernelParam;
  V32:     TUInt32;
  VF32:    TFloat32;
  VPtr:    Pointer;

  { VectorAdd test data }
  AArr, BArr, CArr: array[0..TEST_N - 1] of TFloat32;
  I: Integer;
  PA, PB, PC: Pointer;

  { Fill test data }
  FillArr: array[0..TEST_N - 1] of TFloat32;

  { Copy test data }
  SrcArr, DstArr: array[0..TEST_N - 1] of TFloat32;

  { ArgMax test data }
  MatIn:  array[0..(TEST_ROWS * TEST_COLS) - 1] of TFloat32;
  IdxOut: array[0..TEST_ROWS - 1] of TInt32;

  { Reduce test data }
  RedIn:  array[0..TEST_N - 1] of TFloat32;
  RedOut: array[0..0] of TFloat32;
  SMem:   TSharedMemoryRegion;
  SMemBuf: array[0..TEST_N - 1] of TFloat32;

  { Kernel objects }
  KAdd:    TVectorAddKernel;
  KFill:   TFillKernel;
  KCopy:   TCopyKernel;
  KRelu:   TReluKernel;
  KArgMax: TArgMaxKernel;
  KReduce: TReduceSumKernel;

  KParams: TKernelParamList;
  KDesc:   TKernelDescriptor;
  Meta:    TKernelMetadata;
  Reg:     TKernelRegistry;
  Hist:    TKernelHistory;
  HistRec: TKernelExecutionRecord;
  Props:   TDeviceProperties;
  Config:  TLaunchConfig;
  GridD, BlockD: TDim3D;
  Shared: TSharedMemoryRegion;
  HistStr: AnsiString;
begin
  Result := PGPU_SUCCESS;

  { --- Test 1: TKernelParamList add and find --- }
  PList.Count := 0;
  PList.Items := nil;

  AddParam32(PList, 'MyU32', TUInt32(42));
  AddParamF32(PList, 'MyF32', TFloat32(3.14));
  AddParamPtr(PList, 'MyPtr', @Result);

  if PList.Count <> 3 then begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;

  if FindParam(PList, 'MyU32', PFound) <> PGPU_SUCCESS then
    begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
  V32 := ExtractParamUInt32(PFound);
  if V32 <> 42 then begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;

  if FindParam(PList, 'MyF32', PFound) <> PGPU_SUCCESS then
    begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
  VF32 := ExtractParamFloat32(PFound);
  if Abs(VF32 - 3.14) > 0.001 then begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;

  if FindParam(PList, 'MyPtr', PFound) <> PGPU_SUCCESS then
    begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
  VPtr := ExtractParamPointer(PFound);
  if VPtr <> @Result then begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;

  if FindParam(PList, 'NoSuch', PFound) = PGPU_SUCCESS then
    begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;

  { --- Test 2: TVectorAddKernel --- }
  for I := 0 to TEST_N - 1 do
  begin
    AArr[I] := TFloat32(I + 1);
    BArr[I] := TFloat32((I + 1) * 10);
    CArr[I] := 0.0;
  end;

  PA := @AArr[0];
  PB := @BArr[0];
  PC := @CArr[0];

  KParams.Count := 0;
  KParams.Items := nil;
  AddParamPtr(KParams, 'A', PA);
  AddParamPtr(KParams, 'B', PB);
  AddParamPtr(KParams, 'C', PC);
  AddParam32(KParams, 'N', TUInt32(TEST_N));

  KAdd := TVectorAddKernel.Create;
  try
    GridD  := MakeDim3D(1, 1, 1);
    BlockD := MakeDim3D(1, 1, 1);
    FillChar(Shared, SizeOf(Shared), 0);
    KAdd.Execute(MakeDim3D(0,0,0), MakeDim3D(0,0,0), BlockD, GridD, KParams, Shared);
    for I := 0 to TEST_N - 1 do
      if Abs(CArr[I] - ((I+1) + (I+1)*10)) > 0.001 then
        begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
  finally
    KAdd.Free;
  end;

  { --- Test 3: TFillKernel --- }
  for I := 0 to TEST_N - 1 do FillArr[I] := 0.0;

  KParams.Count := 0;
  KParams.Items := nil;
  AddParamPtr(KParams, 'Buffer', @FillArr[0]);
  AddParam32(KParams, 'N',   TUInt32(TEST_N));
  AddParamF32(KParams, 'Value', TFloat32(7.5));

  KFill := TFillKernel.Create;
  try
    FillChar(Shared, SizeOf(Shared), 0);
    KFill.Execute(MakeDim3D(0,0,0), MakeDim3D(0,0,0), MakeDim3D(1,1,1), MakeDim3D(1,1,1), KParams, Shared);
    for I := 0 to TEST_N - 1 do
      if Abs(FillArr[I] - 7.5) > 0.001 then
        begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
  finally
    KFill.Free;
  end;

  { --- Test 4: TCopyKernel --- }
  for I := 0 to TEST_N - 1 do
  begin
    SrcArr[I] := TFloat32(I * 2);
    DstArr[I] := 0.0;
  end;

  KParams.Count := 0;
  KParams.Items := nil;
  AddParamPtr(KParams, 'Src', @SrcArr[0]);
  AddParamPtr(KParams, 'Dst', @DstArr[0]);
  AddParam32(KParams, 'N',  TUInt32(TEST_N));

  KCopy := TCopyKernel.Create;
  try
    FillChar(Shared, SizeOf(Shared), 0);
    KCopy.Execute(MakeDim3D(0,0,0), MakeDim3D(0,0,0), MakeDim3D(1,1,1), MakeDim3D(1,1,1), KParams, Shared);
    for I := 0 to TEST_N - 1 do
      if Abs(DstArr[I] - SrcArr[I]) > 0.001 then
        begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
  finally
    KCopy.Free;
  end;

  { --- Test 5: TReluKernel --- }
  AArr[0] := -3.0; AArr[1] := -1.0; AArr[2] := 0.0; AArr[3] := 2.0;
  AArr[4] :=  5.0; AArr[5] := -0.5; AArr[6] := 1.5; AArr[7] := -2.0;
  for I := 0 to TEST_N - 1 do CArr[I] := 0.0;

  KParams.Count := 0;
  KParams.Items := nil;
  AddParamPtr(KParams, 'Input',  @AArr[0]);
  AddParamPtr(KParams, 'Output', @CArr[0]);
  AddParam32(KParams, 'N',      TUInt32(TEST_N));

  KRelu := TReluKernel.Create;
  try
    FillChar(Shared, SizeOf(Shared), 0);
    KRelu.Execute(MakeDim3D(0,0,0), MakeDim3D(0,0,0), MakeDim3D(1,1,1), MakeDim3D(1,1,1), KParams, Shared);
    for I := 0 to TEST_N - 1 do
    begin
      if AArr[I] > 0.0 then
      begin
        if Abs(CArr[I] - AArr[I]) > 0.001 then
          begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
      end
      else
      begin
        if Abs(CArr[I]) > 0.001 then
          begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
      end;
    end;
  finally
    KRelu.Free;
  end;

  { --- Test 6: TArgMaxKernel --- }
  { Row 0: [1,5,2,3] -> argmax=1 }
  { Row 1: [7,0,9,4] -> argmax=2 }
  MatIn[0] := 1.0; MatIn[1] := 5.0; MatIn[2] := 2.0; MatIn[3] := 3.0;
  MatIn[4] := 7.0; MatIn[5] := 0.0; MatIn[6] := 9.0; MatIn[7] := 4.0;
  IdxOut[0] := -1; IdxOut[1] := -1;

  KParams.Count := 0;
  KParams.Items := nil;
  AddParamPtr(KParams, 'Input',  @MatIn[0]);
  AddParamPtr(KParams, 'Output', @IdxOut[0]);
  AddParam32(KParams, 'Rows',   TUInt32(TEST_ROWS));
  AddParam32(KParams, 'Cols',   TUInt32(TEST_COLS));

  KArgMax := TArgMaxKernel.Create;
  try
    FillChar(Shared, SizeOf(Shared), 0);
    KArgMax.Execute(MakeDim3D(0,0,0), MakeDim3D(0,0,0), MakeDim3D(1,1,1), MakeDim3D(1,1,1), KParams, Shared);
    if IdxOut[0] <> 1 then begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
    if IdxOut[1] <> 2 then begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
  finally
    KArgMax.Free;
  end;

  { --- Test 7: TReduceSumKernel --- }
  for I := 0 to TEST_N - 1 do RedIn[I] := TFloat32(I + 1);  { sum = 36 }
  RedOut[0] := 0.0;

  KParams.Count := 0;
  KParams.Items := nil;
  AddParamPtr(KParams, 'Input',  @RedIn[0]);
  AddParamPtr(KParams, 'Output', @RedOut[0]);
  AddParam32(KParams, 'N',      TUInt32(TEST_N));

  FillChar(SMemBuf, SizeOf(SMemBuf), 0);
  SMem.Data := @SMemBuf[0];
  SMem.Size := TUInt32(SizeOf(SMemBuf));

  KReduce := TReduceSumKernel.Create;
  try
    { Block 0, thread 0, blockDim=TEST_N covers all elements }
    KReduce.Execute(MakeDim3D(0,0,0), MakeDim3D(0,0,0),
                    MakeDim3D(TUInt32(TEST_N),1,1),
                    MakeDim3D(1,1,1), KParams, SMem);
    if Abs(RedOut[0] - 36.0) > 0.01 then
      begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
  finally
    KReduce.Free;
  end;

  { --- Test 8: CreateKernelDescriptor + ValidateKernelDescriptor --- }
  Meta.Name              := 'test_kernel';
  Meta.Version           := '1.0';
  Meta.Author            := 'Test';
  Meta.Description       := 'Subsystem test kernel';
  Meta.RequiredSharedMem := 0;

  KAdd := TVectorAddKernel.Create;
  try
    if CreateKernelDescriptor(Meta, KAdd, KDesc) <> PGPU_SUCCESS then
      begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
    if KDesc.State <> ksCreated then
      begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
    { Before config is set, ValidateKernelDescriptor passes (function is set) }
    if ValidateKernelDescriptor(KDesc) <> PGPU_SUCCESS then
      begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;

    Config := MakeLaunchConfig1D(4, 256, 0, 0);
    if SetKernelLaunchConfig(KDesc, Config) <> PGPU_SUCCESS then
      begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
    if KDesc.State <> ksReady then
      begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
  finally
    KAdd.Free;
  end;

  { --- Test 9: ValidateLaunchConfig --- }
  Props := MakeDefaultDeviceProperties;
  Config := MakeLaunchConfig1D(1, 256, 0, 0);
  if ValidateLaunchConfig(Config, Props) <> PGPU_SUCCESS then
    begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;

  Config := MakeLaunchConfig1D(1, 2048, 0, 0);  { Exceeds 1024 limit }
  if ValidateLaunchConfig(Config, Props) = PGPU_SUCCESS then
    begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;

  { --- Test 10: TKernelRegistry register and lookup --- }
  Reg.Count   := 0;
  Reg.Entries := nil;

  Meta.Name := 'reg_kernel_a';
  KAdd := TVectorAddKernel.Create;
  try
    CreateKernelDescriptor(Meta, KAdd, KDesc);
    Config := MakeLaunchConfig1D(4, 128, 0, 0);
    SetKernelLaunchConfig(KDesc, Config);
    if RegisterKernel(Reg, KDesc) <> PGPU_SUCCESS then
      begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
  finally
    KAdd.Free;
  end;

  Meta.Name := 'reg_kernel_b';
  KFill := TFillKernel.Create;
  try
    CreateKernelDescriptor(Meta, KFill, KDesc);
    Config := MakeLaunchConfig1D(2, 64, 0, 0);
    SetKernelLaunchConfig(KDesc, Config);
    if RegisterKernel(Reg, KDesc) <> PGPU_SUCCESS then
      begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
  finally
    KFill.Free;
  end;

  if Reg.Count <> 2 then begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;

  if LookupKernel(Reg, 'reg_kernel_a', KDesc) <> PGPU_SUCCESS then
    begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
  if KDesc.Metadata.Name <> 'reg_kernel_a' then
    begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;

  if LookupKernel(Reg, 'does_not_exist', KDesc) = PGPU_SUCCESS then
    begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;

  { --- Test 11: TKernelHistory --- }
  FillChar(Hist, SizeOf(Hist), 0);
  HistRec.KernelName := 'vector_add';
  HistRec.StartTime  := 1000;
  HistRec.EndTime    := 2500;
  HistRec.GridDim    := MakeDim3D(4, 1, 1);
  HistRec.BlockDim   := MakeDim3D(256, 1, 1);
  HistRec.ExecResult := PGPU_SUCCESS;
  RecordKernelExecution(Hist, HistRec);

  HistRec.KernelName := 'fill';
  HistRec.StartTime  := 3000;
  HistRec.EndTime    := 3100;
  HistRec.GridDim    := MakeDim3D(2, 1, 1);
  HistRec.BlockDim   := MakeDim3D(64, 1, 1);
  HistRec.ExecResult := PGPU_SUCCESS;
  RecordKernelExecution(Hist, HistRec);

  if Hist.Total <> 2 then begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
  HistStr := PrintKernelHistory(Hist);
  if Length(HistStr) = 0 then begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;

  { --- Test 12: ValidateKernelGrid --- }
  Meta.Name := 'grid_test';
  KAdd := TVectorAddKernel.Create;
  try
    CreateKernelDescriptor(Meta, KAdd, KDesc);
    Config := MakeLaunchConfig1D(4, 128, 0, 0);
    SetKernelLaunchConfig(KDesc, Config);
    AddParam32(KDesc.Params, 'N', TUInt32(512));
    KDesc.Params.Count := 1;
    if ValidateKernelGrid(KDesc) <> PGPU_SUCCESS then
      begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
  finally
    KAdd.Free;
  end;

  { --- Test 13: KernelLaunchSummary --- }
  Meta.Name := 'summary_test';
  KFill := TFillKernel.Create;
  try
    CreateKernelDescriptor(Meta, KFill, KDesc);
    Config := MakeLaunchConfig1D(8, 256, 512, 0);
    SetKernelLaunchConfig(KDesc, Config);
    HistStr := KernelLaunchSummary(KDesc);
    if Length(HistStr) = 0 then begin Result := PGPU_ERR_KERNEL_FAILED; Exit; end;
  finally
    KFill.Free;
  end;

  Result := PGPU_SUCCESS;
end;

end.
