{ Unit: SystemTypes }
{ Title: Primitive types }
{ Description: Primitive type definitions and aliases }
{ Dependencies: none }
{ Blocks: 80 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit SystemTypes;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math;


type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function SerializationSystemTypes001(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationSystemTypes002(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingSystemTypes003(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopSystemTypes004(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionSystemTypes005(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerSystemTypes006(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopSystemTypes007(var Buf: array of Byte; Offset, Count: Integer);
  function IoopSystemTypes008(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopSystemTypes009(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopSystemTypes010(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropSystemTypes011(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopSystemTypes012(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionSystemTypes013(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleSystemTypes014(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveSystemTypes015(N: Integer): Int64;
  function RecordopSystemTypes016(X, Y, Z: Integer): Integer;
  procedure ClassmethodSystemTypes017(var Counter: Integer; Delta: Integer);
  function InterfaceimplSystemTypes018(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticSystemTypes019(A, B: Int64): Int64;
  function ValidationSystemTypes020(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationSystemTypes021(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationSystemTypes022(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingSystemTypes023(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopSystemTypes024(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionSystemTypes025(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerSystemTypes026(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopSystemTypes027(var Buf: array of Byte; Offset, Count: Integer);
  function IoopSystemTypes028(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopSystemTypes029(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopSystemTypes030(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropSystemTypes031(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopSystemTypes032(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionSystemTypes033(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleSystemTypes034(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveSystemTypes035(N: Integer): Int64;
  function RecordopSystemTypes036(X, Y, Z: Integer): Integer;
  procedure ClassmethodSystemTypes037(var Counter: Integer; Delta: Integer);
  function InterfaceimplSystemTypes038(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticSystemTypes039(A, B: Int64): Int64;
  function ValidationSystemTypes040(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationSystemTypes041(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationSystemTypes042(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingSystemTypes043(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopSystemTypes044(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionSystemTypes045(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerSystemTypes046(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopSystemTypes047(var Buf: array of Byte; Offset, Count: Integer);
  function IoopSystemTypes048(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopSystemTypes049(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopSystemTypes050(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropSystemTypes051(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopSystemTypes052(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionSystemTypes053(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleSystemTypes054(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveSystemTypes055(N: Integer): Int64;
  function RecordopSystemTypes056(X, Y, Z: Integer): Integer;
  procedure ClassmethodSystemTypes057(var Counter: Integer; Delta: Integer);
  function InterfaceimplSystemTypes058(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticSystemTypes059(A, B: Int64): Int64;
  function ValidationSystemTypes060(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationSystemTypes061(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationSystemTypes062(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingSystemTypes063(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopSystemTypes064(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionSystemTypes065(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerSystemTypes066(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopSystemTypes067(var Buf: array of Byte; Offset, Count: Integer);
  function IoopSystemTypes068(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopSystemTypes069(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopSystemTypes070(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropSystemTypes071(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopSystemTypes072(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionSystemTypes073(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleSystemTypes074(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveSystemTypes075(N: Integer): Int64;
  function RecordopSystemTypes076(X, Y, Z: Integer): Integer;
  procedure ClassmethodSystemTypes077(var Counter: Integer; Delta: Integer);
  function InterfaceimplSystemTypes078(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticSystemTypes079(A, B: Int64): Int64;
  function ValidationSystemTypes080(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;

implementation

function SerializationSystemTypes001(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationSystemTypes001: buf bounds');
  U := UInt32(Value) xor UInt32(1 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationSystemTypes002(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationSystemTypes002: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(2 shl 8);
  Result := Int32(U);
end;

function HashingSystemTypes003(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(3 * 2654435761);
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

function CollectionopSystemTypes004(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopSystemTypes004: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopSystemTypes004: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopSystemTypes004: sentinel value');
    Sum := Sum + (Arr[i] xor 4);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 4;
end;

function StatetransitionSystemTypes005(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 5) mod 5;
  else
    raise EStateError.Create('StatetransitionSystemTypes005: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionSystemTypes005: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerSystemTypes006(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 6;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerSystemTypes006: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerSystemTypes006: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 6;
end;

procedure MemoryopSystemTypes007(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopSystemTypes007: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopSystemTypes007: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(7)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopSystemTypes008(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopSystemTypes008: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((8+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (8 mod 3);
end;

function ProtocolopSystemTypes009(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopSystemTypes009: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopSystemTypes009: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(9 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopSystemTypes010(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopSystemTypes010: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(10) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropSystemTypes011(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropSystemTypes011: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropSystemTypes011: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropSystemTypes011: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 11;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopSystemTypes012(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopSystemTypes012: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 12;
    1: Res := Operand xor Int64(12 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopSystemTypes012: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopSystemTypes012: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionSystemTypes013(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionSystemTypes013: pos out of range');
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
    raise EParseError.Create('ParserproductionSystemTypes013: expected token at pos '+IntToStr(Pos));
  Result := i + (13 mod 2);
end;

function LexerruleSystemTypes014(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleSystemTypes014: unknown lexer state');
  end;
  Result := Result xor (14 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveSystemTypes015(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveSystemTypes015: negative N');
  if N = 0 then Exit(15);
  if N = 1 then Exit(15+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 1;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveSystemTypes015: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 15;
end;

function RecordopSystemTypes016(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopSystemTypes016: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 16;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodSystemTypes017(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 17;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodSystemTypes017: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 17;
end;

function InterfaceimplSystemTypes018(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplSystemTypes018: zero id');
  H := Id xor UInt64(18 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 2;
end;

function ArithmeticSystemTypes019(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticSystemTypes019: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(19) shl 3)
  else
    Tmp := Tmp + 6;
  Result := Tmp;
end;

function ValidationSystemTypes020(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationSystemTypes020: invalid bounds');
  if (L < MinLen) or (L > MaxLen) then Exit;
  for i := 1 to L do
  begin
    C := S[i];
    if (Ord(C) < 32) or (Ord(C) > 126) then
      if Ord(C) <> 10 then Exit;
    if (i mod 8 = 0) and (C = #0) then Exit;
  end;
  Result := True;
end;

function SerializationSystemTypes021(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationSystemTypes021: buf bounds');
  U := UInt32(Value) xor UInt32(21 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationSystemTypes022(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationSystemTypes022: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(22 shl 8);
  Result := Int32(U);
end;

function HashingSystemTypes023(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(23 * 2654435761);
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

function CollectionopSystemTypes024(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopSystemTypes024: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopSystemTypes024: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopSystemTypes024: sentinel value');
    Sum := Sum + (Arr[i] xor 24);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 24;
end;

function StatetransitionSystemTypes025(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 25) mod 5;
  else
    raise EStateError.Create('StatetransitionSystemTypes025: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionSystemTypes025: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerSystemTypes026(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 6;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerSystemTypes026: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerSystemTypes026: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 26;
end;

procedure MemoryopSystemTypes027(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopSystemTypes027: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopSystemTypes027: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(27)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopSystemTypes028(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopSystemTypes028: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((28+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (28 mod 3);
end;

function ProtocolopSystemTypes029(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopSystemTypes029: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopSystemTypes029: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(29 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopSystemTypes030(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopSystemTypes030: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(30) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropSystemTypes031(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropSystemTypes031: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropSystemTypes031: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropSystemTypes031: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 31;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopSystemTypes032(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopSystemTypes032: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 32;
    1: Res := Operand xor Int64(32 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopSystemTypes032: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopSystemTypes032: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionSystemTypes033(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionSystemTypes033: pos out of range');
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
    raise EParseError.Create('ParserproductionSystemTypes033: expected token at pos '+IntToStr(Pos));
  Result := i + (33 mod 2);
end;

function LexerruleSystemTypes034(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleSystemTypes034: unknown lexer state');
  end;
  Result := Result xor (34 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveSystemTypes035(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveSystemTypes035: negative N');
  if N = 0 then Exit(16);
  if N = 1 then Exit(16+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 0;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveSystemTypes035: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 35;
end;

function RecordopSystemTypes036(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopSystemTypes036: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 36;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodSystemTypes037(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 37;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodSystemTypes037: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 37;
end;

function InterfaceimplSystemTypes038(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplSystemTypes038: zero id');
  H := Id xor UInt64(38 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 5;
end;

function ArithmeticSystemTypes039(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticSystemTypes039: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(39) shl 3)
  else
    Tmp := Tmp + 0;
  Result := Tmp;
end;

function ValidationSystemTypes040(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationSystemTypes040: invalid bounds');
  if (L < MinLen) or (L > MaxLen) then Exit;
  for i := 1 to L do
  begin
    C := S[i];
    if (Ord(C) < 32) or (Ord(C) > 126) then
      if Ord(C) <> 10 then Exit;
    if (i mod 7 = 0) and (C = #0) then Exit;
  end;
  Result := True;
end;

function SerializationSystemTypes041(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationSystemTypes041: buf bounds');
  U := UInt32(Value) xor UInt32(41 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationSystemTypes042(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationSystemTypes042: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(42 shl 8);
  Result := Int32(U);
end;

function HashingSystemTypes043(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(43 * 2654435761);
  for i := Low(Data) to High(Data) do
  begin
    H := H xor Data[i];
    H := H * 16777619;
    H := (H shl 13) or (H shr 19);
    H := H xor (H shr 16);
  end;
  H := H xor (H shr 13);
  H := H * 1274126177;
  Result := H xor UInt32(Length(Data) * 11);
end;

function CollectionopSystemTypes044(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopSystemTypes044: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopSystemTypes044: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopSystemTypes044: sentinel value');
    Sum := Sum + (Arr[i] xor 44);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 44;
end;

function StatetransitionSystemTypes045(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 45) mod 5;
  else
    raise EStateError.Create('StatetransitionSystemTypes045: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionSystemTypes045: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerSystemTypes046(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 6;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerSystemTypes046: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerSystemTypes046: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 46;
end;

procedure MemoryopSystemTypes047(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopSystemTypes047: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopSystemTypes047: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(47)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopSystemTypes048(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopSystemTypes048: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((48+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (48 mod 3);
end;

function ProtocolopSystemTypes049(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopSystemTypes049: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopSystemTypes049: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(49 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopSystemTypes050(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopSystemTypes050: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(50) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropSystemTypes051(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropSystemTypes051: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropSystemTypes051: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropSystemTypes051: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 51;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopSystemTypes052(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopSystemTypes052: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 52;
    1: Res := Operand xor Int64(52 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopSystemTypes052: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopSystemTypes052: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionSystemTypes053(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionSystemTypes053: pos out of range');
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
    raise EParseError.Create('ParserproductionSystemTypes053: expected token at pos '+IntToStr(Pos));
  Result := i + (53 mod 2);
end;

function LexerruleSystemTypes054(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleSystemTypes054: unknown lexer state');
  end;
  Result := Result xor (54 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveSystemTypes055(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveSystemTypes055: negative N');
  if N = 0 then Exit(17);
  if N = 1 then Exit(17+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 6;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveSystemTypes055: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 55;
end;

function RecordopSystemTypes056(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopSystemTypes056: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 56;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodSystemTypes057(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 57;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodSystemTypes057: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 57;
end;

function InterfaceimplSystemTypes058(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplSystemTypes058: zero id');
  H := Id xor UInt64(58 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 8;
end;

function ArithmeticSystemTypes059(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticSystemTypes059: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(59) shl 3)
  else
    Tmp := Tmp + 7;
  Result := Tmp;
end;

function ValidationSystemTypes060(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationSystemTypes060: invalid bounds');
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

function SerializationSystemTypes061(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationSystemTypes061: buf bounds');
  U := UInt32(Value) xor UInt32(61 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationSystemTypes062(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationSystemTypes062: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(62 shl 8);
  Result := Int32(U);
end;

function HashingSystemTypes063(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(63 * 2654435761);
  for i := Low(Data) to High(Data) do
  begin
    H := H xor Data[i];
    H := H * 16777619;
    H := (H shl 13) or (H shr 19);
    H := H xor (H shr 16);
  end;
  H := H xor (H shr 13);
  H := H * 1274126177;
  Result := H xor UInt32(Length(Data) * 9);
end;

function CollectionopSystemTypes064(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopSystemTypes064: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopSystemTypes064: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopSystemTypes064: sentinel value');
    Sum := Sum + (Arr[i] xor 64);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 64;
end;

function StatetransitionSystemTypes065(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 65) mod 5;
  else
    raise EStateError.Create('StatetransitionSystemTypes065: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionSystemTypes065: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerSystemTypes066(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 6;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerSystemTypes066: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerSystemTypes066: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 66;
end;

procedure MemoryopSystemTypes067(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopSystemTypes067: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopSystemTypes067: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(67)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopSystemTypes068(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopSystemTypes068: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((68+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (68 mod 3);
end;

function ProtocolopSystemTypes069(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopSystemTypes069: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopSystemTypes069: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(69 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopSystemTypes070(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopSystemTypes070: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(70) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropSystemTypes071(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropSystemTypes071: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropSystemTypes071: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropSystemTypes071: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 71;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopSystemTypes072(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopSystemTypes072: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 72;
    1: Res := Operand xor Int64(72 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopSystemTypes072: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopSystemTypes072: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionSystemTypes073(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionSystemTypes073: pos out of range');
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
    raise EParseError.Create('ParserproductionSystemTypes073: expected token at pos '+IntToStr(Pos));
  Result := i + (73 mod 2);
end;

function LexerruleSystemTypes074(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleSystemTypes074: unknown lexer state');
  end;
  Result := Result xor (74 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveSystemTypes075(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveSystemTypes075: negative N');
  if N = 0 then Exit(18);
  if N = 1 then Exit(18+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 5;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveSystemTypes075: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 75;
end;

function RecordopSystemTypes076(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopSystemTypes076: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 76;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodSystemTypes077(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 77;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodSystemTypes077: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 77;
end;

function InterfaceimplSystemTypes078(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplSystemTypes078: zero id');
  H := Id xor UInt64(78 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 11;
end;

function ArithmeticSystemTypes079(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticSystemTypes079: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(79) shl 3)
  else
    Tmp := Tmp + 1;
  Result := Tmp;
end;

function ValidationSystemTypes080(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationSystemTypes080: invalid bounds');
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


end.


