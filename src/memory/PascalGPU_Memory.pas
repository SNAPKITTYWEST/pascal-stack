{ ========================================================================
  SOVEREIGN LEVIATHAN COVENANT — MGPLv3 RECURSIVE INFECTION CLAUSE
  ========================================================================

  Node-ID:           PASCAL-STACK-007
  File:              PascalGPU_Memory.pas
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
unit PascalGPU_Memory;

{ PascalGPU Memory Subsystem
  Blocks 051-100: Pool allocator, tracker, device memory, pinned buffers,
  shared memory, constant buffers, buffer views, stats, utilities, slab allocator.
}

interface

uses
  PascalGPU_Types, SysUtils;

const
  MEMORY_MAX_TRACKER_ENTRIES = 4096;
  MEMORY_MAX_SLAB_ENTRIES    = 4096;

  PGPU_ERR_OUT_OF_MEMORY   = -100;
  PGPU_ERR_INVALID_PARAM   = -101;
  PGPU_ERR_BOUNDS          = -102;
  PGPU_ERR_OVERLAP         = -103;
  PGPU_ERR_INVALID_HANDLE  = -104;
  PGPU_ERR_NOT_INITIALIZED = -105;

{ ============================================================
  BLOCK 051: TMemoryPool — bump allocator over a contiguous slab
  ============================================================ }
type
  TMemoryPool = record
    BasePtr        : Pointer;
    BumpPtr        : Pointer;
    CapacityBytes  : TSizeT;
    UsedBytes      : TSizeT;
    PeakBytes      : TSizeT;
    AllocationCount: TUInt32;
    IsInitialized  : Boolean;
  end;

{ ============================================================
  BLOCK 056: TAllocRecord — tracks a single live allocation
  ============================================================ }
  TAllocRecord = record
    Ptr       : Pointer;
    Size      : TSizeT;
    Alignment : TAlignment;
    Kind      : TMemoryKind;
    Tag       : AnsiString;
    IsLive    : Boolean;
  end;

{ ============================================================
  BLOCK 057: TMemoryTracker — array of TAllocRecord + count
  ============================================================ }
  TMemoryTracker = record
    Entries : array[0..MEMORY_MAX_TRACKER_ENTRIES - 1] of TAllocRecord;
    Count   : TInt32;
  end;

{ ============================================================
  BLOCK 063: TDeviceMemory — device memory handle with simulation backing
  ============================================================ }
  TDeviceMemory = record
    Handle     : THandle;
    HostSimPtr : Pointer;
    Size       : TSizeT;
    Kind       : TMemoryKind;
    Alignment  : TAlignment;
    DeviceID   : TInt32;
    IsValid    : Boolean;
  end;

{ ============================================================
  BLOCK 070: THostPinnedBuffer — simulated page-locked host memory
  ============================================================ }
  THostPinnedBuffer = record
    Ptr      : Pointer;
    Size     : TSizeT;
    IsPinned : Boolean;
    RefCount : TInt32;
  end;

{ ============================================================
  BLOCK 073: TSharedMemoryRegion — per-block shared memory simulation
  ============================================================ }
  TSharedMemoryRegion = record
    Ptr         : Pointer;
    SizeBytes   : TSizeT;
    OwnerBlockID: TUInt32;
    IsValid     : Boolean;
  end;

{ ============================================================
  BLOCK 078: TConstantBuffer — read-only device buffer, immutable after upload
  ============================================================ }
  TConstantBuffer = record
    Ptr     : Pointer;
    Size    : TSizeT;
    IsValid : Boolean;
    Frozen  : Boolean;
  end;

{ ============================================================
  BLOCK 081: TBufferView — non-owning view into a buffer
  ============================================================ }
  TBufferView = record
    BasePtr   : Pointer;
    Offset    : TSizeT;
    Count     : TSizeT;
    DataType  : TDataType;
    IsValid   : Boolean;
    TotalSize : TSizeT;
  end;

{ ============================================================
  BLOCK 084: TMemoryStats — global allocation statistics
  ============================================================ }
  TMemoryStats = record
    TotalAllocated  : TSizeT;
    PeakAllocated   : TSizeT;
    AllocationCount : TUInt64;
    FreeCount       : TUInt64;
  end;

{ ============================================================
  BLOCK 091: TMemoryLifetime — allocation lifetime classification
  ============================================================ }
  TMemoryLifetime = (ltTemporary, ltSession, ltPersistent);

{ ============================================================
  BLOCK 092: TTaggedAllocation — lifetime-tagged allocation descriptor
  ============================================================ }
  TTaggedAllocation = record
    Ptr      : Pointer;
    Size     : TSizeT;
    Lifetime : TMemoryLifetime;
    Tag      : AnsiString;
  end;

{ ============================================================
  BLOCK 095: TSlabAllocator — fixed-size slab allocator with free list
  ============================================================ }
  PSlabNode = ^TSlabNode;
  TSlabNode = record
    Next: PSlabNode;
  end;

  TSlabAllocator = record
    SlabSize     : TSizeT;
    SlabPtrs     : array[0..MEMORY_MAX_SLAB_ENTRIES - 1] of Pointer;
    SlabPtrCount : TUInt32;
    FreeList     : PSlabNode;
    IsInitialized: Boolean;
  end;

{ --- Block 052-055: Memory pool --- }
function  InitMemoryPool(var Pool: TMemoryPool; CapacityBytes: TSizeT): TResult;
procedure FinalizeMemoryPool(var Pool: TMemoryPool);
function  PoolAlloc(var Pool: TMemoryPool; Bytes: TSizeT; Align: TAlignment): Pointer;
procedure PoolFree(var Pool: TMemoryPool; Ptr: Pointer);

{ --- Block 058-060: Memory tracker --- }
procedure MemTrackerRecord(var T: TMemoryTracker; Ptr: Pointer; Bytes: TSizeT;
            Kind: TMemoryKind; const Tag: AnsiString);
procedure MemTrackerRelease(var T: TMemoryTracker; Ptr: Pointer);
function  MemTrackerReport(const T: TMemoryTracker): AnsiString;

{ --- Block 061-062: Aligned allocation --- }
function  PascalGPUAlloc(Bytes: TSizeT; Align: TAlignment): Pointer;
procedure PascalGPUFree(Ptr: Pointer);

{ --- Block 064-069: Device memory --- }
function AllocDeviceMemory(var DM: TDeviceMemory; Bytes: TSizeT; DeviceID: TInt32): TResult;
function FreeDeviceMemory(var DM: TDeviceMemory): TResult;
function HostToDevice(const Src: Pointer; var Dst: TDeviceMemory;
           Bytes: TSizeT; DstOffset: TSizeT): TResult;
function DeviceToHost(const Src: TDeviceMemory; Dst: Pointer;
           Bytes: TSizeT; SrcOffset: TSizeT): TResult;
function DeviceToDevice(const Src: TDeviceMemory; var Dst: TDeviceMemory;
           Bytes: TSizeT): TResult;
function FillDeviceMemory(var DM: TDeviceMemory; Value: TUInt8;
           Bytes: TSizeT): TResult;

{ --- Block 071-072: Pinned buffer --- }
function AllocPinnedBuffer(var Buf: THostPinnedBuffer; Bytes: TSizeT): TResult;
function FreePinnedBuffer(var Buf: THostPinnedBuffer): TResult;

{ --- Block 074-077: Shared memory region --- }
function AllocSharedMemory(var Reg: TSharedMemoryRegion; Bytes: TSizeT;
           BlockID: TUInt32): TResult;
function FreeSharedMemory(var Reg: TSharedMemoryRegion): TResult;
function WriteSharedMem32(var Reg: TSharedMemoryRegion; Offset: TUInt32;
           Value: TUInt32): TResult;
function ReadSharedMem32(const Reg: TSharedMemoryRegion; Offset: TUInt32;
           out Value: TUInt32): TResult;

{ --- Block 079-080: Constant buffer --- }
function  CreateConstantBuffer(var CB: TConstantBuffer; const Src: Pointer;
            Bytes: TSizeT): TResult;
procedure FreeConstantBuffer(var CB: TConstantBuffer);

{ --- Block 082-083: Buffer view --- }
function MakeBufferView(const DM: TDeviceMemory; Offset, Count: TSizeT;
           DT: TDataType): TBufferView;
function ValidateBufferView(const BV: TBufferView): TResult;

{ --- Block 085-086: Memory statistics --- }
function  GetMemoryStats(out Stats: TMemoryStats): TResult;
procedure ResetMemoryStats;

{ --- Block 087-090: Memory utilities --- }
function  CheckBounds(Ptr: Pointer; Offset, AccessSize, TotalSize: TSizeT): TResult;
function  RegionsOverlap(A, B: Pointer; SzA, SzB: TSizeT): Boolean;
procedure ZeroMemoryRegion(Ptr: Pointer; Bytes: TSizeT);
function  CopyMemoryRegion(Dst, Src: Pointer; Bytes: TSizeT): TResult;

{ --- Block 093: Lifetime-based batch free --- }
procedure FreeByLifetime(var T: TMemoryTracker; Lifetime: TMemoryLifetime);

{ --- Block 094: Alignment diagnostic --- }
function MemoryAlignmentReport(Ptr: Pointer; Alignment: TAlignment): AnsiString;

{ --- Block 096-099: Slab allocator --- }
function  InitSlabAllocator(var S: TSlabAllocator; SlabSize: TSizeT;
            InitialCount: TUInt32): TResult;
function  SlabAlloc(var S: TSlabAllocator): Pointer;
procedure SlabFree(var S: TSlabAllocator; Ptr: Pointer);
procedure FinalizeSlabAllocator(var S: TSlabAllocator);

{ --- Block 100: Self-test --- }
function MemorySubsystemTest: TResult;

implementation

{ ============================================================
  Module-level global statistics
  ============================================================ }
var
  GMemStats        : TMemoryStats;
  GStatsInitialized: Boolean = False;

procedure EnsureStats; inline;
begin
  if not GStatsInitialized then
  begin
    FillChar(GMemStats, SizeOf(GMemStats), 0);
    GStatsInitialized := True;
  end;
end;

procedure StatsAlloc(Bytes: TSizeT); inline;
begin
  EnsureStats;
  Inc(GMemStats.TotalAllocated, Bytes);
  Inc(GMemStats.AllocationCount);
  if GMemStats.TotalAllocated > GMemStats.PeakAllocated then
    GMemStats.PeakAllocated := GMemStats.TotalAllocated;
end;

procedure StatsFree; inline;
begin
  EnsureStats;
  Inc(GMemStats.FreeCount);
end;

{ Helper: return element size in bytes for a TDataType ordinal }
function DataTypeSize(DT: TDataType): TSizeT;
begin
  case Ord(DT) of
    0 : Result :=  1;  { dtInt8  / dtUInt8  }
    1 : Result :=  2;  { dtInt16 / dtUInt16 }
    2 : Result :=  4;  { dtInt32 / dtUInt32 }
    3 : Result :=  8;  { dtInt64 / dtUInt64 }
    4 : Result :=  1;  { dtUInt8  alternate }
    5 : Result :=  2;  { dtUInt16 alternate }
    6 : Result :=  4;  { dtUInt32 alternate }
    7 : Result :=  8;  { dtUInt64 alternate }
    8 : Result :=  2;  { dtFloat16 }
    9 : Result :=  4;  { dtFloat32 }
    10: Result :=  8;  { dtFloat64 }
  else
    Result := 4; { default: 4 bytes }
  end;
end;

{ ============================================================
  BLOCK 052: InitMemoryPool
  ============================================================ }
function InitMemoryPool(var Pool: TMemoryPool; CapacityBytes: TSizeT): TResult;
begin
  if CapacityBytes = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  FillChar(Pool, SizeOf(Pool), 0);
  GetMem(Pool.BasePtr, CapacityBytes);
  if Pool.BasePtr = nil then
  begin
    Result := PGPU_ERR_OUT_OF_MEMORY;
    Exit;
  end;
  FillChar(Pool.BasePtr^, CapacityBytes, 0);
  Pool.BumpPtr         := Pool.BasePtr;
  Pool.CapacityBytes   := CapacityBytes;
  Pool.UsedBytes       := 0;
  Pool.PeakBytes       := 0;
  Pool.AllocationCount := 0;
  Pool.IsInitialized   := True;
  StatsAlloc(CapacityBytes);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 053: FinalizeMemoryPool
  ============================================================ }
procedure FinalizeMemoryPool(var Pool: TMemoryPool);
begin
  if Pool.IsInitialized and (Pool.BasePtr <> nil) then
  begin
    FreeMem(Pool.BasePtr);
    StatsFree;
    Pool.BasePtr       := nil;
    Pool.BumpPtr       := nil;
    Pool.CapacityBytes := 0;
    Pool.UsedBytes     := 0;
    Pool.PeakBytes     := 0;
    Pool.IsInitialized := False;
  end;
end;

{ ============================================================
  BLOCK 054: PoolAlloc — bump-pointer allocation with alignment
  ============================================================ }
function PoolAlloc(var Pool: TMemoryPool; Bytes: TSizeT;
  Align: TAlignment): Pointer;
var
  Current  : PtrUInt;
  Aligned  : PtrUInt;
  BaseEnd  : PtrUInt;
begin
  Result := nil;
  if not Pool.IsInitialized then Exit;
  if Bytes = 0 then Exit;
  if Align <= 1 then Align := 1;

  Current := PtrUInt(Pool.BumpPtr);
  if Align > 1 then
    Aligned := (Current + PtrUInt(Align) - 1) and not (PtrUInt(Align) - 1)
  else
    Aligned := Current;

  BaseEnd := PtrUInt(Pool.BasePtr) + Pool.CapacityBytes;
  if Aligned + Bytes > BaseEnd then
    Exit; { insufficient space }

  Result          := Pointer(Aligned);
  Pool.BumpPtr    := Pointer(Aligned + Bytes);
  Pool.UsedBytes  := PtrUInt(Pool.BumpPtr) - PtrUInt(Pool.BasePtr);
  if Pool.UsedBytes > Pool.PeakBytes then
    Pool.PeakBytes := Pool.UsedBytes;
  Inc(Pool.AllocationCount);
end;

{ ============================================================
  BLOCK 055: PoolFree — no-op for bump allocator (documented limitation)
  ============================================================ }
procedure PoolFree(var Pool: TMemoryPool; Ptr: Pointer);
begin
  { Bump allocators do not support individual deallocation.
    Memory is reclaimed only by FinalizeMemoryPool.
    If Ptr equals the last bump boundary, retraction is possible
    in principle but is not implemented here for safety.
    This is a documented limitation of the bump-pointer strategy. }
  if not Pool.IsInitialized then Exit;
  if Ptr = nil then Exit;
  { No action — intentional. }
end;

{ ============================================================
  BLOCK 058: MemTrackerRecord — register a live allocation
  ============================================================ }
procedure MemTrackerRecord(var T: TMemoryTracker; Ptr: Pointer; Bytes: TSizeT;
  Kind: TMemoryKind; const Tag: AnsiString);
var
  I: TInt32;
begin
  if T.Count >= MEMORY_MAX_TRACKER_ENTRIES then Exit;
  { Reuse any dead slot before extending the array }
  for I := 0 to T.Count - 1 do
  begin
    if not T.Entries[I].IsLive then
    begin
      T.Entries[I].Ptr       := Ptr;
      T.Entries[I].Size      := Bytes;
      T.Entries[I].Alignment := 0;
      T.Entries[I].Kind      := Kind;
      T.Entries[I].Tag       := Tag;
      T.Entries[I].IsLive    := True;
      Exit;
    end;
  end;
  { Append at Count }
  T.Entries[T.Count].Ptr       := Ptr;
  T.Entries[T.Count].Size      := Bytes;
  T.Entries[T.Count].Alignment := 0;
  T.Entries[T.Count].Kind      := Kind;
  T.Entries[T.Count].Tag       := Tag;
  T.Entries[T.Count].IsLive    := True;
  Inc(T.Count);
end;

{ ============================================================
  BLOCK 059: MemTrackerRelease — mark an allocation as freed
  ============================================================ }
procedure MemTrackerRelease(var T: TMemoryTracker; Ptr: Pointer);
var
  I: TInt32;
begin
  for I := 0 to T.Count - 1 do
  begin
    if T.Entries[I].IsLive and (T.Entries[I].Ptr = Ptr) then
    begin
      T.Entries[I].IsLive := False;
      T.Entries[I].Ptr    := nil;
      T.Entries[I].Tag    := '';
      Exit;
    end;
  end;
end;

{ ============================================================
  BLOCK 060: MemTrackerReport — enumerate all live allocations
  ============================================================ }
function MemTrackerReport(const T: TMemoryTracker): AnsiString;
var
  I   : TInt32;
  Live: TInt32;
  S   : AnsiString;
begin
  Live := 0;
  S := 'MemoryTracker Report:' + LineEnding;
  for I := 0 to T.Count - 1 do
  begin
    if T.Entries[I].IsLive then
    begin
      Inc(Live);
      S := S + Format('  [%d] Ptr=$%x Size=%d Kind=%d Tag=%s',
        [I,
         PtrUInt(T.Entries[I].Ptr),
         T.Entries[I].Size,
         Ord(T.Entries[I].Kind),
         T.Entries[I].Tag]) + LineEnding;
    end;
  end;
  S := S + Format('Live allocations: %d', [Live]) + LineEnding;
  Result := S;
end;

{ ============================================================
  BLOCK 061: PascalGPUAlloc — aligned heap allocation
  Layout: [RawPtr (SizeOf(Pointer) bytes)] [padding] [aligned user block]
  ============================================================ }
function PascalGPUAlloc(Bytes: TSizeT; Align: TAlignment): Pointer;
var
  RawPtr     : Pointer;
  AlignedAddr: PtrUInt;
  StoredPtr  : PPointer;
  TotalNeeded: TSizeT;
begin
  Result := nil;
  if Bytes = 0 then Exit;
  if Align <= 1 then Align := 1;

  { Extra space: alignment headroom + room to store original pointer }
  TotalNeeded := Bytes + PtrUInt(Align) + SizeOf(Pointer);
  GetMem(RawPtr, TotalNeeded);
  if RawPtr = nil then Exit;

  { Compute aligned address, ensuring there is always room for the stored pointer }
  AlignedAddr := (PtrUInt(RawPtr) + SizeOf(Pointer) + PtrUInt(Align) - 1)
                 and not (PtrUInt(Align) - 1);

  { Write the raw pointer just before the aligned address }
  StoredPtr  := PPointer(AlignedAddr - SizeOf(Pointer));
  StoredPtr^ := RawPtr;

  Result := Pointer(AlignedAddr);
  StatsAlloc(Bytes);
end;

{ ============================================================
  BLOCK 062: PascalGPUFree — release memory allocated by PascalGPUAlloc
  ============================================================ }
procedure PascalGPUFree(Ptr: Pointer);
var
  StoredPtr: PPointer;
  RawPtr   : Pointer;
begin
  if Ptr = nil then Exit;
  StoredPtr := PPointer(PtrUInt(Ptr) - SizeOf(Pointer));
  RawPtr    := StoredPtr^;
  FreeMem(RawPtr);
  StatsFree;
end;

{ ============================================================
  BLOCK 064: AllocDeviceMemory — simulate device allocation on host heap
  ============================================================ }
function AllocDeviceMemory(var DM: TDeviceMemory; Bytes: TSizeT;
  DeviceID: TInt32): TResult;
begin
  FillChar(DM, SizeOf(DM), 0);
  if Bytes = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  GetMem(DM.HostSimPtr, Bytes);
  if DM.HostSimPtr = nil then
  begin
    Result := PGPU_ERR_OUT_OF_MEMORY;
    Exit;
  end;
  FillChar(DM.HostSimPtr^, Bytes, 0);
  DM.Handle    := THandle(PtrUInt(DM.HostSimPtr));
  DM.Size      := Bytes;
  DM.Kind      := mkDevice;
  DM.Alignment := 256;
  DM.DeviceID  := DeviceID;
  DM.IsValid   := True;
  StatsAlloc(Bytes);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 065: FreeDeviceMemory
  ============================================================ }
function FreeDeviceMemory(var DM: TDeviceMemory): TResult;
begin
  if not DM.IsValid then
  begin
    Result := PGPU_ERR_INVALID_HANDLE;
    Exit;
  end;
  if DM.HostSimPtr <> nil then
  begin
    FreeMem(DM.HostSimPtr);
    DM.HostSimPtr := nil;
    StatsFree;
  end;
  DM.Handle  := 0;
  DM.Size    := 0;
  DM.IsValid := False;
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 066: HostToDevice — copy from host pointer into device buffer
  ============================================================ }
function HostToDevice(const Src: Pointer; var Dst: TDeviceMemory;
  Bytes: TSizeT; DstOffset: TSizeT): TResult;
var
  DstByte: PByte;
begin
  if not Dst.IsValid then
  begin
    Result := PGPU_ERR_INVALID_HANDLE;
    Exit;
  end;
  if Src = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if DstOffset + Bytes > Dst.Size then
  begin
    Result := PGPU_ERR_BOUNDS;
    Exit;
  end;
  DstByte := PByte(PtrUInt(Dst.HostSimPtr) + DstOffset);
  Move(Src^, DstByte^, Bytes);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 067: DeviceToHost — copy from device buffer to host pointer
  ============================================================ }
function DeviceToHost(const Src: TDeviceMemory; Dst: Pointer;
  Bytes: TSizeT; SrcOffset: TSizeT): TResult;
var
  SrcByte: PByte;
begin
  if not Src.IsValid then
  begin
    Result := PGPU_ERR_INVALID_HANDLE;
    Exit;
  end;
  if Dst = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if SrcOffset + Bytes > Src.Size then
  begin
    Result := PGPU_ERR_BOUNDS;
    Exit;
  end;
  SrcByte := PByte(PtrUInt(Src.HostSimPtr) + SrcOffset);
  Move(SrcByte^, Dst^, Bytes);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 068: DeviceToDevice — copy between two device buffers
  ============================================================ }
function DeviceToDevice(const Src: TDeviceMemory; var Dst: TDeviceMemory;
  Bytes: TSizeT): TResult;
begin
  if not Src.IsValid then
  begin
    Result := PGPU_ERR_INVALID_HANDLE;
    Exit;
  end;
  if not Dst.IsValid then
  begin
    Result := PGPU_ERR_INVALID_HANDLE;
    Exit;
  end;
  if Bytes > Src.Size then
  begin
    Result := PGPU_ERR_BOUNDS;
    Exit;
  end;
  if Bytes > Dst.Size then
  begin
    Result := PGPU_ERR_BOUNDS;
    Exit;
  end;
  Move(Src.HostSimPtr^, Dst.HostSimPtr^, Bytes);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 069: FillDeviceMemory — fill device buffer with a byte pattern
  ============================================================ }
function FillDeviceMemory(var DM: TDeviceMemory; Value: TUInt8;
  Bytes: TSizeT): TResult;
begin
  if not DM.IsValid then
  begin
    Result := PGPU_ERR_INVALID_HANDLE;
    Exit;
  end;
  if Bytes > DM.Size then
  begin
    Result := PGPU_ERR_BOUNDS;
    Exit;
  end;
  FillChar(DM.HostSimPtr^, Bytes, Value);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 071: AllocPinnedBuffer — simulated page-locked host memory
  ============================================================ }
function AllocPinnedBuffer(var Buf: THostPinnedBuffer; Bytes: TSizeT): TResult;
begin
  FillChar(Buf, SizeOf(Buf), 0);
  if Bytes = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  GetMem(Buf.Ptr, Bytes);
  if Buf.Ptr = nil then
  begin
    Result := PGPU_ERR_OUT_OF_MEMORY;
    Exit;
  end;
  FillChar(Buf.Ptr^, Bytes, 0);
  Buf.Size     := Bytes;
  Buf.IsPinned := True;
  Buf.RefCount := 1;
  StatsAlloc(Bytes);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 072: FreePinnedBuffer — decrement refcount, free when reaches zero
  ============================================================ }
function FreePinnedBuffer(var Buf: THostPinnedBuffer): TResult;
begin
  if Buf.Ptr = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Dec(Buf.RefCount);
  if Buf.RefCount <= 0 then
  begin
    FreeMem(Buf.Ptr);
    StatsFree;
    Buf.Ptr      := nil;
    Buf.Size     := 0;
    Buf.IsPinned := False;
    Buf.RefCount := 0;
  end;
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 074: AllocSharedMemory — per-block shared memory region
  ============================================================ }
function AllocSharedMemory(var Reg: TSharedMemoryRegion; Bytes: TSizeT;
  BlockID: TUInt32): TResult;
begin
  FillChar(Reg, SizeOf(Reg), 0);
  if Bytes = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  GetMem(Reg.Ptr, Bytes);
  if Reg.Ptr = nil then
  begin
    Result := PGPU_ERR_OUT_OF_MEMORY;
    Exit;
  end;
  FillChar(Reg.Ptr^, Bytes, 0);
  Reg.SizeBytes    := Bytes;
  Reg.OwnerBlockID := BlockID;
  Reg.IsValid      := True;
  StatsAlloc(Bytes);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 075: FreeSharedMemory
  ============================================================ }
function FreeSharedMemory(var Reg: TSharedMemoryRegion): TResult;
begin
  if not Reg.IsValid then
  begin
    Result := PGPU_ERR_INVALID_HANDLE;
    Exit;
  end;
  if Reg.Ptr <> nil then
  begin
    FreeMem(Reg.Ptr);
    StatsFree;
    Reg.Ptr := nil;
  end;
  Reg.SizeBytes    := 0;
  Reg.OwnerBlockID := 0;
  Reg.IsValid      := False;
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 076: WriteSharedMem32 — write a 32-bit value at byte offset
  ============================================================ }
function WriteSharedMem32(var Reg: TSharedMemoryRegion; Offset: TUInt32;
  Value: TUInt32): TResult;
var
  Target: ^TUInt32;
begin
  if not Reg.IsValid then
  begin
    Result := PGPU_ERR_INVALID_HANDLE;
    Exit;
  end;
  if TSizeT(Offset) + SizeOf(TUInt32) > Reg.SizeBytes then
  begin
    Result := PGPU_ERR_BOUNDS;
    Exit;
  end;
  Target  := Pointer(PtrUInt(Reg.Ptr) + Offset);
  Target^ := Value;
  Result  := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 077: ReadSharedMem32 — read a 32-bit value at byte offset
  ============================================================ }
function ReadSharedMem32(const Reg: TSharedMemoryRegion; Offset: TUInt32;
  out Value: TUInt32): TResult;
var
  Source: ^TUInt32;
begin
  Value := 0;
  if not Reg.IsValid then
  begin
    Result := PGPU_ERR_INVALID_HANDLE;
    Exit;
  end;
  if TSizeT(Offset) + SizeOf(TUInt32) > Reg.SizeBytes then
  begin
    Result := PGPU_ERR_BOUNDS;
    Exit;
  end;
  Source := Pointer(PtrUInt(Reg.Ptr) + Offset);
  Value  := Source^;
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 079: CreateConstantBuffer — copy src data to immutable buffer
  ============================================================ }
function CreateConstantBuffer(var CB: TConstantBuffer; const Src: Pointer;
  Bytes: TSizeT): TResult;
begin
  FillChar(CB, SizeOf(CB), 0);
  if (Src = nil) or (Bytes = 0) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  GetMem(CB.Ptr, Bytes);
  if CB.Ptr = nil then
  begin
    Result := PGPU_ERR_OUT_OF_MEMORY;
    Exit;
  end;
  Move(Src^, CB.Ptr^, Bytes);
  CB.Size    := Bytes;
  CB.IsValid := True;
  CB.Frozen  := True;
  StatsAlloc(Bytes);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 080: FreeConstantBuffer
  ============================================================ }
procedure FreeConstantBuffer(var CB: TConstantBuffer);
begin
  if CB.IsValid and (CB.Ptr <> nil) then
  begin
    FreeMem(CB.Ptr);
    StatsFree;
    CB.Ptr     := nil;
    CB.Size    := 0;
    CB.IsValid := False;
    CB.Frozen  := False;
  end;
end;

{ ============================================================
  BLOCK 082: MakeBufferView — build a non-owning typed view over a device buffer
  ============================================================ }
function MakeBufferView(const DM: TDeviceMemory; Offset, Count: TSizeT;
  DT: TDataType): TBufferView;
var
  ElemSize : TSizeT;
  ViewBytes: TSizeT;
begin
  FillChar(Result, SizeOf(Result), 0);
  if not DM.IsValid then Exit;
  ElemSize  := DataTypeSize(DT);
  ViewBytes := Count * ElemSize;
  if Offset + ViewBytes > DM.Size then Exit; { out of bounds }
  Result.BasePtr   := DM.HostSimPtr;
  Result.Offset    := Offset;
  Result.Count     := Count;
  Result.DataType  := DT;
  Result.TotalSize := ViewBytes;
  Result.IsValid   := True;
end;

{ ============================================================
  BLOCK 083: ValidateBufferView
  ============================================================ }
function ValidateBufferView(const BV: TBufferView): TResult;
begin
  if not BV.IsValid then
  begin
    Result := PGPU_ERR_INVALID_HANDLE;
    Exit;
  end;
  if BV.BasePtr = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if BV.Count = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if BV.TotalSize = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 085: GetMemoryStats
  ============================================================ }
function GetMemoryStats(out Stats: TMemoryStats): TResult;
begin
  EnsureStats;
  Stats  := GMemStats;
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 086: ResetMemoryStats
  ============================================================ }
procedure ResetMemoryStats;
begin
  FillChar(GMemStats, SizeOf(GMemStats), 0);
  GStatsInitialized := True;
end;

{ ============================================================
  BLOCK 087: CheckBounds — verify [Offset, Offset+AccessSize) fits in TotalSize
  ============================================================ }
function CheckBounds(Ptr: Pointer; Offset, AccessSize, TotalSize: TSizeT): TResult;
begin
  if Ptr = nil then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if AccessSize = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Offset + AccessSize > TotalSize then
  begin
    Result := PGPU_ERR_BOUNDS;
    Exit;
  end;
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 088: RegionsOverlap — true if [A, A+SzA) and [B, B+SzB) intersect
  ============================================================ }
function RegionsOverlap(A, B: Pointer; SzA, SzB: TSizeT): Boolean;
var
  AStart, AEnd, BStart, BEnd: PtrUInt;
begin
  AStart := PtrUInt(A);
  AEnd   := AStart + SzA;
  BStart := PtrUInt(B);
  BEnd   := BStart + SzB;
  Result := (AStart < BEnd) and (BStart < AEnd);
end;

{ ============================================================
  BLOCK 089: ZeroMemoryRegion — fill bytes with zero
  ============================================================ }
procedure ZeroMemoryRegion(Ptr: Pointer; Bytes: TSizeT);
begin
  if (Ptr <> nil) and (Bytes > 0) then
    FillChar(Ptr^, Bytes, 0);
end;

{ ============================================================
  BLOCK 090: CopyMemoryRegion — non-overlapping memory copy
  ============================================================ }
function CopyMemoryRegion(Dst, Src: Pointer; Bytes: TSizeT): TResult;
begin
  if (Dst = nil) or (Src = nil) then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if Bytes = 0 then
  begin
    Result := PGPU_ERR_INVALID_PARAM;
    Exit;
  end;
  if RegionsOverlap(Dst, Src, Bytes, Bytes) then
  begin
    Result := PGPU_ERR_OVERLAP;
    Exit;
  end;
  Move(Src^, Dst^, Bytes);
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 093: FreeByLifetime — batch-free tracker entries by lifetime
  Tag convention: 'tmp:' = ltTemporary, 'ses:' = ltSession, 'prs:' = ltPersistent
  ============================================================ }
procedure FreeByLifetime(var T: TMemoryTracker; Lifetime: TMemoryLifetime);
var
  I     : TInt32;
  Prefix: AnsiString;
begin
  case Lifetime of
    ltTemporary : Prefix := 'tmp:';
    ltSession   : Prefix := 'ses:';
    ltPersistent: Prefix := 'prs:';
  else
    Prefix := '';
  end;
  if Prefix = '' then Exit;

  for I := 0 to T.Count - 1 do
  begin
    if T.Entries[I].IsLive and
       (Copy(T.Entries[I].Tag, 1, Length(Prefix)) = Prefix) then
    begin
      if T.Entries[I].Ptr <> nil then
      begin
        FreeMem(T.Entries[I].Ptr);
        StatsFree;
      end;
      T.Entries[I].IsLive := False;
      T.Entries[I].Ptr    := nil;
      T.Entries[I].Tag    := '';
    end;
  end;
end;

{ ============================================================
  BLOCK 094: MemoryAlignmentReport — human-readable alignment diagnostic
  ============================================================ }
function MemoryAlignmentReport(Ptr: Pointer; Alignment: TAlignment): AnsiString;
var
  Addr     : PtrUInt;
  Remainder: PtrUInt;
begin
  if Ptr = nil then
  begin
    Result := 'MemoryAlignmentReport: NULL pointer';
    Exit;
  end;
  Addr := PtrUInt(Ptr);
  if Alignment <= 1 then
  begin
    Result := Format('Ptr=$%x Align=%d: trivially aligned', [Addr, Alignment]);
    Exit;
  end;
  Remainder := Addr mod PtrUInt(Alignment);
  if Remainder = 0 then
    Result := Format('Ptr=$%x Align=%d: ALIGNED (offset=0)', [Addr, Alignment])
  else
    Result := Format(
      'Ptr=$%x Align=%d: MISALIGNED (remainder=%d, need %d more bytes)',
      [Addr, Alignment, Remainder, PtrUInt(Alignment) - Remainder]);
end;

{ ============================================================
  BLOCK 096: InitSlabAllocator — allocate InitialCount fixed-size slabs
  ============================================================ }
function InitSlabAllocator(var S: TSlabAllocator; SlabSize: TSizeT;
  InitialCount: TUInt32): TResult;
var
  I      : TUInt32;
  SlabPtr: Pointer;
  Node   : PSlabNode;
begin
  FillChar(S, SizeOf(S), 0);
  { Minimum slab size must fit a free-list node pointer }
  if SlabSize < SizeOf(TSlabNode) then
    SlabSize := SizeOf(TSlabNode);
  S.SlabSize      := SlabSize;
  S.FreeList      := nil;
  S.SlabPtrCount  := 0;
  S.IsInitialized := True;

  if InitialCount > MEMORY_MAX_SLAB_ENTRIES then
    InitialCount := MEMORY_MAX_SLAB_ENTRIES;

  for I := 0 to InitialCount - 1 do
  begin
    GetMem(SlabPtr, SlabSize);
    if SlabPtr = nil then
    begin
      Result := PGPU_ERR_OUT_OF_MEMORY;
      Exit;
    end;
    FillChar(SlabPtr^, SlabSize, 0);
    S.SlabPtrs[S.SlabPtrCount] := SlabPtr;
    Inc(S.SlabPtrCount);
    { Push onto free list }
    Node       := PSlabNode(SlabPtr);
    Node^.Next := S.FreeList;
    S.FreeList := Node;
    StatsAlloc(SlabSize);
  end;
  Result := PGPU_SUCCESS;
end;

{ ============================================================
  BLOCK 097: SlabAlloc — pop a slab from the free list; grow if empty
  ============================================================ }
function SlabAlloc(var S: TSlabAllocator): Pointer;
var
  Node   : PSlabNode;
  NewSlab: Pointer;
begin
  Result := nil;
  if not S.IsInitialized then Exit;

  if S.FreeList <> nil then
  begin
    Node       := S.FreeList;
    S.FreeList := Node^.Next;
    Node^.Next := nil;
    Result     := Pointer(Node);
  end
  else
  begin
    { Free list exhausted — allocate an additional slab }
    if S.SlabPtrCount >= MEMORY_MAX_SLAB_ENTRIES then Exit;
    GetMem(NewSlab, S.SlabSize);
    if NewSlab = nil then Exit;
    FillChar(NewSlab^, S.SlabSize, 0);
    S.SlabPtrs[S.SlabPtrCount] := NewSlab;
    Inc(S.SlabPtrCount);
    StatsAlloc(S.SlabSize);
    Result := NewSlab;
  end;
end;

{ ============================================================
  BLOCK 098: SlabFree — push a slab back onto the free list
  ============================================================ }
procedure SlabFree(var S: TSlabAllocator; Ptr: Pointer);
var
  Node: PSlabNode;
begin
  if not S.IsInitialized then Exit;
  if Ptr = nil then Exit;
  { Overwrite the first word with the free-list pointer }
  Node       := PSlabNode(Ptr);
  Node^.Next := S.FreeList;
  S.FreeList := Node;
end;

{ ============================================================
  BLOCK 099: FinalizeSlabAllocator — free all backing pages
  ============================================================ }
procedure FinalizeSlabAllocator(var S: TSlabAllocator);
var
  I: TUInt32;
begin
  if not S.IsInitialized then Exit;
  for I := 0 to S.SlabPtrCount - 1 do
  begin
    if S.SlabPtrs[I] <> nil then
    begin
      FreeMem(S.SlabPtrs[I]);
      S.SlabPtrs[I] := nil;
      StatsFree;
    end;
  end;
  S.FreeList      := nil;
  S.SlabPtrCount  := 0;
  S.IsInitialized := False;
end;

{ ============================================================
  BLOCK 100: MemorySubsystemTest — alloc/free/bounds/overlap self-test
  ============================================================ }
function MemorySubsystemTest: TResult;
var
  Pool   : TMemoryPool;
  Tracker: TMemoryTracker;
  DM1    : TDeviceMemory;
  DM2    : TDeviceMemory;
  Pinned : THostPinnedBuffer;
  Shared : TSharedMemoryRegion;
  CB     : TConstantBuffer;
  Slab   : TSlabAllocator;
  BV     : TBufferView;
  Stats  : TMemoryStats;
  P1, P2 : Pointer;
  AlgP   : Pointer;
  V32    : TUInt32;
  SrcBuf : array[0..63] of Byte;
  DstBuf : array[0..63] of Byte;
  Rpt    : AnsiString;
  I      : Integer;
  R      : TResult;
begin
  Result := PGPU_SUCCESS;
  ResetMemoryStats;

  { ---- Pool ---- }
  R := InitMemoryPool(Pool, 1024 * 1024);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;

  P1 := PoolAlloc(Pool, 128, 16);
  if P1 = nil then begin Result := PGPU_ERR_OUT_OF_MEMORY; Exit; end;
  if (PtrUInt(P1) mod 16) <> 0 then begin Result := PGPU_ERR_INVALID_PARAM; Exit; end;

  P2 := PoolAlloc(Pool, 256, 32);
  if P2 = nil then begin Result := PGPU_ERR_OUT_OF_MEMORY; Exit; end;
  if (PtrUInt(P2) mod 32) <> 0 then begin Result := PGPU_ERR_INVALID_PARAM; Exit; end;

  PoolFree(Pool, P1); { no-op, must not crash }
  FinalizeMemoryPool(Pool);

  { ---- Aligned alloc/free ---- }
  AlgP := PascalGPUAlloc(512, 64);
  if AlgP = nil then begin Result := PGPU_ERR_OUT_OF_MEMORY; Exit; end;
  if (PtrUInt(AlgP) mod 64) <> 0 then begin Result := PGPU_ERR_INVALID_PARAM; Exit; end;
  PascalGPUFree(AlgP);

  { ---- Tracker ---- }
  FillChar(Tracker, SizeOf(Tracker), 0);
  GetMem(P1, 64);
  MemTrackerRecord(Tracker, P1, 64, mkHost, 'tmp:test-block');
  Rpt := MemTrackerReport(Tracker);
  if Pos('tmp:test-block', Rpt) = 0 then
  begin FreeMem(P1); Result := PGPU_ERR_INVALID_PARAM; Exit; end;
  MemTrackerRelease(Tracker, P1);
  FreeMem(P1);

  { ---- FreeByLifetime ---- }
  FillChar(Tracker, SizeOf(Tracker), 0);
  GetMem(P1, 32);
  MemTrackerRecord(Tracker, P1, 32, mkHost, 'tmp:ephemeral');
  FreeByLifetime(Tracker, ltTemporary);
  { P1 is now freed and marked not live; do not double-free }

  { ---- DeviceMemory ---- }
  R := AllocDeviceMemory(DM1, 4096, 0);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;

  R := AllocDeviceMemory(DM2, 4096, 0);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;

  for I := 0 to 63 do SrcBuf[I] := Byte(I);
  R := HostToDevice(@SrcBuf[0], DM1, 64, 0);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;

  FillChar(DstBuf, SizeOf(DstBuf), 0);
  R := DeviceToHost(DM1, @DstBuf[0], 64, 0);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  for I := 0 to 63 do
    if DstBuf[I] <> Byte(I) then
    begin Result := PGPU_ERR_INVALID_PARAM; Exit; end;

  R := DeviceToDevice(DM1, DM2, 64);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;

  R := FillDeviceMemory(DM1, $AB, 4096);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;

  { Out-of-bounds should fail }
  R := HostToDevice(@SrcBuf[0], DM1, 64, 4090);
  if R = PGPU_SUCCESS then begin Result := PGPU_ERR_INVALID_PARAM; Exit; end;

  R := FreeDeviceMemory(DM1);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  R := FreeDeviceMemory(DM2);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;

  { ---- BufferView ---- }
  R := AllocDeviceMemory(DM1, 1024, 0);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  BV := MakeBufferView(DM1, 0, 256, TDataType(9)); { 256 float32 elements }
  R  := ValidateBufferView(BV);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  if BV.TotalSize <> 256 * 4 then begin Result := PGPU_ERR_INVALID_PARAM; Exit; end;
  R := FreeDeviceMemory(DM1);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;

  { ---- PinnedBuffer ---- }
  R := AllocPinnedBuffer(Pinned, 1024);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  if not Pinned.IsPinned then begin Result := PGPU_ERR_INVALID_PARAM; Exit; end;
  R := FreePinnedBuffer(Pinned);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;

  { ---- SharedMemory ---- }
  R := AllocSharedMemory(Shared, 512, 7);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  if Shared.OwnerBlockID <> 7 then begin Result := PGPU_ERR_INVALID_PARAM; Exit; end;

  R := WriteSharedMem32(Shared, 0, $DEADBEEF);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  R := ReadSharedMem32(Shared, 0, V32);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  if V32 <> $DEADBEEF then begin Result := PGPU_ERR_INVALID_PARAM; Exit; end;

  { Bounds check on shared memory }
  R := WriteSharedMem32(Shared, 512, 0); { past end }
  if R = PGPU_SUCCESS then begin Result := PGPU_ERR_INVALID_PARAM; Exit; end;

  R := FreeSharedMemory(Shared);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;

  { ---- ConstantBuffer ---- }
  for I := 0 to 63 do SrcBuf[I] := Byte(255 - I);
  R := CreateConstantBuffer(CB, @SrcBuf[0], 64);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  if not CB.Frozen then begin Result := PGPU_ERR_INVALID_PARAM; Exit; end;
  FreeConstantBuffer(CB);
  if CB.IsValid then begin Result := PGPU_ERR_INVALID_PARAM; Exit; end;

  { ---- CheckBounds ---- }
  GetMem(P1, 256);
  R := CheckBounds(P1, 0, 128, 256);
  if R <> PGPU_SUCCESS then begin FreeMem(P1); Result := R; Exit; end;
  R := CheckBounds(P1, 200, 100, 256); { 200+100 > 256: must fail }
  if R = PGPU_SUCCESS then begin FreeMem(P1); Result := PGPU_ERR_INVALID_PARAM; Exit; end;
  FreeMem(P1);

  { ---- RegionsOverlap ---- }
  GetMem(P1, 256);
  P2 := Pointer(PtrUInt(P1) + 128); { overlaps by 128 bytes }
  if not RegionsOverlap(P1, P2, 256, 256) then
  begin FreeMem(P1); Result := PGPU_ERR_INVALID_PARAM; Exit; end;
  FreeMem(P1);

  { ---- ZeroMemoryRegion ---- }
  GetMem(P1, 64);
  FillChar(P1^, 64, $FF);
  ZeroMemoryRegion(P1, 64);
  for I := 0 to 63 do
    if PByte(PtrUInt(P1) + PtrUInt(I))^ <> 0 then
    begin FreeMem(P1); Result := PGPU_ERR_INVALID_PARAM; Exit; end;
  FreeMem(P1);

  { ---- CopyMemoryRegion ---- }
  GetMem(P1, 128);
  GetMem(P2, 128);
  FillChar(P1^, 128, $5A);
  R := CopyMemoryRegion(P2, P1, 128);
  if R <> PGPU_SUCCESS then begin FreeMem(P1); FreeMem(P2); Result := R; Exit; end;
  for I := 0 to 127 do
    if PByte(PtrUInt(P2) + PtrUInt(I))^ <> $5A then
    begin FreeMem(P1); FreeMem(P2); Result := PGPU_ERR_INVALID_PARAM; Exit; end;
  FreeMem(P1);
  FreeMem(P2);

  { ---- MemoryAlignmentReport ---- }
  GetMem(P1, 64);
  Rpt := MemoryAlignmentReport(P1, 1);
  if Length(Rpt) = 0 then begin FreeMem(P1); Result := PGPU_ERR_INVALID_PARAM; Exit; end;
  FreeMem(P1);

  { ---- SlabAllocator ---- }
  R := InitSlabAllocator(Slab, 64, 4);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;

  P1 := SlabAlloc(Slab);
  if P1 = nil then begin Result := PGPU_ERR_OUT_OF_MEMORY; Exit; end;

  P2 := SlabAlloc(Slab);
  if P2 = nil then begin Result := PGPU_ERR_OUT_OF_MEMORY; Exit; end;

  SlabFree(Slab, P2);
  SlabFree(Slab, P1);

  { Re-allocate from returned slabs }
  P1 := SlabAlloc(Slab);
  if P1 = nil then begin Result := PGPU_ERR_OUT_OF_MEMORY; Exit; end;
  SlabFree(Slab, P1);

  FinalizeSlabAllocator(Slab);
  if Slab.IsInitialized then begin Result := PGPU_ERR_INVALID_PARAM; Exit; end;

  { ---- GetMemoryStats ---- }
  R := GetMemoryStats(Stats);
  if R <> PGPU_SUCCESS then begin Result := R; Exit; end;
  if Stats.AllocationCount = 0 then begin Result := PGPU_ERR_INVALID_PARAM; Exit; end;

  Result := PGPU_SUCCESS;
end;

end.
