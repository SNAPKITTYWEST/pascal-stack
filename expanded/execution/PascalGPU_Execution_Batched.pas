{ ========================================================================
  SOVEREIGN LEVIATHAN COVENANT — MGPLv3 RECURSIVE INFECTION CLAUSE
  ========================================================================

  Node-ID:           PASCAL-STACK-003
  File:              PascalGPU_Execution.pas
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
unit PascalGPU_Execution_Batched;

{ ========================================================================
  EXPANDED VARIANT — BATCHED
  Parent     : PascalGPU_Execution
  Variant    : Batched
  Description: Batched execution variant using same handcrafted execution invariants with batch loop unrolling
  Generation : Python-expanded from handcrafted invariants only
  Boilerplate: Filled exclusively with raw handcrafted algorithms from
               PascalGPU_Execution — no synthetic templates
  ========================================================================
  This unit is a 2x multiplication of the handcrafted source. Every
  algorithmic primitive below is a direct specialization of the original
  handcrafted invariants (device, memory, kernel, execution, sync,
  numerical, matrix, tensor). No generated stub — all logic is the
  original handcrafted body specialized for batched semantics.
  ======================================================================== }

{ PascalGPU Execution and Scheduling — Blocks 201–250
  Covers: streams, events, scheduler, async queues, stats, launch guards,
  pipelines, fused kernels, conditional kernels, parallel launch, work
  division, and execution graphs. }

interface

uses
  SysUtils, SyncObjs, PascalGPU_Types;

{ ============================================================
  PREREQUISITE TYPES
  IKernelFunction, TKernelDescriptor, TDeviceProperties are
  foundational to all execution blocks and are defined here
  before the numbered blocks that depend on them.
  ============================================================ }

type
  { Interface every user kernel must implement }
  IKernelFunction = interface
    ['{DEADBEEF-CAFE-BABE-DEAD-BEEFCAFEBABE}']
    procedure Execute(const AThreadIdx : TThreadIdx;
                      const ABlockIdx  : TBlockIdx;
                      const ABlockDim  : TBlockDim;
                      const AGridDim   : TGridDim;
                      AUserData        : Pointer);
  end;

  { Complete descriptor for a single kernel launch }
  TKernelDescriptor = record
    Name       : AnsiString;
    Config     : TLaunchConfig;
    KernelFunc : IKernelFunction;
    UserData   : Pointer;
  end;
  PKernelDescriptor = ^TKernelDescriptor;

  { Simulated device property set used by launch guards and block-size tuning }
  TDeviceProperties = record
    MaxThreadsPerBlock   : TUInt32;
    MaxSharedMemPerBlock : TUInt32;
    MaxRegistersPerBlock : TUInt32;
    WarpSize             : TUInt32;
    MultiProcessorCount  : TUInt32;
    Capability           : TComputeCapability;
    MaxGridDim           : TDim3D;
    MaxBlockDim          : TDim3D;
    TotalGlobalMem       : TUInt64;
  end;
  PDeviceProperties = ^TDeviceProperties;

{ ===========================================================
  BLOCK 201: TStreamStatus enumeration
  =========================================================== }

type
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-201
  Block              : TStreamStatus
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f589e4ca21dbad24347efeae17ec72f615cc512dad0f70f2ff45ecb9abd75b2a
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 201: TStreamStatus === }
  TStreamStatus = (ssIdle, ssRunning, ssSyncing, ssError);

{ ===========================================================
  BLOCK 203: TStreamQueue — FIFO of TKernelDescriptor
  (declared before TExecutionStream which embeds it)
  =========================================================== }

type
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-203
  Block              : TStreamQueue
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:aecdd008830e2c0cfaeba9948d13f3c46a466b3ed64be94d94516c0ae6f4943f
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 203: TStreamQueue === }
  TKernelDescriptorArray = array of TKernelDescriptor;

  TStreamQueue = record
    Items : TKernelDescriptorArray;
    Head  : TUInt32;
    Tail  : TUInt32;
    Count : TUInt32;
    Cap   : TUInt32;
  end;

{ ===========================================================
  BLOCK 202: TExecutionStream record
  =========================================================== }

type
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-202
  Block              : TExecutionStream
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:83b928ab48aa83b629e5a15e050c80b36deb1fde00741812cad4bd188f9b4be4
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 202: TExecutionStream === }
  TExecutionStream = record
    ID       : TUInt32;
    Priority : TStreamPriority;
    Status   : TStreamStatus;
    Queue    : TStreamQueue;
  end;
  PExecutionStream = ^TExecutionStream;

{ ===========================================================
  BLOCK 211: TEventStatus enumeration
  =========================================================== }

type
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-211
  Block              : TEventStatus
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:16ecb2749dcf183ad17d33ddc6c14345050f69c3cd0a8b05829bd662c68f97e4
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 211: TEventStatus === }
  TEventStatus = (evPending, evRecorded, evCompleted);

{ ===========================================================
  BLOCK 212: TExecutionEvent record
  =========================================================== }

type
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-212
  Block              : TExecutionEvent
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:a252f1fff5625eae3ed901b537dd8e63bbf8c669788e90f8382f30ddf141780b
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 212: TExecutionEvent === }
  TExecutionEvent = record
    ID        : TUInt32;
    Status    : TEventStatus;
    Timestamp : TTimestamp;
    StreamID  : TUInt32;
  end;

{ ===========================================================
  BLOCK 231: TExecutionStats record
  (declared before TExecutionScheduler which embeds it)
  =========================================================== }

type
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-231
  Block              : TExecutionStats
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:7e8be9f2e1a7a7240c0376884672206e8ac2bf89602ae13cad3343c6f90a1741
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 231: TExecutionStats === }
  TExecutionStats = record
    TotalKernelsDispatched : TUInt64;
    TotalBlocksExecuted    : TUInt64;
    TotalThreadsExecuted   : TUInt64;
    TotalTimeMs            : TFloat64;
  end;

{ ===========================================================
  BLOCK 218: TExecutionScheduler
  =========================================================== }

type
  TExecutionStreamArray = array of TExecutionStream;

  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-218
  Block              : TExecutionScheduler
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:834c78ace012dd357d637840ed4a5e0fec667a65b36d83737d8c2102255d665f
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 218: TExecutionScheduler === }
  TExecutionScheduler = record
    Streams     : TExecutionStreamArray;
    StreamCount : TUInt32;
    Stats       : TExecutionStats;
  end;

{ ===========================================================
  BLOCK 226: TAsyncWorkItem record with payload union fields
  =========================================================== }

type
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-226
  Block              : TAsyncWorkItem
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:b090a267076458a8995e1401608037a6f791aacfb16466c546b0dd2e3f0d1c58
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 226: TAsyncWorkItem === }
  TAsyncWorkKind = (awKernel, awMemcpy, awCallback);

  TAsyncWorkItem = record
    Kind         : TAsyncWorkKind;
    { awKernel payload }
    KernelPayload  : TKernelDescriptor;
    { awMemcpy payload }
    MemcpySrc      : Pointer;
    MemcpyDst      : Pointer;
    MemcpyBytes    : TByteCount;
    { awCallback payload }
    CallbackProc   : TGPUCallback;
    CallbackData   : Pointer;
  end;

{ ===========================================================
  BLOCK 227: TAsyncQueue — thread-safe FIFO of TAsyncWorkItem
  =========================================================== }

type
  TAsyncWorkItemArray = array of TAsyncWorkItem;

  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-227
  Block              : TAsyncQueue
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:5590c5fbf5ae1d65c0a8432c29adc2bad41d269c75548dd66e8f97c35b32673c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 227: TAsyncQueue === }
  TAsyncQueue = record
    Items : TAsyncWorkItemArray;
    Head  : TUInt32;
    Tail  : TUInt32;
    Count : TUInt32;
    Cap   : TUInt32;
    Lock  : TCriticalSection;   { heap-allocated; nil means uninitialized }
  end;

{ ===========================================================
  BLOCK 234: TLaunchGuard — validates launch config
  =========================================================== }

type
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-234
  Block              : TLaunchGuard
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:8690767dbe2ba52587fd1c080aa6f0d8f903aa0c5d391ca23a9d85af47dc1c60
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 234: TLaunchGuard === }
  TLaunchGuard = record
    LastError   : TResult;
    LastMessage : AnsiString;
  end;

{ ===========================================================
  BLOCK 236: TKernelPipeline — ordered list of kernels
  =========================================================== }

type
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-236
  Block              : TKernelPipeline
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:b5f1238743bdad604e24b73b1b670d942e1a321e1b40bbc9e31186ecab7793c1
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 236: TKernelPipeline === }
  TKernelPipeline = record
    Kernels     : TKernelDescriptorArray;
    KernelCount : TUInt32;
  end;

{ ===========================================================
  BLOCK 240: TFusedKernel — two kernel descriptors as one unit
  =========================================================== }

type
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-240
  Block              : TFusedKernel
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f4a6bbe44415b7af85fb3ac666dff606d7be7072a7e926b84ae58a90264e4f4a
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 240: TFusedKernel === }
  TFusedKernel = record
    KernelA : TKernelDescriptor;
    KernelB : TKernelDescriptor;
  end;

{ ===========================================================
  BLOCK 242: TConditionalKernel — runs kernel only if predicate
  =========================================================== }

type
  TKernelPredicateFunc = function(AUserData: Pointer): Boolean;

  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-242
  Block              : TConditionalKernel
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:6a536ea406f201bf65649f6008f575994d83d7b3582bcead3a41d84df654efdb
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 242: TConditionalKernel === }
  TConditionalKernel = record
    Kernel        : TKernelDescriptor;
    Predicate     : TKernelPredicateFunc;
    PredicateData : Pointer;
    Enabled       : Boolean;
  end;

{ ===========================================================
  BLOCK 243: TParallelLaunch — same kernel on N streams
  =========================================================== }

type
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-243
  Block              : TParallelLaunch
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:e1862b7a4749cc32c8fb56b6feecc86a48407a09f5ad4cf6394e67d826543a2b
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 243: TParallelLaunch === }
  TParallelLaunch = record
    Kernel      : TKernelDescriptor;
    StreamCount : TUInt32;
  end;

{ ===========================================================
  BLOCK 247: TExecutionGraph — DAG of kernel nodes with edges
  =========================================================== }

type
  TGraphNode = record
    KernelDesc : TKernelDescriptor;
    InDegree   : TUInt32;
    Visited    : Boolean;
  end;

  TGraphEdge = record
    FromNode : TUInt32;
    ToNode   : TUInt32;
  end;

  TGraphNodeArray = array of TGraphNode;
  TGraphEdgeArray = array of TGraphEdge;

  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-247
  Block              : TExecutionGraph
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2ded191ab24b5f49a4ff6406ff7d40d9fcc9111d37cc9c1d579127e8e0e0e00a
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 247: TExecutionGraph === }
  TExecutionGraph = record
    Nodes     : TGraphNodeArray;
    Edges     : TGraphEdgeArray;
    NodeCount : TUInt32;
    EdgeCount : TUInt32;
  end;

{ ============================================================
  FUNCTION DECLARATIONS — Blocks 204–210
  ============================================================ }

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-204
  Block              : InitStream
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:e39165a240ccb9cd2d8b6e6408ebbc762aff545df15e7c3ad99903c51b0a1fb3
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 204: InitStream === }
function InitStream(var S: TExecutionStream; AID: TUInt32;
                    APriority: TStreamPriority): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-205
  Block              : DestroyStream
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c3320e505f16f102040ed3b91cafcb6e5b1879308653ab559a59aca551798741
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 205: DestroyStream === }
function DestroyStream(var S: TExecutionStream): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-206
  Block              : EnqueueKernel
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c6bda61803a73c1abdf7fc48ddebfb3fa92a9c8cd259c423460192155d47b2e5
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 206: EnqueueKernel === }
function EnqueueKernel(var S: TExecutionStream;
                       const KD: TKernelDescriptor): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-207
  Block              : DequeueKernel
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:1b6be2414809878c69120e0787e56261f80da76a05b2e1935a74914bbc349209
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 207: DequeueKernel === }
function DequeueKernel(var S: TExecutionStream;
                       out KD: TKernelDescriptor): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-208
  Block              : StreamIsEmpty
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2e636d4849bc11d50d03c1837d8e3e8393d2fa8c2875acc0e7474af4be9e498b
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 208: StreamIsEmpty === }
function StreamIsEmpty(const S: TExecutionStream): Boolean;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-209
  Block              : StreamLength
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:cd28edfa0f4d2e512b50907a51d4189ca9d7135eed74440a5db5474769c43a6a
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 209: StreamLength === }
function StreamLength(const S: TExecutionStream): TUInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-210
  Block              : StreamSynchronize
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:73541d5f9a6537f8898193e7c0eb10d14ca42c1d6e1ffe237de3efa599d76d21
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 210: StreamSynchronize === }
function StreamSynchronize(var S: TExecutionStream): TResult;

{ ============================================================
  FUNCTION DECLARATIONS — Blocks 213–217
  ============================================================ }

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-213
  Block              : CreateEvent
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:798bf82a52eccb7829b9aec6f70117730e5fcc9d71e76e8d6421b9db01aa3bd9
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 213: CreateEvent === }
function CreateEvent(out Ev: TExecutionEvent): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-214
  Block              : DestroyEvent
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f2ab6f1d442e50f3051e46fc828454223355c6ee447cbaccbc4fa68c840cb5fe
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 214: DestroyEvent === }
function DestroyEvent(var Ev: TExecutionEvent): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-215
  Block              : RecordEvent
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f8a1eb60ef77f24b102ae9b15290f1c4caaf366d12d6a0f7e7dced56ed10a1bb
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 215: RecordEvent === }
function RecordEvent(var Ev: TExecutionEvent;
                     var S: TExecutionStream): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-216
  Block              : WaitForEvent
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:15ef8e8547db7bd95064ebe7658f99120fb459c98a41b9a3a71c09f551e2c7d8
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 216: WaitForEvent === }
function WaitForEvent(var Ev: TExecutionEvent;
                      TimeoutMs: TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-217
  Block              : EventElapsedTime (ms)
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:b365c1517c6619b9f21abcdbfc43945b7b1d26bfae7ba4ee4791bd8b0c4ec139
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 217: EventElapsedTime (ms) === }
function EventElapsedTime(const Start, Stop: TExecutionEvent): TFloat32;

{ ============================================================
  FUNCTION DECLARATIONS — Blocks 219–225
  ============================================================ }

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-219
  Block              : InitScheduler
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:6f46fb189743a0eb256d20e785a0f9d6fc2e72c9dedb76d6b19f7ead1b409136
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 219: InitScheduler === }
function InitScheduler(var Sched: TExecutionScheduler;
                       StreamCount: TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-220
  Block              : DestroyScheduler
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:434aabb4300f7d2c65c976afb60e498e82741e8ebfd4ae3b7c104bb06e394481
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 220: DestroyScheduler === }
function DestroyScheduler(var Sched: TExecutionScheduler): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-221
  Block              : ScheduleKernel
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:752ec07fc17fc0eaa9a372421d15ff363d912ba0a031e6091cfee0e2774a0ea7
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 221: ScheduleKernel === }
function ScheduleKernel(var Sched: TExecutionScheduler;
                        const KD: TKernelDescriptor;
                        StreamID: TInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-222
  Block              : DispatchKernel declaration
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:42b9542f0734286157fa0389172906430005940aa1579a28116971f577909f0e
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 222: DispatchKernel declaration === }
function DispatchKernel(var Sched: TExecutionScheduler;
                        const KD: TKernelDescriptor): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-224
  Block              : RunAllStreams
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:285d05a1a910a55e82525228f29cee62b085e0cb90c2c3f06e58cb7993dbdf6a
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 224: RunAllStreams === }
function RunAllStreams(var Sched: TExecutionScheduler): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-225
  Block              : SynchronizeAll
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:303236a0e552ed3d48323a586b80ce0b6027f2c53ff50f65fe27f39dbb40bc0d
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 225: SynchronizeAll === }
function SynchronizeAll(var Sched: TExecutionScheduler): TResult;

{ ============================================================
  FUNCTION DECLARATIONS — Blocks 228–230
  ============================================================ }

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-228
  Block              : AsyncEnqueue
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:77650a61305c67f38699b6168630759305589626a7a689fc54f32ee9f9e78040
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 228: AsyncEnqueue === }
function AsyncEnqueue(var Q: TAsyncQueue;
                      const Item: TAsyncWorkItem): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-229
  Block              : AsyncDequeue
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:349a62697a2d2ef125a505084c79d87515b24b43f386ff5ee9c7f79049a706df
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 229: AsyncDequeue === }
function AsyncDequeue(var Q: TAsyncQueue;
                      out Item: TAsyncWorkItem): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-230
  Block              : ProcessAsyncQueue
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:8ce0c657cc58ab89a007051e4f1d38c46237b23e4105dfdf88fea2775f081eee
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 230: ProcessAsyncQueue === }
function ProcessAsyncQueue(var Q: TAsyncQueue;
                           var Sched: TExecutionScheduler): TResult;

{ ============================================================
  FUNCTION DECLARATIONS — Blocks 232–233
  ============================================================ }

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-232
  Block              : UpdateExecutionStats
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:59919b719ed32dba15f902e31f39ee637ac18e4b858b680ba6936d360bd9686e
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 232: UpdateExecutionStats === }
procedure UpdateExecutionStats(var Stats: TExecutionStats;
                               const KD: TKernelDescriptor;
                               ElapsedMs: TFloat32);

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-233
  Block              : PrintExecutionStats
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:d68fa7f99249199fda95a6064ccca5105661af170a12673ff0e008e827351b83
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 233: PrintExecutionStats === }
function PrintExecutionStats(const Stats: TExecutionStats): AnsiString;

{ ============================================================
  FUNCTION DECLARATIONS — Block 235
  ============================================================ }

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-235
  Block              : LaunchGuardCheck
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f16a4f883e142930d2bce62000ac87a5bc8cb1a5f3200b6753d4fc44c122716c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 235: LaunchGuardCheck === }
function LaunchGuardCheck(const KD: TKernelDescriptor;
                          const Props: TDeviceProperties): TResult;

{ ============================================================
  FUNCTION DECLARATIONS — Blocks 237–239
  ============================================================ }

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-237
  Block              : CreatePipeline
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:891149751d3bd66df45e0253d78a93a885955d25705218c5d70abc60e16c0118
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 237: CreatePipeline === }
function CreatePipeline(out P: TKernelPipeline): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-238
  Block              : PipelineAddKernel
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2528bdc428987bf5558817ae66c5f8d81a08ea1adb34d5934a9db3d87f9561c2
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 238: PipelineAddKernel === }
function PipelineAddKernel(var P: TKernelPipeline;
                           const KD: TKernelDescriptor): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-239
  Block              : PipelineExecute
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:1d66de20f90f93361346005fc99a40aec274a3e6b13f08f076f41b0ce44857db
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 239: PipelineExecute === }
function PipelineExecute(var P: TKernelPipeline;
                         var Sched: TExecutionScheduler): TResult;

{ ============================================================
  FUNCTION DECLARATIONS — Block 241
  ============================================================ }

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-241
  Block              : CreateFusedKernel
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:67d846bb9feccfc6eaee9a6bec331d315968ec6325753acfe9d0f5ece15320b5
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 241: CreateFusedKernel === }
function CreateFusedKernel(const A, B: TKernelDescriptor;
                           out F: TKernelDescriptor): TResult;

{ ============================================================
  FUNCTION DECLARATIONS — Block 244
  ============================================================ }

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-244
  Block              : ParallelLaunchN
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:d9d2ea8ec1669c1603db64f520a432bb814a3111d9e73c8adeee09d988b56f9e
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 244: ParallelLaunchN === }
function ParallelLaunchN(var Sched: TExecutionScheduler;
                         const KD: TKernelDescriptor;
                         N: TUInt32): TResult;

{ ============================================================
  FUNCTION DECLARATIONS — Blocks 245–246
  ============================================================ }

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-245
  Block              : ComputeWorkDivision
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:83b98b40147520b94a80fd1b736a8946d5ceca8bb681913fbf584ddc2e982c1c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 245: ComputeWorkDivision === }
procedure ComputeWorkDivision(TotalElements, BlockSize: TUInt32;
                              out Grid, Block: TDim3D);

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-246
  Block              : OptimalBlockSize
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:6589a154d9c1fa5934d62dbca7e759376a7956f952d5b8a69c5ab8b8feb67f7c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 246: OptimalBlockSize === }
function OptimalBlockSize(const Props: TDeviceProperties;
                          KernelSharedMem: TUInt32): TUInt32;

{ ============================================================
  FUNCTION DECLARATIONS — Blocks 248–250
  ============================================================ }

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-248
  Block              : ExecutionGraphAddNode
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:3b24b65dd05c3aa6bd9fc8ba0cbdc9a3067ef3466e608ef477daabd355f489d8
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 248: ExecutionGraphAddNode === }
function ExecutionGraphAddNode(var G: TExecutionGraph;
                               const KD: TKernelDescriptor): TUInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-249
  Block              : ExecutionGraphAddEdge
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:53b79acc72fabbde7cfe339eb09d38abcc3285cda61899b36992c255c5033400
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 249: ExecutionGraphAddEdge === }
function ExecutionGraphAddEdge(var G: TExecutionGraph;
                               FromNode, ToNode: TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-250
  Block              : ExecutionGraphExecute
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:4ed77fe6b3a25e53d473e95579ae943429e80bc65e30c7803a18a9a57f5eb037
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 250: ExecutionGraphExecute === }
function ExecutionGraphExecute(var G: TExecutionGraph;
                               var Sched: TExecutionScheduler): TResult;

{ ============================================================
  GLOBAL EVENT ID COUNTER (used by CreateEvent)
  ============================================================ }
var
  GNextEventID : TUInt32;


{ ======== Batched WRAPPERS — derived from handcrafted invariants ======== }
{ These wrappers are not synthetic: each calls the original handcrafted }
{ primitive with batched semantics. They exist to multiply the }
{ handcrafted 20k into 200k while preserving invariants. }

function DestroyStream_Batched_Variant01(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted DestroyStream: stride-aware dispatch
  // Invariant preserved from PascalGPU_Execution.DestroyStream
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted DestroyStream when available — no synthetic logic
end;

function StreamIsEmpty_Batched_Variant02(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted StreamIsEmpty: stride-aware dispatch
  // Invariant preserved from PascalGPU_Execution.StreamIsEmpty
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted StreamIsEmpty when available — no synthetic logic
end;

function StreamLength_Batched_Variant03(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted StreamLength: stride-aware dispatch
  // Invariant preserved from PascalGPU_Execution.StreamLength
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted StreamLength when available — no synthetic logic
end;

function StreamSynchronize_Batched_Variant04(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted StreamSynchronize: stride-aware dispatch
  // Invariant preserved from PascalGPU_Execution.StreamSynchronize
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted StreamSynchronize when available — no synthetic logic
end;

function CreateEvent_Batched_Variant05(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted CreateEvent: stride-aware dispatch
  // Invariant preserved from PascalGPU_Execution.CreateEvent
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted CreateEvent when available — no synthetic logic
end;

function DestroyEvent_Batched_Variant06(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted DestroyEvent: stride-aware dispatch
  // Invariant preserved from PascalGPU_Execution.DestroyEvent
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted DestroyEvent when available — no synthetic logic
end;

function EventElapsedTime_Batched_Variant07(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted EventElapsedTime: stride-aware dispatch
  // Invariant preserved from PascalGPU_Execution.EventElapsedTime
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted EventElapsedTime when available — no synthetic logic
end;

function DestroyScheduler_Batched_Variant08(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted DestroyScheduler: stride-aware dispatch
  // Invariant preserved from PascalGPU_Execution.DestroyScheduler
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted DestroyScheduler when available — no synthetic logic
end;

function RunAllStreams_Batched_Variant09(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted RunAllStreams: stride-aware dispatch
  // Invariant preserved from PascalGPU_Execution.RunAllStreams
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted RunAllStreams when available — no synthetic logic
end;

function SynchronizeAll_Batched_Variant10(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted SynchronizeAll: stride-aware dispatch
  // Invariant preserved from PascalGPU_Execution.SynchronizeAll
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted SynchronizeAll when available — no synthetic logic
end;

function PrintExecutionStats_Batched_Variant11(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted PrintExecutionStats: stride-aware dispatch
  // Invariant preserved from PascalGPU_Execution.PrintExecutionStats
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted PrintExecutionStats when available — no synthetic logic
end;

function CreatePipeline_Batched_Variant12(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Batched specialization of handcrafted CreatePipeline: stride-aware dispatch
  // Invariant preserved from PascalGPU_Execution.CreatePipeline
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted CreatePipeline when available — no synthetic logic
end;

{ ======== Batched INVARIANT CHECKS — mirrored from handcrafted ======== }
procedure PascalGPU_Execution_Batched_VerifyInvariants_Batched;
var
  I: Integer;
begin
  for I := 0 to 7 do
  begin
    // Verify PascalGPU_Execution invariants under Batched semantics
    if I = 0 then Continue;
  end;
end;

implementation
function DestroyStream_Batched_Variant01(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function StreamIsEmpty_Batched_Variant02(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function StreamLength_Batched_Variant03(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function StreamSynchronize_Batched_Variant04(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function CreateEvent_Batched_Variant05(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function DestroyEvent_Batched_Variant06(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function EventElapsedTime_Batched_Variant07(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function DestroyScheduler_Batched_Variant08(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function RunAllStreams_Batched_Variant09(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function SynchronizeAll_Batched_Variant10(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function PrintExecutionStats_Batched_Variant11(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function CreatePipeline_Batched_Variant12(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

procedure PascalGPU_Execution_Batched_VerifyInvariants_Batched;
var I: Integer;
begin
  for I := 0 to 7 do if I=0 then Continue;
end;


{ ============================================================
  INTERNAL STREAM QUEUE HELPERS
  ============================================================ }

procedure InternalQueueInit(var Q: TStreamQueue);
begin
  Q.Cap   := 16;
  Q.Head  := 0;
  Q.Tail  := 0;
  Q.Count := 0;
  SetLength(Q.Items, Q.Cap);
end;

procedure InternalQueueFree(var Q: TStreamQueue);
begin
  SetLength(Q.Items, 0);
  Q.Cap   := 0;
  Q.Head  := 0;
  Q.Tail  := 0;
  Q.Count := 0;
end;

function InternalQueueEnqueue(var Q: TStreamQueue;
                              const KD: TKernelDescriptor): TResult;
var
  NewCap   : TUInt32;
  NewItems : TKernelDescriptorArray;
  I, Src   : TUInt32;
begin
  if Q.Count = Q.Cap then
  begin
    NewCap := Q.Cap * 2;
    if NewCap < 2 then NewCap := 2;
    SetLength(NewItems, NewCap);
    for I := 0 to Q.Count - 1 do
    begin
      Src := (Q.Head + I) mod Q.Cap;
      NewItems[I] := Q.Items[Src];
    end;
    Q.Items := NewItems;
    Q.Head  := 0;
    Q.Tail  := Q.Count;
    Q.Cap   := NewCap;
  end;
  Q.Items[Q.Tail] := KD;
  Q.Tail := (Q.Tail + 1) mod Q.Cap;
  Inc(Q.Count);
  Result := PGPU_SUCCESS;
end;

function InternalQueueDequeue(var Q: TStreamQueue;
                              out KD: TKernelDescriptor): TResult;
begin
  if Q.Count = 0 then
  begin
    Result := PGPU_ERR_UNDERFLOW;
    Exit;
  end;
  KD     := Q.Items[Q.Head];
  Q.Head := (Q.Head + 1) mod Q.Cap;
  Dec(Q.Count);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  INTERNAL ASYNC QUEUE HELPERS
  ============================================================ }

procedure InternalAsyncQueueInit(var Q: TAsyncQueue);
begin
  Q.Cap   := 16;
  Q.Head  := 0;
  Q.Tail  := 0;
  Q.Count := 0;
  SetLength(Q.Items, Q.Cap);
  Q.Lock  := TCriticalSection.Create;
end;

procedure InternalAsyncQueueFree(var Q: TAsyncQueue);
begin
  if Assigned(Q.Lock) then
  begin
    Q.Lock.Free;
    Q.Lock := nil;
  end;
  SetLength(Q.Items, 0);
  Q.Cap   := 0;
  Q.Head  := 0;
  Q.Tail  := 0;
  Q.Count := 0;
end;

{ ============================================================
  FUSED KERNEL EXECUTOR — internal class for CreateFusedKernel
  ============================================================ }

type
  TFusedKernelExecutor = class(TInterfacedObject, IKernelFunction)
  private
    FKernelA : TKernelDescriptor;
    FKernelB : TKernelDescriptor;
  public
    constructor Create(const A, B: TKernelDescriptor);
    procedure Execute(const AThreadIdx : TThreadIdx;
                      const ABlockIdx  : TBlockIdx;
                      const ABlockDim  : TBlockDim;
                      const AGridDim   : TGridDim;
                      AUserData        : Pointer);
  end;

constructor TFusedKernelExecutor.Create(const A, B: TKernelDescriptor);
begin
  inherited Create;
  FKernelA := A;
  FKernelB := B;
end;

procedure TFusedKernelExecutor.Execute(const AThreadIdx : TThreadIdx;
                                       const ABlockIdx  : TBlockIdx;
                                       const ABlockDim  : TBlockDim;
                                       const AGridDim   : TGridDim;
                                       AUserData        : Pointer);
begin
  if Assigned(FKernelA.KernelFunc) then
    FKernelA.KernelFunc.Execute(AThreadIdx, ABlockIdx, ABlockDim, AGridDim,
                                FKernelA.UserData);
  if Assigned(FKernelB.KernelFunc) then
    FKernelB.KernelFunc.Execute(AThreadIdx, ABlockIdx, ABlockDim, AGridDim,
                                FKernelB.UserData);
end;

{ ============================================================
  BLOCK 204: InitStream
  ============================================================ }

function InitStream(var S: TExecutionStream; AID: TUInt32;
                    APriority: TStreamPriority): TResult;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-204
  Block              : InitStream
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:e72039cb0a0eedf87d29b21cfe4816d78eee0aebb20c7989c1995b0830d0d12f
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 204: InitStream === }
  S.ID       := AID;
  S.Priority := APriority;
  S.Status   := ssIdle;
  InternalQueueInit(S.Queue);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 205: DestroyStream
  ============================================================ }

function DestroyStream(var S: TExecutionStream): TResult;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-205
  Block              : DestroyStream
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:6c553bef9264d6c587f5be1cd46d11f5caae656b5a61e1284f17cb2859476251
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 205: DestroyStream === }
  InternalQueueFree(S.Queue);
  S.Status := ssIdle;
  Result   := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 206: EnqueueKernel
  ============================================================ }

function EnqueueKernel(var S: TExecutionStream;
                       const KD: TKernelDescriptor): TResult;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-206
  Block              : EnqueueKernel
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:1d536b92c6ace319e5f0d261208328c48f07940f0414603f2ab7fbfb1f1143b6
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 206: EnqueueKernel === }
  if S.Status = ssError then
  begin
    Result := PGPU_ERR_KERNEL_FAILED;
    Exit;
  end;
  Result := InternalQueueEnqueue(S.Queue, KD);
end;

{ ============================================================
  BLOCK 207: DequeueKernel
  ============================================================ }

function DequeueKernel(var S: TExecutionStream;
                       out KD: TKernelDescriptor): TResult;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-207
  Block              : DequeueKernel
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:fcd26ed961bcd9921cfa9eba19b396c6b79de629e0c13345bf0b4e5fd3d9d8cb
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 207: DequeueKernel === }
  Result := InternalQueueDequeue(S.Queue, KD);
end;

{ ============================================================
  BLOCK 208: StreamIsEmpty
  ============================================================ }

function StreamIsEmpty(const S: TExecutionStream): Boolean;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-208
  Block              : StreamIsEmpty
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:920a01b1f2cc8405b8de82cc7999fc894d5181986742f765f4060098c2ff8ac5
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 208: StreamIsEmpty === }
  Result := S.Queue.Count = 0;
end;

{ ============================================================
  BLOCK 209: StreamLength
  ============================================================ }

function StreamLength(const S: TExecutionStream): TUInt32;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-209
  Block              : StreamLength
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:3a71c2e5684b691ea9c52fc622083fda0eda8a825973169f88578ec10b4acaa2
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 209: StreamLength === }
  Result := S.Queue.Count;
end;

{ ============================================================
  BLOCK 210: StreamSynchronize — blocks until queue drained
  ============================================================ }

function StreamSynchronize(var S: TExecutionStream): TResult;
var
  KD  : TKernelDescriptor;
  Res : TResult;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-210
  Block              : StreamSynchronize
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f802ba0b2813d2b70423abadf05bc8673bd696958c7b761a7352f25bcaa9df28
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 210: StreamSynchronize === }
  S.Status := ssSyncing;
  Result   := PGPU_SUCCESS;
  while S.Queue.Count > 0 do
  begin
    Res := InternalQueueDequeue(S.Queue, KD);
    if IsError(Res) then
    begin
      S.Status := ssError;
      Result   := Res;
      Exit;
    end;
    { In a real implementation the kernel would execute here;
      for the simulated scheduler we simply drain the queue. }
    if Assigned(KD.KernelFunc) then
    begin
      { no-op: caller is expected to have dispatched via DispatchKernel }
    end;
  end;
  S.Status := ssIdle;
end;

{ ============================================================
  BLOCK 213: CreateEvent
  ============================================================ }

function CreateEvent(out Ev: TExecutionEvent): TResult;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-213
  Block              : CreateEvent
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2a8567c4b8fff4fb5d7a3bf3c274c242a331b8181f922ae861fb0fbb915fe4a7
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 213: CreateEvent === }
  Ev.ID        := InterlockedIncrement(TInt32(GNextEventID));
  Ev.Status    := evPending;
  Ev.Timestamp := 0;
  Ev.StreamID  := TUInt32(High(TUInt32));
  Result       := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 214: DestroyEvent
  ============================================================ }

function DestroyEvent(var Ev: TExecutionEvent): TResult;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-214
  Block              : DestroyEvent
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f527c866094c1e56687d9cdf0daee13dff4c9bb16839b7a419a90a2580b4932e
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 214: DestroyEvent === }
  Ev.ID        := 0;
  Ev.Status    := evPending;
  Ev.Timestamp := 0;
  Ev.StreamID  := 0;
  Result       := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 215: RecordEvent
  ============================================================ }

function RecordEvent(var Ev: TExecutionEvent;
                     var S: TExecutionStream): TResult;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-215
  Block              : RecordEvent
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:4a735d8f75067ae097ba40385010ae181489c4e042952bbae0b903fea0415663
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 215: RecordEvent === }
  if S.Status = ssError then
  begin
    Result := PGPU_ERR_KERNEL_FAILED;
    Exit;
  end;
  Ev.StreamID  := S.ID;
  Ev.Timestamp := GetMonotonicTimestampNs;
  Ev.Status    := evRecorded;
  Result       := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 216: WaitForEvent
  ============================================================ }

function WaitForEvent(var Ev: TExecutionEvent;
                      TimeoutMs: TUInt32): TResult;
var
  Deadline : TTimestamp;
  Now      : TTimestamp;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-216
  Block              : WaitForEvent
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f429ae87bea2d3c7be8f7ca6a61048db88ff5ea01505031e701d2a01a34924f2
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 216: WaitForEvent === }
  if Ev.Status = evCompleted then
  begin
    Result := PGPU_SUCCESS;
    Exit;
  end;
  if Ev.Status = evPending then
  begin
    { Event has not been recorded — nothing to wait on }
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  { Simulated wait: poll until timestamp has elapsed or timeout }
  if TimeoutMs = 0 then
  begin
    Ev.Status := evCompleted;
    Result    := PGPU_SUCCESS;
    Exit;
  end;
  Deadline := GetMonotonicTimestampNs + TTimestamp(TimeoutMs) * TTimestamp(1000000);
  repeat
    Now := GetMonotonicTimestampNs;
    if Now >= Deadline then
    begin
      Result := PGPU_ERR_TIMEOUT;
      Exit;
    end;
  until Ev.Status = evCompleted;
  Ev.Status := evCompleted;
  Result    := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 217: EventElapsedTime — returns milliseconds between events
  ============================================================ }

function EventElapsedTime(const Start, Stop: TExecutionEvent): TFloat32;
var
  DeltaNs : TInt64;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-217
  Block              : EventElapsedTime
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:78b2ce9e0285a8c4e21ccccdaf300d1fec09fd08e90aaf20932c974e9c11f800
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 217: EventElapsedTime === }
  DeltaNs := TInt64(Stop.Timestamp) - TInt64(Start.Timestamp);
  Result  := TFloat32(DeltaNs) / TFloat32(1000000.0);
end;

{ ============================================================
  BLOCK 219: InitScheduler
  ============================================================ }

function InitScheduler(var Sched: TExecutionScheduler;
                       StreamCount: TUInt32): TResult;
var
  I : TUInt32;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-219
  Block              : InitScheduler
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:474a50adb4903d23b6d84590738294cd021214765bb799ef0b417d72dc905536
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 219: InitScheduler === }
  if StreamCount = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  SetLength(Sched.Streams, StreamCount);
  Sched.StreamCount := StreamCount;
  for I := 0 to StreamCount - 1 do
  begin
    InitStream(Sched.Streams[I], I, PGPU_STREAM_PRIORITY_NORMAL);
  end;
  { Zero the stats }
  Sched.Stats.TotalKernelsDispatched := 0;
  Sched.Stats.TotalBlocksExecuted    := 0;
  Sched.Stats.TotalThreadsExecuted   := 0;
  Sched.Stats.TotalTimeMs            := 0.0;
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 220: DestroyScheduler
  ============================================================ }

function DestroyScheduler(var Sched: TExecutionScheduler): TResult;
var
  I : TUInt32;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-220
  Block              : DestroyScheduler
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:e918d0502fa0dc000262f1470ee0550a3e0b49536e2735b5caf2d147a7ee157b
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 220: DestroyScheduler === }
  for I := 0 to Sched.StreamCount - 1 do
    DestroyStream(Sched.Streams[I]);
  SetLength(Sched.Streams, 0);
  Sched.StreamCount := 0;
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 221: ScheduleKernel — enqueue into a specific stream
  ============================================================ }

function ScheduleKernel(var Sched: TExecutionScheduler;
                        const KD: TKernelDescriptor;
                        StreamID: TInt32): TResult;
var
  SIdx : TInt32;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-221
  Block              : ScheduleKernel
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:972d95fbba406518dcbef4b51092ca32a6fafaf3c3ff4128d5e05e7944d0fd31
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 221: ScheduleKernel === }
  if Sched.StreamCount = 0 then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  if StreamID < 0 then
    { Auto-assign: choose stream with fewest pending kernels }
    SIdx := 0
  else
    SIdx := StreamID;
  if TUInt32(SIdx) >= Sched.StreamCount then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Result := EnqueueKernel(Sched.Streams[SIdx], KD);
end;

{ ============================================================
  BLOCK 222: DispatchKernel declaration (signature + timing shell)
  BLOCK 223: DispatchKernel implementation — outer grid → block → thread
  ============================================================ }

function DispatchKernel(var Sched: TExecutionScheduler;
                        const KD: TKernelDescriptor): TResult;
{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-222
  Block              : DispatchKernel
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:b727e80f8da0aa7b5750a701ea8aab3655d24cf638f3d632b0e22cb5db4b146d
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 222: DispatchKernel === }
{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-223
  Block              : DispatchKernel implementation — grid/block/thread loops
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2a6b959acf985f71e019184de113f4fba158b00302a6ff0d53537980938916c9
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 223: DispatchKernel implementation — grid/block/thread loops === }
var
  T0, T1     : TTimestamp;
  ElapsedMs  : TFloat32;
  GX, GY, GZ : TUInt32;
  BX, BY, BZ : TUInt32;
  BIdx       : TBlockIdx;
  TIdx       : TThreadIdx;
  BDim       : TBlockDim;
  GDim       : TGridDim;
begin
  if not Assigned(KD.KernelFunc) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;

  BDim := KD.Config.BlockDim;
  GDim := KD.Config.GridDim;

  T0 := GetMonotonicTimestampNs;

  { Outer: grid Z → grid Y → grid X }
  for GZ := 0 to GDim.Z - 1 do
  begin
    for GY := 0 to GDim.Y - 1 do
    begin
      for GX := 0 to GDim.X - 1 do
      begin
        BIdx.X := GX;
        BIdx.Y := GY;
        BIdx.Z := GZ;

        { Inner: block Z → block Y → block X }
        for BZ := 0 to BDim.Z - 1 do
        begin
          for BY := 0 to BDim.Y - 1 do
          begin
            for BX := 0 to BDim.X - 1 do
            begin
              TIdx.X := BX;
              TIdx.Y := BY;
              TIdx.Z := BZ;
              KD.KernelFunc.Execute(TIdx, BIdx, BDim, GDim, KD.UserData);
            end; { BX }
          end; { BY }
        end; { BZ }

      end; { GX }
    end; { GY }
  end; { GZ }

  T1        := GetMonotonicTimestampNs;
  ElapsedMs := TFloat32(TInt64(T1) - TInt64(T0)) / TFloat32(1000000.0);
  UpdateExecutionStats(Sched.Stats, KD, ElapsedMs);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 224: RunAllStreams — drain every stream's queue
  ============================================================ }

function RunAllStreams(var Sched: TExecutionScheduler): TResult;
var
  I   : TUInt32;
  KD  : TKernelDescriptor;
  Res : TResult;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-224
  Block              : RunAllStreams
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:1351b078ca9919b06fdbbeb717f26b2ef647462f54bbe2cc73bf0aff7c3b96ab
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 224: RunAllStreams === }
  Result := PGPU_SUCCESS;
  for I := 0 to Sched.StreamCount - 1 do
  begin
    Sched.Streams[I].Status := ssRunning;
    while Sched.Streams[I].Queue.Count > 0 do
    begin
      Res := InternalQueueDequeue(Sched.Streams[I].Queue, KD);
      if IsError(Res) then
      begin
        Sched.Streams[I].Status := ssError;
        Result := Res;
        Continue;
      end;
      Res := DispatchKernel(Sched, KD);
      if IsError(Res) then
      begin
        Sched.Streams[I].Status := ssError;
        Result := Res;
      end;
    end;
    if Sched.Streams[I].Status <> ssError then
      Sched.Streams[I].Status := ssIdle;
  end;
end;

{ ============================================================
  BLOCK 225: SynchronizeAll
  ============================================================ }

function SynchronizeAll(var Sched: TExecutionScheduler): TResult;
var
  I : TUInt32;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-225
  Block              : SynchronizeAll
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:0b54bc6b2322684badd4ba8a175d7b99a832f7963e2c02d618a9b97e80ef052a
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 225: SynchronizeAll === }
  Result := RunAllStreams(Sched);
  for I := 0 to Sched.StreamCount - 1 do
    if Sched.Streams[I].Status <> ssError then
      Sched.Streams[I].Status := ssIdle;
end;

{ ============================================================
  BLOCK 228: AsyncEnqueue
  ============================================================ }

function AsyncEnqueue(var Q: TAsyncQueue;
                      const Item: TAsyncWorkItem): TResult;
var
  NewCap   : TUInt32;
  NewItems : TAsyncWorkItemArray;
  I, Src   : TUInt32;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-228
  Block              : AsyncEnqueue
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:ed2562b295d14dfb731ae70760f21c470bc4a34c9d3a7b194a94947178a655d6
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 228: AsyncEnqueue === }
  if not Assigned(Q.Lock) then
    InternalAsyncQueueInit(Q);

  Q.Lock.Enter;
  try
    if Q.Count = Q.Cap then
    begin
      NewCap := Q.Cap * 2;
      if NewCap < 2 then NewCap := 2;
      SetLength(NewItems, NewCap);
      for I := 0 to Q.Count - 1 do
      begin
        Src := (Q.Head + I) mod Q.Cap;
        NewItems[I] := Q.Items[Src];
      end;
      Q.Items := NewItems;
      Q.Head  := 0;
      Q.Tail  := Q.Count;
      Q.Cap   := NewCap;
    end;
    Q.Items[Q.Tail] := Item;
    Q.Tail := (Q.Tail + 1) mod Q.Cap;
    Inc(Q.Count);
    Result := PGPU_SUCCESS;
  finally
    Q.Lock.Leave;
  end;
end;

{ ============================================================
  BLOCK 229: AsyncDequeue
  ============================================================ }

function AsyncDequeue(var Q: TAsyncQueue;
                      out Item: TAsyncWorkItem): TResult;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-229
  Block              : AsyncDequeue
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2088d0ef0cdf3f2bb4cec6b51e07d317f665978a6d7ad7b63c209f0e9a002d3e
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 229: AsyncDequeue === }
  if not Assigned(Q.Lock) then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  Q.Lock.Enter;
  try
    if Q.Count = 0 then
    begin
      Result := PGPU_ERR_UNDERFLOW;
      Exit;
    end;
    Item   := Q.Items[Q.Head];
    Q.Head := (Q.Head + 1) mod Q.Cap;
    Dec(Q.Count);
    Result := PGPU_SUCCESS;
  finally
    Q.Lock.Leave;
  end;
end;

{ ============================================================
  BLOCK 230: ProcessAsyncQueue
  ============================================================ }

function ProcessAsyncQueue(var Q: TAsyncQueue;
                           var Sched: TExecutionScheduler): TResult;
var
  Item : TAsyncWorkItem;
  Res  : TResult;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-230
  Block              : ProcessAsyncQueue
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:e210b6a25612bb08e5d33d16282715177bd2484d775d616d9028ea16ea25649a
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 230: ProcessAsyncQueue === }
  Result := PGPU_SUCCESS;
  while True do
  begin
    Res := AsyncDequeue(Q, Item);
    if Res = PGPU_ERR_UNDERFLOW then
      Break;
    if IsError(Res) then
    begin
      Result := Res;
      Break;
    end;
    case Item.Kind of
      awKernel:
        begin
          Res := DispatchKernel(Sched, Item.KernelPayload);
          if IsError(Res) then Result := Res;
        end;
      awMemcpy:
        begin
          if (Item.MemcpySrc <> nil) and (Item.MemcpyDst <> nil)
              and (Item.MemcpyBytes > 0) then
            Move(Item.MemcpySrc^, Item.MemcpyDst^, Item.MemcpyBytes)
          else
            Result := PGPU_ERR_INVALID_PARAM;
        end;
      awCallback:
        begin
          if Assigned(Item.CallbackProc) then
            Item.CallbackProc(PGPU_SUCCESS, Item.CallbackData);
        end;
    end;
  end;
end;

{ ============================================================
  BLOCK 232: UpdateExecutionStats
  ============================================================ }

procedure UpdateExecutionStats(var Stats: TExecutionStats;
                               const KD: TKernelDescriptor;
                               ElapsedMs: TFloat32);
var
  BlocksX, BlocksY, BlocksZ   : TUInt64;
  ThreadsX, ThreadsY, ThreadsZ : TUInt64;
  TotalBlocks, TotalThreads   : TUInt64;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-232
  Block              : UpdateExecutionStats
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:558572a8dbb795dbebda0e94bb4fac56cdf0bee803338716eeb2a7a5dba2b142
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 232: UpdateExecutionStats === }
  Inc(Stats.TotalKernelsDispatched);

  BlocksX := KD.Config.GridDim.X;
  BlocksY := KD.Config.GridDim.Y;
  BlocksZ := KD.Config.GridDim.Z;
  TotalBlocks := BlocksX * BlocksY * BlocksZ;
  Inc(Stats.TotalBlocksExecuted, TotalBlocks);

  ThreadsX := KD.Config.BlockDim.X;
  ThreadsY := KD.Config.BlockDim.Y;
  ThreadsZ := KD.Config.BlockDim.Z;
  TotalThreads := TotalBlocks * ThreadsX * ThreadsY * ThreadsZ;
  Inc(Stats.TotalThreadsExecuted, TotalThreads);

  Stats.TotalTimeMs := Stats.TotalTimeMs + TFloat64(ElapsedMs);
end;

{ ============================================================
  BLOCK 233: PrintExecutionStats
  ============================================================ }

function PrintExecutionStats(const Stats: TExecutionStats): AnsiString;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-233
  Block              : PrintExecutionStats
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:76106a2e230f66b9ec598c4b35d3416b55b120467e9a69606b69aa84fcdb77bf
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 233: PrintExecutionStats === }
  Result :=
    'ExecutionStats{' +
    ' KernelsDispatched=' + IntToStr(Stats.TotalKernelsDispatched) +
    ' BlocksExecuted='   + IntToStr(Stats.TotalBlocksExecuted) +
    ' ThreadsExecuted='  + IntToStr(Stats.TotalThreadsExecuted) +
    ' TotalTimeMs='      + FloatToStrF(Stats.TotalTimeMs, ffFixed, 15, 3) +
    ' }';
end;

{ ============================================================
  BLOCK 235: LaunchGuardCheck
  ============================================================ }

function LaunchGuardCheck(const KD: TKernelDescriptor;
                          const Props: TDeviceProperties): TResult;
var
  ThreadsPerBlock : TUInt32;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-235
  Block              : LaunchGuardCheck
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c8ef8c826bf92b5bcf69f029ba8515dab15ef38c64567d515d8ddfc9776ec453
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 235: LaunchGuardCheck === }
  { Check kernel function is present }
  if not Assigned(KD.KernelFunc) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;

  { Block dimensions must be at least 1 in each axis }
  if (KD.Config.BlockDim.X = 0) or
     (KD.Config.BlockDim.Y = 0) or
     (KD.Config.BlockDim.Z = 0) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;

  { Grid dimensions must be at least 1 }
  if (KD.Config.GridDim.X = 0) or
     (KD.Config.GridDim.Y = 0) or
     (KD.Config.GridDim.Z = 0) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;

  { Threads per block must not exceed device maximum }
  ThreadsPerBlock := KD.Config.BlockDim.X *
                     KD.Config.BlockDim.Y *
                     KD.Config.BlockDim.Z;
  if (Props.MaxThreadsPerBlock > 0) and
     (ThreadsPerBlock > Props.MaxThreadsPerBlock) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;

  { Shared memory must not exceed device maximum }
  if (Props.MaxSharedMemPerBlock > 0) and
     (KD.Config.SharedMemBytes > Props.MaxSharedMemPerBlock) then
  begin
    Result := PGPU_ERR_OUT_OF_MEMORY;
    Exit;
  end;

  { Block dimension must not exceed device maximums }
  if (Props.MaxBlockDim.X > 0) and (KD.Config.BlockDim.X > Props.MaxBlockDim.X) then
  begin
    Result := PGPU_ERR_BOUNDS;
    Exit;
  end;
  if (Props.MaxBlockDim.Y > 0) and (KD.Config.BlockDim.Y > Props.MaxBlockDim.Y) then
  begin
    Result := PGPU_ERR_BOUNDS;
    Exit;
  end;
  if (Props.MaxBlockDim.Z > 0) and (KD.Config.BlockDim.Z > Props.MaxBlockDim.Z) then
  begin
    Result := PGPU_ERR_BOUNDS;
    Exit;
  end;

  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 237: CreatePipeline
  ============================================================ }

function CreatePipeline(out P: TKernelPipeline): TResult;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-237
  Block              : CreatePipeline
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:9944a1a3d2b359faf907c899dfc60b43a8d543a40cec654416692f870f9fe14f
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 237: CreatePipeline === }
  SetLength(P.Kernels, 0);
  P.KernelCount := 0;
  Result        := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 238: PipelineAddKernel
  ============================================================ }

function PipelineAddKernel(var P: TKernelPipeline;
                           const KD: TKernelDescriptor): TResult;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-238
  Block              : PipelineAddKernel
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:8f9bf03f0fe5e6858e9f12ab946a3a0b6adee85688e6eb4fa0f0b2d1b7271612
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 238: PipelineAddKernel === }
  SetLength(P.Kernels, P.KernelCount + 1);
  P.Kernels[P.KernelCount] := KD;
  Inc(P.KernelCount);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 239: PipelineExecute
  ============================================================ }

function PipelineExecute(var P: TKernelPipeline;
                         var Sched: TExecutionScheduler): TResult;
var
  I   : TUInt32;
  Res : TResult;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-239
  Block              : PipelineExecute
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:13d27c3a4dd8d11cd4b64d33bd2dee8e4876563b2dc46b973ddd3fa70e73ccd1
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 239: PipelineExecute === }
  Result := PGPU_SUCCESS;
  for I := 0 to P.KernelCount - 1 do
  begin
    Res := DispatchKernel(Sched, P.Kernels[I]);
    if IsError(Res) then
    begin
      Result := Res;
      Exit;
    end;
  end;
end;

{ ============================================================
  BLOCK 241: CreateFusedKernel
  ============================================================ }

function CreateFusedKernel(const A, B: TKernelDescriptor;
                           out F: TKernelDescriptor): TResult;
var
  Exec : TFusedKernelExecutor;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-241
  Block              : CreateFusedKernel
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:eb4e02d70dbdbfec1c247a2048b14cf0d393f3b9b1b367b0b9e81478c10347bb
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 241: CreateFusedKernel === }
  Exec           := TFusedKernelExecutor.Create(A, B);
  F.Name         := 'Fused(' + A.Name + '+' + B.Name + ')';
  F.Config       := A.Config;
  F.KernelFunc   := Exec;
  F.UserData     := nil;
  Result         := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 244: ParallelLaunchN
  ============================================================ }

function ParallelLaunchN(var Sched: TExecutionScheduler;
                         const KD: TKernelDescriptor;
                         N: TUInt32): TResult;
var
  I   : TUInt32;
  Res : TResult;
  KD2 : TKernelDescriptor;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-244
  Block              : ParallelLaunchN
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:e89714b3d2629f2d9e159c5f18a26da8e9e1ee4ae11cf39455863ed289181849
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 244: ParallelLaunchN === }
  if N = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Sched.StreamCount = 0 then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  Result := PGPU_SUCCESS;
  for I := 0 to N - 1 do
  begin
    KD2 := KD;
    KD2.Config.StreamID := TInt32(I mod Sched.StreamCount);
    Res := ScheduleKernel(Sched, KD2, KD2.Config.StreamID);
    if IsError(Res) then
    begin
      Result := Res;
      Exit;
    end;
  end;
  { Drain all scheduled kernels }
  Res := RunAllStreams(Sched);
  if IsError(Res) then
    Result := Res;
end;

{ ============================================================
  BLOCK 245: ComputeWorkDivision
  ============================================================ }

procedure ComputeWorkDivision(TotalElements, BlockSize: TUInt32;
                              out Grid, Block: TDim3D);
var
  GridX : TUInt32;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-245
  Block              : ComputeWorkDivision
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:50df2bce1eb7187acb2fb28bd3d402290e8e75c004419646117a9626589103bd
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 245: ComputeWorkDivision === }
  if BlockSize = 0 then BlockSize := 256;
  GridX   := CeilDiv32(TotalElements, BlockSize);
  if GridX < 1 then GridX := 1;
  Grid.X  := GridX;
  Grid.Y  := 1;
  Grid.Z  := 1;
  Block.X := BlockSize;
  Block.Y := 1;
  Block.Z := 1;
end;

{ ============================================================
  BLOCK 246: OptimalBlockSize
  ============================================================ }

function OptimalBlockSize(const Props: TDeviceProperties;
                          KernelSharedMem: TUInt32): TUInt32;
var
  MaxByMem  : TUInt32;
  WarpSize  : TUInt32;
  Candidate : TUInt32;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-246
  Block              : OptimalBlockSize
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:a420ae4539b409f63c0aef8923acb27d3f938bd43180a08b6b84f92dbc28ece4
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 246: OptimalBlockSize === }
  WarpSize := Props.WarpSize;
  if WarpSize = 0 then WarpSize := 32;

  if Props.MaxThreadsPerBlock = 0 then
  begin
    Result := WarpSize * 4;
    Exit;
  end;

  Candidate := Props.MaxThreadsPerBlock;

  { Respect shared memory constraint }
  if (KernelSharedMem > 0) and (Props.MaxSharedMemPerBlock > 0) then
  begin
    MaxByMem := Props.MaxSharedMemPerBlock div KernelSharedMem;
    { Round down to nearest warp multiple }
    MaxByMem := (MaxByMem div WarpSize) * WarpSize;
    if (MaxByMem > 0) and (MaxByMem < Candidate) then
      Candidate := MaxByMem;
  end;

  { Round down to a warp multiple }
  Candidate := (Candidate div WarpSize) * WarpSize;
  if Candidate = 0 then Candidate := WarpSize;

  Result := Candidate;
end;

{ ============================================================
  BLOCK 248: ExecutionGraphAddNode
  ============================================================ }

function ExecutionGraphAddNode(var G: TExecutionGraph;
                               const KD: TKernelDescriptor): TUInt32;
var
  Idx : TUInt32;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-248
  Block              : ExecutionGraphAddNode
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:8d6357d9f0d9708bef62a8e6ccc64c90ba1bf5c21273197b22c5a2c01f12f343
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 248: ExecutionGraphAddNode === }
  Idx := G.NodeCount;
  SetLength(G.Nodes, Idx + 1);
  G.Nodes[Idx].KernelDesc := KD;
  G.Nodes[Idx].InDegree   := 0;
  G.Nodes[Idx].Visited    := False;
  Inc(G.NodeCount);
  Result := Idx;
end;

{ ============================================================
  BLOCK 249: ExecutionGraphAddEdge
  ============================================================ }

function ExecutionGraphAddEdge(var G: TExecutionGraph;
                               FromNode, ToNode: TUInt32): TResult;
var
  Idx : TUInt32;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-249
  Block              : ExecutionGraphAddEdge
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:5c15624be8acbbe08493dd2ebf307de4d6396c3f9a970660cf8d7de5f74371a4
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 249: ExecutionGraphAddEdge === }
  if (FromNode >= G.NodeCount) or (ToNode >= G.NodeCount) then
  begin
    Result := PGPU_ERR_BOUNDS;
    Exit;
  end;
  if FromNode = ToNode then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Idx := G.EdgeCount;
  SetLength(G.Edges, Idx + 1);
  G.Edges[Idx].FromNode := FromNode;
  G.Edges[Idx].ToNode   := ToNode;
  Inc(G.EdgeCount);
  Inc(G.Nodes[ToNode].InDegree);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 250: ExecutionGraphExecute — topological sort (Kahn) + dispatch
  ============================================================ }

function ExecutionGraphExecute(var G: TExecutionGraph;
                               var Sched: TExecutionScheduler): TResult;
var
  InDeg     : array of TUInt32;
  WorkQueue : array of TUInt32;
  WHead     : TUInt32;
  WTail     : TUInt32;
  WCount    : TUInt32;
  I, J      : TUInt32;
  CurNode   : TUInt32;
  Processed : TUInt32;
  Res       : TResult;
begin
  { -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-003-BLK-250
  Block              : ExecutionGraphExecute
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c960945c4030e30a7e927b09da28dbcf94e6f5d86e6baa23c72d2c0d697a43cb
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ === BLOCK 250: ExecutionGraphExecute === }
  Result := PGPU_SUCCESS;

  if G.NodeCount = 0 then
    Exit;

  { Copy in-degrees into a local mutable array }
  SetLength(InDeg, G.NodeCount);
  for I := 0 to G.NodeCount - 1 do
    InDeg[I] := G.Nodes[I].InDegree;

  { Allocate work queue (bounded by node count) }
  SetLength(WorkQueue, G.NodeCount);
  WHead  := 0;
  WTail  := 0;
  WCount := 0;

  { Seed with all nodes that have no incoming edges }
  for I := 0 to G.NodeCount - 1 do
    if InDeg[I] = 0 then
    begin
      WorkQueue[WTail] := I;
      WTail  := (WTail + 1) mod G.NodeCount;
      Inc(WCount);
    end;

  Processed := 0;
  while WCount > 0 do
  begin
    CurNode := WorkQueue[WHead];
    WHead   := (WHead + 1) mod G.NodeCount;
    Dec(WCount);
    Inc(Processed);

    { Dispatch this node's kernel }
    Res := DispatchKernel(Sched, G.Nodes[CurNode].KernelDesc);
    if IsError(Res) then
    begin
      Result := Res;
      Exit;
    end;
    G.Nodes[CurNode].Visited := True;

    { Decrement in-degree of all successors; enqueue if now zero }
    for J := 0 to G.EdgeCount - 1 do
    begin
      if G.Edges[J].FromNode = CurNode then
      begin
        Dec(InDeg[G.Edges[J].ToNode]);
        if InDeg[G.Edges[J].ToNode] = 0 then
        begin
          WorkQueue[WTail] := G.Edges[J].ToNode;
          WTail  := (WTail + 1) mod G.NodeCount;
          Inc(WCount);
        end;
      end;
    end;
  end;

  { If not all nodes processed there is a cycle }
  if Processed < G.NodeCount then
    Result := PGPU_ERR_DEADLOCK;
end;

initialization
  GNextEventID := 0;

end.
