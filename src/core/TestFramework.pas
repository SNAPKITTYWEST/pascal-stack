{ Unit: TestFramework }
{ Title: TestFramework }
{ Description: Test framework }
{ Dependencies: SystemTypes, ErrorModel, Logging }
{ Blocks: 72 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit TestFramework;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, ErrorModel, Logging;

  // internal dependencies: SystemTypes, ErrorModel, Logging

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function ErrorhandlerTestFramework001(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopTestFramework002(var Buf: array of Byte; Offset, Count: Integer);
  function IoopTestFramework003(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopTestFramework004(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopTestFramework005(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropTestFramework006(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopTestFramework007(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionTestFramework008(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleTestFramework009(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveTestFramework010(N: Integer): Int64;
  function RecordopTestFramework011(X, Y, Z: Integer): Integer;
  procedure ClassmethodTestFramework012(var Counter: Integer; Delta: Integer);
  function InterfaceimplTestFramework013(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticTestFramework014(A, B: Int64): Int64;
  function ValidationTestFramework015(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationTestFramework016(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationTestFramework017(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingTestFramework018(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopTestFramework019(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionTestFramework020(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerTestFramework021(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopTestFramework022(var Buf: array of Byte; Offset, Count: Integer);
  function IoopTestFramework023(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopTestFramework024(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopTestFramework025(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropTestFramework026(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopTestFramework027(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionTestFramework028(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleTestFramework029(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveTestFramework030(N: Integer): Int64;
  function RecordopTestFramework031(X, Y, Z: Integer): Integer;
  procedure ClassmethodTestFramework032(var Counter: Integer; Delta: Integer);
  function InterfaceimplTestFramework033(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticTestFramework034(A, B: Int64): Int64;
  function ValidationTestFramework035(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationTestFramework036(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationTestFramework037(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingTestFramework038(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopTestFramework039(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionTestFramework040(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerTestFramework041(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopTestFramework042(var Buf: array of Byte; Offset, Count: Integer);
  function IoopTestFramework043(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopTestFramework044(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopTestFramework045(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropTestFramework046(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopTestFramework047(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionTestFramework048(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleTestFramework049(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveTestFramework050(N: Integer): Int64;
  function RecordopTestFramework051(X, Y, Z: Integer): Integer;
  procedure ClassmethodTestFramework052(var Counter: Integer; Delta: Integer);
  function InterfaceimplTestFramework053(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticTestFramework054(A, B: Int64): Int64;
  function ValidationTestFramework055(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationTestFramework056(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationTestFramework057(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingTestFramework058(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopTestFramework059(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionTestFramework060(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerTestFramework061(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopTestFramework062(var Buf: array of Byte; Offset, Count: Integer);
  function IoopTestFramework063(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopTestFramework064(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopTestFramework065(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropTestFramework066(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopTestFramework067(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionTestFramework068(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleTestFramework069(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveTestFramework070(N: Integer): Int64;
  function RecordopTestFramework071(X, Y, Z: Integer): Integer;
  procedure ClassmethodTestFramework072(var Counter: Integer; Delta: Integer);

implementation

function ErrorhandlerTestFramework001(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerTestFramework001: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerTestFramework001: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 1;
end;

procedure MemoryopTestFramework002(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopTestFramework002: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopTestFramework002: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(2)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopTestFramework003(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopTestFramework003: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((3+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (3 mod 3);
end;

function ProtocolopTestFramework004(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopTestFramework004: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopTestFramework004: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(4 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopTestFramework005(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopTestFramework005: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(5) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropTestFramework006(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropTestFramework006: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropTestFramework006: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropTestFramework006: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 6;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopTestFramework007(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopTestFramework007: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 7;
    1: Res := Operand xor Int64(7 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopTestFramework007: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopTestFramework007: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionTestFramework008(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionTestFramework008: pos out of range');
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
    raise EParseError.Create('ParserproductionTestFramework008: expected token at pos '+IntToStr(Pos));
  Result := i + (8 mod 2);
end;

function LexerruleTestFramework009(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleTestFramework009: unknown lexer state');
  end;
  Result := Result xor (9 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveTestFramework010(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveTestFramework010: negative N');
  if N = 0 then Exit(10);
  if N = 1 then Exit(10+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 3;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveTestFramework010: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 10;
end;

function RecordopTestFramework011(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopTestFramework011: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 11;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodTestFramework012(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 12;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodTestFramework012: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 12;
end;

function InterfaceimplTestFramework013(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplTestFramework013: zero id');
  H := Id xor UInt64(13 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 14;
end;

function ArithmeticTestFramework014(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticTestFramework014: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(14) shl 3)
  else
    Tmp := Tmp + 1;
  Result := Tmp;
end;

function ValidationTestFramework015(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationTestFramework015: invalid bounds');
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

function SerializationTestFramework016(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationTestFramework016: buf bounds');
  U := UInt32(Value) xor UInt32(16 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationTestFramework017(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationTestFramework017: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(17 shl 8);
  Result := Int32(U);
end;

function HashingTestFramework018(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(18 * 2654435761);
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

function CollectionopTestFramework019(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopTestFramework019: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopTestFramework019: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopTestFramework019: sentinel value');
    Sum := Sum + (Arr[i] xor 19);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 19;
end;

function StatetransitionTestFramework020(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 20) mod 5;
  else
    raise EStateError.Create('StatetransitionTestFramework020: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionTestFramework020: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerTestFramework021(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerTestFramework021: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerTestFramework021: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 21;
end;

procedure MemoryopTestFramework022(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopTestFramework022: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopTestFramework022: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(22)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopTestFramework023(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopTestFramework023: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((23+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (23 mod 3);
end;

function ProtocolopTestFramework024(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopTestFramework024: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopTestFramework024: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(24 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopTestFramework025(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopTestFramework025: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(25) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropTestFramework026(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropTestFramework026: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropTestFramework026: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropTestFramework026: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 26;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopTestFramework027(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopTestFramework027: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 27;
    1: Res := Operand xor Int64(27 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopTestFramework027: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopTestFramework027: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionTestFramework028(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionTestFramework028: pos out of range');
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
    raise EParseError.Create('ParserproductionTestFramework028: expected token at pos '+IntToStr(Pos));
  Result := i + (28 mod 2);
end;

function LexerruleTestFramework029(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleTestFramework029: unknown lexer state');
  end;
  Result := Result xor (29 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveTestFramework030(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveTestFramework030: negative N');
  if N = 0 then Exit(11);
  if N = 1 then Exit(11+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 2;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveTestFramework030: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 30;
end;

function RecordopTestFramework031(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopTestFramework031: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 31;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodTestFramework032(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 32;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodTestFramework032: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 32;
end;

function InterfaceimplTestFramework033(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplTestFramework033: zero id');
  H := Id xor UInt64(33 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 17;
end;

function ArithmeticTestFramework034(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticTestFramework034: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(34) shl 3)
  else
    Tmp := Tmp + 8;
  Result := Tmp;
end;

function ValidationTestFramework035(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationTestFramework035: invalid bounds');
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

function SerializationTestFramework036(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationTestFramework036: buf bounds');
  U := UInt32(Value) xor UInt32(36 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationTestFramework037(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationTestFramework037: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(37 shl 8);
  Result := Int32(U);
end;

function HashingTestFramework038(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(38 * 2654435761);
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

function CollectionopTestFramework039(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopTestFramework039: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopTestFramework039: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopTestFramework039: sentinel value');
    Sum := Sum + (Arr[i] xor 39);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 39;
end;

function StatetransitionTestFramework040(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 40) mod 5;
  else
    raise EStateError.Create('StatetransitionTestFramework040: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionTestFramework040: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerTestFramework041(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerTestFramework041: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerTestFramework041: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 41;
end;

procedure MemoryopTestFramework042(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopTestFramework042: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopTestFramework042: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(42)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopTestFramework043(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopTestFramework043: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((43+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (43 mod 3);
end;

function ProtocolopTestFramework044(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopTestFramework044: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopTestFramework044: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(44 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopTestFramework045(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopTestFramework045: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(45) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropTestFramework046(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropTestFramework046: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropTestFramework046: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropTestFramework046: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 46;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopTestFramework047(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopTestFramework047: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 47;
    1: Res := Operand xor Int64(47 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopTestFramework047: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopTestFramework047: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionTestFramework048(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionTestFramework048: pos out of range');
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
    raise EParseError.Create('ParserproductionTestFramework048: expected token at pos '+IntToStr(Pos));
  Result := i + (48 mod 2);
end;

function LexerruleTestFramework049(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleTestFramework049: unknown lexer state');
  end;
  Result := Result xor (49 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveTestFramework050(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveTestFramework050: negative N');
  if N = 0 then Exit(12);
  if N = 1 then Exit(12+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 1;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveTestFramework050: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 50;
end;

function RecordopTestFramework051(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopTestFramework051: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 51;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodTestFramework052(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 52;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodTestFramework052: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 52;
end;

function InterfaceimplTestFramework053(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplTestFramework053: zero id');
  H := Id xor UInt64(53 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 3;
end;

function ArithmeticTestFramework054(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticTestFramework054: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(54) shl 3)
  else
    Tmp := Tmp + 2;
  Result := Tmp;
end;

function ValidationTestFramework055(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationTestFramework055: invalid bounds');
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

function SerializationTestFramework056(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationTestFramework056: buf bounds');
  U := UInt32(Value) xor UInt32(56 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationTestFramework057(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationTestFramework057: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(57 shl 8);
  Result := Int32(U);
end;

function HashingTestFramework058(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(58 * 2654435761);
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

function CollectionopTestFramework059(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopTestFramework059: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopTestFramework059: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopTestFramework059: sentinel value');
    Sum := Sum + (Arr[i] xor 59);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 59;
end;

function StatetransitionTestFramework060(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 60) mod 5;
  else
    raise EStateError.Create('StatetransitionTestFramework060: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionTestFramework060: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerTestFramework061(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerTestFramework061: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerTestFramework061: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 61;
end;

procedure MemoryopTestFramework062(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopTestFramework062: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopTestFramework062: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(62)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopTestFramework063(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopTestFramework063: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((63+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (63 mod 3);
end;

function ProtocolopTestFramework064(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopTestFramework064: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopTestFramework064: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(64 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopTestFramework065(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopTestFramework065: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(65) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropTestFramework066(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropTestFramework066: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropTestFramework066: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropTestFramework066: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 66;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopTestFramework067(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopTestFramework067: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 67;
    1: Res := Operand xor Int64(67 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopTestFramework067: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopTestFramework067: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionTestFramework068(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionTestFramework068: pos out of range');
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
    raise EParseError.Create('ParserproductionTestFramework068: expected token at pos '+IntToStr(Pos));
  Result := i + (68 mod 2);
end;

function LexerruleTestFramework069(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleTestFramework069: unknown lexer state');
  end;
  Result := Result xor (69 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveTestFramework070(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveTestFramework070: negative N');
  if N = 0 then Exit(13);
  if N = 1 then Exit(13+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 0;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveTestFramework070: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 70;
end;

function RecordopTestFramework071(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopTestFramework071: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 71;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodTestFramework072(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 72;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodTestFramework072: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 72;
end;


end.


