{ Unit: UtilsValidation }
{ Title: UtilsValidation }
{ Description: Validation routines }
{ Dependencies: SystemTypes }
{ Blocks: 72 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit UtilsValidation;

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

  function LexerruleUtilsValidation001(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveUtilsValidation002(N: Integer): Int64;
  function RecordopUtilsValidation003(X, Y, Z: Integer): Integer;
  procedure ClassmethodUtilsValidation004(var Counter: Integer; Delta: Integer);
  function InterfaceimplUtilsValidation005(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticUtilsValidation006(A, B: Int64): Int64;
  function ValidationUtilsValidation007(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationUtilsValidation008(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationUtilsValidation009(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingUtilsValidation010(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopUtilsValidation011(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionUtilsValidation012(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerUtilsValidation013(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopUtilsValidation014(var Buf: array of Byte; Offset, Count: Integer);
  function IoopUtilsValidation015(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopUtilsValidation016(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopUtilsValidation017(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropUtilsValidation018(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopUtilsValidation019(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionUtilsValidation020(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleUtilsValidation021(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveUtilsValidation022(N: Integer): Int64;
  function RecordopUtilsValidation023(X, Y, Z: Integer): Integer;
  procedure ClassmethodUtilsValidation024(var Counter: Integer; Delta: Integer);
  function InterfaceimplUtilsValidation025(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticUtilsValidation026(A, B: Int64): Int64;
  function ValidationUtilsValidation027(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationUtilsValidation028(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationUtilsValidation029(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingUtilsValidation030(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopUtilsValidation031(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionUtilsValidation032(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerUtilsValidation033(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopUtilsValidation034(var Buf: array of Byte; Offset, Count: Integer);
  function IoopUtilsValidation035(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopUtilsValidation036(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopUtilsValidation037(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropUtilsValidation038(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopUtilsValidation039(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionUtilsValidation040(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleUtilsValidation041(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveUtilsValidation042(N: Integer): Int64;
  function RecordopUtilsValidation043(X, Y, Z: Integer): Integer;
  procedure ClassmethodUtilsValidation044(var Counter: Integer; Delta: Integer);
  function InterfaceimplUtilsValidation045(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticUtilsValidation046(A, B: Int64): Int64;
  function ValidationUtilsValidation047(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationUtilsValidation048(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationUtilsValidation049(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingUtilsValidation050(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopUtilsValidation051(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionUtilsValidation052(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerUtilsValidation053(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopUtilsValidation054(var Buf: array of Byte; Offset, Count: Integer);
  function IoopUtilsValidation055(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopUtilsValidation056(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopUtilsValidation057(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropUtilsValidation058(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopUtilsValidation059(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionUtilsValidation060(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleUtilsValidation061(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveUtilsValidation062(N: Integer): Int64;
  function RecordopUtilsValidation063(X, Y, Z: Integer): Integer;
  procedure ClassmethodUtilsValidation064(var Counter: Integer; Delta: Integer);
  function InterfaceimplUtilsValidation065(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticUtilsValidation066(A, B: Int64): Int64;
  function ValidationUtilsValidation067(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationUtilsValidation068(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationUtilsValidation069(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingUtilsValidation070(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopUtilsValidation071(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionUtilsValidation072(CurrentState: Integer; Event: Integer): Integer;

implementation

function LexerruleUtilsValidation001(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleUtilsValidation001: unknown lexer state');
  end;
  Result := Result xor (1 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveUtilsValidation002(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveUtilsValidation002: negative N');
  if N = 0 then Exit(2);
  if N = 1 then Exit(2+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 2;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveUtilsValidation002: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 2;
end;

function RecordopUtilsValidation003(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopUtilsValidation003: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 3;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodUtilsValidation004(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 4;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodUtilsValidation004: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 4;
end;

function InterfaceimplUtilsValidation005(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplUtilsValidation005: zero id');
  H := Id xor UInt64(5 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 6;
end;

function ArithmeticUtilsValidation006(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticUtilsValidation006: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(6) shl 3)
  else
    Tmp := Tmp + 6;
  Result := Tmp;
end;

function ValidationUtilsValidation007(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationUtilsValidation007: invalid bounds');
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

function SerializationUtilsValidation008(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationUtilsValidation008: buf bounds');
  U := UInt32(Value) xor UInt32(8 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationUtilsValidation009(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationUtilsValidation009: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(9 shl 8);
  Result := Int32(U);
end;

function HashingUtilsValidation010(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(10 * 2654435761);
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

function CollectionopUtilsValidation011(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopUtilsValidation011: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopUtilsValidation011: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopUtilsValidation011: sentinel value');
    Sum := Sum + (Arr[i] xor 11);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 11;
end;

function StatetransitionUtilsValidation012(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 12) mod 5;
  else
    raise EStateError.Create('StatetransitionUtilsValidation012: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionUtilsValidation012: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerUtilsValidation013(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 3;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerUtilsValidation013: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerUtilsValidation013: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 13;
end;

procedure MemoryopUtilsValidation014(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopUtilsValidation014: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopUtilsValidation014: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(14)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopUtilsValidation015(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopUtilsValidation015: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((15+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (15 mod 3);
end;

function ProtocolopUtilsValidation016(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopUtilsValidation016: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopUtilsValidation016: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(16 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopUtilsValidation017(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopUtilsValidation017: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(17) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropUtilsValidation018(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropUtilsValidation018: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropUtilsValidation018: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropUtilsValidation018: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 18;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopUtilsValidation019(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopUtilsValidation019: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 19;
    1: Res := Operand xor Int64(19 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopUtilsValidation019: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopUtilsValidation019: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionUtilsValidation020(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionUtilsValidation020: pos out of range');
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
    raise EParseError.Create('ParserproductionUtilsValidation020: expected token at pos '+IntToStr(Pos));
  Result := i + (20 mod 2);
end;

function LexerruleUtilsValidation021(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleUtilsValidation021: unknown lexer state');
  end;
  Result := Result xor (21 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveUtilsValidation022(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveUtilsValidation022: negative N');
  if N = 0 then Exit(3);
  if N = 1 then Exit(3+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 1;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveUtilsValidation022: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 22;
end;

function RecordopUtilsValidation023(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopUtilsValidation023: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 23;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodUtilsValidation024(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 24;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodUtilsValidation024: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 24;
end;

function InterfaceimplUtilsValidation025(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplUtilsValidation025: zero id');
  H := Id xor UInt64(25 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 9;
end;

function ArithmeticUtilsValidation026(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticUtilsValidation026: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(26) shl 3)
  else
    Tmp := Tmp + 0;
  Result := Tmp;
end;

function ValidationUtilsValidation027(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationUtilsValidation027: invalid bounds');
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

function SerializationUtilsValidation028(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationUtilsValidation028: buf bounds');
  U := UInt32(Value) xor UInt32(28 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationUtilsValidation029(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationUtilsValidation029: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(29 shl 8);
  Result := Int32(U);
end;

function HashingUtilsValidation030(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(30 * 2654435761);
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

function CollectionopUtilsValidation031(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopUtilsValidation031: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopUtilsValidation031: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopUtilsValidation031: sentinel value');
    Sum := Sum + (Arr[i] xor 31);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 31;
end;

function StatetransitionUtilsValidation032(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 32) mod 5;
  else
    raise EStateError.Create('StatetransitionUtilsValidation032: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionUtilsValidation032: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerUtilsValidation033(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 3;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerUtilsValidation033: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerUtilsValidation033: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 33;
end;

procedure MemoryopUtilsValidation034(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopUtilsValidation034: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopUtilsValidation034: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(34)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopUtilsValidation035(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopUtilsValidation035: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((35+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (35 mod 3);
end;

function ProtocolopUtilsValidation036(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopUtilsValidation036: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopUtilsValidation036: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(36 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopUtilsValidation037(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopUtilsValidation037: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(37) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropUtilsValidation038(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropUtilsValidation038: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropUtilsValidation038: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropUtilsValidation038: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 38;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopUtilsValidation039(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopUtilsValidation039: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 39;
    1: Res := Operand xor Int64(39 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopUtilsValidation039: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopUtilsValidation039: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionUtilsValidation040(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionUtilsValidation040: pos out of range');
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
    raise EParseError.Create('ParserproductionUtilsValidation040: expected token at pos '+IntToStr(Pos));
  Result := i + (40 mod 2);
end;

function LexerruleUtilsValidation041(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleUtilsValidation041: unknown lexer state');
  end;
  Result := Result xor (41 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveUtilsValidation042(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveUtilsValidation042: negative N');
  if N = 0 then Exit(4);
  if N = 1 then Exit(4+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 0;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveUtilsValidation042: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 42;
end;

function RecordopUtilsValidation043(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopUtilsValidation043: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 43;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodUtilsValidation044(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 44;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodUtilsValidation044: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 44;
end;

function InterfaceimplUtilsValidation045(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplUtilsValidation045: zero id');
  H := Id xor UInt64(45 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 12;
end;

function ArithmeticUtilsValidation046(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticUtilsValidation046: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(46) shl 3)
  else
    Tmp := Tmp + 7;
  Result := Tmp;
end;

function ValidationUtilsValidation047(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationUtilsValidation047: invalid bounds');
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

function SerializationUtilsValidation048(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationUtilsValidation048: buf bounds');
  U := UInt32(Value) xor UInt32(48 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationUtilsValidation049(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationUtilsValidation049: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(49 shl 8);
  Result := Int32(U);
end;

function HashingUtilsValidation050(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(50 * 2654435761);
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

function CollectionopUtilsValidation051(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopUtilsValidation051: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopUtilsValidation051: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopUtilsValidation051: sentinel value');
    Sum := Sum + (Arr[i] xor 51);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 51;
end;

function StatetransitionUtilsValidation052(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 52) mod 5;
  else
    raise EStateError.Create('StatetransitionUtilsValidation052: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionUtilsValidation052: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerUtilsValidation053(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 3;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerUtilsValidation053: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerUtilsValidation053: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 53;
end;

procedure MemoryopUtilsValidation054(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopUtilsValidation054: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopUtilsValidation054: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(54)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopUtilsValidation055(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopUtilsValidation055: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((55+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (55 mod 3);
end;

function ProtocolopUtilsValidation056(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopUtilsValidation056: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopUtilsValidation056: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(56 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopUtilsValidation057(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopUtilsValidation057: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(57) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropUtilsValidation058(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropUtilsValidation058: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropUtilsValidation058: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropUtilsValidation058: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 58;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopUtilsValidation059(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopUtilsValidation059: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 59;
    1: Res := Operand xor Int64(59 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopUtilsValidation059: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopUtilsValidation059: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionUtilsValidation060(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionUtilsValidation060: pos out of range');
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
    raise EParseError.Create('ParserproductionUtilsValidation060: expected token at pos '+IntToStr(Pos));
  Result := i + (60 mod 2);
end;

function LexerruleUtilsValidation061(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleUtilsValidation061: unknown lexer state');
  end;
  Result := Result xor (61 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveUtilsValidation062(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveUtilsValidation062: negative N');
  if N = 0 then Exit(5);
  if N = 1 then Exit(5+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 6;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveUtilsValidation062: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 62;
end;

function RecordopUtilsValidation063(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopUtilsValidation063: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 63;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodUtilsValidation064(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 64;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodUtilsValidation064: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 64;
end;

function InterfaceimplUtilsValidation065(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplUtilsValidation065: zero id');
  H := Id xor UInt64(65 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 15;
end;

function ArithmeticUtilsValidation066(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticUtilsValidation066: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(66) shl 3)
  else
    Tmp := Tmp + 1;
  Result := Tmp;
end;

function ValidationUtilsValidation067(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationUtilsValidation067: invalid bounds');
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

function SerializationUtilsValidation068(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationUtilsValidation068: buf bounds');
  U := UInt32(Value) xor UInt32(68 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationUtilsValidation069(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationUtilsValidation069: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(69 shl 8);
  Result := Int32(U);
end;

function HashingUtilsValidation070(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(70 * 2654435761);
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

function CollectionopUtilsValidation071(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopUtilsValidation071: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopUtilsValidation071: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopUtilsValidation071: sentinel value');
    Sum := Sum + (Arr[i] xor 71);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 71;
end;

function StatetransitionUtilsValidation072(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 72) mod 5;
  else
    raise EStateError.Create('StatetransitionUtilsValidation072: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionUtilsValidation072: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;


end.


