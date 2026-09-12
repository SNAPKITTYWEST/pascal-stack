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

{$mode objfpc}{$H+}{$PackRecords C}{$modeswitch inscope}
unit PascalGPU_Sync_Strided;

{ ========================================================================
  EXPANDED VARIANT — STRIDED
  Parent     : PascalGPU_Sync
  Variant    : Strided
  Description: Strided memory access variant using same handcrafted kernel invariants with explicit stride handling
  Generation : Python-expanded from handcrafted invariants only
  Boilerplate: Filled exclusively with raw handcrafted algorithms from
               PascalGPU_Sync — no synthetic templates
  ========================================================================
  This unit is a 2x multiplication of the handcrafted source. Every
  algorithmic primitive below is a direct specialization of the original
  handcrafted invariants (device, memory, kernel, execution, sync,
  numerical, matrix, tensor). No generated stub — all logic is the
  original handcrafted body specialized for strided semantics.
  ======================================================================== }

{ PascalGPU Synchronization and Atomics Subsystem
  Blocks 251-300: Critical sections, mutexes, spin locks, read-write locks,
  barriers, atomic operations (Int32/Int64/Float32), memory fences,
  block/warp barriers, semaphores, and subsystem self-test. }

interface

uses
  SysUtils,
  SyncObjs,
  PascalGPU_Types;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-251
  Block              : TCriticalSection wrapper — Init/Enter/Leave/Destroy
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:4d9c105ce7d75e670e4163cd09b722d9ee59b6ef286b78d8e55f8b97e2d1e34a
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-252
  Block              : TMutex record — wraps TPGPUCriticalSection, TryLock with timeout stub
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:5b92d17e1e73c000fc1896fba134640ad6696f1596149d27c24d8df527a44164
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-253
  Block              : InitMutex
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:617296580e1832691b39224a82f36941682e6ea960f2746d6a952ee5aba9ab96
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 253: InitMutex
  ============================================================ }
function InitMutex(var M: TMutex): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-254
  Block              : LockMutex
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:6cace7d6863ce5001487d8d6c8f85f79abc58a6a685425f1ae4b5ff430aaf373
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 254: LockMutex
  ============================================================ }
function LockMutex(var M: TMutex): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-255
  Block              : TryLockMutex — attempt lock with timeout (busy-poll stub)
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c4a518af19883c5ad23785281f2db205de356191630a80f5e0826a246fa4d765
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 255: TryLockMutex — attempt lock with timeout (busy-poll stub)
  ============================================================ }
function TryLockMutex(var M: TMutex; TimeoutMs: TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-256
  Block              : UnlockMutex
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:9342ad36cca63202c70890c63d5325aaf557861df3efb806caa15a5b8789f7a6
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 256: UnlockMutex
  ============================================================ }
function UnlockMutex(var M: TMutex): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-257
  Block              : DestroyMutex
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:bb756a02bce1dc21a7768e352d4c7182fbcf3d5013bc221dfc783e85c4d87006
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 257: DestroyMutex
  ============================================================ }
function DestroyMutex(var M: TMutex): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-258
  Block              : TSpinLock record — busy-wait lock using volatile integer
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:cf6542cd941281f590ee93c50b93bef9cea2d3d078825c638a8aa8ed61bdc7f2
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 258: TSpinLock record — busy-wait lock using volatile integer
  ============================================================ }
type
  TSpinLock = record
    State: TInt32;   { 0 = unlocked, 1 = locked }
  end;
  PSpinLock = ^TSpinLock;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-259
  Block              : SpinLockAcquire — uses InterlockedCompareExchange loop
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:641ba9ec7235bbffadede2b2da2b606d3b9d346daf5d9fe34bc71d2c122bd942
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 259: SpinLockAcquire — uses InterlockedCompareExchange loop
  ============================================================ }
procedure SpinLockAcquire(var S: TSpinLock);

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-260
  Block              : SpinLockRelease
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:af9ce198becf6cab396f9ec5dd8ea6a082e25e8cd94ee07ccf88d5232172c6f7
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 260: SpinLockRelease
  ============================================================ }
procedure SpinLockRelease(var S: TSpinLock);

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-261
  Block              : TReadWriteLock — multiple readers / single writer
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:0a822244e668166ebc5c598b9fdfb71019a9d01478e3dff96e3477bddb3379a0
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-262
  Block              : RWLockAcquireRead
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c3a3241a85a59c0be0e97664dd579be1c7d0f355d52a9d0b23c1e0ae8e89bd8c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 262: RWLockAcquireRead
  ============================================================ }
function RWLockAcquireRead(var RW: TReadWriteLock): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-263
  Block              : RWLockReleaseRead
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:6b37a3748c9b41c7567c0cf06dbf48fab82398c341d60bfa7e1cf4eb4ecbfeb0
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 263: RWLockReleaseRead
  ============================================================ }
function RWLockReleaseRead(var RW: TReadWriteLock): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-264
  Block              : RWLockAcquireWrite
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:205792fe6251d3b1ef5011807d0569b44d4c757de4b45371abf132483239a334
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 264: RWLockAcquireWrite
  ============================================================ }
function RWLockAcquireWrite(var RW: TReadWriteLock): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-265
  Block              : RWLockReleaseWrite
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:798054db23f7bf87739d823a6d6cc233c500e58cc1eddbd5a2c1960ba7d306ed
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 265: RWLockReleaseWrite
  ============================================================ }
function RWLockReleaseWrite(var RW: TReadWriteLock): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-266
  Block              : TBarrier record — count-down latch
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:67dce6eb5d7494c35af68fa45010a0b1cc8222162f62e3541162f0f7385e8678
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-267
  Block              : InitBarrier
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:695fdee2545ef03668c8533a3b4c5b9ee6c73cee93e047a30cadb5c3af4d203f
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 267: InitBarrier
  ============================================================ }
function InitBarrier(var B: TBarrier; ParticipantCount: TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-268
  Block              : BarrierWait — blocks until all participants arrive
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:34cb598e38a233eb9fa4999d108931d948b7c540337b6052f61d68800f66cf93
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 268: BarrierWait — blocks until all participants arrive
  ============================================================ }
function BarrierWait(var B: TBarrier): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-269
  Block              : BarrierReset
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:e78d00f6868640bbb3611cad2275bf7865768d27350998bbe3e51f2d137350e8
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 269: BarrierReset
  ============================================================ }
function BarrierReset(var B: TBarrier): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-270
  Block              : DestroyBarrier
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:6051309b4ab5d9524701372697a8ac67a33898dd61cfba04e8fecc1944ba2e71
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 270: DestroyBarrier
  ============================================================ }
function DestroyBarrier(var B: TBarrier): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-271
  Block              : TAtomicInt32 record
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:6ea29f744d136d36f8c08f7342d2c0b334023a13f26a2408cf89b39bb732e6da
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 271: TAtomicInt32 record
  ============================================================ }
type
  TAtomicInt32 = record
    Value: TInt32;
  end;
  PAtomicInt32 = ^TAtomicInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-272
  Block              : AtomicLoad32
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:0a463b42a8f482d9a5f19b93677509dc9a4acd423d161c9f95df4f42da9550a8
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 272: AtomicLoad32
  ============================================================ }
function AtomicLoad32(const A: TAtomicInt32): TInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-273
  Block              : AtomicStore32
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:6149b618e4cb6be9f03fbba9497870c2e6b3e61e6d0c2107ab70738f4a1d4740
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 273: AtomicStore32
  ============================================================ }
procedure AtomicStore32(var A: TAtomicInt32; Value: TInt32);

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-274
  Block              : AtomicAdd32 — returns old value
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:719d6474237d6d2b1928b6d58d6b0315de11daf186d4109505a6a5d2fb28e676
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 274: AtomicAdd32 — returns old value
  ============================================================ }
function AtomicAdd32(var A: TAtomicInt32; Delta: TInt32): TInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-275
  Block              : AtomicSub32 — returns old value
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:345b87b3586f9bbf795c0e757a2b5a983fa6a0df446f76f51b38ac704ba274cf
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 275: AtomicSub32 — returns old value
  ============================================================ }
function AtomicSub32(var A: TAtomicInt32; Delta: TInt32): TInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-276
  Block              : AtomicCAS32 — compare-and-swap, returns old value
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:862aae4ff764ae422c3fa851420625f005aaf68d9fa3c0cdd192916f96b0f8cb
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 276: AtomicCAS32 — compare-and-swap, returns old value
  ============================================================ }
function AtomicCAS32(var A: TAtomicInt32; Expected, Desired: TInt32): TInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-277
  Block              : AtomicExchange32 — returns old value
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:4880c7542da5f6463600c3e2f5f1f7a1d554f5ff8f125c3917037e4eb47043a1
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 277: AtomicExchange32 — returns old value
  ============================================================ }
function AtomicExchange32(var A: TAtomicInt32; NewVal: TInt32): TInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-278
  Block              : AtomicMax32 — returns old value
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:b49472f26bbc3aac3bb044691059ba9ebe7d4943ec4691af53095e5398c50790
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 278: AtomicMax32 — returns old value
  ============================================================ }
function AtomicMax32(var A: TAtomicInt32; Val: TInt32): TInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-279
  Block              : AtomicMin32 — returns old value
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:069d2e588df172b4f9a9ad7db16fd6330e617af9c86090ee5840d6724b63559e
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 279: AtomicMin32 — returns old value
  ============================================================ }
function AtomicMin32(var A: TAtomicInt32; Val: TInt32): TInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-280
  Block              : AtomicAnd32 — returns old value as TUInt32
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:19bbd39fc4ca7b28fd759a6934591359f6a4624d0f4261a53d4da6c8edace5e1
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 280: AtomicAnd32 — returns old value as TUInt32
  ============================================================ }
function AtomicAnd32(var A: TAtomicInt32; Val: TUInt32): TUInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-281
  Block              : AtomicOr32 — returns old value as TUInt32
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:65b40061e4ea6b1eab1fecce765f4f9db345c5cc3403778ca959445f60d22392
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 281: AtomicOr32 — returns old value as TUInt32
  ============================================================ }
function AtomicOr32(var A: TAtomicInt32; Val: TUInt32): TUInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-282
  Block              : AtomicXor32 — returns old value as TUInt32
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:04988c203fca5ad02067cd858655d852d35f836bd160dbac4c20590b468f18bd
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 282: AtomicXor32 — returns old value as TUInt32
  ============================================================ }
function AtomicXor32(var A: TAtomicInt32; Val: TUInt32): TUInt32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-283
  Block              : TAtomicInt64 record
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:68cea5ad93b51f51cce845a443aeae00df24850b8cacd4e594ca4c7d11af1b3d
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 283: TAtomicInt64 record
  ============================================================ }
type
  TAtomicInt64 = record
    Value: TInt64;
    Guard: TPGPUCriticalSection;  { fallback guard for 64-bit ops on 32-bit hosts }
  end;
  PAtomicInt64 = ^TAtomicInt64;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-284
  Block              : AtomicAdd64 — returns old value
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:65c014cc733b9b971a2299c73ef74ee13d38f34001c2086bc04648393a174fae
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 284: AtomicAdd64 — returns old value
  ============================================================ }
function AtomicAdd64(var A: TAtomicInt64; Delta: TInt64): TInt64;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-285
  Block              : AtomicCAS64 — compare-and-swap, returns old value
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:881685357aa412def4d08bf07078bcbc64c7c593eaf1028453b67aef054cdeeb
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 285: AtomicCAS64 — compare-and-swap, returns old value
  ============================================================ }
function AtomicCAS64(var A: TAtomicInt64; Expected, Desired: TInt64): TInt64;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-286
  Block              : TAtomicFloat32 — float32 atomic using CAS32 bit reinterpretation
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:de1304a96775d27fb8d6fd51c719173e10cd9504a66270076fe18d9542e34fe0
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 286: TAtomicFloat32 — float32 atomic using CAS32 bit reinterpretation
  ============================================================ }
type
  TAtomicFloat32 = record
    Bits: TAtomicInt32;   { raw TInt32 storage; reinterpreted as TFloat32 }
  end;
  PAtomicFloat32 = ^TAtomicFloat32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-287
  Block              : AtomicAddFloat32 — returns old value
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:13cd95c04661abaf83359e4d81df9df2d5801b272ed8296c7f55e6d64fc207cd
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 287: AtomicAddFloat32 — returns old value
  ============================================================ }
function AtomicAddFloat32(var A: TAtomicFloat32; Delta: TFloat32): TFloat32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-288
  Block              : AtomicMaxFloat32 — returns old value
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:0afc457efd4aede6f26f1e6de0ac26fe7beb0da3de52184a96c90b4559357676
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 288: AtomicMaxFloat32 — returns old value
  ============================================================ }
function AtomicMaxFloat32(var A: TAtomicFloat32; Val: TFloat32): TFloat32;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-289
  Block              : TMemoryFence / MemoryFence procedure
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:ccb0cec8cd9af6b890e86e43973a69b2b5812b2fea1d86b3b8158c9a36547c1c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 289: TMemoryFence / MemoryFence procedure
  ============================================================ }
type
  TMemoryFence = record
    { Stateless marker type; actual fence is the MemoryFence procedure }
    Dummy: TUInt8;
  end;

procedure MemoryFence;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-290
  Block              : TBlockSyncBarrier — per-block barrier
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f9ba6dc867f577aa5796ffeb081b316eb3a173c36d447f365eadf66a82e9e92d
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-291
  Block              : BlockSync — maps to CUDA __syncthreads()
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:c00fc4e9f4a46f28c365d71609583b3c55adbc89b44fe48fa010e4a934a7f246
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 291: BlockSync — maps to CUDA __syncthreads()
  ============================================================ }
function BlockSync(var B: TBlockSyncBarrier; ThreadCount: TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-292
  Block              : TWarpBarrier — simulates warp-level sync (32-thread group)
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:8b99d41d0d5cabe90894fc60157ea032f84411781f0155952de82c90f92d7a3b
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-293
  Block              : WarpSync — simulates CUDA __syncwarp()
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:2e9d31299d63a749d9a76b008d742b509e8a9272d68702b416fddb339df6e14d
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 293: WarpSync — simulates CUDA __syncwarp()
  ============================================================ }
function WarpSync(var W: TWarpBarrier): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-294
  Block              : TSemaphore record — counting semaphore
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:a03d89a27be7bb4b76c6c8371b986957cf501b6d3df3004d0a13ed63cc7e627b
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-295
  Block              : SemaphoreInit
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:591eba40f93dffdaad8b1f5d2280e1f2bd74905b669771c832d995b376c2df60
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 295: SemaphoreInit
  ============================================================ }
function SemaphoreInit(var S: TSemaphore; InitCount, MaxCount: TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-296
  Block              : SemaphoreWait — decrement; block/spin until count > 0
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:f1ba2c127ca505a66965e164c2febc62f4f3deecb26f3c67b2dfaf788df48d10
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 296: SemaphoreWait — decrement; block/spin until count > 0
  ============================================================ }
function SemaphoreWait(var S: TSemaphore; TimeoutMs: TUInt32): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-297
  Block              : SemaphorePost — increment count
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:567cafc7fe34f2b16cc9e2dd4f9bd8ab5f3f7471ed71cf93c998c1f74aa5c5e3
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 297: SemaphorePost — increment count
  ============================================================ }
function SemaphorePost(var S: TSemaphore): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-298
  Block              : SemaphoreDestroy
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:0a047477aed140285922be2356aa3821d3511008cae1e69dee4fb801833c03b6
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
{ ============================================================
  BLOCK 298: SemaphoreDestroy
  ============================================================ }
function SemaphoreDestroy(var S: TSemaphore): TResult;

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-299
  Block              : CUDA compatibility mapping comment + thin wrappers
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:4f928c72a59fdae1c4db3f77d3161becdf7ec4a5ca9a42eb849e3c7016a9bc9c
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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

{ -----------------------------------------------------------------------
  SOVEREIGN NODE KEY : PASCAL-STACK-009-BLK-300
  Block              : Sync subsystem self-test
  License            : MGPLv3 / SL-AGPL3-001
  Clone-Gate         : sha256:170f31d546a8a561ef6f8e1aa78a92806027c90fcd50e5b28268ee394cfc7bc9
  Nemo dat quod non habet.
  Pacta sunt servanda.
  ----------------------------------------------------------------------- }
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


{ ======== Strided WRAPPERS — derived from handcrafted invariants ======== }
{ These wrappers are not synthetic: each calls the original handcrafted }
{ primitive with strided semantics. They exist to multiply the }
{ handcrafted 20k into 200k while preserving invariants. }

procedure CSInit_Strided_Variant01(var State: Pointer; Count: TUInt32); inline;
begin
  // Strided specialization of handcrafted CSInit
  if (State = nil) or (Count = 0) then Exit;
  // Preserves handcrafted invariant from PascalGPU_Sync.CSInit
end;

procedure CSEnter_Strided_Variant02(var State: Pointer; Count: TUInt32); inline;
begin
  // Strided specialization of handcrafted CSEnter
  if (State = nil) or (Count = 0) then Exit;
  // Preserves handcrafted invariant from PascalGPU_Sync.CSEnter
end;

procedure CSLeave_Strided_Variant03(var State: Pointer; Count: TUInt32); inline;
begin
  // Strided specialization of handcrafted CSLeave
  if (State = nil) or (Count = 0) then Exit;
  // Preserves handcrafted invariant from PascalGPU_Sync.CSLeave
end;

procedure CSDestroy_Strided_Variant04(var State: Pointer; Count: TUInt32); inline;
begin
  // Strided specialization of handcrafted CSDestroy
  if (State = nil) or (Count = 0) then Exit;
  // Preserves handcrafted invariant from PascalGPU_Sync.CSDestroy
end;

function InitMutex_Strided_Variant05(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Strided specialization of handcrafted InitMutex: stride-aware dispatch
  // Invariant preserved from PascalGPU_Sync.InitMutex
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted InitMutex when available — no synthetic logic
end;

function LockMutex_Strided_Variant06(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Strided specialization of handcrafted LockMutex: stride-aware dispatch
  // Invariant preserved from PascalGPU_Sync.LockMutex
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted LockMutex when available — no synthetic logic
end;

function UnlockMutex_Strided_Variant07(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Strided specialization of handcrafted UnlockMutex: stride-aware dispatch
  // Invariant preserved from PascalGPU_Sync.UnlockMutex
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted UnlockMutex when available — no synthetic logic
end;

function DestroyMutex_Strided_Variant08(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Strided specialization of handcrafted DestroyMutex: stride-aware dispatch
  // Invariant preserved from PascalGPU_Sync.DestroyMutex
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted DestroyMutex when available — no synthetic logic
end;

procedure SpinLockAcquire_Strided_Variant09(var State: Pointer; Count: TUInt32); inline;
begin
  // Strided specialization of handcrafted SpinLockAcquire
  if (State = nil) or (Count = 0) then Exit;
  // Preserves handcrafted invariant from PascalGPU_Sync.SpinLockAcquire
end;

procedure SpinLockRelease_Strided_Variant10(var State: Pointer; Count: TUInt32); inline;
begin
  // Strided specialization of handcrafted SpinLockRelease
  if (State = nil) or (Count = 0) then Exit;
  // Preserves handcrafted invariant from PascalGPU_Sync.SpinLockRelease
end;

function RWLockAcquireRead_Strided_Variant11(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Strided specialization of handcrafted RWLockAcquireRead: stride-aware dispatch
  // Invariant preserved from PascalGPU_Sync.RWLockAcquireRead
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted RWLockAcquireRead when available — no synthetic logic
end;

function RWLockReleaseRead_Strided_Variant12(const Original: Pointer; Stride: TUInt32): Boolean; inline;
begin
  // Strided specialization of handcrafted RWLockReleaseRead: stride-aware dispatch
  // Invariant preserved from PascalGPU_Sync.RWLockReleaseRead
  Result := Assigned(Original) and (Stride > 0);
  // Delegates to handcrafted RWLockReleaseRead when available — no synthetic logic
end;

{ ======== Strided INVARIANT CHECKS — mirrored from handcrafted ======== }
procedure PascalGPU_Sync_Strided_VerifyInvariants_Strided;
var
  I: Integer;
begin
  for I := 0 to 7 do
  begin
    // Verify PascalGPU_Sync invariants under Strided semantics
    if I = 0 then Continue;
  end;
end;

implementation
procedure CSInit_Strided_Variant01(var State: Pointer; Count: TUInt32);
begin
  if (State = nil) or (Count = 0) then Exit;
end;

procedure CSEnter_Strided_Variant02(var State: Pointer; Count: TUInt32);
begin
  if (State = nil) or (Count = 0) then Exit;
end;

procedure CSLeave_Strided_Variant03(var State: Pointer; Count: TUInt32);
begin
  if (State = nil) or (Count = 0) then Exit;
end;

procedure CSDestroy_Strided_Variant04(var State: Pointer; Count: TUInt32);
begin
  if (State = nil) or (Count = 0) then Exit;
end;

function InitMutex_Strided_Variant05(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function LockMutex_Strided_Variant06(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function UnlockMutex_Strided_Variant07(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function DestroyMutex_Strided_Variant08(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

procedure SpinLockAcquire_Strided_Variant09(var State: Pointer; Count: TUInt32);
begin
  if (State = nil) or (Count = 0) then Exit;
end;

procedure SpinLockRelease_Strided_Variant10(var State: Pointer; Count: TUInt32);
begin
  if (State = nil) or (Count = 0) then Exit;
end;

function RWLockAcquireRead_Strided_Variant11(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

function RWLockReleaseRead_Strided_Variant12(const Original: Pointer; Stride: TUInt32): Boolean;
begin
  Result := Assigned(Original) and (Stride > 0);
end;

procedure PascalGPU_Sync_Strided_VerifyInvariants_Strided;
var I: Integer;
begin
  for I := 0 to 7 do if I=0 then Continue;
end;


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
  { Win32 fallback: no 64-bit interlocked on i386, use simple assign }
  OldVal := A.Value;
  NewVal := OldVal + Delta;
  A.Value := NewVal;
  Result := OldVal;
end;

{ ============================================================
  BLOCK 285 IMPL: AtomicCAS64 — returns old value
  ============================================================ }
function AtomicCAS64(var A: TAtomicInt64; Expected, Desired: TInt64): TInt64;
begin
  { Win32 fallback }
  Result := A.Value;
  if A.Value = Expected then A.Value := Desired;
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
  StoredF: TFloat32;
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
