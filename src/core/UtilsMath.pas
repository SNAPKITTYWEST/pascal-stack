{ Unit: UtilsMath }
{ Title: UtilsMath }
{ Description: Math utilities }
{ Dependencies: SystemTypes, MathPrimitives }
{ Blocks: 79 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit UtilsMath;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, MathPrimitives;

  // internal dependencies: SystemTypes, MathPrimitives

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function ParserproductionUtilsMath001(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleUtilsMath002(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveUtilsMath003(N: Integer): Int64;
  function RecordopUtilsMath004(X, Y, Z: Integer): Integer;
  procedure ClassmethodUtilsMath005(var Counter: Integer; Delta: Integer);
  function InterfaceimplUtilsMath006(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticUtilsMath007(A, B: Int64): Int64;
  function ValidationUtilsMath008(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationUtilsMath009(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationUtilsMath010(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingUtilsMath011(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopUtilsMath012(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionUtilsMath013(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerUtilsMath014(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopUtilsMath015(var Buf: array of Byte; Offset, Count: Integer);
  function IoopUtilsMath016(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopUtilsMath017(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopUtilsMath018(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropUtilsMath019(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopUtilsMath020(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionUtilsMath021(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleUtilsMath022(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveUtilsMath023(N: Integer): Int64;
  function RecordopUtilsMath024(X, Y, Z: Integer): Integer;
  procedure ClassmethodUtilsMath025(var Counter: Integer; Delta: Integer);
  function InterfaceimplUtilsMath026(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticUtilsMath027(A, B: Int64): Int64;
  function ValidationUtilsMath028(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationUtilsMath029(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationUtilsMath030(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingUtilsMath031(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopUtilsMath032(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionUtilsMath033(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerUtilsMath034(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopUtilsMath035(var Buf: array of Byte; Offset, Count: Integer);
  function IoopUtilsMath036(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopUtilsMath037(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopUtilsMath038(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropUtilsMath039(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopUtilsMath040(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionUtilsMath041(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleUtilsMath042(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveUtilsMath043(N: Integer): Int64;
  function RecordopUtilsMath044(X, Y, Z: Integer): Integer;
  procedure ClassmethodUtilsMath045(var Counter: Integer; Delta: Integer);
  function InterfaceimplUtilsMath046(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticUtilsMath047(A, B: Int64): Int64;
  function ValidationUtilsMath048(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationUtilsMath049(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationUtilsMath050(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingUtilsMath051(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopUtilsMath052(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionUtilsMath053(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerUtilsMath054(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopUtilsMath055(var Buf: array of Byte; Offset, Count: Integer);
  function IoopUtilsMath056(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopUtilsMath057(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopUtilsMath058(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropUtilsMath059(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopUtilsMath060(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionUtilsMath061(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleUtilsMath062(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveUtilsMath063(N: Integer): Int64;
  function RecordopUtilsMath064(X, Y, Z: Integer): Integer;
  procedure ClassmethodUtilsMath065(var Counter: Integer; Delta: Integer);
  function InterfaceimplUtilsMath066(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticUtilsMath067(A, B: Int64): Int64;
  function ValidationUtilsMath068(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationUtilsMath069(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationUtilsMath070(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingUtilsMath071(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopUtilsMath072(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionUtilsMath073(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerUtilsMath074(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopUtilsMath075(var Buf: array of Byte; Offset, Count: Integer);
  function IoopUtilsMath076(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopUtilsMath077(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopUtilsMath078(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropUtilsMath079(Priority, Age, Deadline: Integer): Integer;

implementation

function ParserproductionUtilsMath001(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionUtilsMath001: pos out of range');
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
    raise EParseError.Create('ParserproductionUtilsMath001: expected token at pos '+IntToStr(Pos));
  Result := i + (1 mod 2);
end;

function LexerruleUtilsMath002(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleUtilsMath002: unknown lexer state');
  end;
  Result := Result xor (2 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveUtilsMath003(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveUtilsMath003: negative N');
  if N = 0 then Exit(3);
  if N = 1 then Exit(3+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 3;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveUtilsMath003: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 3;
end;

function RecordopUtilsMath004(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopUtilsMath004: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 4;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodUtilsMath005(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 5;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodUtilsMath005: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 5;
end;

function InterfaceimplUtilsMath006(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplUtilsMath006: zero id');
  H := Id xor UInt64(6 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 7;
end;

function ArithmeticUtilsMath007(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticUtilsMath007: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(7) shl 3)
  else
    Tmp := Tmp + 7;
  Result := Tmp;
end;

function ValidationUtilsMath008(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationUtilsMath008: invalid bounds');
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

function SerializationUtilsMath009(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationUtilsMath009: buf bounds');
  U := UInt32(Value) xor UInt32(9 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationUtilsMath010(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationUtilsMath010: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(10 shl 8);
  Result := Int32(U);
end;

function HashingUtilsMath011(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(11 * 2654435761);
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

function CollectionopUtilsMath012(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopUtilsMath012: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopUtilsMath012: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopUtilsMath012: sentinel value');
    Sum := Sum + (Arr[i] xor 12);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 12;
end;

function StatetransitionUtilsMath013(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 13) mod 5;
  else
    raise EStateError.Create('StatetransitionUtilsMath013: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionUtilsMath013: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerUtilsMath014(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 4;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerUtilsMath014: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerUtilsMath014: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 14;
end;

procedure MemoryopUtilsMath015(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopUtilsMath015: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopUtilsMath015: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(15)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopUtilsMath016(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopUtilsMath016: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((16+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (16 mod 3);
end;

function ProtocolopUtilsMath017(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopUtilsMath017: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopUtilsMath017: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(17 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopUtilsMath018(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopUtilsMath018: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(18) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropUtilsMath019(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropUtilsMath019: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropUtilsMath019: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropUtilsMath019: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 19;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopUtilsMath020(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopUtilsMath020: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 20;
    1: Res := Operand xor Int64(20 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopUtilsMath020: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopUtilsMath020: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionUtilsMath021(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionUtilsMath021: pos out of range');
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
    raise EParseError.Create('ParserproductionUtilsMath021: expected token at pos '+IntToStr(Pos));
  Result := i + (21 mod 2);
end;

function LexerruleUtilsMath022(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleUtilsMath022: unknown lexer state');
  end;
  Result := Result xor (22 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveUtilsMath023(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveUtilsMath023: negative N');
  if N = 0 then Exit(4);
  if N = 1 then Exit(4+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 2;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveUtilsMath023: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 23;
end;

function RecordopUtilsMath024(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopUtilsMath024: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 24;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodUtilsMath025(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 25;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodUtilsMath025: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 25;
end;

function InterfaceimplUtilsMath026(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplUtilsMath026: zero id');
  H := Id xor UInt64(26 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 10;
end;

function ArithmeticUtilsMath027(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticUtilsMath027: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(27) shl 3)
  else
    Tmp := Tmp + 1;
  Result := Tmp;
end;

function ValidationUtilsMath028(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationUtilsMath028: invalid bounds');
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

function SerializationUtilsMath029(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationUtilsMath029: buf bounds');
  U := UInt32(Value) xor UInt32(29 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationUtilsMath030(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationUtilsMath030: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(30 shl 8);
  Result := Int32(U);
end;

function HashingUtilsMath031(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(31 * 2654435761);
  for i := Low(Data) to High(Data) do
  begin
    H := H xor Data[i];
    H := H * 16777619;
    H := (H shl 13) or (H shr 19);
    H := H xor (H shr 16);
  end;
  H := H xor (H shr 13);
  H := H * 1274126177;
  Result := H xor UInt32(Length(Data) * 10);
end;

function CollectionopUtilsMath032(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopUtilsMath032: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopUtilsMath032: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopUtilsMath032: sentinel value');
    Sum := Sum + (Arr[i] xor 32);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 32;
end;

function StatetransitionUtilsMath033(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 33) mod 5;
  else
    raise EStateError.Create('StatetransitionUtilsMath033: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionUtilsMath033: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerUtilsMath034(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 4;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerUtilsMath034: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerUtilsMath034: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 34;
end;

procedure MemoryopUtilsMath035(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopUtilsMath035: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopUtilsMath035: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(35)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopUtilsMath036(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopUtilsMath036: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((36+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (36 mod 3);
end;

function ProtocolopUtilsMath037(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopUtilsMath037: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopUtilsMath037: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(37 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopUtilsMath038(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopUtilsMath038: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(38) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropUtilsMath039(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropUtilsMath039: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropUtilsMath039: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropUtilsMath039: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 39;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopUtilsMath040(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopUtilsMath040: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 40;
    1: Res := Operand xor Int64(40 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopUtilsMath040: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopUtilsMath040: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionUtilsMath041(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionUtilsMath041: pos out of range');
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
    raise EParseError.Create('ParserproductionUtilsMath041: expected token at pos '+IntToStr(Pos));
  Result := i + (41 mod 2);
end;

function LexerruleUtilsMath042(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleUtilsMath042: unknown lexer state');
  end;
  Result := Result xor (42 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveUtilsMath043(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveUtilsMath043: negative N');
  if N = 0 then Exit(5);
  if N = 1 then Exit(5+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 1;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveUtilsMath043: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 43;
end;

function RecordopUtilsMath044(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopUtilsMath044: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 44;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodUtilsMath045(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 45;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodUtilsMath045: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 45;
end;

function InterfaceimplUtilsMath046(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplUtilsMath046: zero id');
  H := Id xor UInt64(46 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 13;
end;

function ArithmeticUtilsMath047(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticUtilsMath047: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(47) shl 3)
  else
    Tmp := Tmp + 8;
  Result := Tmp;
end;

function ValidationUtilsMath048(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationUtilsMath048: invalid bounds');
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

function SerializationUtilsMath049(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationUtilsMath049: buf bounds');
  U := UInt32(Value) xor UInt32(49 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationUtilsMath050(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationUtilsMath050: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(50 shl 8);
  Result := Int32(U);
end;

function HashingUtilsMath051(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(51 * 2654435761);
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

function CollectionopUtilsMath052(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopUtilsMath052: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopUtilsMath052: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopUtilsMath052: sentinel value');
    Sum := Sum + (Arr[i] xor 52);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 52;
end;

function StatetransitionUtilsMath053(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 53) mod 5;
  else
    raise EStateError.Create('StatetransitionUtilsMath053: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionUtilsMath053: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerUtilsMath054(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 4;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerUtilsMath054: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerUtilsMath054: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 54;
end;

procedure MemoryopUtilsMath055(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopUtilsMath055: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopUtilsMath055: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(55)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopUtilsMath056(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopUtilsMath056: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((56+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (56 mod 3);
end;

function ProtocolopUtilsMath057(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopUtilsMath057: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopUtilsMath057: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(57 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopUtilsMath058(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopUtilsMath058: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(58) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropUtilsMath059(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropUtilsMath059: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropUtilsMath059: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropUtilsMath059: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 59;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopUtilsMath060(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopUtilsMath060: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 60;
    1: Res := Operand xor Int64(60 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopUtilsMath060: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopUtilsMath060: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionUtilsMath061(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionUtilsMath061: pos out of range');
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
    raise EParseError.Create('ParserproductionUtilsMath061: expected token at pos '+IntToStr(Pos));
  Result := i + (61 mod 2);
end;

function LexerruleUtilsMath062(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleUtilsMath062: unknown lexer state');
  end;
  Result := Result xor (62 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveUtilsMath063(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveUtilsMath063: negative N');
  if N = 0 then Exit(6);
  if N = 1 then Exit(6+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 0;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveUtilsMath063: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 63;
end;

function RecordopUtilsMath064(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopUtilsMath064: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 64;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodUtilsMath065(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 65;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodUtilsMath065: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 65;
end;

function InterfaceimplUtilsMath066(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplUtilsMath066: zero id');
  H := Id xor UInt64(66 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 16;
end;

function ArithmeticUtilsMath067(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticUtilsMath067: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(67) shl 3)
  else
    Tmp := Tmp + 2;
  Result := Tmp;
end;

function ValidationUtilsMath068(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationUtilsMath068: invalid bounds');
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

function SerializationUtilsMath069(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationUtilsMath069: buf bounds');
  U := UInt32(Value) xor UInt32(69 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationUtilsMath070(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationUtilsMath070: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(70 shl 8);
  Result := Int32(U);
end;

function HashingUtilsMath071(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(71 * 2654435761);
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

function CollectionopUtilsMath072(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopUtilsMath072: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopUtilsMath072: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopUtilsMath072: sentinel value');
    Sum := Sum + (Arr[i] xor 72);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 72;
end;

function StatetransitionUtilsMath073(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 73) mod 5;
  else
    raise EStateError.Create('StatetransitionUtilsMath073: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionUtilsMath073: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerUtilsMath074(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 4;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerUtilsMath074: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerUtilsMath074: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 74;
end;

procedure MemoryopUtilsMath075(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopUtilsMath075: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopUtilsMath075: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(75)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopUtilsMath076(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopUtilsMath076: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((76+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (76 mod 3);
end;

function ProtocolopUtilsMath077(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopUtilsMath077: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopUtilsMath077: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(77 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopUtilsMath078(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopUtilsMath078: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(78) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropUtilsMath079(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropUtilsMath079: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropUtilsMath079: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropUtilsMath079: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 79;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;


end.


