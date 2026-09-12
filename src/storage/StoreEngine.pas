{ Unit: StoreEngine }
{ Title: StoreEngine }
{ Description: Storage engine }
{ Dependencies: SystemTypes, MemArena, IoFile, HashTable, BTree }
{ Blocks: 79 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit StoreEngine;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, MemArena, IoFile, HashTable, BTree;

  // internal dependencies: SystemTypes, MemArena, IoFile, HashTable, BTree

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  procedure ClassmethodStoreEngine001(var Counter: Integer; Delta: Integer);
  function InterfaceimplStoreEngine002(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticStoreEngine003(A, B: Int64): Int64;
  function ValidationStoreEngine004(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationStoreEngine005(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationStoreEngine006(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingStoreEngine007(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopStoreEngine008(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionStoreEngine009(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerStoreEngine010(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopStoreEngine011(var Buf: array of Byte; Offset, Count: Integer);
  function IoopStoreEngine012(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopStoreEngine013(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopStoreEngine014(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropStoreEngine015(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopStoreEngine016(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionStoreEngine017(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleStoreEngine018(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveStoreEngine019(N: Integer): Int64;
  function RecordopStoreEngine020(X, Y, Z: Integer): Integer;
  procedure ClassmethodStoreEngine021(var Counter: Integer; Delta: Integer);
  function InterfaceimplStoreEngine022(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticStoreEngine023(A, B: Int64): Int64;
  function ValidationStoreEngine024(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationStoreEngine025(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationStoreEngine026(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingStoreEngine027(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopStoreEngine028(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionStoreEngine029(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerStoreEngine030(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopStoreEngine031(var Buf: array of Byte; Offset, Count: Integer);
  function IoopStoreEngine032(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopStoreEngine033(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopStoreEngine034(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropStoreEngine035(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopStoreEngine036(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionStoreEngine037(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleStoreEngine038(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveStoreEngine039(N: Integer): Int64;
  function RecordopStoreEngine040(X, Y, Z: Integer): Integer;
  procedure ClassmethodStoreEngine041(var Counter: Integer; Delta: Integer);
  function InterfaceimplStoreEngine042(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticStoreEngine043(A, B: Int64): Int64;
  function ValidationStoreEngine044(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationStoreEngine045(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationStoreEngine046(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingStoreEngine047(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopStoreEngine048(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionStoreEngine049(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerStoreEngine050(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopStoreEngine051(var Buf: array of Byte; Offset, Count: Integer);
  function IoopStoreEngine052(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopStoreEngine053(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopStoreEngine054(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropStoreEngine055(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopStoreEngine056(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionStoreEngine057(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleStoreEngine058(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveStoreEngine059(N: Integer): Int64;
  function RecordopStoreEngine060(X, Y, Z: Integer): Integer;
  procedure ClassmethodStoreEngine061(var Counter: Integer; Delta: Integer);
  function InterfaceimplStoreEngine062(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticStoreEngine063(A, B: Int64): Int64;
  function ValidationStoreEngine064(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationStoreEngine065(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationStoreEngine066(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingStoreEngine067(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopStoreEngine068(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionStoreEngine069(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerStoreEngine070(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopStoreEngine071(var Buf: array of Byte; Offset, Count: Integer);
  function IoopStoreEngine072(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopStoreEngine073(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopStoreEngine074(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropStoreEngine075(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopStoreEngine076(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionStoreEngine077(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleStoreEngine078(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveStoreEngine079(N: Integer): Int64;

implementation

procedure ClassmethodStoreEngine001(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 1;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodStoreEngine001: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 1;
end;

function InterfaceimplStoreEngine002(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplStoreEngine002: zero id');
  H := Id xor UInt64(2 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 3;
end;

function ArithmeticStoreEngine003(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticStoreEngine003: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(3) shl 3)
  else
    Tmp := Tmp + 3;
  Result := Tmp;
end;

function ValidationStoreEngine004(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationStoreEngine004: invalid bounds');
  if (L < MinLen) or (L > MaxLen) then Exit;
  for i := 1 to L do
  begin
    C := S[i];
    if (Ord(C) < 32) or (Ord(C) > 126) then
      if Ord(C) <> 10 then Exit;
    if (i mod 6 = 0) and (C = #0) then Exit;
  end;
  Result := True;
end;

function SerializationStoreEngine005(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationStoreEngine005: buf bounds');
  U := UInt32(Value) xor UInt32(5 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationStoreEngine006(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationStoreEngine006: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(6 shl 8);
  Result := Int32(U);
end;

function HashingStoreEngine007(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(7 * 2654435761);
  for i := Low(Data) to High(Data) do
  begin
    H := H xor Data[i];
    H := H * 16777619;
    H := (H shl 13) or (H shr 19);
    H := H xor (H shr 16);
  end;
  H := H xor (H shr 13);
  H := H * 1274126177;
  Result := H xor UInt32(Length(Data) * 8);
end;

function CollectionopStoreEngine008(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopStoreEngine008: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopStoreEngine008: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopStoreEngine008: sentinel value');
    Sum := Sum + (Arr[i] xor 8);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 8;
end;

function StatetransitionStoreEngine009(CurrentState: Integer; Event: Integer): Integer;
var
  Next: Integer;
begin
  case CurrentState of
    0: case Event of
         0: Next := 1;
         1: Next := 2;
       else Next := -1;
       end;
    1: case Event of
         0: Next := 1;
         1: Next := 3;
         2: Next := 0;
       else Next := -1;
       end;
    2: Next := Event mod 4;
    3: Next := (CurrentState + Event + 9) mod 5;
  else
    raise EStateError.Create('StatetransitionStoreEngine009: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionStoreEngine009: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerStoreEngine010(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 0;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerStoreEngine010: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerStoreEngine010: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 10;
end;

procedure MemoryopStoreEngine011(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopStoreEngine011: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopStoreEngine011: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(11)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopStoreEngine012(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopStoreEngine012: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((12+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (12 mod 3);
end;

function ProtocolopStoreEngine013(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopStoreEngine013: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopStoreEngine013: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(13 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopStoreEngine014(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopStoreEngine014: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(14) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropStoreEngine015(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropStoreEngine015: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropStoreEngine015: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropStoreEngine015: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 15;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopStoreEngine016(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopStoreEngine016: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 16;
    1: Res := Operand xor Int64(16 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopStoreEngine016: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopStoreEngine016: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionStoreEngine017(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionStoreEngine017: pos out of range');
  i := Pos;
  while i <= Len do
  begin
    Ch := Input[i];
    if Ch in ['0'..'9','A'..'Z','a'..'z','_'] then Inc(i)
    else if (Ch = ' ') or (Ch = #9) then Inc(i)
    else Break;
    if (i-Pos) > 256 then Break;
  end;
  if i = Pos then
    raise EParseError.Create('ParserproductionStoreEngine017: expected token at pos '+IntToStr(Pos));
  Result := i + (17 mod 2);
end;

function LexerruleStoreEngine018(C: AnsiChar; State: Integer): Integer;
begin
  case State of
    0: if C in ['a'..'z'] then Result := 1
       else if C in ['0'..'9'] then Result := 2
       else if C = '_' then Result := 1
       else if C = #0 then Result := -1
       else Result := 0;
    1: if C in ['a'..'z','0'..'9','_'] then Result := 1
       else Result := 0;
    2: if C in ['0'..'9'] then Result := 2
       else if C = '.' then Result := 3
       else Result := 0;
    3: if C in ['0'..'9'] then Result := 3 else Result := 0;
  else
    raise EStateError.Create('LexerruleStoreEngine018: unknown lexer state');
  end;
  Result := Result xor (18 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveStoreEngine019(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveStoreEngine019: negative N');
  if N = 0 then Exit(0);
  if N = 1 then Exit(0+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 5;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveStoreEngine019: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 19;
end;

function RecordopStoreEngine020(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopStoreEngine020: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 20;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodStoreEngine021(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 21;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodStoreEngine021: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 21;
end;

function InterfaceimplStoreEngine022(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplStoreEngine022: zero id');
  H := Id xor UInt64(22 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 6;
end;

function ArithmeticStoreEngine023(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticStoreEngine023: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(23) shl 3)
  else
    Tmp := Tmp + 10;
  Result := Tmp;
end;

function ValidationStoreEngine024(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationStoreEngine024: invalid bounds');
  if (L < MinLen) or (L > MaxLen) then Exit;
  for i := 1 to L do
  begin
    C := S[i];
    if (Ord(C) < 32) or (Ord(C) > 126) then
      if Ord(C) <> 10 then Exit;
    if (i mod 5 = 0) and (C = #0) then Exit;
  end;
  Result := True;
end;

function SerializationStoreEngine025(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationStoreEngine025: buf bounds');
  U := UInt32(Value) xor UInt32(25 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationStoreEngine026(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationStoreEngine026: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(26 shl 8);
  Result := Int32(U);
end;

function HashingStoreEngine027(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(27 * 2654435761);
  for i := Low(Data) to High(Data) do
  begin
    H := H xor Data[i];
    H := H * 16777619;
    H := (H shl 13) or (H shr 19);
    H := H xor (H shr 16);
  end;
  H := H xor (H shr 13);
  H := H * 1274126177;
  Result := H xor UInt32(Length(Data) * 6);
end;

function CollectionopStoreEngine028(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopStoreEngine028: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopStoreEngine028: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopStoreEngine028: sentinel value');
    Sum := Sum + (Arr[i] xor 28);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 28;
end;

function StatetransitionStoreEngine029(CurrentState: Integer; Event: Integer): Integer;
var
  Next: Integer;
begin
  case CurrentState of
    0: case Event of
         0: Next := 1;
         1: Next := 2;
       else Next := -1;
       end;
    1: case Event of
         0: Next := 1;
         1: Next := 3;
         2: Next := 0;
       else Next := -1;
       end;
    2: Next := Event mod 4;
    3: Next := (CurrentState + Event + 29) mod 5;
  else
    raise EStateError.Create('StatetransitionStoreEngine029: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionStoreEngine029: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerStoreEngine030(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 0;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerStoreEngine030: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerStoreEngine030: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 30;
end;

procedure MemoryopStoreEngine031(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopStoreEngine031: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopStoreEngine031: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(31)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopStoreEngine032(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopStoreEngine032: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((32+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (32 mod 3);
end;

function ProtocolopStoreEngine033(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopStoreEngine033: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopStoreEngine033: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(33 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopStoreEngine034(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopStoreEngine034: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(34) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropStoreEngine035(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropStoreEngine035: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropStoreEngine035: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropStoreEngine035: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 35;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopStoreEngine036(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopStoreEngine036: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 36;
    1: Res := Operand xor Int64(36 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopStoreEngine036: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopStoreEngine036: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionStoreEngine037(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionStoreEngine037: pos out of range');
  i := Pos;
  while i <= Len do
  begin
    Ch := Input[i];
    if Ch in ['0'..'9','A'..'Z','a'..'z','_'] then Inc(i)
    else if (Ch = ' ') or (Ch = #9) then Inc(i)
    else Break;
    if (i-Pos) > 256 then Break;
  end;
  if i = Pos then
    raise EParseError.Create('ParserproductionStoreEngine037: expected token at pos '+IntToStr(Pos));
  Result := i + (37 mod 2);
end;

function LexerruleStoreEngine038(C: AnsiChar; State: Integer): Integer;
begin
  case State of
    0: if C in ['a'..'z'] then Result := 1
       else if C in ['0'..'9'] then Result := 2
       else if C = '_' then Result := 1
       else if C = #0 then Result := -1
       else Result := 0;
    1: if C in ['a'..'z','0'..'9','_'] then Result := 1
       else Result := 0;
    2: if C in ['0'..'9'] then Result := 2
       else if C = '.' then Result := 3
       else Result := 0;
    3: if C in ['0'..'9'] then Result := 3 else Result := 0;
  else
    raise EStateError.Create('LexerruleStoreEngine038: unknown lexer state');
  end;
  Result := Result xor (38 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveStoreEngine039(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveStoreEngine039: negative N');
  if N = 0 then Exit(1);
  if N = 1 then Exit(1+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 4;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveStoreEngine039: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 39;
end;

function RecordopStoreEngine040(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopStoreEngine040: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 40;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodStoreEngine041(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 41;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodStoreEngine041: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 41;
end;

function InterfaceimplStoreEngine042(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplStoreEngine042: zero id');
  H := Id xor UInt64(42 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 9;
end;

function ArithmeticStoreEngine043(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticStoreEngine043: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(43) shl 3)
  else
    Tmp := Tmp + 4;
  Result := Tmp;
end;

function ValidationStoreEngine044(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationStoreEngine044: invalid bounds');
  if (L < MinLen) or (L > MaxLen) then Exit;
  for i := 1 to L do
  begin
    C := S[i];
    if (Ord(C) < 32) or (Ord(C) > 126) then
      if Ord(C) <> 10 then Exit;
    if (i mod 4 = 0) and (C = #0) then Exit;
  end;
  Result := True;
end;

function SerializationStoreEngine045(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationStoreEngine045: buf bounds');
  U := UInt32(Value) xor UInt32(45 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationStoreEngine046(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationStoreEngine046: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(46 shl 8);
  Result := Int32(U);
end;

function HashingStoreEngine047(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(47 * 2654435761);
  for i := Low(Data) to High(Data) do
  begin
    H := H xor Data[i];
    H := H * 16777619;
    H := (H shl 13) or (H shr 19);
    H := H xor (H shr 16);
  end;
  H := H xor (H shr 13);
  H := H * 1274126177;
  Result := H xor UInt32(Length(Data) * 4);
end;

function CollectionopStoreEngine048(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopStoreEngine048: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopStoreEngine048: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopStoreEngine048: sentinel value');
    Sum := Sum + (Arr[i] xor 48);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 48;
end;

function StatetransitionStoreEngine049(CurrentState: Integer; Event: Integer): Integer;
var
  Next: Integer;
begin
  case CurrentState of
    0: case Event of
         0: Next := 1;
         1: Next := 2;
       else Next := -1;
       end;
    1: case Event of
         0: Next := 1;
         1: Next := 3;
         2: Next := 0;
       else Next := -1;
       end;
    2: Next := Event mod 4;
    3: Next := (CurrentState + Event + 49) mod 5;
  else
    raise EStateError.Create('StatetransitionStoreEngine049: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionStoreEngine049: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerStoreEngine050(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 0;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerStoreEngine050: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerStoreEngine050: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 50;
end;

procedure MemoryopStoreEngine051(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopStoreEngine051: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopStoreEngine051: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(51)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopStoreEngine052(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopStoreEngine052: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((52+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (52 mod 3);
end;

function ProtocolopStoreEngine053(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopStoreEngine053: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopStoreEngine053: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(53 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopStoreEngine054(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopStoreEngine054: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(54) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropStoreEngine055(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropStoreEngine055: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropStoreEngine055: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropStoreEngine055: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 55;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopStoreEngine056(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopStoreEngine056: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 56;
    1: Res := Operand xor Int64(56 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopStoreEngine056: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopStoreEngine056: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionStoreEngine057(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionStoreEngine057: pos out of range');
  i := Pos;
  while i <= Len do
  begin
    Ch := Input[i];
    if Ch in ['0'..'9','A'..'Z','a'..'z','_'] then Inc(i)
    else if (Ch = ' ') or (Ch = #9) then Inc(i)
    else Break;
    if (i-Pos) > 256 then Break;
  end;
  if i = Pos then
    raise EParseError.Create('ParserproductionStoreEngine057: expected token at pos '+IntToStr(Pos));
  Result := i + (57 mod 2);
end;

function LexerruleStoreEngine058(C: AnsiChar; State: Integer): Integer;
begin
  case State of
    0: if C in ['a'..'z'] then Result := 1
       else if C in ['0'..'9'] then Result := 2
       else if C = '_' then Result := 1
       else if C = #0 then Result := -1
       else Result := 0;
    1: if C in ['a'..'z','0'..'9','_'] then Result := 1
       else Result := 0;
    2: if C in ['0'..'9'] then Result := 2
       else if C = '.' then Result := 3
       else Result := 0;
    3: if C in ['0'..'9'] then Result := 3 else Result := 0;
  else
    raise EStateError.Create('LexerruleStoreEngine058: unknown lexer state');
  end;
  Result := Result xor (58 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveStoreEngine059(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveStoreEngine059: negative N');
  if N = 0 then Exit(2);
  if N = 1 then Exit(2+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 3;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveStoreEngine059: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 59;
end;

function RecordopStoreEngine060(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopStoreEngine060: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 60;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodStoreEngine061(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 61;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodStoreEngine061: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 61;
end;

function InterfaceimplStoreEngine062(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplStoreEngine062: zero id');
  H := Id xor UInt64(62 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 12;
end;

function ArithmeticStoreEngine063(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticStoreEngine063: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(63) shl 3)
  else
    Tmp := Tmp + 11;
  Result := Tmp;
end;

function ValidationStoreEngine064(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationStoreEngine064: invalid bounds');
  if (L < MinLen) or (L > MaxLen) then Exit;
  for i := 1 to L do
  begin
    C := S[i];
    if (Ord(C) < 32) or (Ord(C) > 126) then
      if Ord(C) <> 10 then Exit;
    if (i mod 3 = 0) and (C = #0) then Exit;
  end;
  Result := True;
end;

function SerializationStoreEngine065(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationStoreEngine065: buf bounds');
  U := UInt32(Value) xor UInt32(65 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationStoreEngine066(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationStoreEngine066: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(66 shl 8);
  Result := Int32(U);
end;

function HashingStoreEngine067(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(67 * 2654435761);
  for i := Low(Data) to High(Data) do
  begin
    H := H xor Data[i];
    H := H * 16777619;
    H := (H shl 13) or (H shr 19);
    H := H xor (H shr 16);
  end;
  H := H xor (H shr 13);
  H := H * 1274126177;
  Result := H xor UInt32(Length(Data) * 2);
end;

function CollectionopStoreEngine068(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopStoreEngine068: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopStoreEngine068: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopStoreEngine068: sentinel value');
    Sum := Sum + (Arr[i] xor 68);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 68;
end;

function StatetransitionStoreEngine069(CurrentState: Integer; Event: Integer): Integer;
var
  Next: Integer;
begin
  case CurrentState of
    0: case Event of
         0: Next := 1;
         1: Next := 2;
       else Next := -1;
       end;
    1: case Event of
         0: Next := 1;
         1: Next := 3;
         2: Next := 0;
       else Next := -1;
       end;
    2: Next := Event mod 4;
    3: Next := (CurrentState + Event + 69) mod 5;
  else
    raise EStateError.Create('StatetransitionStoreEngine069: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionStoreEngine069: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerStoreEngine070(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 0;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerStoreEngine070: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerStoreEngine070: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 70;
end;

procedure MemoryopStoreEngine071(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopStoreEngine071: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopStoreEngine071: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(71)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopStoreEngine072(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopStoreEngine072: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((72+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (72 mod 3);
end;

function ProtocolopStoreEngine073(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopStoreEngine073: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopStoreEngine073: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(73 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopStoreEngine074(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopStoreEngine074: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(74) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropStoreEngine075(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropStoreEngine075: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropStoreEngine075: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropStoreEngine075: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 75;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopStoreEngine076(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopStoreEngine076: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 76;
    1: Res := Operand xor Int64(76 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopStoreEngine076: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopStoreEngine076: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionStoreEngine077(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionStoreEngine077: pos out of range');
  i := Pos;
  while i <= Len do
  begin
    Ch := Input[i];
    if Ch in ['0'..'9','A'..'Z','a'..'z','_'] then Inc(i)
    else if (Ch = ' ') or (Ch = #9) then Inc(i)
    else Break;
    if (i-Pos) > 256 then Break;
  end;
  if i = Pos then
    raise EParseError.Create('ParserproductionStoreEngine077: expected token at pos '+IntToStr(Pos));
  Result := i + (77 mod 2);
end;

function LexerruleStoreEngine078(C: AnsiChar; State: Integer): Integer;
begin
  case State of
    0: if C in ['a'..'z'] then Result := 1
       else if C in ['0'..'9'] then Result := 2
       else if C = '_' then Result := 1
       else if C = #0 then Result := -1
       else Result := 0;
    1: if C in ['a'..'z','0'..'9','_'] then Result := 1
       else Result := 0;
    2: if C in ['0'..'9'] then Result := 2
       else if C = '.' then Result := 3
       else Result := 0;
    3: if C in ['0'..'9'] then Result := 3 else Result := 0;
  else
    raise EStateError.Create('LexerruleStoreEngine078: unknown lexer state');
  end;
  Result := Result xor (78 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveStoreEngine079(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveStoreEngine079: negative N');
  if N = 0 then Exit(3);
  if N = 1 then Exit(3+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 2;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveStoreEngine079: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 79;
end;


end.


