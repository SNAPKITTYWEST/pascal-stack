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



{$mode objfpc}{$H+}{$PackRecords C}{$modeswitch inscope}

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-151

  Block              : TKernelParamKind enumeration

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:74dbbb98e1adefe6422dda05d4d366556f1a6052726562659a65037612a05fdd

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-152

  Block              : TKernelParam record

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:80538fb3df4ec2e133634c12b2f7935f94b231f4853fa49b1975f84f164af50b

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 152: TKernelParam record === }

type

  TKernelParam = record

    Kind:       TKernelParamKind;

    Name:       AnsiString;

    ValueBytes: TUInt32;

    Data:       array[0..31] of Byte;

  end;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-153

  Block              : TKernelParamList — dynamic array of TKernelParam + AddParam helpers

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:7f3391622e311bdccbf6b54f6ee99a49839f6ded00f1320431cdd97a568edf0e

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 153: TKernelParamList — dynamic array of TKernelParam + AddParam helpers === }

type

  TKernelParamList = record

    Items: array of TKernelParam;

    Count: TUInt32;

  end;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-154

  Block              : AddParam32 — appends a 32-bit scalar parameter

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:f568a5438c1c92094e9f55f08e72524ddf58c92c210eb914ba446bd71ae2f9f9

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 154: AddParam32 — appends a 32-bit scalar parameter === }

procedure AddParam32(var List: TKernelParamList; const Name: AnsiString;

                     Value: TUInt32);



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-155

  Block              : AddParam64 — appends a 64-bit scalar parameter

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:51ff08c781de6bc809c6e757042f2241bebc97c972fe5fc2009ebb8bbebb3441

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 155: AddParam64 — appends a 64-bit scalar parameter === }

procedure AddParam64(var List: TKernelParamList; const Name: AnsiString;

                     Value: TUInt64);



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-156

  Block              : AddParamF32 — appends a 32-bit float parameter

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:f30be2a896c701b0958cd2bd02bb95acfbce73ad616b5eec096c324c699f5c80

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 156: AddParamF32 — appends a 32-bit float parameter === }

procedure AddParamF32(var List: TKernelParamList; const Name: AnsiString;

                      Value: TFloat32);



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-157

  Block              : AddParamPtr — appends a raw pointer parameter

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:6eaec04f92dfec372d33076de7e865821cf286492f5f39682d69382ce7ef807d

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 157: AddParamPtr — appends a raw pointer parameter === }

procedure AddParamPtr(var List: TKernelParamList; const Name: AnsiString;

                      Ptr: Pointer);



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-158

  Block              : AddParamBuffer — appends a TDeviceMemory buffer parameter

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:fddc228e8a862d70df192d99c158bfd0f8a07db8f9ba06558232a2377400a735

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 158: AddParamBuffer — appends a TDeviceMemory buffer parameter === }

procedure AddParamBuffer(var List: TKernelParamList; const Name: AnsiString;

                         var Mem: TDeviceMemory);



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-159

  Block              : FindParam — searches by name; PGPU_ERR_NOT_FOUND if absent

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:a7e92ca16709b6c6bea2f928540bba0a3b281c021cb10c67751c33a1f9a9fb53

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 159: FindParam — searches by name; PGPU_ERR_NOT_FOUND if absent === }

function FindParam(const List: TKernelParamList; const Name: AnsiString;

                   out Param: TKernelParam): TResult;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-160

  Block              : TKernelState

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:35fb1c2db0226c27bfd8537d7b6c40ac8d45dda12675285a5022021ba906f139

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-161

  Block              : TKernelMetadata record

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:b5a504a5aa138bea460a85b3741c8d1bf8fddec695ca435c0cf68e886886010c

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 161: TKernelMetadata record === }

type

  TKernelMetadata = record

    Name:              AnsiString;

    Version:           AnsiString;

    Author:            AnsiString;

    Description:       AnsiString;

    RequiredSharedMem: TUInt32;

  end;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-162

  Block              : IKernelFunction interface

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:e0a92f6713935e5347efb7b3270dfc04a222ceaa085c771d0333b6c7257f5838

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-163

  Block              : TKernelDescriptor record

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:80b7a99670323d0742dcf265f9579c21b068ecb5bbd582dff6b2836587c16ae0

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 163: TKernelDescriptor record === }

type

  TKernelDescriptor = record

    Metadata:       TKernelMetadata;

    KernelFunction: IKernelFunction;

    Config:         TLaunchConfig;

    Params:         TKernelParamList;

    State:          TKernelState;

  end;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-164

  Block              : CreateKernelDescriptor — initialises a TKernelDescriptor

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:00b871ffa0e3bde50b279e29750db20cdd3540acee7f4ba90ce8e4887cea5dfd

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 164: CreateKernelDescriptor — initialises a TKernelDescriptor === }

function CreateKernelDescriptor(const Meta: TKernelMetadata;

                                 Func: IKernelFunction;

                                 out KD: TKernelDescriptor): TResult;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-165

  Block              : ValidateKernelDescriptor — checks config, params, function not nil

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:48048c20a2017cacad1ef87ee3e398fa02f360ab8ad0396ea7e2ca833dfa5c7a

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 165: ValidateKernelDescriptor — checks config, params, function not nil === }

function ValidateKernelDescriptor(const KD: TKernelDescriptor): TResult;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-166

  Block              : SetKernelLaunchConfig — assigns launch config and advances state

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:a346353c98827bf3551ec8530a5a517cb615e9504191edfc39ae5144ce1db3e8

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 166: SetKernelLaunchConfig — assigns launch config and advances state === }

function SetKernelLaunchConfig(var KD: TKernelDescriptor;

                                const Config: TLaunchConfig): TResult;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-167

  Block              : ValidateLaunchConfig — checks thread/grid limits against device

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:e5ef8a6cee4790211b001d5a608a713f7b5b12a4de3899e725f06a8884e4fd8d

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 167: ValidateLaunchConfig — checks thread/grid limits against device === }

function ValidateLaunchConfig(const Config: TLaunchConfig;

                               const Props: TDeviceProperties): TResult;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-168

  Block              : TKernelRegistry — named kernel store

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:36039c9262dbaf71ad84729340716da03807fb95e50fe9a83ed38424e50e6ebf

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 168: TKernelRegistry — named kernel store === }

type

  TKernelRegistry = record

    Entries: array of TKernelDescriptor;

    Count:   TUInt32;

  end;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-169

  Block              : RegisterKernel — validates and stores a descriptor by name

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:c7acd3ee75bbd145047135c36dd299ef99e755b45a6f26693181a70ca60ecb67

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 169: RegisterKernel — validates and stores a descriptor by name === }

function RegisterKernel(var Reg: TKernelRegistry;

                         const KD: TKernelDescriptor): TResult;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-170

  Block              : LookupKernel — retrieves a descriptor by metadata name

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:4d728768f8a0d5dd6133b549bd568927c59fde1fef4d603e6446c83d94f7c87a

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 170: LookupKernel — retrieves a descriptor by metadata name === }

function LookupKernel(const Reg: TKernelRegistry;

                       const Name: AnsiString;

                       out KD: TKernelDescriptor): TResult;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-171

  Block              : TKernelExecutionRecord — tracks one invocation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:74945f90b9bb56e39a1d340b574d2643df60eec0db7ae4d70f819f32a5411cdf

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-172

  Block              : TKernelHistory — circular buffer of 256 execution records

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:21e6005b8175f3882383173f524e69147e0028e2b917026d468e9a53d323bfcf

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 172: TKernelHistory — circular buffer of 256 execution records === }

const

  KERNEL_HISTORY_SIZE = 256;



type

  TKernelHistory = record

    Records: array[0..KERNEL_HISTORY_SIZE - 1] of TKernelExecutionRecord;

    Head:    TUInt32;

    Total:   TUInt64;

  end;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-173

  Block              : RecordKernelExecution — writes to circular buffer and advances head

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:0ab1fc31eac590a03c856e523ff582d51bb44f8d19b215454280b59f9f8ff77c

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 173: RecordKernelExecution — writes to circular buffer and advances head === }

procedure RecordKernelExecution(var History: TKernelHistory;

                                 const Rec: TKernelExecutionRecord);



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-174

  Block              : PrintKernelHistory — returns human-readable history string

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:c9acb2de4e108f072e217229a322655f15ecece3b9ebc24f6117218df4087305

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 174: PrintKernelHistory — returns human-readable history string === }

function PrintKernelHistory(const History: TKernelHistory): AnsiString;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-175

  Block              : TAbstractKernelBase — base class; Execute is abstract

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:9e218686fa22d10c8f83920fb28097cbe708d13f20f77faf1a45f75009bce862

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-176

  Block              : TVectorAddKernel — element-wise float32 array addition

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:4f1637f88bbdd0dfaa66a18d70ef955ad3244fcfaf75312456940612e387e888

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 176: TVectorAddKernel — element-wise float32 array addition === }

type

  TVectorAddKernel = class(TAbstractKernelBase)

  public

    constructor Create;

    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;

                      const Params: TKernelParamList;

                      var SharedMem: TSharedMemoryRegion); override;

  end;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-178

  Block              : TVectorScaleKernel — element-wise scalar multiplication

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:9af0cd69da5b43e41399b119d63c18d49a363496ce9e32671cc882b29e2079db

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 178: TVectorScaleKernel — element-wise scalar multiplication === }

type

  TVectorScaleKernel = class(TAbstractKernelBase)

  public

    constructor Create;

    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;

                      const Params: TKernelParamList;

                      var SharedMem: TSharedMemoryRegion); override;

  end;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-180

  Block              : TMatMulKernel — naive matrix multiply (row-range assignment)

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:f00b0d41bba399deb34a6e1c1babc0333022215c9516fc29b66574b7f2178dfc

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 180: TMatMulKernel — naive matrix multiply (row-range assignment) === }

type

  TMatMulKernel = class(TAbstractKernelBase)

  public

    constructor Create;

    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;

                      const Params: TKernelParamList;

                      var SharedMem: TSharedMemoryRegion); override;

  end;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-182

  Block              : TReduceSumKernel — parallel reduction using shared memory

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:a0509c6d3124b5e0bf27d9b2a89d38ab03117b7bc748de314da3a76a10f88ce1

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 182: TReduceSumKernel — parallel reduction using shared memory === }

type

  TReduceSumKernel = class(TAbstractKernelBase)

  public

    constructor Create;

    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;

                      const Params: TKernelParamList;

                      var SharedMem: TSharedMemoryRegion); override;

  end;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-184

  Block              : TFillKernel — fills a buffer with a constant float32 value

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:ada4aa69ca7bd778f14e49a88516b4789b5ec62363045c7b9baef1f2104dd7d1

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 184: TFillKernel — fills a buffer with a constant float32 value === }

type

  TFillKernel = class(TAbstractKernelBase)

  public

    constructor Create;

    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;

                      const Params: TKernelParamList;

                      var SharedMem: TSharedMemoryRegion); override;

  end;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-186

  Block              : TCopyKernel — device-side buffer copy

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:7fde94b1158f57abe361b83214b71a0a58e7a15c53c4a4ba90610b60adfd0546

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 186: TCopyKernel — device-side buffer copy === }

type

  TCopyKernel = class(TAbstractKernelBase)

  public

    constructor Create;

    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;

                      const Params: TKernelParamList;

                      var SharedMem: TSharedMemoryRegion); override;

  end;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-188

  Block              : TElementWiseMulKernel — Hadamard product of two float32 arrays

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:375ef6daf91391da5f7d2ab31d1ce5cdc32069506303e0e32e9c28becef79af4

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 188: TElementWiseMulKernel — Hadamard product of two float32 arrays === }

type

  TElementWiseMulKernel = class(TAbstractKernelBase)

  public

    constructor Create;

    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;

                      const Params: TKernelParamList;

                      var SharedMem: TSharedMemoryRegion); override;

  end;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-190

  Block              : TReluKernel — ReLU activation max(0, x)

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:b8d330ffa48286989196b82c2d5fa5dd4aa340bbf4d1d491f223451333a2e80b

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 190: TReluKernel — ReLU activation max(0, x) === }

type

  TReluKernel = class(TAbstractKernelBase)

  public

    constructor Create;

    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;

                      const Params: TKernelParamList;

                      var SharedMem: TSharedMemoryRegion); override;

  end;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-192

  Block              : TGELUKernel — GELU activation x * 0.5 * (1 + erf(x/sqrt(2)))

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:65f2ea69ec93732356211c142fdc7177a8c18f6034ae76dd42a9aea87e291225

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 192: TGELUKernel — GELU activation x * 0.5 * (1 + erf(x/sqrt(2))) === }

type

  TGELUKernel = class(TAbstractKernelBase)

  public

    constructor Create;

    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;

                      const Params: TKernelParamList;

                      var SharedMem: TSharedMemoryRegion); override;

  end;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-194

  Block              : TSoftmaxKernel — row-wise softmax

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:6a0234df7c6d3dedc67d4d3d38acbff360cc4dea40f1b31a720c96956e24b441

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 194: TSoftmaxKernel — row-wise softmax === }

type

  TSoftmaxKernel = class(TAbstractKernelBase)

  public

    constructor Create;

    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;

                      const Params: TKernelParamList;

                      var SharedMem: TSharedMemoryRegion); override;

  end;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-196

  Block              : TArgMaxKernel — index of maximum value in each row

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:f6c03ec04e4033ee280afcfa1670060f7acbe512aed22abd8f5baa9e689cc442

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 196: TArgMaxKernel — index of maximum value in each row === }

type

  TArgMaxKernel = class(TAbstractKernelBase)

  public

    constructor Create;

    procedure Execute(ThreadIdx, BlockIdx, BlockDim, GridDim: TDim3D;

                      const Params: TKernelParamList;

                      var SharedMem: TSharedMemoryRegion); override;

  end;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-198

  Block              : ValidateKernelGrid — ensures grid covers all elements

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:dfeaba60cbf701482f7231d38e37931f2600428786a07267065ed7049b38b85d

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 198: ValidateKernelGrid — ensures grid covers all elements === }

function ValidateKernelGrid(const KD: TKernelDescriptor): TResult;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-199

  Block              : KernelLaunchSummary — human-readable launch info string

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:76dfa619867c385cbc98feaba60ffbb77ef0386b97bf57ba0bb13b869e954c80

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

{ === BLOCK 199: KernelLaunchSummary — human-readable launch info string === }

function KernelLaunchSummary(const KD: TKernelDescriptor): AnsiString;



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-200

  Block              : KernelSubsystemTest — self-test returning PGPU_SUCCESS on pass

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:5cccf6250c95f259c3bd54326e3b4e5ff72486799f9542476f14b5f550e7b1e9

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ Erf approximation (Abramowitz & Stegun 7.1.26) }
function Erf(x: Double): Double;
const
  A1 =  0.254829592; A2 = -0.284496736; A3 =  1.421413741;
  A4 = -1.453152027; A5 =  1.061405429; P  =  0.3275911;
var
  t, y: Double;
  sign: Integer;
begin
  sign := 1;
  if x < 0 then sign := -1;
  x := Abs(x);
  t := 1.0 / (1.0 + P * x);
  y := 1.0 - (((((A5*t + A4)*t) + A3)*t + A2)*t + A1)*t*Exp(-x*x);
  Result := sign * y;
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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-154

  Block              : AddParam32 implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:e633fcd36a791104447acfff7e4415bb3e5d00eb41ceeb9525fa4f92a1b0dd55

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-155

  Block              : AddParam64 implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:83b35a7c9fdb27c3fde22e893b8f0ed3d825bb721b8aa655b1fa503bf4233d0f

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-156

  Block              : AddParamF32 implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:ce872366c16947568761aaabaad2ff0259b02fbd5539059b028731ce584cda72

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-157

  Block              : AddParamPtr implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:e76aa1320d2a98c8204a23cb5d36a6a7cf831b8be0a706d6015edeb1c09c44d0

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-158

  Block              : AddParamBuffer implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:5779dc2fa7f05d45d02245c92ee1bd4c6302afd9447b57e33b7999a679eb5175

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-159

  Block              : FindParam implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:5cacef0c31fc854a16bb895dbc4a6e3f983e16f03f3bc9f2613b307c35c85775

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-164

  Block              : CreateKernelDescriptor implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:f81a211280a7731104fe113a7205818f8524226cb0308448a78775d0e30d28cf

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-165

  Block              : ValidateKernelDescriptor implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:2a14284a39d03f3ee88bbfebe8d071f95b0c6e46fa321d3e209e891718d030b5

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-166

  Block              : SetKernelLaunchConfig implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:bfa3e936618fd41f0df4abb410248afb29b5fb49fa20d67b15db7f9d8dff3371

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-167

  Block              : ValidateLaunchConfig implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:fb3758509a8f6bf2fc42d1aed3bfb97e13de9f02bce9ed7896b2d8f54ed5c15b

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-169

  Block              : RegisterKernel implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:1ae9474e588ce4a2840968308ed78169a26925ba63790aebae5188240f48a5fe

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-170

  Block              : LookupKernel implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:cbd81b24372e2dd80afee0bd341053889e2c2a89ef9d0a5c5538bc61551ea692

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-173

  Block              : RecordKernelExecution implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:d676ef61b3b8459f53c212686bc6e8b60b26b7ceb0bfda49e8a7e78ba89ab1f0

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-174

  Block              : PrintKernelHistory implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:f3daf712a4ffd4dc6a807059cecacc8ab0fadd10a9a4fd30f2b6f55cc598d387

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-175

  Block              : TAbstractKernelBase implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:8dd89bbc34234921ee57cad61575144b6598f546e4b03f3c01c43d4b708cbe57

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-177

  Block              : TVectorAddKernel.Execute — grid-stride loop over A+B→C

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:7b154d91099eb08d42d607bc748d9935e17da79f99d06bcbfa79b4bcd9300e90

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-179

  Block              : TVectorScaleKernel.Execute — grid-stride loop multiplying by scalar

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:1d7d6175b78bb981e6103fe92f39aa7e564cc97da7bc1cc5e7c1d79f349f9b36

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-181

  Block              : TMatMulKernel.Execute — triple loop over assigned row range

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:a350d32d388f2a83ee8e044301481d68129647ffa18b81f1c3e38de7ba2d8dd5

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-183

  Block              : TReduceSumKernel.Execute — tree reduction via shared memory

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:8a2b3997de69c7ac493f09756670ac0f8c65e89b32ffbeb8ab6b3d1c8a1e711f

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-185

  Block              : TFillKernel.Execute — grid-stride fill of constant value

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:3463edca1034c40eeccaf83fa1019415af64302a5bd60e18bbc5658df29ca491

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-187

  Block              : TCopyKernel.Execute — grid-stride element copy

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:24c0a17e785990c6dde1e4fbde9729edad8f29cfbbecd80e7c003b95f652cd30

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-189

  Block              : TElementWiseMulKernel.Execute — grid-stride Hadamard product

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:8043f35dbfc2795bd81d9a249077668b75b752aac2338ca9c75d935f81bc0173

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-191

  Block              : TReluKernel.Execute — grid-stride ReLU application

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:881f809ac745f97f5bf3001a2c203a6bb4d8804f7b473188b193a4776683accb

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-193

  Block              : TGELUKernel.Execute — grid-stride GELU activation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:6c0e367c38b494c5b647765de34271e72a7a547995d35ba1cacfdf0c02cf8a3f

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-195

  Block              : TSoftmaxKernel.Execute — row-wise softmax, one thread per row

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:9f75f3d94c1c687ea280ef0501b34bda6fc2a3389cd18d66ad30b1950a6db324

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-197

  Block              : TArgMaxKernel.Execute — row-wise argmax, one thread per row

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:6b91ee1db991a07c144158d03367d6c874ba1841d3c7d02c7e4a761a657179e6

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-198

  Block              : ValidateKernelGrid implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:f553f8d73bf22ce2d42835c85d560466f1c00f715daba9d1486021193e1095f2

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-199

  Block              : KernelLaunchSummary implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:e17243be05b378f5fe718f5870c4172db6ba1b6ae675e5fe66dd7684a35ff717

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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



{ -----------------------------------------------------------------------

  SOVEREIGN NODE KEY : PASCAL-STACK-005-BLK-200

  Block              : KernelSubsystemTest implementation

  License            : MGPLv3 / SL-AGPL3-001

  Clone-Gate         : sha256:3be6babbc5d4fca09ff400e0e400231fd97b2f30e4f722ed0ed094d04dffa892

  Nemo dat quod non habet.

  Pacta sunt servanda.

  ----------------------------------------------------------------------- }

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

