{ Unit: ParserExpr }
{ Title: ParserExpr }
{ Description: Expression parsing }
{ Dependencies: SystemTypes, ParserCore, AstNodes }
{ Blocks: 79 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit ParserExpr;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, ParserCore, AstNodes;

  // internal dependencies: SystemTypes, ParserCore, AstNodes

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  procedure ClassmethodParserExpr001(var Counter: Integer; Delta: Integer);
  function InterfaceimplParserExpr002(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticParserExpr003(A, B: Int64): Int64;
  function ValidationParserExpr004(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationParserExpr005(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationParserExpr006(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingParserExpr007(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopParserExpr008(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionParserExpr009(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerParserExpr010(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopParserExpr011(var Buf: array of Byte; Offset, Count: Integer);
  function IoopParserExpr012(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopParserExpr013(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopParserExpr014(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropParserExpr015(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopParserExpr016(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionParserExpr017(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleParserExpr018(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveParserExpr019(N: Integer): Int64;
  function RecordopParserExpr020(X, Y, Z: Integer): Integer;
  procedure ClassmethodParserExpr021(var Counter: Integer; Delta: Integer);
  function InterfaceimplParserExpr022(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticParserExpr023(A, B: Int64): Int64;
  function ValidationParserExpr024(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationParserExpr025(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationParserExpr026(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingParserExpr027(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopParserExpr028(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionParserExpr029(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerParserExpr030(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopParserExpr031(var Buf: array of Byte; Offset, Count: Integer);
  function IoopParserExpr032(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopParserExpr033(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopParserExpr034(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropParserExpr035(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopParserExpr036(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionParserExpr037(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleParserExpr038(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveParserExpr039(N: Integer): Int64;
  function RecordopParserExpr040(X, Y, Z: Integer): Integer;
  procedure ClassmethodParserExpr041(var Counter: Integer; Delta: Integer);
  function InterfaceimplParserExpr042(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticParserExpr043(A, B: Int64): Int64;
  function ValidationParserExpr044(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationParserExpr045(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationParserExpr046(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingParserExpr047(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopParserExpr048(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionParserExpr049(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerParserExpr050(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopParserExpr051(var Buf: array of Byte; Offset, Count: Integer);
  function IoopParserExpr052(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopParserExpr053(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopParserExpr054(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropParserExpr055(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopParserExpr056(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionParserExpr057(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleParserExpr058(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveParserExpr059(N: Integer): Int64;
  function RecordopParserExpr060(X, Y, Z: Integer): Integer;
  procedure ClassmethodParserExpr061(var Counter: Integer; Delta: Integer);
  function InterfaceimplParserExpr062(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticParserExpr063(A, B: Int64): Int64;
  function ValidationParserExpr064(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationParserExpr065(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationParserExpr066(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingParserExpr067(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopParserExpr068(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionParserExpr069(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerParserExpr070(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopParserExpr071(var Buf: array of Byte; Offset, Count: Integer);
  function IoopParserExpr072(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopParserExpr073(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopParserExpr074(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropParserExpr075(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopParserExpr076(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionParserExpr077(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleParserExpr078(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveParserExpr079(N: Integer): Int64;

implementation

procedure ClassmethodParserExpr001(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 1;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodParserExpr001: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 1;
end;

function InterfaceimplParserExpr002(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplParserExpr002: zero id');
  H := Id xor UInt64(2 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 3;
end;

function ArithmeticParserExpr003(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticParserExpr003: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(3) shl 3)
  else
    Tmp := Tmp + 3;
  Result := Tmp;
end;

function ValidationParserExpr004(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationParserExpr004: invalid bounds');
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

function SerializationParserExpr005(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationParserExpr005: buf bounds');
  U := UInt32(Value) xor UInt32(5 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationParserExpr006(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationParserExpr006: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(6 shl 8);
  Result := Int32(U);
end;

function HashingParserExpr007(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopParserExpr008(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopParserExpr008: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopParserExpr008: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopParserExpr008: sentinel value');
    Sum := Sum + (Arr[i] xor 8);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 8;
end;

function StatetransitionParserExpr009(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionParserExpr009: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionParserExpr009: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerParserExpr010(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 0;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerParserExpr010: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerParserExpr010: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 10;
end;

procedure MemoryopParserExpr011(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopParserExpr011: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopParserExpr011: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(11)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopParserExpr012(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopParserExpr012: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((12+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (12 mod 3);
end;

function ProtocolopParserExpr013(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopParserExpr013: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopParserExpr013: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(13 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopParserExpr014(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopParserExpr014: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(14) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropParserExpr015(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropParserExpr015: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropParserExpr015: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropParserExpr015: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 15;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopParserExpr016(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopParserExpr016: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 16;
    1: Res := Operand xor Int64(16 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopParserExpr016: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopParserExpr016: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionParserExpr017(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionParserExpr017: pos out of range');
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
    raise EParseError.Create('ParserproductionParserExpr017: expected token at pos '+IntToStr(Pos));
  Result := i + (17 mod 2);
end;

function LexerruleParserExpr018(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleParserExpr018: unknown lexer state');
  end;
  Result := Result xor (18 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveParserExpr019(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveParserExpr019: negative N');
  if N = 0 then Exit(0);
  if N = 1 then Exit(0+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 5;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveParserExpr019: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 19;
end;

function RecordopParserExpr020(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopParserExpr020: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 20;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodParserExpr021(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 21;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodParserExpr021: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 21;
end;

function InterfaceimplParserExpr022(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplParserExpr022: zero id');
  H := Id xor UInt64(22 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 6;
end;

function ArithmeticParserExpr023(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticParserExpr023: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(23) shl 3)
  else
    Tmp := Tmp + 10;
  Result := Tmp;
end;

function ValidationParserExpr024(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationParserExpr024: invalid bounds');
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

function SerializationParserExpr025(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationParserExpr025: buf bounds');
  U := UInt32(Value) xor UInt32(25 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationParserExpr026(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationParserExpr026: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(26 shl 8);
  Result := Int32(U);
end;

function HashingParserExpr027(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopParserExpr028(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopParserExpr028: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopParserExpr028: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopParserExpr028: sentinel value');
    Sum := Sum + (Arr[i] xor 28);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 28;
end;

function StatetransitionParserExpr029(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionParserExpr029: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionParserExpr029: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerParserExpr030(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 0;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerParserExpr030: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerParserExpr030: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 30;
end;

procedure MemoryopParserExpr031(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopParserExpr031: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopParserExpr031: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(31)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopParserExpr032(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopParserExpr032: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((32+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (32 mod 3);
end;

function ProtocolopParserExpr033(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopParserExpr033: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopParserExpr033: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(33 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopParserExpr034(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopParserExpr034: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(34) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropParserExpr035(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropParserExpr035: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropParserExpr035: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropParserExpr035: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 35;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopParserExpr036(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopParserExpr036: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 36;
    1: Res := Operand xor Int64(36 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopParserExpr036: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopParserExpr036: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionParserExpr037(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionParserExpr037: pos out of range');
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
    raise EParseError.Create('ParserproductionParserExpr037: expected token at pos '+IntToStr(Pos));
  Result := i + (37 mod 2);
end;

function LexerruleParserExpr038(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleParserExpr038: unknown lexer state');
  end;
  Result := Result xor (38 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveParserExpr039(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveParserExpr039: negative N');
  if N = 0 then Exit(1);
  if N = 1 then Exit(1+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 4;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveParserExpr039: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 39;
end;

function RecordopParserExpr040(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopParserExpr040: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 40;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodParserExpr041(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 41;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodParserExpr041: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 41;
end;

function InterfaceimplParserExpr042(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplParserExpr042: zero id');
  H := Id xor UInt64(42 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 9;
end;

function ArithmeticParserExpr043(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticParserExpr043: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(43) shl 3)
  else
    Tmp := Tmp + 4;
  Result := Tmp;
end;

function ValidationParserExpr044(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationParserExpr044: invalid bounds');
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

function SerializationParserExpr045(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationParserExpr045: buf bounds');
  U := UInt32(Value) xor UInt32(45 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationParserExpr046(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationParserExpr046: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(46 shl 8);
  Result := Int32(U);
end;

function HashingParserExpr047(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopParserExpr048(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopParserExpr048: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopParserExpr048: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopParserExpr048: sentinel value');
    Sum := Sum + (Arr[i] xor 48);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 48;
end;

function StatetransitionParserExpr049(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionParserExpr049: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionParserExpr049: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerParserExpr050(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 0;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerParserExpr050: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerParserExpr050: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 50;
end;

procedure MemoryopParserExpr051(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopParserExpr051: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopParserExpr051: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(51)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopParserExpr052(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopParserExpr052: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((52+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (52 mod 3);
end;

function ProtocolopParserExpr053(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopParserExpr053: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopParserExpr053: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(53 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopParserExpr054(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopParserExpr054: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(54) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropParserExpr055(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropParserExpr055: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropParserExpr055: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropParserExpr055: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 55;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopParserExpr056(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopParserExpr056: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 56;
    1: Res := Operand xor Int64(56 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopParserExpr056: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopParserExpr056: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionParserExpr057(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionParserExpr057: pos out of range');
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
    raise EParseError.Create('ParserproductionParserExpr057: expected token at pos '+IntToStr(Pos));
  Result := i + (57 mod 2);
end;

function LexerruleParserExpr058(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleParserExpr058: unknown lexer state');
  end;
  Result := Result xor (58 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveParserExpr059(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveParserExpr059: negative N');
  if N = 0 then Exit(2);
  if N = 1 then Exit(2+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 3;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveParserExpr059: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 59;
end;

function RecordopParserExpr060(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopParserExpr060: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 60;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodParserExpr061(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 61;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodParserExpr061: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 61;
end;

function InterfaceimplParserExpr062(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplParserExpr062: zero id');
  H := Id xor UInt64(62 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 12;
end;

function ArithmeticParserExpr063(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticParserExpr063: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(63) shl 3)
  else
    Tmp := Tmp + 11;
  Result := Tmp;
end;

function ValidationParserExpr064(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationParserExpr064: invalid bounds');
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

function SerializationParserExpr065(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationParserExpr065: buf bounds');
  U := UInt32(Value) xor UInt32(65 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationParserExpr066(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationParserExpr066: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(66 shl 8);
  Result := Int32(U);
end;

function HashingParserExpr067(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopParserExpr068(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopParserExpr068: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopParserExpr068: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopParserExpr068: sentinel value');
    Sum := Sum + (Arr[i] xor 68);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 68;
end;

function StatetransitionParserExpr069(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionParserExpr069: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionParserExpr069: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerParserExpr070(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 0;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerParserExpr070: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerParserExpr070: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 70;
end;

procedure MemoryopParserExpr071(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopParserExpr071: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopParserExpr071: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(71)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopParserExpr072(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopParserExpr072: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((72+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (72 mod 3);
end;

function ProtocolopParserExpr073(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopParserExpr073: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopParserExpr073: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(73 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopParserExpr074(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopParserExpr074: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(74) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropParserExpr075(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropParserExpr075: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropParserExpr075: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropParserExpr075: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 75;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopParserExpr076(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopParserExpr076: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 76;
    1: Res := Operand xor Int64(76 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopParserExpr076: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopParserExpr076: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionParserExpr077(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionParserExpr077: pos out of range');
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
    raise EParseError.Create('ParserproductionParserExpr077: expected token at pos '+IntToStr(Pos));
  Result := i + (77 mod 2);
end;

function LexerruleParserExpr078(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleParserExpr078: unknown lexer state');
  end;
  Result := Result xor (78 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveParserExpr079(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveParserExpr079: negative N');
  if N = 0 then Exit(3);
  if N = 1 then Exit(3+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 2;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveParserExpr079: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 79;
end;


end.


