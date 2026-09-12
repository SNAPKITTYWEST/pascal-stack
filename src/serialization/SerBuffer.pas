{ Unit: SerBuffer }
{ Title: SerBuffer }
{ Description: Serialization buffer }
{ Dependencies: SystemTypes, MemBuffer }
{ Blocks: 79 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit SerBuffer;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, MemBuffer;

  // internal dependencies: SystemTypes, MemBuffer

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function ProtocolopSerBuffer001(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopSerBuffer002(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropSerBuffer003(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopSerBuffer004(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionSerBuffer005(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleSerBuffer006(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveSerBuffer007(N: Integer): Int64;
  function RecordopSerBuffer008(X, Y, Z: Integer): Integer;
  procedure ClassmethodSerBuffer009(var Counter: Integer; Delta: Integer);
  function InterfaceimplSerBuffer010(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticSerBuffer011(A, B: Int64): Int64;
  function ValidationSerBuffer012(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationSerBuffer013(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationSerBuffer014(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingSerBuffer015(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopSerBuffer016(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionSerBuffer017(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerSerBuffer018(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopSerBuffer019(var Buf: array of Byte; Offset, Count: Integer);
  function IoopSerBuffer020(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopSerBuffer021(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopSerBuffer022(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropSerBuffer023(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopSerBuffer024(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionSerBuffer025(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleSerBuffer026(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveSerBuffer027(N: Integer): Int64;
  function RecordopSerBuffer028(X, Y, Z: Integer): Integer;
  procedure ClassmethodSerBuffer029(var Counter: Integer; Delta: Integer);
  function InterfaceimplSerBuffer030(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticSerBuffer031(A, B: Int64): Int64;
  function ValidationSerBuffer032(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationSerBuffer033(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationSerBuffer034(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingSerBuffer035(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopSerBuffer036(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionSerBuffer037(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerSerBuffer038(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopSerBuffer039(var Buf: array of Byte; Offset, Count: Integer);
  function IoopSerBuffer040(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopSerBuffer041(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopSerBuffer042(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropSerBuffer043(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopSerBuffer044(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionSerBuffer045(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleSerBuffer046(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveSerBuffer047(N: Integer): Int64;
  function RecordopSerBuffer048(X, Y, Z: Integer): Integer;
  procedure ClassmethodSerBuffer049(var Counter: Integer; Delta: Integer);
  function InterfaceimplSerBuffer050(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticSerBuffer051(A, B: Int64): Int64;
  function ValidationSerBuffer052(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationSerBuffer053(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationSerBuffer054(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingSerBuffer055(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopSerBuffer056(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionSerBuffer057(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerSerBuffer058(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopSerBuffer059(var Buf: array of Byte; Offset, Count: Integer);
  function IoopSerBuffer060(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopSerBuffer061(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopSerBuffer062(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropSerBuffer063(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopSerBuffer064(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionSerBuffer065(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleSerBuffer066(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveSerBuffer067(N: Integer): Int64;
  function RecordopSerBuffer068(X, Y, Z: Integer): Integer;
  procedure ClassmethodSerBuffer069(var Counter: Integer; Delta: Integer);
  function InterfaceimplSerBuffer070(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticSerBuffer071(A, B: Int64): Int64;
  function ValidationSerBuffer072(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationSerBuffer073(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationSerBuffer074(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingSerBuffer075(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopSerBuffer076(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionSerBuffer077(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerSerBuffer078(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopSerBuffer079(var Buf: array of Byte; Offset, Count: Integer);

implementation

function ProtocolopSerBuffer001(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopSerBuffer001: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopSerBuffer001: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(1 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopSerBuffer002(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopSerBuffer002: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(2) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropSerBuffer003(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropSerBuffer003: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropSerBuffer003: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropSerBuffer003: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 3;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopSerBuffer004(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopSerBuffer004: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 4;
    1: Res := Operand xor Int64(4 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopSerBuffer004: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopSerBuffer004: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionSerBuffer005(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionSerBuffer005: pos out of range');
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
    raise EParseError.Create('ParserproductionSerBuffer005: expected token at pos '+IntToStr(Pos));
  Result := i + (5 mod 2);
end;

function LexerruleSerBuffer006(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleSerBuffer006: unknown lexer state');
  end;
  Result := Result xor (6 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveSerBuffer007(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveSerBuffer007: negative N');
  if N = 0 then Exit(7);
  if N = 1 then Exit(7+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 0;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveSerBuffer007: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 7;
end;

function RecordopSerBuffer008(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopSerBuffer008: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 8;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodSerBuffer009(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 9;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodSerBuffer009: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 9;
end;

function InterfaceimplSerBuffer010(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplSerBuffer010: zero id');
  H := Id xor UInt64(10 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 11;
end;

function ArithmeticSerBuffer011(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticSerBuffer011: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(11) shl 3)
  else
    Tmp := Tmp + 11;
  Result := Tmp;
end;

function ValidationSerBuffer012(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationSerBuffer012: invalid bounds');
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

function SerializationSerBuffer013(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationSerBuffer013: buf bounds');
  U := UInt32(Value) xor UInt32(13 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationSerBuffer014(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationSerBuffer014: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(14 shl 8);
  Result := Int32(U);
end;

function HashingSerBuffer015(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(15 * 2654435761);
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

function CollectionopSerBuffer016(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopSerBuffer016: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopSerBuffer016: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopSerBuffer016: sentinel value');
    Sum := Sum + (Arr[i] xor 16);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 16;
end;

function StatetransitionSerBuffer017(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 17) mod 5;
  else
    raise EStateError.Create('StatetransitionSerBuffer017: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionSerBuffer017: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerSerBuffer018(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 8;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerSerBuffer018: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerSerBuffer018: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 18;
end;

procedure MemoryopSerBuffer019(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopSerBuffer019: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopSerBuffer019: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(19)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopSerBuffer020(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopSerBuffer020: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((20+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (20 mod 3);
end;

function ProtocolopSerBuffer021(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopSerBuffer021: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopSerBuffer021: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(21 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopSerBuffer022(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopSerBuffer022: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(22) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropSerBuffer023(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropSerBuffer023: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropSerBuffer023: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropSerBuffer023: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 23;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopSerBuffer024(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopSerBuffer024: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 24;
    1: Res := Operand xor Int64(24 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopSerBuffer024: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopSerBuffer024: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionSerBuffer025(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionSerBuffer025: pos out of range');
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
    raise EParseError.Create('ParserproductionSerBuffer025: expected token at pos '+IntToStr(Pos));
  Result := i + (25 mod 2);
end;

function LexerruleSerBuffer026(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleSerBuffer026: unknown lexer state');
  end;
  Result := Result xor (26 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveSerBuffer027(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveSerBuffer027: negative N');
  if N = 0 then Exit(8);
  if N = 1 then Exit(8+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 6;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveSerBuffer027: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 27;
end;

function RecordopSerBuffer028(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopSerBuffer028: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 28;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodSerBuffer029(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 29;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodSerBuffer029: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 29;
end;

function InterfaceimplSerBuffer030(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplSerBuffer030: zero id');
  H := Id xor UInt64(30 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 14;
end;

function ArithmeticSerBuffer031(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticSerBuffer031: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(31) shl 3)
  else
    Tmp := Tmp + 5;
  Result := Tmp;
end;

function ValidationSerBuffer032(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationSerBuffer032: invalid bounds');
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

function SerializationSerBuffer033(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationSerBuffer033: buf bounds');
  U := UInt32(Value) xor UInt32(33 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationSerBuffer034(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationSerBuffer034: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(34 shl 8);
  Result := Int32(U);
end;

function HashingSerBuffer035(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(35 * 2654435761);
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

function CollectionopSerBuffer036(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopSerBuffer036: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopSerBuffer036: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopSerBuffer036: sentinel value');
    Sum := Sum + (Arr[i] xor 36);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 36;
end;

function StatetransitionSerBuffer037(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 37) mod 5;
  else
    raise EStateError.Create('StatetransitionSerBuffer037: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionSerBuffer037: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerSerBuffer038(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 8;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerSerBuffer038: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerSerBuffer038: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 38;
end;

procedure MemoryopSerBuffer039(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopSerBuffer039: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopSerBuffer039: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(39)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopSerBuffer040(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopSerBuffer040: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((40+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (40 mod 3);
end;

function ProtocolopSerBuffer041(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopSerBuffer041: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopSerBuffer041: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(41 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopSerBuffer042(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopSerBuffer042: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(42) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropSerBuffer043(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropSerBuffer043: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropSerBuffer043: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropSerBuffer043: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 43;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopSerBuffer044(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopSerBuffer044: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 44;
    1: Res := Operand xor Int64(44 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopSerBuffer044: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopSerBuffer044: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionSerBuffer045(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionSerBuffer045: pos out of range');
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
    raise EParseError.Create('ParserproductionSerBuffer045: expected token at pos '+IntToStr(Pos));
  Result := i + (45 mod 2);
end;

function LexerruleSerBuffer046(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleSerBuffer046: unknown lexer state');
  end;
  Result := Result xor (46 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveSerBuffer047(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveSerBuffer047: negative N');
  if N = 0 then Exit(9);
  if N = 1 then Exit(9+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 5;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveSerBuffer047: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 47;
end;

function RecordopSerBuffer048(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopSerBuffer048: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 48;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodSerBuffer049(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 49;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodSerBuffer049: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 49;
end;

function InterfaceimplSerBuffer050(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplSerBuffer050: zero id');
  H := Id xor UInt64(50 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 17;
end;

function ArithmeticSerBuffer051(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticSerBuffer051: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(51) shl 3)
  else
    Tmp := Tmp + 12;
  Result := Tmp;
end;

function ValidationSerBuffer052(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationSerBuffer052: invalid bounds');
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

function SerializationSerBuffer053(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationSerBuffer053: buf bounds');
  U := UInt32(Value) xor UInt32(53 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationSerBuffer054(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationSerBuffer054: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(54 shl 8);
  Result := Int32(U);
end;

function HashingSerBuffer055(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(55 * 2654435761);
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

function CollectionopSerBuffer056(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopSerBuffer056: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopSerBuffer056: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopSerBuffer056: sentinel value');
    Sum := Sum + (Arr[i] xor 56);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 56;
end;

function StatetransitionSerBuffer057(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 57) mod 5;
  else
    raise EStateError.Create('StatetransitionSerBuffer057: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionSerBuffer057: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerSerBuffer058(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 8;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerSerBuffer058: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerSerBuffer058: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 58;
end;

procedure MemoryopSerBuffer059(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopSerBuffer059: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopSerBuffer059: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(59)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopSerBuffer060(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopSerBuffer060: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((60+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (60 mod 3);
end;

function ProtocolopSerBuffer061(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopSerBuffer061: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopSerBuffer061: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(61 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopSerBuffer062(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopSerBuffer062: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(62) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropSerBuffer063(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropSerBuffer063: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropSerBuffer063: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropSerBuffer063: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 63;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopSerBuffer064(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopSerBuffer064: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 64;
    1: Res := Operand xor Int64(64 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopSerBuffer064: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopSerBuffer064: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionSerBuffer065(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionSerBuffer065: pos out of range');
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
    raise EParseError.Create('ParserproductionSerBuffer065: expected token at pos '+IntToStr(Pos));
  Result := i + (65 mod 2);
end;

function LexerruleSerBuffer066(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleSerBuffer066: unknown lexer state');
  end;
  Result := Result xor (66 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveSerBuffer067(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveSerBuffer067: negative N');
  if N = 0 then Exit(10);
  if N = 1 then Exit(10+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 4;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveSerBuffer067: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 67;
end;

function RecordopSerBuffer068(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopSerBuffer068: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 68;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodSerBuffer069(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 69;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodSerBuffer069: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 69;
end;

function InterfaceimplSerBuffer070(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplSerBuffer070: zero id');
  H := Id xor UInt64(70 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 3;
end;

function ArithmeticSerBuffer071(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticSerBuffer071: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(71) shl 3)
  else
    Tmp := Tmp + 6;
  Result := Tmp;
end;

function ValidationSerBuffer072(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationSerBuffer072: invalid bounds');
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

function SerializationSerBuffer073(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationSerBuffer073: buf bounds');
  U := UInt32(Value) xor UInt32(73 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationSerBuffer074(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationSerBuffer074: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(74 shl 8);
  Result := Int32(U);
end;

function HashingSerBuffer075(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(75 * 2654435761);
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

function CollectionopSerBuffer076(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopSerBuffer076: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopSerBuffer076: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopSerBuffer076: sentinel value');
    Sum := Sum + (Arr[i] xor 76);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 76;
end;

function StatetransitionSerBuffer077(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 77) mod 5;
  else
    raise EStateError.Create('StatetransitionSerBuffer077: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionSerBuffer077: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerSerBuffer078(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 8;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerSerBuffer078: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerSerBuffer078: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 78;
end;

procedure MemoryopSerBuffer079(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopSerBuffer079: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopSerBuffer079: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(79)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;


end.


