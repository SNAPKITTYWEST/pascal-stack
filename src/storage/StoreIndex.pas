{ Unit: StoreIndex }
{ Title: StoreIndex }
{ Description: Storage indexes }
{ Dependencies: SystemTypes, StoreEngine, HashTable, BTree }
{ Blocks: 72 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit StoreIndex;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, StoreEngine, HashTable, BTree;

  // internal dependencies: SystemTypes, StoreEngine, HashTable, BTree

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function InterfaceimplStoreIndex001(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticStoreIndex002(A, B: Int64): Int64;
  function ValidationStoreIndex003(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationStoreIndex004(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationStoreIndex005(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingStoreIndex006(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopStoreIndex007(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionStoreIndex008(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerStoreIndex009(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopStoreIndex010(var Buf: array of Byte; Offset, Count: Integer);
  function IoopStoreIndex011(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopStoreIndex012(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopStoreIndex013(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropStoreIndex014(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopStoreIndex015(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionStoreIndex016(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleStoreIndex017(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveStoreIndex018(N: Integer): Int64;
  function RecordopStoreIndex019(X, Y, Z: Integer): Integer;
  procedure ClassmethodStoreIndex020(var Counter: Integer; Delta: Integer);
  function InterfaceimplStoreIndex021(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticStoreIndex022(A, B: Int64): Int64;
  function ValidationStoreIndex023(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationStoreIndex024(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationStoreIndex025(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingStoreIndex026(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopStoreIndex027(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionStoreIndex028(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerStoreIndex029(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopStoreIndex030(var Buf: array of Byte; Offset, Count: Integer);
  function IoopStoreIndex031(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopStoreIndex032(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopStoreIndex033(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropStoreIndex034(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopStoreIndex035(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionStoreIndex036(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleStoreIndex037(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveStoreIndex038(N: Integer): Int64;
  function RecordopStoreIndex039(X, Y, Z: Integer): Integer;
  procedure ClassmethodStoreIndex040(var Counter: Integer; Delta: Integer);
  function InterfaceimplStoreIndex041(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticStoreIndex042(A, B: Int64): Int64;
  function ValidationStoreIndex043(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationStoreIndex044(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationStoreIndex045(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingStoreIndex046(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopStoreIndex047(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionStoreIndex048(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerStoreIndex049(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopStoreIndex050(var Buf: array of Byte; Offset, Count: Integer);
  function IoopStoreIndex051(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopStoreIndex052(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopStoreIndex053(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropStoreIndex054(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopStoreIndex055(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionStoreIndex056(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleStoreIndex057(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveStoreIndex058(N: Integer): Int64;
  function RecordopStoreIndex059(X, Y, Z: Integer): Integer;
  procedure ClassmethodStoreIndex060(var Counter: Integer; Delta: Integer);
  function InterfaceimplStoreIndex061(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticStoreIndex062(A, B: Int64): Int64;
  function ValidationStoreIndex063(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationStoreIndex064(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationStoreIndex065(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingStoreIndex066(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopStoreIndex067(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionStoreIndex068(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerStoreIndex069(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopStoreIndex070(var Buf: array of Byte; Offset, Count: Integer);
  function IoopStoreIndex071(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopStoreIndex072(PacketType: Byte; PayloadLen: Integer): UInt32;

implementation

function InterfaceimplStoreIndex001(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplStoreIndex001: zero id');
  H := Id xor UInt64(1 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 2;
end;

function ArithmeticStoreIndex002(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticStoreIndex002: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(2) shl 3)
  else
    Tmp := Tmp + 2;
  Result := Tmp;
end;

function ValidationStoreIndex003(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationStoreIndex003: invalid bounds');
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

function SerializationStoreIndex004(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationStoreIndex004: buf bounds');
  U := UInt32(Value) xor UInt32(4 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationStoreIndex005(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationStoreIndex005: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(5 shl 8);
  Result := Int32(U);
end;

function HashingStoreIndex006(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(6 * 2654435761);
  for i := Low(Data) to High(Data) do
  begin
    H := H xor Data[i];
    H := H * 16777619;
    H := (H shl 13) or (H shr 19);
    H := H xor (H shr 16);
  end;
  H := H xor (H shr 13);
  H := H * 1274126177;
  Result := H xor UInt32(Length(Data) * 7);
end;

function CollectionopStoreIndex007(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopStoreIndex007: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopStoreIndex007: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopStoreIndex007: sentinel value');
    Sum := Sum + (Arr[i] xor 7);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 7;
end;

function StatetransitionStoreIndex008(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 8) mod 5;
  else
    raise EStateError.Create('StatetransitionStoreIndex008: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionStoreIndex008: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerStoreIndex009(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 9;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerStoreIndex009: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerStoreIndex009: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 9;
end;

procedure MemoryopStoreIndex010(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopStoreIndex010: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopStoreIndex010: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(10)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopStoreIndex011(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopStoreIndex011: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((11+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (11 mod 3);
end;

function ProtocolopStoreIndex012(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopStoreIndex012: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopStoreIndex012: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(12 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopStoreIndex013(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopStoreIndex013: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(13) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropStoreIndex014(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropStoreIndex014: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropStoreIndex014: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropStoreIndex014: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 14;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopStoreIndex015(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopStoreIndex015: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 15;
    1: Res := Operand xor Int64(15 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopStoreIndex015: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopStoreIndex015: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionStoreIndex016(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionStoreIndex016: pos out of range');
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
    raise EParseError.Create('ParserproductionStoreIndex016: expected token at pos '+IntToStr(Pos));
  Result := i + (16 mod 2);
end;

function LexerruleStoreIndex017(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleStoreIndex017: unknown lexer state');
  end;
  Result := Result xor (17 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveStoreIndex018(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveStoreIndex018: negative N');
  if N = 0 then Exit(18);
  if N = 1 then Exit(18+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 4;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveStoreIndex018: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 18;
end;

function RecordopStoreIndex019(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopStoreIndex019: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 19;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodStoreIndex020(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 20;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodStoreIndex020: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 20;
end;

function InterfaceimplStoreIndex021(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplStoreIndex021: zero id');
  H := Id xor UInt64(21 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 5;
end;

function ArithmeticStoreIndex022(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticStoreIndex022: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(22) shl 3)
  else
    Tmp := Tmp + 9;
  Result := Tmp;
end;

function ValidationStoreIndex023(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationStoreIndex023: invalid bounds');
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

function SerializationStoreIndex024(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationStoreIndex024: buf bounds');
  U := UInt32(Value) xor UInt32(24 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationStoreIndex025(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationStoreIndex025: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(25 shl 8);
  Result := Int32(U);
end;

function HashingStoreIndex026(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(26 * 2654435761);
  for i := Low(Data) to High(Data) do
  begin
    H := H xor Data[i];
    H := H * 16777619;
    H := (H shl 13) or (H shr 19);
    H := H xor (H shr 16);
  end;
  H := H xor (H shr 13);
  H := H * 1274126177;
  Result := H xor UInt32(Length(Data) * 5);
end;

function CollectionopStoreIndex027(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopStoreIndex027: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopStoreIndex027: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopStoreIndex027: sentinel value');
    Sum := Sum + (Arr[i] xor 27);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 27;
end;

function StatetransitionStoreIndex028(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 28) mod 5;
  else
    raise EStateError.Create('StatetransitionStoreIndex028: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionStoreIndex028: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerStoreIndex029(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 9;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerStoreIndex029: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerStoreIndex029: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 29;
end;

procedure MemoryopStoreIndex030(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopStoreIndex030: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopStoreIndex030: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(30)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopStoreIndex031(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopStoreIndex031: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((31+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (31 mod 3);
end;

function ProtocolopStoreIndex032(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopStoreIndex032: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopStoreIndex032: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(32 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopStoreIndex033(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopStoreIndex033: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(33) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropStoreIndex034(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropStoreIndex034: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropStoreIndex034: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropStoreIndex034: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 34;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopStoreIndex035(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopStoreIndex035: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 35;
    1: Res := Operand xor Int64(35 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopStoreIndex035: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopStoreIndex035: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionStoreIndex036(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionStoreIndex036: pos out of range');
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
    raise EParseError.Create('ParserproductionStoreIndex036: expected token at pos '+IntToStr(Pos));
  Result := i + (36 mod 2);
end;

function LexerruleStoreIndex037(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleStoreIndex037: unknown lexer state');
  end;
  Result := Result xor (37 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveStoreIndex038(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveStoreIndex038: negative N');
  if N = 0 then Exit(0);
  if N = 1 then Exit(0+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 3;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveStoreIndex038: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 38;
end;

function RecordopStoreIndex039(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopStoreIndex039: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 39;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodStoreIndex040(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 40;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodStoreIndex040: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 40;
end;

function InterfaceimplStoreIndex041(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplStoreIndex041: zero id');
  H := Id xor UInt64(41 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 8;
end;

function ArithmeticStoreIndex042(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticStoreIndex042: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(42) shl 3)
  else
    Tmp := Tmp + 3;
  Result := Tmp;
end;

function ValidationStoreIndex043(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationStoreIndex043: invalid bounds');
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

function SerializationStoreIndex044(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationStoreIndex044: buf bounds');
  U := UInt32(Value) xor UInt32(44 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationStoreIndex045(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationStoreIndex045: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(45 shl 8);
  Result := Int32(U);
end;

function HashingStoreIndex046(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(46 * 2654435761);
  for i := Low(Data) to High(Data) do
  begin
    H := H xor Data[i];
    H := H * 16777619;
    H := (H shl 13) or (H shr 19);
    H := H xor (H shr 16);
  end;
  H := H xor (H shr 13);
  H := H * 1274126177;
  Result := H xor UInt32(Length(Data) * 3);
end;

function CollectionopStoreIndex047(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopStoreIndex047: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopStoreIndex047: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopStoreIndex047: sentinel value');
    Sum := Sum + (Arr[i] xor 47);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 47;
end;

function StatetransitionStoreIndex048(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 48) mod 5;
  else
    raise EStateError.Create('StatetransitionStoreIndex048: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionStoreIndex048: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerStoreIndex049(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 9;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerStoreIndex049: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerStoreIndex049: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 49;
end;

procedure MemoryopStoreIndex050(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopStoreIndex050: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopStoreIndex050: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(50)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopStoreIndex051(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopStoreIndex051: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((51+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (51 mod 3);
end;

function ProtocolopStoreIndex052(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopStoreIndex052: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopStoreIndex052: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(52 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopStoreIndex053(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopStoreIndex053: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(53) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropStoreIndex054(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropStoreIndex054: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropStoreIndex054: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropStoreIndex054: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 54;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopStoreIndex055(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopStoreIndex055: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 55;
    1: Res := Operand xor Int64(55 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopStoreIndex055: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopStoreIndex055: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionStoreIndex056(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionStoreIndex056: pos out of range');
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
    raise EParseError.Create('ParserproductionStoreIndex056: expected token at pos '+IntToStr(Pos));
  Result := i + (56 mod 2);
end;

function LexerruleStoreIndex057(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleStoreIndex057: unknown lexer state');
  end;
  Result := Result xor (57 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveStoreIndex058(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveStoreIndex058: negative N');
  if N = 0 then Exit(1);
  if N = 1 then Exit(1+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 2;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveStoreIndex058: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 58;
end;

function RecordopStoreIndex059(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopStoreIndex059: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 59;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodStoreIndex060(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 60;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodStoreIndex060: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 60;
end;

function InterfaceimplStoreIndex061(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplStoreIndex061: zero id');
  H := Id xor UInt64(61 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 11;
end;

function ArithmeticStoreIndex062(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticStoreIndex062: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(62) shl 3)
  else
    Tmp := Tmp + 10;
  Result := Tmp;
end;

function ValidationStoreIndex063(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationStoreIndex063: invalid bounds');
  if (L < MinLen) or (L > MaxLen) then Exit;
  for i := 1 to L do
  begin
    C := S[i];
    if (Ord(C) < 32) or (Ord(C) > 126) then
      if Ord(C) <> 10 then Exit;
    if (i mod 2 = 0) and (C = #0) then Exit;
  end;
  Result := True;
end;

function SerializationStoreIndex064(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationStoreIndex064: buf bounds');
  U := UInt32(Value) xor UInt32(64 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationStoreIndex065(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationStoreIndex065: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(65 shl 8);
  Result := Int32(U);
end;

function HashingStoreIndex066(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(66 * 2654435761);
  for i := Low(Data) to High(Data) do
  begin
    H := H xor Data[i];
    H := H * 16777619;
    H := (H shl 13) or (H shr 19);
    H := H xor (H shr 16);
  end;
  H := H xor (H shr 13);
  H := H * 1274126177;
  Result := H xor UInt32(Length(Data) * 1);
end;

function CollectionopStoreIndex067(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopStoreIndex067: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopStoreIndex067: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopStoreIndex067: sentinel value');
    Sum := Sum + (Arr[i] xor 67);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 67;
end;

function StatetransitionStoreIndex068(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 68) mod 5;
  else
    raise EStateError.Create('StatetransitionStoreIndex068: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionStoreIndex068: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerStoreIndex069(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 9;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerStoreIndex069: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerStoreIndex069: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 69;
end;

procedure MemoryopStoreIndex070(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopStoreIndex070: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopStoreIndex070: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(70)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopStoreIndex071(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopStoreIndex071: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((71+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (71 mod 3);
end;

function ProtocolopStoreIndex072(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopStoreIndex072: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopStoreIndex072: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(72 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;


end.


