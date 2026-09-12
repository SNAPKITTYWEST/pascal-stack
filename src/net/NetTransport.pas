{ Unit: NetTransport }
{ Title: NetTransport }
{ Description: Transport }
{ Dependencies: SystemTypes, NetProtocol, IoStream }
{ Blocks: 72 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit NetTransport;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, NetProtocol, IoStream;

  // internal dependencies: SystemTypes, NetProtocol, IoStream

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function RecordopNetTransport001(X, Y, Z: Integer): Integer;
  procedure ClassmethodNetTransport002(var Counter: Integer; Delta: Integer);
  function InterfaceimplNetTransport003(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticNetTransport004(A, B: Int64): Int64;
  function ValidationNetTransport005(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationNetTransport006(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationNetTransport007(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingNetTransport008(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopNetTransport009(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionNetTransport010(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerNetTransport011(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopNetTransport012(var Buf: array of Byte; Offset, Count: Integer);
  function IoopNetTransport013(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopNetTransport014(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopNetTransport015(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropNetTransport016(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopNetTransport017(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionNetTransport018(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleNetTransport019(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveNetTransport020(N: Integer): Int64;
  function RecordopNetTransport021(X, Y, Z: Integer): Integer;
  procedure ClassmethodNetTransport022(var Counter: Integer; Delta: Integer);
  function InterfaceimplNetTransport023(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticNetTransport024(A, B: Int64): Int64;
  function ValidationNetTransport025(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationNetTransport026(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationNetTransport027(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingNetTransport028(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopNetTransport029(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionNetTransport030(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerNetTransport031(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopNetTransport032(var Buf: array of Byte; Offset, Count: Integer);
  function IoopNetTransport033(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopNetTransport034(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopNetTransport035(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropNetTransport036(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopNetTransport037(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionNetTransport038(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleNetTransport039(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveNetTransport040(N: Integer): Int64;
  function RecordopNetTransport041(X, Y, Z: Integer): Integer;
  procedure ClassmethodNetTransport042(var Counter: Integer; Delta: Integer);
  function InterfaceimplNetTransport043(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticNetTransport044(A, B: Int64): Int64;
  function ValidationNetTransport045(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationNetTransport046(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationNetTransport047(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingNetTransport048(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopNetTransport049(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionNetTransport050(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerNetTransport051(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopNetTransport052(var Buf: array of Byte; Offset, Count: Integer);
  function IoopNetTransport053(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopNetTransport054(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopNetTransport055(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropNetTransport056(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopNetTransport057(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionNetTransport058(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleNetTransport059(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveNetTransport060(N: Integer): Int64;
  function RecordopNetTransport061(X, Y, Z: Integer): Integer;
  procedure ClassmethodNetTransport062(var Counter: Integer; Delta: Integer);
  function InterfaceimplNetTransport063(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticNetTransport064(A, B: Int64): Int64;
  function ValidationNetTransport065(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationNetTransport066(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationNetTransport067(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingNetTransport068(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopNetTransport069(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionNetTransport070(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerNetTransport071(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopNetTransport072(var Buf: array of Byte; Offset, Count: Integer);

implementation

function RecordopNetTransport001(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopNetTransport001: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 1;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodNetTransport002(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 2;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodNetTransport002: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 2;
end;

function InterfaceimplNetTransport003(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplNetTransport003: zero id');
  H := Id xor UInt64(3 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 4;
end;

function ArithmeticNetTransport004(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticNetTransport004: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(4) shl 3)
  else
    Tmp := Tmp + 4;
  Result := Tmp;
end;

function ValidationNetTransport005(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationNetTransport005: invalid bounds');
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

function SerializationNetTransport006(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationNetTransport006: buf bounds');
  U := UInt32(Value) xor UInt32(6 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationNetTransport007(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationNetTransport007: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(7 shl 8);
  Result := Int32(U);
end;

function HashingNetTransport008(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(8 * 2654435761);
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

function CollectionopNetTransport009(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopNetTransport009: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopNetTransport009: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopNetTransport009: sentinel value');
    Sum := Sum + (Arr[i] xor 9);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 9;
end;

function StatetransitionNetTransport010(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 10) mod 5;
  else
    raise EStateError.Create('StatetransitionNetTransport010: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionNetTransport010: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerNetTransport011(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerNetTransport011: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerNetTransport011: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 11;
end;

procedure MemoryopNetTransport012(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopNetTransport012: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopNetTransport012: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(12)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopNetTransport013(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopNetTransport013: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((13+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (13 mod 3);
end;

function ProtocolopNetTransport014(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopNetTransport014: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopNetTransport014: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(14 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopNetTransport015(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopNetTransport015: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(15) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropNetTransport016(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropNetTransport016: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropNetTransport016: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropNetTransport016: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 16;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopNetTransport017(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopNetTransport017: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 17;
    1: Res := Operand xor Int64(17 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopNetTransport017: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopNetTransport017: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionNetTransport018(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionNetTransport018: pos out of range');
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
    raise EParseError.Create('ParserproductionNetTransport018: expected token at pos '+IntToStr(Pos));
  Result := i + (18 mod 2);
end;

function LexerruleNetTransport019(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleNetTransport019: unknown lexer state');
  end;
  Result := Result xor (19 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveNetTransport020(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveNetTransport020: negative N');
  if N = 0 then Exit(1);
  if N = 1 then Exit(1+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 6;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveNetTransport020: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 20;
end;

function RecordopNetTransport021(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopNetTransport021: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 21;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodNetTransport022(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 22;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodNetTransport022: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 22;
end;

function InterfaceimplNetTransport023(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplNetTransport023: zero id');
  H := Id xor UInt64(23 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 7;
end;

function ArithmeticNetTransport024(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticNetTransport024: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(24) shl 3)
  else
    Tmp := Tmp + 11;
  Result := Tmp;
end;

function ValidationNetTransport025(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationNetTransport025: invalid bounds');
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

function SerializationNetTransport026(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationNetTransport026: buf bounds');
  U := UInt32(Value) xor UInt32(26 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationNetTransport027(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationNetTransport027: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(27 shl 8);
  Result := Int32(U);
end;

function HashingNetTransport028(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(28 * 2654435761);
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

function CollectionopNetTransport029(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopNetTransport029: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopNetTransport029: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopNetTransport029: sentinel value');
    Sum := Sum + (Arr[i] xor 29);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 29;
end;

function StatetransitionNetTransport030(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 30) mod 5;
  else
    raise EStateError.Create('StatetransitionNetTransport030: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionNetTransport030: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerNetTransport031(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerNetTransport031: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerNetTransport031: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 31;
end;

procedure MemoryopNetTransport032(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopNetTransport032: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopNetTransport032: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(32)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopNetTransport033(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopNetTransport033: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((33+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (33 mod 3);
end;

function ProtocolopNetTransport034(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopNetTransport034: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopNetTransport034: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(34 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopNetTransport035(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopNetTransport035: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(35) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropNetTransport036(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropNetTransport036: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropNetTransport036: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropNetTransport036: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 36;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopNetTransport037(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopNetTransport037: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 37;
    1: Res := Operand xor Int64(37 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopNetTransport037: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopNetTransport037: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionNetTransport038(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionNetTransport038: pos out of range');
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
    raise EParseError.Create('ParserproductionNetTransport038: expected token at pos '+IntToStr(Pos));
  Result := i + (38 mod 2);
end;

function LexerruleNetTransport039(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleNetTransport039: unknown lexer state');
  end;
  Result := Result xor (39 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveNetTransport040(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveNetTransport040: negative N');
  if N = 0 then Exit(2);
  if N = 1 then Exit(2+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 5;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveNetTransport040: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 40;
end;

function RecordopNetTransport041(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopNetTransport041: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 41;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodNetTransport042(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 42;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodNetTransport042: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 42;
end;

function InterfaceimplNetTransport043(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplNetTransport043: zero id');
  H := Id xor UInt64(43 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 10;
end;

function ArithmeticNetTransport044(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticNetTransport044: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(44) shl 3)
  else
    Tmp := Tmp + 5;
  Result := Tmp;
end;

function ValidationNetTransport045(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationNetTransport045: invalid bounds');
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

function SerializationNetTransport046(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationNetTransport046: buf bounds');
  U := UInt32(Value) xor UInt32(46 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationNetTransport047(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationNetTransport047: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(47 shl 8);
  Result := Int32(U);
end;

function HashingNetTransport048(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(48 * 2654435761);
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

function CollectionopNetTransport049(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopNetTransport049: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopNetTransport049: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopNetTransport049: sentinel value');
    Sum := Sum + (Arr[i] xor 49);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 49;
end;

function StatetransitionNetTransport050(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 50) mod 5;
  else
    raise EStateError.Create('StatetransitionNetTransport050: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionNetTransport050: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerNetTransport051(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerNetTransport051: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerNetTransport051: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 51;
end;

procedure MemoryopNetTransport052(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopNetTransport052: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopNetTransport052: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(52)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopNetTransport053(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopNetTransport053: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((53+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (53 mod 3);
end;

function ProtocolopNetTransport054(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopNetTransport054: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopNetTransport054: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(54 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopNetTransport055(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopNetTransport055: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(55) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropNetTransport056(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropNetTransport056: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropNetTransport056: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropNetTransport056: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 56;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopNetTransport057(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopNetTransport057: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 57;
    1: Res := Operand xor Int64(57 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopNetTransport057: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopNetTransport057: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionNetTransport058(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionNetTransport058: pos out of range');
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
    raise EParseError.Create('ParserproductionNetTransport058: expected token at pos '+IntToStr(Pos));
  Result := i + (58 mod 2);
end;

function LexerruleNetTransport059(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleNetTransport059: unknown lexer state');
  end;
  Result := Result xor (59 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveNetTransport060(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveNetTransport060: negative N');
  if N = 0 then Exit(3);
  if N = 1 then Exit(3+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 4;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveNetTransport060: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 60;
end;

function RecordopNetTransport061(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopNetTransport061: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 61;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodNetTransport062(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 62;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodNetTransport062: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 62;
end;

function InterfaceimplNetTransport063(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplNetTransport063: zero id');
  H := Id xor UInt64(63 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 13;
end;

function ArithmeticNetTransport064(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticNetTransport064: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(64) shl 3)
  else
    Tmp := Tmp + 12;
  Result := Tmp;
end;

function ValidationNetTransport065(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationNetTransport065: invalid bounds');
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

function SerializationNetTransport066(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationNetTransport066: buf bounds');
  U := UInt32(Value) xor UInt32(66 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationNetTransport067(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationNetTransport067: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(67 shl 8);
  Result := Int32(U);
end;

function HashingNetTransport068(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(68 * 2654435761);
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

function CollectionopNetTransport069(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopNetTransport069: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopNetTransport069: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopNetTransport069: sentinel value');
    Sum := Sum + (Arr[i] xor 69);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 69;
end;

function StatetransitionNetTransport070(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 70) mod 5;
  else
    raise EStateError.Create('StatetransitionNetTransport070: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionNetTransport070: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerNetTransport071(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerNetTransport071: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerNetTransport071: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 71;
end;

procedure MemoryopNetTransport072(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopNetTransport072: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopNetTransport072: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(72)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;


end.


