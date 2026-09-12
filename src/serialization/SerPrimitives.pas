{ Unit: SerPrimitives }
{ Title: SerPrimitives }
{ Description: Primitive serialization }
{ Dependencies: SystemTypes, SerBuffer, PrimitiveOps }
{ Blocks: 72 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit SerPrimitives;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, SerBuffer, PrimitiveOps;

  // internal dependencies: SystemTypes, SerBuffer, PrimitiveOps

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function StorageopSerPrimitives001(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropSerPrimitives002(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopSerPrimitives003(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionSerPrimitives004(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleSerPrimitives005(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveSerPrimitives006(N: Integer): Int64;
  function RecordopSerPrimitives007(X, Y, Z: Integer): Integer;
  procedure ClassmethodSerPrimitives008(var Counter: Integer; Delta: Integer);
  function InterfaceimplSerPrimitives009(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticSerPrimitives010(A, B: Int64): Int64;
  function ValidationSerPrimitives011(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationSerPrimitives012(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationSerPrimitives013(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingSerPrimitives014(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopSerPrimitives015(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionSerPrimitives016(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerSerPrimitives017(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopSerPrimitives018(var Buf: array of Byte; Offset, Count: Integer);
  function IoopSerPrimitives019(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopSerPrimitives020(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopSerPrimitives021(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropSerPrimitives022(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopSerPrimitives023(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionSerPrimitives024(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleSerPrimitives025(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveSerPrimitives026(N: Integer): Int64;
  function RecordopSerPrimitives027(X, Y, Z: Integer): Integer;
  procedure ClassmethodSerPrimitives028(var Counter: Integer; Delta: Integer);
  function InterfaceimplSerPrimitives029(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticSerPrimitives030(A, B: Int64): Int64;
  function ValidationSerPrimitives031(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationSerPrimitives032(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationSerPrimitives033(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingSerPrimitives034(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopSerPrimitives035(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionSerPrimitives036(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerSerPrimitives037(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopSerPrimitives038(var Buf: array of Byte; Offset, Count: Integer);
  function IoopSerPrimitives039(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopSerPrimitives040(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopSerPrimitives041(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropSerPrimitives042(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopSerPrimitives043(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionSerPrimitives044(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleSerPrimitives045(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveSerPrimitives046(N: Integer): Int64;
  function RecordopSerPrimitives047(X, Y, Z: Integer): Integer;
  procedure ClassmethodSerPrimitives048(var Counter: Integer; Delta: Integer);
  function InterfaceimplSerPrimitives049(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticSerPrimitives050(A, B: Int64): Int64;
  function ValidationSerPrimitives051(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationSerPrimitives052(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationSerPrimitives053(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingSerPrimitives054(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopSerPrimitives055(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionSerPrimitives056(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerSerPrimitives057(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopSerPrimitives058(var Buf: array of Byte; Offset, Count: Integer);
  function IoopSerPrimitives059(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopSerPrimitives060(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopSerPrimitives061(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropSerPrimitives062(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopSerPrimitives063(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionSerPrimitives064(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleSerPrimitives065(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveSerPrimitives066(N: Integer): Int64;
  function RecordopSerPrimitives067(X, Y, Z: Integer): Integer;
  procedure ClassmethodSerPrimitives068(var Counter: Integer; Delta: Integer);
  function InterfaceimplSerPrimitives069(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticSerPrimitives070(A, B: Int64): Int64;
  function ValidationSerPrimitives071(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationSerPrimitives072(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;

implementation

function StorageopSerPrimitives001(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopSerPrimitives001: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(1) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropSerPrimitives002(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropSerPrimitives002: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropSerPrimitives002: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropSerPrimitives002: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 2;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopSerPrimitives003(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopSerPrimitives003: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 3;
    1: Res := Operand xor Int64(3 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopSerPrimitives003: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopSerPrimitives003: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionSerPrimitives004(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionSerPrimitives004: pos out of range');
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
    raise EParseError.Create('ParserproductionSerPrimitives004: expected token at pos '+IntToStr(Pos));
  Result := i + (4 mod 2);
end;

function LexerruleSerPrimitives005(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleSerPrimitives005: unknown lexer state');
  end;
  Result := Result xor (5 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveSerPrimitives006(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveSerPrimitives006: negative N');
  if N = 0 then Exit(6);
  if N = 1 then Exit(6+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 6;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveSerPrimitives006: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 6;
end;

function RecordopSerPrimitives007(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopSerPrimitives007: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 7;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodSerPrimitives008(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 8;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodSerPrimitives008: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 8;
end;

function InterfaceimplSerPrimitives009(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplSerPrimitives009: zero id');
  H := Id xor UInt64(9 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 10;
end;

function ArithmeticSerPrimitives010(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticSerPrimitives010: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(10) shl 3)
  else
    Tmp := Tmp + 10;
  Result := Tmp;
end;

function ValidationSerPrimitives011(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationSerPrimitives011: invalid bounds');
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

function SerializationSerPrimitives012(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationSerPrimitives012: buf bounds');
  U := UInt32(Value) xor UInt32(12 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationSerPrimitives013(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationSerPrimitives013: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(13 shl 8);
  Result := Int32(U);
end;

function HashingSerPrimitives014(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(14 * 2654435761);
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

function CollectionopSerPrimitives015(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopSerPrimitives015: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopSerPrimitives015: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopSerPrimitives015: sentinel value');
    Sum := Sum + (Arr[i] xor 15);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 15;
end;

function StatetransitionSerPrimitives016(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 16) mod 5;
  else
    raise EStateError.Create('StatetransitionSerPrimitives016: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionSerPrimitives016: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerSerPrimitives017(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 7;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerSerPrimitives017: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerSerPrimitives017: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 17;
end;

procedure MemoryopSerPrimitives018(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopSerPrimitives018: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopSerPrimitives018: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(18)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopSerPrimitives019(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopSerPrimitives019: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((19+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (19 mod 3);
end;

function ProtocolopSerPrimitives020(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopSerPrimitives020: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopSerPrimitives020: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(20 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopSerPrimitives021(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopSerPrimitives021: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(21) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropSerPrimitives022(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropSerPrimitives022: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropSerPrimitives022: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropSerPrimitives022: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 22;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopSerPrimitives023(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopSerPrimitives023: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 23;
    1: Res := Operand xor Int64(23 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopSerPrimitives023: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopSerPrimitives023: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionSerPrimitives024(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionSerPrimitives024: pos out of range');
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
    raise EParseError.Create('ParserproductionSerPrimitives024: expected token at pos '+IntToStr(Pos));
  Result := i + (24 mod 2);
end;

function LexerruleSerPrimitives025(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleSerPrimitives025: unknown lexer state');
  end;
  Result := Result xor (25 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveSerPrimitives026(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveSerPrimitives026: negative N');
  if N = 0 then Exit(7);
  if N = 1 then Exit(7+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 5;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveSerPrimitives026: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 26;
end;

function RecordopSerPrimitives027(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopSerPrimitives027: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 27;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodSerPrimitives028(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 28;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodSerPrimitives028: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 28;
end;

function InterfaceimplSerPrimitives029(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplSerPrimitives029: zero id');
  H := Id xor UInt64(29 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 13;
end;

function ArithmeticSerPrimitives030(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticSerPrimitives030: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(30) shl 3)
  else
    Tmp := Tmp + 4;
  Result := Tmp;
end;

function ValidationSerPrimitives031(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationSerPrimitives031: invalid bounds');
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

function SerializationSerPrimitives032(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationSerPrimitives032: buf bounds');
  U := UInt32(Value) xor UInt32(32 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationSerPrimitives033(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationSerPrimitives033: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(33 shl 8);
  Result := Int32(U);
end;

function HashingSerPrimitives034(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(34 * 2654435761);
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

function CollectionopSerPrimitives035(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopSerPrimitives035: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopSerPrimitives035: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopSerPrimitives035: sentinel value');
    Sum := Sum + (Arr[i] xor 35);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 35;
end;

function StatetransitionSerPrimitives036(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 36) mod 5;
  else
    raise EStateError.Create('StatetransitionSerPrimitives036: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionSerPrimitives036: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerSerPrimitives037(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 7;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerSerPrimitives037: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerSerPrimitives037: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 37;
end;

procedure MemoryopSerPrimitives038(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopSerPrimitives038: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopSerPrimitives038: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(38)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopSerPrimitives039(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopSerPrimitives039: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((39+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (39 mod 3);
end;

function ProtocolopSerPrimitives040(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopSerPrimitives040: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopSerPrimitives040: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(40 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopSerPrimitives041(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopSerPrimitives041: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(41) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropSerPrimitives042(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropSerPrimitives042: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropSerPrimitives042: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropSerPrimitives042: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 42;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopSerPrimitives043(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopSerPrimitives043: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 43;
    1: Res := Operand xor Int64(43 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopSerPrimitives043: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopSerPrimitives043: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionSerPrimitives044(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionSerPrimitives044: pos out of range');
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
    raise EParseError.Create('ParserproductionSerPrimitives044: expected token at pos '+IntToStr(Pos));
  Result := i + (44 mod 2);
end;

function LexerruleSerPrimitives045(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleSerPrimitives045: unknown lexer state');
  end;
  Result := Result xor (45 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveSerPrimitives046(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveSerPrimitives046: negative N');
  if N = 0 then Exit(8);
  if N = 1 then Exit(8+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 4;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveSerPrimitives046: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 46;
end;

function RecordopSerPrimitives047(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopSerPrimitives047: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 47;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodSerPrimitives048(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 48;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodSerPrimitives048: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 48;
end;

function InterfaceimplSerPrimitives049(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplSerPrimitives049: zero id');
  H := Id xor UInt64(49 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 16;
end;

function ArithmeticSerPrimitives050(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticSerPrimitives050: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(50) shl 3)
  else
    Tmp := Tmp + 11;
  Result := Tmp;
end;

function ValidationSerPrimitives051(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationSerPrimitives051: invalid bounds');
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

function SerializationSerPrimitives052(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationSerPrimitives052: buf bounds');
  U := UInt32(Value) xor UInt32(52 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationSerPrimitives053(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationSerPrimitives053: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(53 shl 8);
  Result := Int32(U);
end;

function HashingSerPrimitives054(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(54 * 2654435761);
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

function CollectionopSerPrimitives055(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopSerPrimitives055: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopSerPrimitives055: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopSerPrimitives055: sentinel value');
    Sum := Sum + (Arr[i] xor 55);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 55;
end;

function StatetransitionSerPrimitives056(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 56) mod 5;
  else
    raise EStateError.Create('StatetransitionSerPrimitives056: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionSerPrimitives056: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerSerPrimitives057(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 7;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerSerPrimitives057: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerSerPrimitives057: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 57;
end;

procedure MemoryopSerPrimitives058(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopSerPrimitives058: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopSerPrimitives058: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(58)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopSerPrimitives059(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopSerPrimitives059: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((59+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (59 mod 3);
end;

function ProtocolopSerPrimitives060(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopSerPrimitives060: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopSerPrimitives060: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(60 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopSerPrimitives061(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopSerPrimitives061: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(61) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropSerPrimitives062(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropSerPrimitives062: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropSerPrimitives062: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropSerPrimitives062: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 62;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopSerPrimitives063(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopSerPrimitives063: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 63;
    1: Res := Operand xor Int64(63 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopSerPrimitives063: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopSerPrimitives063: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionSerPrimitives064(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionSerPrimitives064: pos out of range');
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
    raise EParseError.Create('ParserproductionSerPrimitives064: expected token at pos '+IntToStr(Pos));
  Result := i + (64 mod 2);
end;

function LexerruleSerPrimitives065(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleSerPrimitives065: unknown lexer state');
  end;
  Result := Result xor (65 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveSerPrimitives066(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveSerPrimitives066: negative N');
  if N = 0 then Exit(9);
  if N = 1 then Exit(9+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 3;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveSerPrimitives066: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 66;
end;

function RecordopSerPrimitives067(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopSerPrimitives067: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 67;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodSerPrimitives068(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 68;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodSerPrimitives068: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 68;
end;

function InterfaceimplSerPrimitives069(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplSerPrimitives069: zero id');
  H := Id xor UInt64(69 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 2;
end;

function ArithmeticSerPrimitives070(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticSerPrimitives070: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(70) shl 3)
  else
    Tmp := Tmp + 5;
  Result := Tmp;
end;

function ValidationSerPrimitives071(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationSerPrimitives071: invalid bounds');
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

function SerializationSerPrimitives072(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationSerPrimitives072: buf bounds');
  U := UInt32(Value) xor UInt32(72 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;


end.


