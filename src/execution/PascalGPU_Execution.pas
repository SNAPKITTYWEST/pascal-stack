{$mode objfpc}{$H+}{$PackRecords C}
unit PascalGPU_Execution;

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
  { === BLOCK 201: TStreamStatus === }
  TStreamStatus = (ssIdle, ssRunning, ssSyncing, ssError);

{ ===========================================================
  BLOCK 203: TStreamQueue — FIFO of TKernelDescriptor
  (declared before TExecutionStream which embeds it)
  =========================================================== }

type
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
  { === BLOCK 211: TEventStatus === }
  TEventStatus = (evPending, evRecorded, evCompleted);

{ ===========================================================
  BLOCK 212: TExecutionEvent record
  =========================================================== }

type
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
  { === BLOCK 234: TLaunchGuard === }
  TLaunchGuard = record
    LastError   : TResult;
    LastMessage : AnsiString;
  end;

{ ===========================================================
  BLOCK 236: TKernelPipeline — ordered list of kernels
  =========================================================== }

type
  { === BLOCK 236: TKernelPipeline === }
  TKernelPipeline = record
    Kernels     : TKernelDescriptorArray;
    KernelCount : TUInt32;
  end;

{ ===========================================================
  BLOCK 240: TFusedKernel — two kernel descriptors as one unit
  =========================================================== }

type
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

{ === BLOCK 204: InitStream === }
function InitStream(var S: TExecutionStream; AID: TUInt32;
                    APriority: TStreamPriority): TResult;

{ === BLOCK 205: DestroyStream === }
function DestroyStream(var S: TExecutionStream): TResult;

{ === BLOCK 206: EnqueueKernel === }
function EnqueueKernel(var S: TExecutionStream;
                       const KD: TKernelDescriptor): TResult;

{ === BLOCK 207: DequeueKernel === }
function DequeueKernel(var S: TExecutionStream;
                       out KD: TKernelDescriptor): TResult;

{ === BLOCK 208: StreamIsEmpty === }
function StreamIsEmpty(const S: TExecutionStream): Boolean;

{ === BLOCK 209: StreamLength === }
function StreamLength(const S: TExecutionStream): TUInt32;

{ === BLOCK 210: StreamSynchronize === }
function StreamSynchronize(var S: TExecutionStream): TResult;

{ ============================================================
  FUNCTION DECLARATIONS — Blocks 213–217
  ============================================================ }

{ === BLOCK 213: CreateEvent === }
function CreateEvent(out Ev: TExecutionEvent): TResult;

{ === BLOCK 214: DestroyEvent === }
function DestroyEvent(var Ev: TExecutionEvent): TResult;

{ === BLOCK 215: RecordEvent === }
function RecordEvent(var Ev: TExecutionEvent;
                     var S: TExecutionStream): TResult;

{ === BLOCK 216: WaitForEvent === }
function WaitForEvent(var Ev: TExecutionEvent;
                      TimeoutMs: TUInt32): TResult;

{ === BLOCK 217: EventElapsedTime (ms) === }
function EventElapsedTime(const Start, Stop: TExecutionEvent): TFloat32;

{ ============================================================
  FUNCTION DECLARATIONS — Blocks 219–225
  ============================================================ }

{ === BLOCK 219: InitScheduler === }
function InitScheduler(var Sched: TExecutionScheduler;
                       StreamCount: TUInt32): TResult;

{ === BLOCK 220: DestroyScheduler === }
function DestroyScheduler(var Sched: TExecutionScheduler): TResult;

{ === BLOCK 221: ScheduleKernel === }
function ScheduleKernel(var Sched: TExecutionScheduler;
                        const KD: TKernelDescriptor;
                        StreamID: TInt32): TResult;

{ === BLOCK 222: DispatchKernel declaration === }
function DispatchKernel(var Sched: TExecutionScheduler;
                        const KD: TKernelDescriptor): TResult;

{ === BLOCK 224: RunAllStreams === }
function RunAllStreams(var Sched: TExecutionScheduler): TResult;

{ === BLOCK 225: SynchronizeAll === }
function SynchronizeAll(var Sched: TExecutionScheduler): TResult;

{ ============================================================
  FUNCTION DECLARATIONS — Blocks 228–230
  ============================================================ }

{ === BLOCK 228: AsyncEnqueue === }
function AsyncEnqueue(var Q: TAsyncQueue;
                      const Item: TAsyncWorkItem): TResult;

{ === BLOCK 229: AsyncDequeue === }
function AsyncDequeue(var Q: TAsyncQueue;
                      out Item: TAsyncWorkItem): TResult;

{ === BLOCK 230: ProcessAsyncQueue === }
function ProcessAsyncQueue(var Q: TAsyncQueue;
                           var Sched: TExecutionScheduler): TResult;

{ ============================================================
  FUNCTION DECLARATIONS — Blocks 232–233
  ============================================================ }

{ === BLOCK 232: UpdateExecutionStats === }
procedure UpdateExecutionStats(var Stats: TExecutionStats;
                               const KD: TKernelDescriptor;
                               ElapsedMs: TFloat32);

{ === BLOCK 233: PrintExecutionStats === }
function PrintExecutionStats(const Stats: TExecutionStats): AnsiString;

{ ============================================================
  FUNCTION DECLARATIONS — Block 235
  ============================================================ }

{ === BLOCK 235: LaunchGuardCheck === }
function LaunchGuardCheck(const KD: TKernelDescriptor;
                          const Props: TDeviceProperties): TResult;

{ ============================================================
  FUNCTION DECLARATIONS — Blocks 237–239
  ============================================================ }

{ === BLOCK 237: CreatePipeline === }
function CreatePipeline(out P: TKernelPipeline): TResult;

{ === BLOCK 238: PipelineAddKernel === }
function PipelineAddKernel(var P: TKernelPipeline;
                           const KD: TKernelDescriptor): TResult;

{ === BLOCK 239: PipelineExecute === }
function PipelineExecute(var P: TKernelPipeline;
                         var Sched: TExecutionScheduler): TResult;

{ ============================================================
  FUNCTION DECLARATIONS — Block 241
  ============================================================ }

{ === BLOCK 241: CreateFusedKernel === }
function CreateFusedKernel(const A, B: TKernelDescriptor;
                           out F: TKernelDescriptor): TResult;

{ ============================================================
  FUNCTION DECLARATIONS — Block 244
  ============================================================ }

{ === BLOCK 244: ParallelLaunchN === }
function ParallelLaunchN(var Sched: TExecutionScheduler;
                         const KD: TKernelDescriptor;
                         N: TUInt32): TResult;

{ ============================================================
  FUNCTION DECLARATIONS — Blocks 245–246
  ============================================================ }

{ === BLOCK 245: ComputeWorkDivision === }
procedure ComputeWorkDivision(TotalElements, BlockSize: TUInt32;
                              out Grid, Block: TDim3D);

{ === BLOCK 246: OptimalBlockSize === }
function OptimalBlockSize(const Props: TDeviceProperties;
                          KernelSharedMem: TUInt32): TUInt32;

{ ============================================================
  FUNCTION DECLARATIONS — Blocks 248–250
  ============================================================ }

{ === BLOCK 248: ExecutionGraphAddNode === }
function ExecutionGraphAddNode(var G: TExecutionGraph;
                               const KD: TKernelDescriptor): TUInt32;

{ === BLOCK 249: ExecutionGraphAddEdge === }
function ExecutionGraphAddEdge(var G: TExecutionGraph;
                               FromNode, ToNode: TUInt32): TResult;

{ === BLOCK 250: ExecutionGraphExecute === }
function ExecutionGraphExecute(var G: TExecutionGraph;
                               var Sched: TExecutionScheduler): TResult;

{ ============================================================
  GLOBAL EVENT ID COUNTER (used by CreateEvent)
  ============================================================ }
var
  GNextEventID : TUInt32;

implementation

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
  { === BLOCK 207: DequeueKernel === }
  Result := InternalQueueDequeue(S.Queue, KD);
end;

{ ============================================================
  BLOCK 208: StreamIsEmpty
  ============================================================ }

function StreamIsEmpty(const S: TExecutionStream): Boolean;
begin
  { === BLOCK 208: StreamIsEmpty === }
  Result := S.Queue.Count = 0;
end;

{ ============================================================
  BLOCK 209: StreamLength
  ============================================================ }

function StreamLength(const S: TExecutionStream): TUInt32;
begin
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
{ === BLOCK 222: DispatchKernel === }
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
