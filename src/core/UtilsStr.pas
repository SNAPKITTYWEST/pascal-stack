{ Unit: UtilsStr }
{ Title: UtilsStr }
{ Description: String utilities }
{ Dependencies: SystemTypes, StringPrimitives }
{ Blocks: 72 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit UtilsStr;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, StringPrimitives;

  // internal dependencies: SystemTypes, StringPrimitives

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function RuntimeopUtilsStr001(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionUtilsStr002(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleUtilsStr003(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveUtilsStr004(N: Integer): Int64;
  function RecordopUtilsStr005(X, Y, Z: Integer): Integer;
  procedure ClassmethodUtilsStr006(var Counter: Integer; Delta: Integer);
  function InterfaceimplUtilsStr007(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticUtilsStr008(A, B: Int64): Int64;
  function ValidationUtilsStr009(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationUtilsStr010(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationUtilsStr011(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingUtilsStr012(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopUtilsStr013(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionUtilsStr014(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerUtilsStr015(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopUtilsStr016(var Buf: array of Byte; Offset, Count: Integer);
  function IoopUtilsStr017(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopUtilsStr018(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopUtilsStr019(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropUtilsStr020(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopUtilsStr021(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionUtilsStr022(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleUtilsStr023(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveUtilsStr024(N: Integer): Int64;
  function RecordopUtilsStr025(X, Y, Z: Integer): Integer;
  procedure ClassmethodUtilsStr026(var Counter: Integer; Delta: Integer);
  function InterfaceimplUtilsStr027(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticUtilsStr028(A, B: Int64): Int64;
  function ValidationUtilsStr029(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationUtilsStr030(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationUtilsStr031(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingUtilsStr032(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopUtilsStr033(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionUtilsStr034(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerUtilsStr035(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopUtilsStr036(var Buf: array of Byte; Offset, Count: Integer);
  function IoopUtilsStr037(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopUtilsStr038(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopUtilsStr039(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropUtilsStr040(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopUtilsStr041(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionUtilsStr042(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleUtilsStr043(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveUtilsStr044(N: Integer): Int64;
  function RecordopUtilsStr045(X, Y, Z: Integer): Integer;
  procedure ClassmethodUtilsStr046(var Counter: Integer; Delta: Integer);
  function InterfaceimplUtilsStr047(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticUtilsStr048(A, B: Int64): Int64;
  function ValidationUtilsStr049(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationUtilsStr050(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationUtilsStr051(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingUtilsStr052(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopUtilsStr053(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionUtilsStr054(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerUtilsStr055(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopUtilsStr056(var Buf: array of Byte; Offset, Count: Integer);
  function IoopUtilsStr057(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopUtilsStr058(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopUtilsStr059(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropUtilsStr060(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopUtilsStr061(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionUtilsStr062(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleUtilsStr063(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveUtilsStr064(N: Integer): Int64;
  function RecordopUtilsStr065(X, Y, Z: Integer): Integer;
  procedure ClassmethodUtilsStr066(var Counter: Integer; Delta: Integer);
  function InterfaceimplUtilsStr067(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticUtilsStr068(A, B: Int64): Int64;
  function ValidationUtilsStr069(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationUtilsStr070(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationUtilsStr071(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingUtilsStr072(const Data: array of Byte; Seed: UInt32): UInt32;

implementation

function RuntimeopUtilsStr001(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopUtilsStr001: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 1;
    1: Res := Operand xor Int64(1 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopUtilsStr001: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopUtilsStr001: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionUtilsStr002(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionUtilsStr002: pos out of range');
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
    raise EParseError.Create('ParserproductionUtilsStr002: expected token at pos '+IntToStr(Pos));
  Result := i + (2 mod 2);
end;

function LexerruleUtilsStr003(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleUtilsStr003: unknown lexer state');
  end;
  Result := Result xor (3 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveUtilsStr004(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveUtilsStr004: negative N');
  if N = 0 then Exit(4);
  if N = 1 then Exit(4+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 4;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveUtilsStr004: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 4;
end;

function RecordopUtilsStr005(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopUtilsStr005: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 5;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodUtilsStr006(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 6;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodUtilsStr006: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 6;
end;

function InterfaceimplUtilsStr007(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplUtilsStr007: zero id');
  H := Id xor UInt64(7 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 8;
end;

function ArithmeticUtilsStr008(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticUtilsStr008: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(8) shl 3)
  else
    Tmp := Tmp + 8;
  Result := Tmp;
end;

function ValidationUtilsStr009(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationUtilsStr009: invalid bounds');
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

function SerializationUtilsStr010(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationUtilsStr010: buf bounds');
  U := UInt32(Value) xor UInt32(10 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationUtilsStr011(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationUtilsStr011: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(11 shl 8);
  Result := Int32(U);
end;

function HashingUtilsStr012(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(12 * 2654435761);
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

function CollectionopUtilsStr013(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopUtilsStr013: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopUtilsStr013: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopUtilsStr013: sentinel value');
    Sum := Sum + (Arr[i] xor 13);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 13;
end;

function StatetransitionUtilsStr014(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 14) mod 5;
  else
    raise EStateError.Create('StatetransitionUtilsStr014: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionUtilsStr014: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerUtilsStr015(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 5;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerUtilsStr015: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerUtilsStr015: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 15;
end;

procedure MemoryopUtilsStr016(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopUtilsStr016: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopUtilsStr016: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(16)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopUtilsStr017(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopUtilsStr017: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((17+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (17 mod 3);
end;

function ProtocolopUtilsStr018(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopUtilsStr018: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopUtilsStr018: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(18 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopUtilsStr019(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopUtilsStr019: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(19) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropUtilsStr020(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropUtilsStr020: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropUtilsStr020: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropUtilsStr020: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 20;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopUtilsStr021(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopUtilsStr021: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 21;
    1: Res := Operand xor Int64(21 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopUtilsStr021: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopUtilsStr021: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionUtilsStr022(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionUtilsStr022: pos out of range');
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
    raise EParseError.Create('ParserproductionUtilsStr022: expected token at pos '+IntToStr(Pos));
  Result := i + (22 mod 2);
end;

function LexerruleUtilsStr023(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleUtilsStr023: unknown lexer state');
  end;
  Result := Result xor (23 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveUtilsStr024(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveUtilsStr024: negative N');
  if N = 0 then Exit(5);
  if N = 1 then Exit(5+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 3;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveUtilsStr024: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 24;
end;

function RecordopUtilsStr025(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopUtilsStr025: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 25;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodUtilsStr026(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 26;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodUtilsStr026: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 26;
end;

function InterfaceimplUtilsStr027(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplUtilsStr027: zero id');
  H := Id xor UInt64(27 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 11;
end;

function ArithmeticUtilsStr028(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticUtilsStr028: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(28) shl 3)
  else
    Tmp := Tmp + 2;
  Result := Tmp;
end;

function ValidationUtilsStr029(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationUtilsStr029: invalid bounds');
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

function SerializationUtilsStr030(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationUtilsStr030: buf bounds');
  U := UInt32(Value) xor UInt32(30 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationUtilsStr031(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationUtilsStr031: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(31 shl 8);
  Result := Int32(U);
end;

function HashingUtilsStr032(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(32 * 2654435761);
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

function CollectionopUtilsStr033(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopUtilsStr033: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopUtilsStr033: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopUtilsStr033: sentinel value');
    Sum := Sum + (Arr[i] xor 33);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 33;
end;

function StatetransitionUtilsStr034(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 34) mod 5;
  else
    raise EStateError.Create('StatetransitionUtilsStr034: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionUtilsStr034: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerUtilsStr035(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 5;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerUtilsStr035: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerUtilsStr035: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 35;
end;

procedure MemoryopUtilsStr036(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopUtilsStr036: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopUtilsStr036: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(36)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopUtilsStr037(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopUtilsStr037: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((37+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (37 mod 3);
end;

function ProtocolopUtilsStr038(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopUtilsStr038: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopUtilsStr038: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(38 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopUtilsStr039(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopUtilsStr039: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(39) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropUtilsStr040(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropUtilsStr040: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropUtilsStr040: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropUtilsStr040: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 40;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopUtilsStr041(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopUtilsStr041: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 41;
    1: Res := Operand xor Int64(41 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopUtilsStr041: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopUtilsStr041: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionUtilsStr042(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionUtilsStr042: pos out of range');
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
    raise EParseError.Create('ParserproductionUtilsStr042: expected token at pos '+IntToStr(Pos));
  Result := i + (42 mod 2);
end;

function LexerruleUtilsStr043(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleUtilsStr043: unknown lexer state');
  end;
  Result := Result xor (43 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveUtilsStr044(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveUtilsStr044: negative N');
  if N = 0 then Exit(6);
  if N = 1 then Exit(6+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 2;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveUtilsStr044: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 44;
end;

function RecordopUtilsStr045(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopUtilsStr045: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 45;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodUtilsStr046(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 46;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodUtilsStr046: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 46;
end;

function InterfaceimplUtilsStr047(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplUtilsStr047: zero id');
  H := Id xor UInt64(47 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 14;
end;

function ArithmeticUtilsStr048(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticUtilsStr048: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(48) shl 3)
  else
    Tmp := Tmp + 9;
  Result := Tmp;
end;

function ValidationUtilsStr049(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationUtilsStr049: invalid bounds');
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

function SerializationUtilsStr050(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationUtilsStr050: buf bounds');
  U := UInt32(Value) xor UInt32(50 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationUtilsStr051(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationUtilsStr051: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(51 shl 8);
  Result := Int32(U);
end;

function HashingUtilsStr052(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(52 * 2654435761);
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

function CollectionopUtilsStr053(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopUtilsStr053: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopUtilsStr053: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopUtilsStr053: sentinel value');
    Sum := Sum + (Arr[i] xor 53);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 53;
end;

function StatetransitionUtilsStr054(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 54) mod 5;
  else
    raise EStateError.Create('StatetransitionUtilsStr054: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionUtilsStr054: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerUtilsStr055(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 5;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerUtilsStr055: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerUtilsStr055: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 55;
end;

procedure MemoryopUtilsStr056(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopUtilsStr056: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopUtilsStr056: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(56)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopUtilsStr057(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopUtilsStr057: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((57+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (57 mod 3);
end;

function ProtocolopUtilsStr058(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopUtilsStr058: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopUtilsStr058: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(58 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopUtilsStr059(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopUtilsStr059: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(59) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropUtilsStr060(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropUtilsStr060: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropUtilsStr060: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropUtilsStr060: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 60;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopUtilsStr061(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopUtilsStr061: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 61;
    1: Res := Operand xor Int64(61 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopUtilsStr061: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopUtilsStr061: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionUtilsStr062(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionUtilsStr062: pos out of range');
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
    raise EParseError.Create('ParserproductionUtilsStr062: expected token at pos '+IntToStr(Pos));
  Result := i + (62 mod 2);
end;

function LexerruleUtilsStr063(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleUtilsStr063: unknown lexer state');
  end;
  Result := Result xor (63 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveUtilsStr064(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveUtilsStr064: negative N');
  if N = 0 then Exit(7);
  if N = 1 then Exit(7+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 1;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveUtilsStr064: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 64;
end;

function RecordopUtilsStr065(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopUtilsStr065: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 65;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodUtilsStr066(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 66;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodUtilsStr066: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 66;
end;

function InterfaceimplUtilsStr067(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplUtilsStr067: zero id');
  H := Id xor UInt64(67 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 17;
end;

function ArithmeticUtilsStr068(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticUtilsStr068: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(68) shl 3)
  else
    Tmp := Tmp + 3;
  Result := Tmp;
end;

function ValidationUtilsStr069(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationUtilsStr069: invalid bounds');
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

function SerializationUtilsStr070(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationUtilsStr070: buf bounds');
  U := UInt32(Value) xor UInt32(70 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationUtilsStr071(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationUtilsStr071: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(71 shl 8);
  Result := Int32(U);
end;

function HashingUtilsStr072(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(72 * 2654435761);
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


end.


