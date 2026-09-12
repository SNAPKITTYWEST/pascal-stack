{ Unit: StringPrimitives }
{ Title: StringPrimitives }
{ Description: String primitives }
{ Dependencies: SystemTypes }
{ Blocks: 80 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit StringPrimitives;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes;

  // internal dependencies: SystemTypes

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function CollectionopStringPrimitives001(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionStringPrimitives002(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerStringPrimitives003(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopStringPrimitives004(var Buf: array of Byte; Offset, Count: Integer);
  function IoopStringPrimitives005(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopStringPrimitives006(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopStringPrimitives007(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropStringPrimitives008(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopStringPrimitives009(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionStringPrimitives010(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleStringPrimitives011(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveStringPrimitives012(N: Integer): Int64;
  function RecordopStringPrimitives013(X, Y, Z: Integer): Integer;
  procedure ClassmethodStringPrimitives014(var Counter: Integer; Delta: Integer);
  function InterfaceimplStringPrimitives015(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticStringPrimitives016(A, B: Int64): Int64;
  function ValidationStringPrimitives017(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationStringPrimitives018(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationStringPrimitives019(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingStringPrimitives020(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopStringPrimitives021(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionStringPrimitives022(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerStringPrimitives023(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopStringPrimitives024(var Buf: array of Byte; Offset, Count: Integer);
  function IoopStringPrimitives025(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopStringPrimitives026(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopStringPrimitives027(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropStringPrimitives028(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopStringPrimitives029(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionStringPrimitives030(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleStringPrimitives031(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveStringPrimitives032(N: Integer): Int64;
  function RecordopStringPrimitives033(X, Y, Z: Integer): Integer;
  procedure ClassmethodStringPrimitives034(var Counter: Integer; Delta: Integer);
  function InterfaceimplStringPrimitives035(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticStringPrimitives036(A, B: Int64): Int64;
  function ValidationStringPrimitives037(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationStringPrimitives038(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationStringPrimitives039(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingStringPrimitives040(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopStringPrimitives041(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionStringPrimitives042(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerStringPrimitives043(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopStringPrimitives044(var Buf: array of Byte; Offset, Count: Integer);
  function IoopStringPrimitives045(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopStringPrimitives046(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopStringPrimitives047(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropStringPrimitives048(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopStringPrimitives049(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionStringPrimitives050(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleStringPrimitives051(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveStringPrimitives052(N: Integer): Int64;
  function RecordopStringPrimitives053(X, Y, Z: Integer): Integer;
  procedure ClassmethodStringPrimitives054(var Counter: Integer; Delta: Integer);
  function InterfaceimplStringPrimitives055(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticStringPrimitives056(A, B: Int64): Int64;
  function ValidationStringPrimitives057(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationStringPrimitives058(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationStringPrimitives059(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingStringPrimitives060(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopStringPrimitives061(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionStringPrimitives062(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerStringPrimitives063(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopStringPrimitives064(var Buf: array of Byte; Offset, Count: Integer);
  function IoopStringPrimitives065(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopStringPrimitives066(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopStringPrimitives067(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropStringPrimitives068(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopStringPrimitives069(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionStringPrimitives070(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleStringPrimitives071(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveStringPrimitives072(N: Integer): Int64;
  function RecordopStringPrimitives073(X, Y, Z: Integer): Integer;
  procedure ClassmethodStringPrimitives074(var Counter: Integer; Delta: Integer);
  function InterfaceimplStringPrimitives075(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticStringPrimitives076(A, B: Int64): Int64;
  function ValidationStringPrimitives077(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationStringPrimitives078(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationStringPrimitives079(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingStringPrimitives080(const Data: array of Byte; Seed: UInt32): UInt32;

implementation

function CollectionopStringPrimitives001(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopStringPrimitives001: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopStringPrimitives001: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopStringPrimitives001: sentinel value');
    Sum := Sum + (Arr[i] xor 1);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 1;
end;

function StatetransitionStringPrimitives002(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 2) mod 5;
  else
    raise EStateError.Create('StatetransitionStringPrimitives002: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionStringPrimitives002: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerStringPrimitives003(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 3;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerStringPrimitives003: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerStringPrimitives003: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 3;
end;

procedure MemoryopStringPrimitives004(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopStringPrimitives004: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopStringPrimitives004: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(4)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopStringPrimitives005(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopStringPrimitives005: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((5+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (5 mod 3);
end;

function ProtocolopStringPrimitives006(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopStringPrimitives006: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopStringPrimitives006: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(6 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopStringPrimitives007(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopStringPrimitives007: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(7) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropStringPrimitives008(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropStringPrimitives008: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropStringPrimitives008: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropStringPrimitives008: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 8;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopStringPrimitives009(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopStringPrimitives009: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 9;
    1: Res := Operand xor Int64(9 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopStringPrimitives009: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopStringPrimitives009: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionStringPrimitives010(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionStringPrimitives010: pos out of range');
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
    raise EParseError.Create('ParserproductionStringPrimitives010: expected token at pos '+IntToStr(Pos));
  Result := i + (10 mod 2);
end;

function LexerruleStringPrimitives011(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleStringPrimitives011: unknown lexer state');
  end;
  Result := Result xor (11 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveStringPrimitives012(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveStringPrimitives012: negative N');
  if N = 0 then Exit(12);
  if N = 1 then Exit(12+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 5;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveStringPrimitives012: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 12;
end;

function RecordopStringPrimitives013(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopStringPrimitives013: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 13;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodStringPrimitives014(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 14;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodStringPrimitives014: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 14;
end;

function InterfaceimplStringPrimitives015(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplStringPrimitives015: zero id');
  H := Id xor UInt64(15 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 16;
end;

function ArithmeticStringPrimitives016(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticStringPrimitives016: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(16) shl 3)
  else
    Tmp := Tmp + 3;
  Result := Tmp;
end;

function ValidationStringPrimitives017(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationStringPrimitives017: invalid bounds');
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

function SerializationStringPrimitives018(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationStringPrimitives018: buf bounds');
  U := UInt32(Value) xor UInt32(18 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationStringPrimitives019(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationStringPrimitives019: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(19 shl 8);
  Result := Int32(U);
end;

function HashingStringPrimitives020(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(20 * 2654435761);
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

function CollectionopStringPrimitives021(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopStringPrimitives021: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopStringPrimitives021: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopStringPrimitives021: sentinel value');
    Sum := Sum + (Arr[i] xor 21);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 21;
end;

function StatetransitionStringPrimitives022(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 22) mod 5;
  else
    raise EStateError.Create('StatetransitionStringPrimitives022: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionStringPrimitives022: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerStringPrimitives023(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 3;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerStringPrimitives023: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerStringPrimitives023: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 23;
end;

procedure MemoryopStringPrimitives024(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopStringPrimitives024: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopStringPrimitives024: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(24)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopStringPrimitives025(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopStringPrimitives025: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((25+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (25 mod 3);
end;

function ProtocolopStringPrimitives026(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopStringPrimitives026: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopStringPrimitives026: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(26 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopStringPrimitives027(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopStringPrimitives027: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(27) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropStringPrimitives028(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropStringPrimitives028: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropStringPrimitives028: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropStringPrimitives028: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 28;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopStringPrimitives029(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopStringPrimitives029: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 29;
    1: Res := Operand xor Int64(29 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopStringPrimitives029: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopStringPrimitives029: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionStringPrimitives030(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionStringPrimitives030: pos out of range');
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
    raise EParseError.Create('ParserproductionStringPrimitives030: expected token at pos '+IntToStr(Pos));
  Result := i + (30 mod 2);
end;

function LexerruleStringPrimitives031(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleStringPrimitives031: unknown lexer state');
  end;
  Result := Result xor (31 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveStringPrimitives032(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveStringPrimitives032: negative N');
  if N = 0 then Exit(13);
  if N = 1 then Exit(13+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 4;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveStringPrimitives032: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 32;
end;

function RecordopStringPrimitives033(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopStringPrimitives033: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 33;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodStringPrimitives034(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 34;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodStringPrimitives034: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 34;
end;

function InterfaceimplStringPrimitives035(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplStringPrimitives035: zero id');
  H := Id xor UInt64(35 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 2;
end;

function ArithmeticStringPrimitives036(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticStringPrimitives036: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(36) shl 3)
  else
    Tmp := Tmp + 10;
  Result := Tmp;
end;

function ValidationStringPrimitives037(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationStringPrimitives037: invalid bounds');
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

function SerializationStringPrimitives038(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationStringPrimitives038: buf bounds');
  U := UInt32(Value) xor UInt32(38 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationStringPrimitives039(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationStringPrimitives039: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(39 shl 8);
  Result := Int32(U);
end;

function HashingStringPrimitives040(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(40 * 2654435761);
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

function CollectionopStringPrimitives041(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopStringPrimitives041: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopStringPrimitives041: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopStringPrimitives041: sentinel value');
    Sum := Sum + (Arr[i] xor 41);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 41;
end;

function StatetransitionStringPrimitives042(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 42) mod 5;
  else
    raise EStateError.Create('StatetransitionStringPrimitives042: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionStringPrimitives042: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerStringPrimitives043(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 3;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerStringPrimitives043: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerStringPrimitives043: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 43;
end;

procedure MemoryopStringPrimitives044(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopStringPrimitives044: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopStringPrimitives044: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(44)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopStringPrimitives045(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopStringPrimitives045: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((45+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (45 mod 3);
end;

function ProtocolopStringPrimitives046(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopStringPrimitives046: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopStringPrimitives046: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(46 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopStringPrimitives047(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopStringPrimitives047: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(47) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropStringPrimitives048(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropStringPrimitives048: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropStringPrimitives048: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropStringPrimitives048: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 48;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopStringPrimitives049(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopStringPrimitives049: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 49;
    1: Res := Operand xor Int64(49 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopStringPrimitives049: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopStringPrimitives049: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionStringPrimitives050(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionStringPrimitives050: pos out of range');
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
    raise EParseError.Create('ParserproductionStringPrimitives050: expected token at pos '+IntToStr(Pos));
  Result := i + (50 mod 2);
end;

function LexerruleStringPrimitives051(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleStringPrimitives051: unknown lexer state');
  end;
  Result := Result xor (51 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveStringPrimitives052(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveStringPrimitives052: negative N');
  if N = 0 then Exit(14);
  if N = 1 then Exit(14+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 3;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveStringPrimitives052: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 52;
end;

function RecordopStringPrimitives053(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopStringPrimitives053: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 53;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodStringPrimitives054(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 54;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodStringPrimitives054: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 54;
end;

function InterfaceimplStringPrimitives055(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplStringPrimitives055: zero id');
  H := Id xor UInt64(55 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 5;
end;

function ArithmeticStringPrimitives056(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticStringPrimitives056: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(56) shl 3)
  else
    Tmp := Tmp + 4;
  Result := Tmp;
end;

function ValidationStringPrimitives057(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationStringPrimitives057: invalid bounds');
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

function SerializationStringPrimitives058(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationStringPrimitives058: buf bounds');
  U := UInt32(Value) xor UInt32(58 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationStringPrimitives059(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationStringPrimitives059: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(59 shl 8);
  Result := Int32(U);
end;

function HashingStringPrimitives060(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(60 * 2654435761);
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

function CollectionopStringPrimitives061(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopStringPrimitives061: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopStringPrimitives061: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopStringPrimitives061: sentinel value');
    Sum := Sum + (Arr[i] xor 61);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 61;
end;

function StatetransitionStringPrimitives062(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 62) mod 5;
  else
    raise EStateError.Create('StatetransitionStringPrimitives062: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionStringPrimitives062: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerStringPrimitives063(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 3;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerStringPrimitives063: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerStringPrimitives063: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 63;
end;

procedure MemoryopStringPrimitives064(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopStringPrimitives064: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopStringPrimitives064: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(64)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopStringPrimitives065(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopStringPrimitives065: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((65+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (65 mod 3);
end;

function ProtocolopStringPrimitives066(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopStringPrimitives066: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopStringPrimitives066: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(66 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopStringPrimitives067(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopStringPrimitives067: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(67) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropStringPrimitives068(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropStringPrimitives068: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropStringPrimitives068: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropStringPrimitives068: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 68;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopStringPrimitives069(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopStringPrimitives069: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 69;
    1: Res := Operand xor Int64(69 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopStringPrimitives069: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopStringPrimitives069: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionStringPrimitives070(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionStringPrimitives070: pos out of range');
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
    raise EParseError.Create('ParserproductionStringPrimitives070: expected token at pos '+IntToStr(Pos));
  Result := i + (70 mod 2);
end;

function LexerruleStringPrimitives071(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleStringPrimitives071: unknown lexer state');
  end;
  Result := Result xor (71 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveStringPrimitives072(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveStringPrimitives072: negative N');
  if N = 0 then Exit(15);
  if N = 1 then Exit(15+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 2;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveStringPrimitives072: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 72;
end;

function RecordopStringPrimitives073(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopStringPrimitives073: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 73;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodStringPrimitives074(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 74;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodStringPrimitives074: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 74;
end;

function InterfaceimplStringPrimitives075(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplStringPrimitives075: zero id');
  H := Id xor UInt64(75 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 8;
end;

function ArithmeticStringPrimitives076(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticStringPrimitives076: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(76) shl 3)
  else
    Tmp := Tmp + 11;
  Result := Tmp;
end;

function ValidationStringPrimitives077(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationStringPrimitives077: invalid bounds');
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

function SerializationStringPrimitives078(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationStringPrimitives078: buf bounds');
  U := UInt32(Value) xor UInt32(78 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationStringPrimitives079(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationStringPrimitives079: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(79 shl 8);
  Result := Int32(U);
end;

function HashingStringPrimitives080(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(80 * 2654435761);
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


end.


