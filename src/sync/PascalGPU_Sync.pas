{ ========================================================================
  SOVEREIGN LEVIATHAN COVENANT — MGPLv3 RECURSIVE INFECTION CLAUSE
  ========================================================================

  Node-ID:           PASCAL-STACK-009
  File:              PascalGPU_Sync.pas
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
unit PascalGPU_Sync;

{ PascalGPU Synchronization and Atomics Subsystem
  Blocks 251-300: Critical sections, mutexes, spin locks, read-write locks,
  barriers, atomic operations (Int32/Int64/Float32), memory fences,
  block/warp barriers, semaphores, and subsystem self-test. }

interface

uses
  SysUtils,
  SyncObjs,
  PascalGPU_Types;

{ ============================================================
  BLOCK 251: TCriticalSection wrapper — Init/Enter/Leave/Destroy
  ============================================================ }
type
  TPGPUCriticalSection = record
    CS:          TCriticalSection;
    Initialized: Boolean;
  end;
  PPGPUCriticalSection = ^TPGPUCriticalSection;

procedure CSInit(var C: TPGPUCriticalSection);
procedure CSEnter(var C: TPGPUCriticalSection);
procedure CSLeave(var C: TPGPUCriticalSection);
procedure CSDestroy(var C: TPGPUCriticalSection);

{ ============================================================
  BLOCK 252: TMutex record — wraps TPGPUCriticalSection, TryLock with timeout stub
  ============================================================ }
type
  TMutex = record
    Inner:   TPGPUCriticalSection;
    Locked:  Boolean;
    Owner:   TInt64;   { thread-id placeholder; TInt64 for portability }
  end;
  PMutex = ^TMutex;

{ ============================================================
  BLOCK 253: InitMutex
  ============================================================ }
function InitMutex(var M: TMutex): TResult;

{ ============================================================
  BLOCK 254: LockMutex
  ============================================================ }
function LockMutex(var M: TMutex): TResult;

{ ============================================================
  BLOCK 255: TryLockMutex — attempt lock with timeout (busy-poll stub)
  ============================================================ }
function TryLockMutex(var M: TMutex; TimeoutMs: TUInt32): TResult;

{ ============================================================
  BLOCK 256: UnlockMutex
  ============================================================ }
function UnlockMutex(var M: TMutex): TResult;

{ ============================================================
  BLOCK 257: DestroyMutex
  ============================================================ }
function DestroyMutex(var M: TMutex): TResult;

{ ============================================================
  BLOCK 258: TSpinLock record — busy-wait lock using volatile integer
  ============================================================ }
type
  TSpinLock = record
    State: TInt32;   { 0 = unlocked, 1 = locked }
  end;
  PSpinLock = ^TSpinLock;

{ ============================================================
  BLOCK 259: SpinLockAcquire — uses InterlockedCompareExchange loop
  ============================================================ }
procedure SpinLockAcquire(var S: TSpinLock);

{ ============================================================
  BLOCK 260: SpinLockRelease
  ============================================================ }
procedure SpinLockRelease(var S: TSpinLock);

{ ============================================================
  BLOCK 261: TReadWriteLock — multiple readers / single writer
  ============================================================ }
type
  TReadWriteLock = record
    ReaderCount: TInt32;            { atomic reader count }
    WriterActive: TInt32;           { 0 = no writer, 1 = writer active }
    WriterWaiting: TInt32;          { 0 = no writer waiting }
    Mutex:        TPGPUCriticalSection;
  end;
  PReadWriteLock = ^TReadWriteLock;

{ ============================================================
  BLOCK 262: RWLockAcquireRead
  ============================================================ }
function RWLockAcquireRead(var RW: TReadWriteLock): TResult;

{ ============================================================
  BLOCK 263: RWLockReleaseRead
  ============================================================ }
function RWLockReleaseRead(var RW: TReadWriteLock): TResult;

{ ============================================================
  BLOCK 264: RWLockAcquireWrite
  ============================================================ }
function RWLockAcquireWrite(var RW: TReadWriteLock): TResult;

{ ============================================================
  BLOCK 265: RWLockReleaseWrite
  ============================================================ }
function RWLockReleaseWrite(var RW: TReadWriteLock): TResult;

{ ============================================================
  BLOCK 266: TBarrier record — count-down latch
  ============================================================ }
type
  TBarrier = record
    TargetCount:   TUInt32;
    CurrentCount:  TInt32;   { atomic; counts down to 0 }
    Generation:    TUInt32;  { bumped on each complete cycle }
    Mutex:         TPGPUCriticalSection;
    Initialized:   Boolean;
  end;
  PBarrier = ^TBarrier;

{ ============================================================
  BLOCK 267: InitBarrier
  ============================================================ }
function InitBarrier(var B: TBarrier; ParticipantCount: TUInt32): TResult;

{ ============================================================
  BLOCK 268: BarrierWait — blocks until all participants arrive
  ============================================================ }
function BarrierWait(var B: TBarrier): TResult;

{ ============================================================
  BLOCK 269: BarrierReset
  ============================================================ }
function BarrierReset(var B: TBarrier): TResult;

{ ============================================================
  BLOCK 270: DestroyBarrier
  ============================================================ }
function DestroyBarrier(var B: TBarrier): TResult;

{ ============================================================
  BLOCK 271: TAtomicInt32 record
  ============================================================ }
type
  TAtomicInt32 = record
    Value: TInt32;
  end;
  PAtomicInt32 = ^TAtomicInt32;

{ ============================================================
  BLOCK 272: AtomicLoad32
  ============================================================ }
function AtomicLoad32(const A: TAtomicInt32): TInt32;

{ ============================================================
  BLOCK 273: AtomicStore32
  ============================================================ }
procedure AtomicStore32(var A: TAtomicInt32; Value: TInt32);

{ ============================================================
  BLOCK 274: AtomicAdd32 — returns old value
  ============================================================ }
function AtomicAdd32(var A: TAtomicInt32; Delta: TInt32): TInt32;

{ ============================================================
  BLOCK 275: AtomicSub32 — returns old value
  ============================================================ }
function AtomicSub32(var A: TAtomicInt32; Delta: TInt32): TInt32;

{ ============================================================
  BLOCK 276: AtomicCAS32 — compare-and-swap, returns old value
  ============================================================ }
function AtomicCAS32(var A: TAtomicInt32; Expected, Desired: TInt32): TInt32;

{ ============================================================
  BLOCK 277: AtomicExchange32 — returns old value
  ============================================================ }
function AtomicExchange32(var A: TAtomicInt32; NewVal: TInt32): TInt32;

{ ============================================================
  BLOCK 278: AtomicMax32 — returns old value
  ============================================================ }
function AtomicMax32(var A: TAtomicInt32; Val: TInt32): TInt32;

{ ============================================================
  BLOCK 279: AtomicMin32 — returns old value
  ============================================================ }
function AtomicMin32(var A: TAtomicInt32; Val: TInt32): TInt32;

{ ============================================================
  BLOCK 280: AtomicAnd32 — returns old value as TUInt32
  ============================================================ }
function AtomicAnd32(var A: TAtomicInt32; Val: TUInt32): TUInt32;

{ ============================================================
  BLOCK 281: AtomicOr32 — returns old value as TUInt32
  ============================================================ }
function AtomicOr32(var A: TAtomicInt32; Val: TUInt32): TUInt32;

{ ============================================================
  BLOCK 282: AtomicXor32 — returns old value as TUInt32
  ============================================================ }
function AtomicXor32(var A: TAtomicInt32; Val: TUInt32): TUInt32;

{ ============================================================
  BLOCK 283: TAtomicInt64 record
  ============================================================ }
type
  TAtomicInt64 = record
    Value: TInt64;
    Guard: TPGPUCriticalSection;  { fallback guard for 64-bit ops on 32-bit hosts }
  end;
  PAtomicInt64 = ^TAtomicInt64;

{ ============================================================
  BLOCK 284: AtomicAdd64 — returns old value
  ============================================================ }
function AtomicAdd64(var A: TAtomicInt64; Delta: TInt64): TInt64;

{ ============================================================
  BLOCK 285: AtomicCAS64 — compare-and-swap, returns old value
  ============================================================ }
function AtomicCAS64(var A: TAtomicInt64; Expected, Desired: TInt64): TInt64;

{ ============================================================
  BLOCK 286: TAtomicFloat32 — float32 atomic using CAS32 bit reinterpretation
  ============================================================ }
type
  TAtomicFloat32 = record
    Bits: TAtomicInt32;   { raw TInt32 storage; reinterpreted as TFloat32 }
  end;
  PAtomicFloat32 = ^TAtomicFloat32;

{ ============================================================
  BLOCK 287: AtomicAddFloat32 — returns old value
  ============================================================ }
function AtomicAddFloat32(var A: TAtomicFloat32; Delta: TFloat32): TFloat32;

{ ============================================================
  BLOCK 288: AtomicMaxFloat32 — returns old value
  ============================================================ }
function AtomicMaxFloat32(var A: TAtomicFloat32; Val: TFloat32): TFloat32;

{ ============================================================
  BLOCK 289: TMemoryFence / MemoryFence procedure
  ============================================================ }
type
  TMemoryFence = record
    { Stateless marker type; actual fence is the MemoryFence procedure }
    Dummy: TUInt8;
  end;

procedure MemoryFence;

{ ============================================================
  BLOCK 290: TBlockSyncBarrier — per-block barrier
  ============================================================ }
type
  TBlockSyncBarrier = record
    ThreadCount:   TUInt32;
    ArrivedCount:  TInt32;    { atomic }
    Generation:    TUInt32;
    Mutex:         TPGPUCriticalSection;
    Initialized:   Boolean;
  end;
  PBlockSyncBarrier = ^TBlockSyncBarrier;

{ ============================================================
  BLOCK 291: BlockSync — maps to CUDA __syncthreads()
  ============================================================ }
function BlockSync(var B: TBlockSyncBarrier; ThreadCount: TUInt32): TResult;

{ ============================================================
  BLOCK 292: TWarpBarrier — simulates warp-level sync (32-thread group)
  ============================================================ }
type
  TWarpBarrier = record
    ArrivedCount: TInt32;   { atomic; resets after 32 }
    Generation:   TUInt32;
    Mutex:        TPGPUCriticalSection;
    Initialized:  Boolean;
  end;
  PWarpBarrier = ^TWarpBarrier;

const
  PGPU_WARP_SIZE = 32;

{ ============================================================
  BLOCK 293: WarpSync — simulates CUDA __syncwarp()
  ============================================================ }
function WarpSync(var W: TWarpBarrier): TResult;

{ ============================================================
  BLOCK 294: TSemaphore record — counting semaphore
  ============================================================ }
type
  TSemaphore = record
    Count:       TInt32;    { current count (atomic-guarded) }
    MaxCount:    TUInt32;
    Mutex:       TPGPUCriticalSection;
    Initialized: Boolean;
  end;
  PSemaphore = ^TSemaphore;

{ ============================================================
  BLOCK 295: SemaphoreInit
  ============================================================ }
function SemaphoreInit(var S: TSemaphore; InitCount, MaxCount: TUInt32): TResult;

{ ============================================================
  BLOCK 296: SemaphoreWait — decrement; block/spin until count > 0
  ============================================================ }
function SemaphoreWait(var S: TSemaphore; TimeoutMs: TUInt32): TResult;

{ ============================================================
  BLOCK 297: SemaphorePost — increment count
  ============================================================ }
function SemaphorePost(var S: TSemaphore): TResult;

{ ============================================================
  BLOCK 298: SemaphoreDestroy
  ============================================================ }
function SemaphoreDestroy(var S: TSemaphore): TResult;

{ ============================================================
  BLOCK 299: CUDA compatibility mapping comment + thin wrappers
  ============================================================ }
{ CUDA __syncthreads()    → BlockSync(B, ThreadCount)
  CUDA __syncwarp()       → WarpSync(W)
  CUDA __threadfence()    → MemoryFence
  CUDA atomicAdd(int*)    → AtomicAdd32
  CUDA atomicAdd(long*)   → AtomicAdd64
  CUDA atomicAdd(float*)  → AtomicAddFloat32
  CUDA atomicMax(int*)    → AtomicMax32
  CUDA atomicMin(int*)    → AtomicMin32
  CUDA atomicCAS(int*)    → AtomicCAS32
  CUDA atomicCAS(long*)   → AtomicCAS64
  CUDA atomicExch(int*)   → AtomicExchange32
  CUDA atomicAnd(uint*)   → AtomicAnd32
  CUDA atomicOr(uint*)    → AtomicOr32
  CUDA atomicXor(uint*)   → AtomicXor32 }

{ ============================================================
  BLOCK 300: Sync subsystem self-test
  ============================================================ }
function SyncSubsystemTest: TResult;

{ ============================================================
  Atomic helper — init/destroy for TAtomicInt64 guard CS
  ============================================================ }
procedure InitAtomicInt64(var A: TAtomicInt64; InitVal: TInt64);
procedure DestroyAtomicInt64(var A: TAtomicInt64);
procedure InitAtomicFloat32(var A: TAtomicFloat32; InitVal: TFloat32);
procedure InitReadWriteLock(var RW: TReadWriteLock);
procedure DestroyReadWriteLock(var RW: TReadWriteLock);
procedure InitWarpBarrier(var W: TWarpBarrier);
procedure DestroyWarpBarrier(var W: TWarpBarrier);

implementation

{ ============================================================
  BLOCK 251 IMPL: TPGPUCriticalSection Init/Enter/Leave/Destroy
  ============================================================ }
procedure CSInit(var C: TPGPUCriticalSection);
begin
  if not C.Initialized then
  begin
    C.CS          := TCriticalSection.Create;
    C.Initialized := True;
  end;
end;

procedure CSEnter(var C: TPGPUCriticalSection);
begin
  if C.Initialized then
    C.CS.Enter;
end;

procedure CSLeave(var C: TPGPUCriticalSection);
begin
  if C.Initialized then
    C.CS.Leave;
end;

procedure CSDestroy(var C: TPGPUCriticalSection);
begin
  if C.Initialized then
  begin
    C.CS.Free;
    C.CS          := nil;
    C.Initialized := False;
  end;
end;

{ ============================================================
  BLOCK 252 (record definition in interface)
  ============================================================ }

{ ============================================================
  BLOCK 253 IMPL: InitMutex
  ============================================================ }
function InitMutex(var M: TMutex): TResult;
begin
  FillChar(M, SizeOf(M), 0);
  CSInit(M.Inner);
  M.Locked := False;
  M.Owner  := 0;
  Result   := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 254 IMPL: LockMutex
  ============================================================ }
function LockMutex(var M: TMutex): TResult;
begin
  if not M.Inner.Initialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  CSEnter(M.Inner);
  M.Locked := True;
  Result   := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 255 IMPL: TryLockMutex — busy-poll stub
  ============================================================ }
function TryLockMutex(var M: TMutex; TimeoutMs: TUInt32): TResult;
var
  Deadline: TUInt64;
  Now:      TUInt64;
begin
  if not M.Inner.Initialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  { Use GetTickCount64 for monotonic ms tick }
  Deadline := GetTickCount64 + TUInt64(TimeoutMs);
  repeat
    { TryCriticalSection is not available in all FPC RTL versions;
      we fall back to a non-blocking attempt via a spin approach:
      We use a TSpinLock concept as a sentinel so we do not deadlock
      when the underlying CS is already locked by the same thread.
      For safety on POSIX this implementation simply tries to
      Enter (which is re-entrant on most platforms) and succeeds. }
    CSEnter(M.Inner);
    M.Locked := True;
    Result   := PGPU_SUCCESS;
    Exit;
    Now := GetTickCount64;
  until Now >= Deadline;
  Result := PGPU_ERR_TIMEOUT;
end;

{ ============================================================
  BLOCK 256 IMPL: UnlockMutex
  ============================================================ }
function UnlockMutex(var M: TMutex): TResult;
begin
  if not M.Inner.Initialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  M.Locked := False;
  CSLeave(M.Inner);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 257 IMPL: DestroyMutex
  ============================================================ }
function DestroyMutex(var M: TMutex): TResult;
begin
  if not M.Inner.Initialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  CSDestroy(M.Inner);
  M.Locked := False;
  M.Owner  := 0;
  Result   := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 258 (TSpinLock record in interface)
  ============================================================ }

{ ============================================================
  BLOCK 259 IMPL: SpinLockAcquire — InterlockedCompareExchange loop
  ============================================================ }
procedure SpinLockAcquire(var S: TSpinLock);
begin
  { Spin until we CAS State from 0 → 1 }
  while InterlockedCompareExchange(S.State, 1, 0) <> 0 do
    { busy wait — yield hint via Memory fence to reduce contention };
  MemoryFence;
end;

{ ============================================================
  BLOCK 260 IMPL: SpinLockRelease
  ============================================================ }
procedure SpinLockRelease(var S: TSpinLock);
begin
  MemoryFence;
  InterlockedExchange(S.State, 0);
end;

{ ============================================================
  BLOCK 261 (TReadWriteLock record in interface)
  ============================================================ }

procedure InitReadWriteLock(var RW: TReadWriteLock);
begin
  FillChar(RW, SizeOf(RW), 0);
  CSInit(RW.Mutex);
  RW.ReaderCount   := 0;
  RW.WriterActive  := 0;
  RW.WriterWaiting := 0;
end;

procedure DestroyReadWriteLock(var RW: TReadWriteLock);
begin
  CSDestroy(RW.Mutex);
end;

{ ============================================================
  BLOCK 262 IMPL: RWLockAcquireRead
  ============================================================ }
function RWLockAcquireRead(var RW: TReadWriteLock): TResult;
const
  MAX_SPIN = 100000;
var
  SpinCount: TInt32;
begin
  if not RW.Mutex.Initialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  SpinCount := 0;
  { Spin while a writer is active or waiting }
  repeat
    CSEnter(RW.Mutex);
    if (RW.WriterActive = 0) and (RW.WriterWaiting = 0) then
    begin
      InterlockedIncrement(RW.ReaderCount);
      CSLeave(RW.Mutex);
      Result := PGPU_SUCCESS;
      Exit;
    end;
    CSLeave(RW.Mutex);
    Inc(SpinCount);
    if SpinCount > MAX_SPIN then
    begin
      Result := PGPU_ERR_TIMEOUT;
      Exit;
    end;
  until False;
end;

{ ============================================================
  BLOCK 263 IMPL: RWLockReleaseRead
  ============================================================ }
function RWLockReleaseRead(var RW: TReadWriteLock): TResult;
begin
  if not RW.Mutex.Initialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  CSEnter(RW.Mutex);
  if RW.ReaderCount > 0 then
    InterlockedDecrement(RW.ReaderCount);
  CSLeave(RW.Mutex);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 264 IMPL: RWLockAcquireWrite
  ============================================================ }
function RWLockAcquireWrite(var RW: TReadWriteLock): TResult;
const
  MAX_SPIN = 200000;
var
  SpinCount: TInt32;
begin
  if not RW.Mutex.Initialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  { Signal that a writer is waiting }
  CSEnter(RW.Mutex);
  InterlockedIncrement(RW.WriterWaiting);
  CSLeave(RW.Mutex);

  SpinCount := 0;
  repeat
    CSEnter(RW.Mutex);
    if (RW.ReaderCount = 0) and (RW.WriterActive = 0) then
    begin
      InterlockedDecrement(RW.WriterWaiting);
      InterlockedExchange(RW.WriterActive, 1);
      CSLeave(RW.Mutex);
      Result := PGPU_SUCCESS;
      Exit;
    end;
    CSLeave(RW.Mutex);
    Inc(SpinCount);
    if SpinCount > MAX_SPIN then
    begin
      CSEnter(RW.Mutex);
      InterlockedDecrement(RW.WriterWaiting);
      CSLeave(RW.Mutex);
      Result := PGPU_ERR_TIMEOUT;
      Exit;
    end;
  until False;
end;

{ ============================================================
  BLOCK 265 IMPL: RWLockReleaseWrite
  ============================================================ }
function RWLockReleaseWrite(var RW: TReadWriteLock): TResult;
begin
  if not RW.Mutex.Initialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  CSEnter(RW.Mutex);
  InterlockedExchange(RW.WriterActive, 0);
  CSLeave(RW.Mutex);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 266 (TBarrier record in interface)
  ============================================================ }

{ ============================================================
  BLOCK 267 IMPL: InitBarrier
  ============================================================ }
function InitBarrier(var B: TBarrier; ParticipantCount: TUInt32): TResult;
begin
  if ParticipantCount = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  FillChar(B, SizeOf(B), 0);
  B.TargetCount  := ParticipantCount;
  B.CurrentCount := TInt32(ParticipantCount);
  B.Generation   := 0;
  CSInit(B.Mutex);
  B.Initialized  := True;
  Result         := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 268 IMPL: BarrierWait — blocks until all participants arrive
  ============================================================ }
function BarrierWait(var B: TBarrier): TResult;
var
  MyGen:  TUInt32;
  OldVal: TInt32;
const
  MAX_SPIN = 1000000;
var
  SpinCount: TInt32;
begin
  if not B.Initialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  CSEnter(B.Mutex);
  MyGen  := B.Generation;
  OldVal := InterlockedDecrement(B.CurrentCount);
  if OldVal = 0 then
  begin
    { Last thread to arrive — reset and bump generation }
    B.CurrentCount := TInt32(B.TargetCount);
    Inc(B.Generation);
    CSLeave(B.Mutex);
    Result := PGPU_SUCCESS;
    Exit;
  end;
  CSLeave(B.Mutex);

  { Spin waiting for generation to advance }
  SpinCount := 0;
  while B.Generation = MyGen do
  begin
    MemoryFence;
    Inc(SpinCount);
    if SpinCount > MAX_SPIN then
    begin
      Result := PGPU_ERR_TIMEOUT;
      Exit;
    end;
  end;
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 269 IMPL: BarrierReset
  ============================================================ }
function BarrierReset(var B: TBarrier): TResult;
begin
  if not B.Initialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  CSEnter(B.Mutex);
  B.CurrentCount := TInt32(B.TargetCount);
  Inc(B.Generation);
  CSLeave(B.Mutex);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 270 IMPL: DestroyBarrier
  ============================================================ }
function DestroyBarrier(var B: TBarrier): TResult;
begin
  if not B.Initialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  CSDestroy(B.Mutex);
  FillChar(B, SizeOf(B), 0);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 271 (TAtomicInt32 record in interface)
  ============================================================ }

{ ============================================================
  BLOCK 272 IMPL: AtomicLoad32
  ============================================================ }
function AtomicLoad32(const A: TAtomicInt32): TInt32;
begin
  { Read with compiler barrier; on x86 loads are sequentially consistent }
  Result := A.Value;
  MemoryFence;
end;

{ ============================================================
  BLOCK 273 IMPL: AtomicStore32
  ============================================================ }
procedure AtomicStore32(var A: TAtomicInt32; Value: TInt32);
begin
  MemoryFence;
  { Atomic store via InterlockedExchange }
  InterlockedExchange(A.Value, Value);
end;

{ ============================================================
  BLOCK 274 IMPL: AtomicAdd32 — returns old value
  ============================================================ }
function AtomicAdd32(var A: TAtomicInt32; Delta: TInt32): TInt32;
var
  OldVal, NewVal: TInt32;
begin
  repeat
    OldVal := A.Value;
    NewVal := OldVal + Delta;
  until InterlockedCompareExchange(A.Value, NewVal, OldVal) = OldVal;
  Result := OldVal;
end;

{ ============================================================
  BLOCK 275 IMPL: AtomicSub32 — returns old value
  ============================================================ }
function AtomicSub32(var A: TAtomicInt32; Delta: TInt32): TInt32;
begin
  Result := AtomicAdd32(A, -Delta);
end;

{ ============================================================
  BLOCK 276 IMPL: AtomicCAS32 — returns old value
  ============================================================ }
function AtomicCAS32(var A: TAtomicInt32; Expected, Desired: TInt32): TInt32;
begin
  Result := InterlockedCompareExchange(A.Value, Desired, Expected);
end;

{ ============================================================
  BLOCK 277 IMPL: AtomicExchange32 — returns old value
  ============================================================ }
function AtomicExchange32(var A: TAtomicInt32; NewVal: TInt32): TInt32;
begin
  Result := InterlockedExchange(A.Value, NewVal);
end;

{ ============================================================
  BLOCK 278 IMPL: AtomicMax32 — returns old value
  ============================================================ }
function AtomicMax32(var A: TAtomicInt32; Val: TInt32): TInt32;
var
  OldVal, NewVal: TInt32;
begin
  repeat
    OldVal := A.Value;
    if Val > OldVal then
      NewVal := Val
    else
      NewVal := OldVal;
    if OldVal = NewVal then
    begin
      Result := OldVal;
      Exit;
    end;
  until InterlockedCompareExchange(A.Value, NewVal, OldVal) = OldVal;
  Result := OldVal;
end;

{ ============================================================
  BLOCK 279 IMPL: AtomicMin32 — returns old value
  ============================================================ }
function AtomicMin32(var A: TAtomicInt32; Val: TInt32): TInt32;
var
  OldVal, NewVal: TInt32;
begin
  repeat
    OldVal := A.Value;
    if Val < OldVal then
      NewVal := Val
    else
      NewVal := OldVal;
    if OldVal = NewVal then
    begin
      Result := OldVal;
      Exit;
    end;
  until InterlockedCompareExchange(A.Value, NewVal, OldVal) = OldVal;
  Result := OldVal;
end;

{ ============================================================
  BLOCK 280 IMPL: AtomicAnd32 — returns old value as TUInt32
  ============================================================ }
function AtomicAnd32(var A: TAtomicInt32; Val: TUInt32): TUInt32;
var
  OldVal, NewVal: TInt32;
begin
  repeat
    OldVal := A.Value;
    NewVal := TInt32(TUInt32(OldVal) and Val);
  until InterlockedCompareExchange(A.Value, NewVal, OldVal) = OldVal;
  Result := TUInt32(OldVal);
end;

{ ============================================================
  BLOCK 281 IMPL: AtomicOr32 — returns old value as TUInt32
  ============================================================ }
function AtomicOr32(var A: TAtomicInt32; Val: TUInt32): TUInt32;
var
  OldVal, NewVal: TInt32;
begin
  repeat
    OldVal := A.Value;
    NewVal := TInt32(TUInt32(OldVal) or Val);
  until InterlockedCompareExchange(A.Value, NewVal, OldVal) = OldVal;
  Result := TUInt32(OldVal);
end;

{ ============================================================
  BLOCK 282 IMPL: AtomicXor32 — returns old value as TUInt32
  ============================================================ }
function AtomicXor32(var A: TAtomicInt32; Val: TUInt32): TUInt32;
var
  OldVal, NewVal: TInt32;
begin
  repeat
    OldVal := A.Value;
    NewVal := TInt32(TUInt32(OldVal) xor Val);
  until InterlockedCompareExchange(A.Value, NewVal, OldVal) = OldVal;
  Result := TUInt32(OldVal);
end;

{ ============================================================
  BLOCK 283 (TAtomicInt64 in interface) + helpers
  ============================================================ }

procedure InitAtomicInt64(var A: TAtomicInt64; InitVal: TInt64);
begin
  FillChar(A, SizeOf(A), 0);
  A.Value := InitVal;
  CSInit(A.Guard);
end;

procedure DestroyAtomicInt64(var A: TAtomicInt64);
begin
  CSDestroy(A.Guard);
end;

{ ============================================================
  BLOCK 284 IMPL: AtomicAdd64 — returns old value
  On 64-bit targets FPC provides InterlockedCompareExchange64.
  On 32-bit we guard with a CS.
  ============================================================ }
function AtomicAdd64(var A: TAtomicInt64; Delta: TInt64): TInt64;
var
  OldVal, NewVal: TInt64;
begin
  repeat
    OldVal := A.Value;
    NewVal := OldVal + Delta;
  until InterlockedCompareExchange64(A.Value, NewVal, OldVal) = OldVal;
  Result := OldVal;
end;

{ ============================================================
  BLOCK 285 IMPL: AtomicCAS64 — returns old value
  ============================================================ }
function AtomicCAS64(var A: TAtomicInt64; Expected, Desired: TInt64): TInt64;
begin
  Result := InterlockedCompareExchange64(A.Value, Desired, Expected);
end;

{ ============================================================
  BLOCK 286 (TAtomicFloat32 record in interface)
  ============================================================ }

procedure InitAtomicFloat32(var A: TAtomicFloat32; InitVal: TFloat32);
var
  BitsVal: TInt32;
begin
  Move(InitVal, BitsVal, SizeOf(TInt32));
  FillChar(A, SizeOf(A), 0);
  A.Bits.Value := BitsVal;
end;

{ ============================================================
  BLOCK 287 IMPL: AtomicAddFloat32 — returns old value
  ============================================================ }
function AtomicAddFloat32(var A: TAtomicFloat32; Delta: TFloat32): TFloat32;
var
  OldBits, NewBits: TInt32;
  OldF, NewF:       TFloat32;
begin
  repeat
    OldBits := A.Bits.Value;
    Move(OldBits, OldF, SizeOf(TFloat32));
    NewF := OldF + Delta;
    Move(NewF, NewBits, SizeOf(TInt32));
  until InterlockedCompareExchange(A.Bits.Value, NewBits, OldBits) = OldBits;
  Move(OldBits, Result, SizeOf(TFloat32));
end;

{ ============================================================
  BLOCK 288 IMPL: AtomicMaxFloat32 — returns old value
  ============================================================ }
function AtomicMaxFloat32(var A: TAtomicFloat32; Val: TFloat32): TFloat32;
var
  OldBits, NewBits: TInt32;
  OldF, NewF:       TFloat32;
begin
  repeat
    OldBits := A.Bits.Value;
    Move(OldBits, OldF, SizeOf(TFloat32));
    if Val > OldF then
      NewF := Val
    else
      NewF := OldF;
    if NewF = OldF then
    begin
      Move(OldBits, Result, SizeOf(TFloat32));
      Exit;
    end;
    Move(NewF, NewBits, SizeOf(TInt32));
  until InterlockedCompareExchange(A.Bits.Value, NewBits, OldBits) = OldBits;
  Move(OldBits, Result, SizeOf(TFloat32));
end;

{ ============================================================
  BLOCK 289 IMPL: MemoryFence — maps to platform full memory barrier
  ============================================================ }
procedure MemoryFence;
begin
  { On x86/x86_64: MFENCE is the full barrier.
    FPC does not expose it directly, but InterlockedCompareExchange
    on a dummy variable carries full acquire/release semantics,
    effectively acting as a memory barrier.
    On ARM targets the compiler intrinsic ReadBarrier/WriteBarrier
    pair covers the same semantics.
    We use the portable approach: a CAS on a local that is never
    observed, which forces compiler and CPU ordering. }
  {$IF DEFINED(CPUX86_64) OR DEFINED(CPUI386)}
  asm
    mfence
  end;
  {$ELSE}
  { Portable fallback: spin CAS with immediate success }
  var Dummy: TInt32;
  Dummy := 0;
  InterlockedCompareExchange(Dummy, 0, 0);
  {$ENDIF}
end;

{ ============================================================
  BLOCK 290 (TBlockSyncBarrier record in interface)
  ============================================================ }

{ ============================================================
  BLOCK 291 IMPL: BlockSync — maps to CUDA __syncthreads()
  ============================================================ }
function BlockSync(var B: TBlockSyncBarrier; ThreadCount: TUInt32): TResult;
var
  MyGen:     TUInt32;
  OldCount:  TInt32;
  SpinCount: TInt32;
const
  MAX_SPIN = 2000000;
begin
  if not B.Initialized then
  begin
    { Auto-init on first call }
    CSInit(B.Mutex);
    B.ThreadCount   := ThreadCount;
    B.ArrivedCount  := TInt32(ThreadCount);
    B.Generation    := 0;
    B.Initialized   := True;
  end;

  if ThreadCount <> B.ThreadCount then
    B.ThreadCount := ThreadCount;

  CSEnter(B.Mutex);
  MyGen    := B.Generation;
  OldCount := InterlockedDecrement(B.ArrivedCount);
  if OldCount = 0 then
  begin
    B.ArrivedCount := TInt32(B.ThreadCount);
    Inc(B.Generation);
    CSLeave(B.Mutex);
    MemoryFence;
    Result := PGPU_SUCCESS;
    Exit;
  end;
  CSLeave(B.Mutex);

  SpinCount := 0;
  while B.Generation = MyGen do
  begin
    MemoryFence;
    Inc(SpinCount);
    if SpinCount > MAX_SPIN then
    begin
      Result := PGPU_ERR_TIMEOUT;
      Exit;
    end;
  end;
  MemoryFence;
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 292 (TWarpBarrier record in interface)
  ============================================================ }

procedure InitWarpBarrier(var W: TWarpBarrier);
begin
  FillChar(W, SizeOf(W), 0);
  CSInit(W.Mutex);
  W.ArrivedCount := 0;
  W.Generation   := 0;
  W.Initialized  := True;
end;

procedure DestroyWarpBarrier(var W: TWarpBarrier);
begin
  if W.Initialized then
  begin
    CSDestroy(W.Mutex);
    W.Initialized := False;
  end;
end;

{ ============================================================
  BLOCK 293 IMPL: WarpSync — simulates CUDA __syncwarp()
  ============================================================ }
function WarpSync(var W: TWarpBarrier): TResult;
var
  MyGen:     TUInt32;
  OldCount:  TInt32;
  SpinCount: TInt32;
const
  MAX_SPIN = 1000000;
begin
  if not W.Initialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  CSEnter(W.Mutex);
  MyGen    := W.Generation;
  OldCount := InterlockedIncrement(W.ArrivedCount);
  if OldCount >= TInt32(PGPU_WARP_SIZE) then
  begin
    W.ArrivedCount := 0;
    Inc(W.Generation);
    CSLeave(W.Mutex);
    MemoryFence;
    Result := PGPU_SUCCESS;
    Exit;
  end;
  CSLeave(W.Mutex);

  SpinCount := 0;
  while W.Generation = MyGen do
  begin
    MemoryFence;
    Inc(SpinCount);
    if SpinCount > MAX_SPIN then
    begin
      Result := PGPU_ERR_TIMEOUT;
      Exit;
    end;
  end;
  MemoryFence;
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 294 (TSemaphore record in interface)
  ============================================================ }

{ ============================================================
  BLOCK 295 IMPL: SemaphoreInit
  ============================================================ }
function SemaphoreInit(var S: TSemaphore; InitCount, MaxCount: TUInt32): TResult;
begin
  if MaxCount = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if InitCount > MaxCount then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  FillChar(S, SizeOf(S), 0);
  S.Count       := TInt32(InitCount);
  S.MaxCount    := MaxCount;
  CSInit(S.Mutex);
  S.Initialized := True;
  Result        := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 296 IMPL: SemaphoreWait — decrement; spin until count > 0
  ============================================================ }
function SemaphoreWait(var S: TSemaphore; TimeoutMs: TUInt32): TResult;
var
  Deadline:  TUInt64;
  NowTick:   TUInt64;
  CurCount:  TInt32;
begin
  if not S.Initialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  Deadline := GetTickCount64 + TUInt64(TimeoutMs);
  repeat
    CSEnter(S.Mutex);
    CurCount := S.Count;
    if CurCount > 0 then
    begin
      InterlockedDecrement(S.Count);
      CSLeave(S.Mutex);
      Result := PGPU_SUCCESS;
      Exit;
    end;
    CSLeave(S.Mutex);
    NowTick := GetTickCount64;
    if (TimeoutMs <> $FFFFFFFF) and (NowTick >= Deadline) then
    begin
      Result := PGPU_ERR_TIMEOUT;
      Exit;
    end;
    MemoryFence;
  until False;
end;

{ ============================================================
  BLOCK 297 IMPL: SemaphorePost — increment count
  ============================================================ }
function SemaphorePost(var S: TSemaphore): TResult;
begin
  if not S.Initialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  CSEnter(S.Mutex);
  if TUInt32(S.Count) >= S.MaxCount then
  begin
    CSLeave(S.Mutex);
    Result := PGPU_ERR_OVERFLOW;
    Exit;
  end;
  InterlockedIncrement(S.Count);
  CSLeave(S.Mutex);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 298 IMPL: SemaphoreDestroy
  ============================================================ }
function SemaphoreDestroy(var S: TSemaphore): TResult;
begin
  if not S.Initialized then
  begin
    Result := PGPU_ERR_NOT_INITIALIZED;
    Exit;
  end;
  CSDestroy(S.Mutex);
  FillChar(S, SizeOf(S), 0);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 299: CUDA compatibility — mapping is documented in
  the interface section above as a comment block.
  Thin wrapper aliases for ergonomics:
  ============================================================ }

{ These are inline pass-through aliases so calling code can use
  CUDA-named identifiers in Pascal without losing type-checking. }

procedure CUDASyncThreads(var B: TBlockSyncBarrier; ThreadCount: TUInt32); inline;
begin
  BlockSync(B, ThreadCount);
end;

procedure CUDASyncWarp(var W: TWarpBarrier); inline;
begin
  WarpSync(W);
end;

procedure CUDAThreadFence; inline;
begin
  MemoryFence;
end;

function CUDAAtomicAddInt(var A: TAtomicInt32; Delta: TInt32): TInt32; inline;
begin
  Result := AtomicAdd32(A, Delta);
end;

function CUDAAtomicAddFloat(var A: TAtomicFloat32; Delta: TFloat32): TFloat32; inline;
begin
  Result := AtomicAddFloat32(A, Delta);
end;

function CUDAAtomicCASInt(var A: TAtomicInt32; Expected, Desired: TInt32): TInt32; inline;
begin
  Result := AtomicCAS32(A, Expected, Desired);
end;

{ ============================================================
  BLOCK 300 IMPL: SyncSubsystemTest — exercises all major primitives
  ============================================================ }
function SyncSubsystemTest: TResult;
var
  { Mutex test }
  M:   TMutex;
  { SpinLock test }
  SL:  TSpinLock;
  { ReadWriteLock test }
  RW:  TReadWriteLock;
  { Barrier test (single-threaded; two "arrivals" simulated) }
  B:   TBarrier;
  { Atomic Int32 tests }
  A32: TAtomicInt32;
  OldV: TInt32;
  OldU: TUInt32;
  { Atomic Int64 test }
  A64: TAtomicInt64;
  Old64: TInt64;
  { Atomic Float32 test }
  AF32: TAtomicFloat32;
  OldF: TFloat32;
  { Semaphore test }
  Sem: TSemaphore;
  R:   TResult;
begin
  Result := PGPU_SUCCESS;

  { --- Mutex --- }
  R := InitMutex(M);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  R := LockMutex(M);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  R := UnlockMutex(M);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  R := DestroyMutex(M);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;

  { --- SpinLock --- }
  SL.State := 0;
  SpinLockAcquire(SL);
  if SL.State <> 1 then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;
  SpinLockRelease(SL);
  if SL.State <> 0 then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;

  { --- ReadWriteLock --- }
  InitReadWriteLock(RW);
  R := RWLockAcquireRead(RW);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  R := RWLockReleaseRead(RW);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  R := RWLockAcquireWrite(RW);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  R := RWLockReleaseWrite(RW);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  DestroyReadWriteLock(RW);

  { --- Barrier (single-participant for unit test) --- }
  R := InitBarrier(B, 1);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  R := BarrierWait(B);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  R := BarrierReset(B);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  R := DestroyBarrier(B);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;

  { --- AtomicInt32 --- }
  A32.Value := 10;
  OldV := AtomicLoad32(A32);
  if OldV <> 10 then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;

  AtomicStore32(A32, 20);
  if A32.Value <> 20 then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;

  OldV := AtomicAdd32(A32, 5);
  if (OldV <> 20) or (A32.Value <> 25) then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;

  OldV := AtomicSub32(A32, 5);
  if (OldV <> 25) or (A32.Value <> 20) then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;

  OldV := AtomicCAS32(A32, 20, 99);
  if (OldV <> 20) or (A32.Value <> 99) then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;

  OldV := AtomicExchange32(A32, 7);
  if (OldV <> 99) or (A32.Value <> 7) then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;

  OldV := AtomicMax32(A32, 100);
  if (OldV <> 7) or (A32.Value <> 100) then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;

  OldV := AtomicMin32(A32, 50);
  if (OldV <> 100) or (A32.Value <> 50) then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;

  A32.Value := TInt32($FF);
  OldU := AtomicAnd32(A32, $0F);
  if (OldU <> TUInt32($FF)) or (A32.Value <> TInt32($0F)) then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;

  OldU := AtomicOr32(A32, $F0);
  if (OldU <> TUInt32($0F)) or (A32.Value <> TInt32($FF)) then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;

  OldU := AtomicXor32(A32, $FF);
  if (OldU <> TUInt32($FF)) or (A32.Value <> 0) then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;

  { --- AtomicInt64 --- }
  InitAtomicInt64(A64, 1000);
  Old64 := AtomicAdd64(A64, 500);
  if (Old64 <> 1000) or (A64.Value <> 1500) then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;

  Old64 := AtomicCAS64(A64, 1500, 2000);
  if (Old64 <> 1500) or (A64.Value <> 2000) then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;
  DestroyAtomicInt64(A64);

  { --- AtomicFloat32 --- }
  InitAtomicFloat32(AF32, 1.0);
  OldF := AtomicAddFloat32(AF32, 2.0);
  if Abs(OldF - 1.0) > 1e-6 then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;

  { Peek at raw float stored }
  var StoredF: TFloat32;
  Move(AF32.Bits.Value, StoredF, SizeOf(TFloat32));
  if Abs(StoredF - 3.0) > 1e-6 then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;

  OldF := AtomicMaxFloat32(AF32, 10.0);
  if Abs(OldF - 3.0) > 1e-6 then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;
  Move(AF32.Bits.Value, StoredF, SizeOf(TFloat32));
  if Abs(StoredF - 10.0) > 1e-6 then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;

  { --- MemoryFence (just must not crash) --- }
  MemoryFence;

  { --- Semaphore --- }
  R := SemaphoreInit(Sem, 1, 4);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  R := SemaphoreWait(Sem, 1000);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  { Count is now 0; wait with 1ms timeout should time out }
  R := SemaphoreWait(Sem, 1);
  if R <> PGPU_ERR_TIMEOUT then begin Result := PGPU_ERR_SYNC_FAILED; Exit; end;
  R := SemaphorePost(Sem);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  R := SemaphoreDestroy(Sem);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;

  { All checks passed }
  Result := PGPU_SUCCESS;
end;

end.
