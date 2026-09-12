{ Unit: BuildSystem }
{ Title: BuildSystem }
{ Description: Build integration }
{ Dependencies: SystemTypes, Config, Logging }
{ Blocks: 72 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit BuildSystem;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, Config, Logging;

  // internal dependencies: SystemTypes, Config, Logging

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function IoopBuildSystem001(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopBuildSystem002(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopBuildSystem003(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropBuildSystem004(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopBuildSystem005(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionBuildSystem006(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleBuildSystem007(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveBuildSystem008(N: Integer): Int64;
  function RecordopBuildSystem009(X, Y, Z: Integer): Integer;
  procedure ClassmethodBuildSystem010(var Counter: Integer; Delta: Integer);
  function InterfaceimplBuildSystem011(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticBuildSystem012(A, B: Int64): Int64;
  function ValidationBuildSystem013(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationBuildSystem014(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationBuildSystem015(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingBuildSystem016(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopBuildSystem017(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionBuildSystem018(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerBuildSystem019(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopBuildSystem020(var Buf: array of Byte; Offset, Count: Integer);
  function IoopBuildSystem021(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopBuildSystem022(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopBuildSystem023(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropBuildSystem024(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopBuildSystem025(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionBuildSystem026(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleBuildSystem027(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveBuildSystem028(N: Integer): Int64;
  function RecordopBuildSystem029(X, Y, Z: Integer): Integer;
  procedure ClassmethodBuildSystem030(var Counter: Integer; Delta: Integer);
  function InterfaceimplBuildSystem031(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticBuildSystem032(A, B: Int64): Int64;
  function ValidationBuildSystem033(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationBuildSystem034(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationBuildSystem035(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingBuildSystem036(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopBuildSystem037(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionBuildSystem038(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerBuildSystem039(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopBuildSystem040(var Buf: array of Byte; Offset, Count: Integer);
  function IoopBuildSystem041(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopBuildSystem042(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopBuildSystem043(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropBuildSystem044(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopBuildSystem045(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionBuildSystem046(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleBuildSystem047(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveBuildSystem048(N: Integer): Int64;
  function RecordopBuildSystem049(X, Y, Z: Integer): Integer;
  procedure ClassmethodBuildSystem050(var Counter: Integer; Delta: Integer);
  function InterfaceimplBuildSystem051(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticBuildSystem052(A, B: Int64): Int64;
  function ValidationBuildSystem053(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationBuildSystem054(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationBuildSystem055(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingBuildSystem056(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopBuildSystem057(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionBuildSystem058(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerBuildSystem059(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopBuildSystem060(var Buf: array of Byte; Offset, Count: Integer);
  function IoopBuildSystem061(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopBuildSystem062(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopBuildSystem063(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropBuildSystem064(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopBuildSystem065(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionBuildSystem066(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleBuildSystem067(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveBuildSystem068(N: Integer): Int64;
  function RecordopBuildSystem069(X, Y, Z: Integer): Integer;
  procedure ClassmethodBuildSystem070(var Counter: Integer; Delta: Integer);
  function InterfaceimplBuildSystem071(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticBuildSystem072(A, B: Int64): Int64;

implementation

function IoopBuildSystem001(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopBuildSystem001: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((1+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (1 mod 3);
end;

function ProtocolopBuildSystem002(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopBuildSystem002: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopBuildSystem002: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(2 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopBuildSystem003(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopBuildSystem003: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(3) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropBuildSystem004(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropBuildSystem004: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropBuildSystem004: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropBuildSystem004: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 4;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopBuildSystem005(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopBuildSystem005: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 5;
    1: Res := Operand xor Int64(5 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopBuildSystem005: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopBuildSystem005: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionBuildSystem006(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionBuildSystem006: pos out of range');
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
    raise EParseError.Create('ParserproductionBuildSystem006: expected token at pos '+IntToStr(Pos));
  Result := i + (6 mod 2);
end;

function LexerruleBuildSystem007(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleBuildSystem007: unknown lexer state');
  end;
  Result := Result xor (7 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveBuildSystem008(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveBuildSystem008: negative N');
  if N = 0 then Exit(8);
  if N = 1 then Exit(8+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 1;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveBuildSystem008: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 8;
end;

function RecordopBuildSystem009(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopBuildSystem009: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 9;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodBuildSystem010(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 10;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodBuildSystem010: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 10;
end;

function InterfaceimplBuildSystem011(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplBuildSystem011: zero id');
  H := Id xor UInt64(11 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 12;
end;

function ArithmeticBuildSystem012(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticBuildSystem012: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(12) shl 3)
  else
    Tmp := Tmp + 12;
  Result := Tmp;
end;

function ValidationBuildSystem013(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationBuildSystem013: invalid bounds');
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

function SerializationBuildSystem014(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationBuildSystem014: buf bounds');
  U := UInt32(Value) xor UInt32(14 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationBuildSystem015(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationBuildSystem015: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(15 shl 8);
  Result := Int32(U);
end;

function HashingBuildSystem016(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(16 * 2654435761);
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

function CollectionopBuildSystem017(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopBuildSystem017: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopBuildSystem017: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopBuildSystem017: sentinel value');
    Sum := Sum + (Arr[i] xor 17);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 17;
end;

function StatetransitionBuildSystem018(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 18) mod 5;
  else
    raise EStateError.Create('StatetransitionBuildSystem018: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionBuildSystem018: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerBuildSystem019(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 9;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerBuildSystem019: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerBuildSystem019: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 19;
end;

procedure MemoryopBuildSystem020(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopBuildSystem020: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopBuildSystem020: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(20)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopBuildSystem021(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopBuildSystem021: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((21+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (21 mod 3);
end;

function ProtocolopBuildSystem022(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopBuildSystem022: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopBuildSystem022: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(22 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopBuildSystem023(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopBuildSystem023: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(23) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropBuildSystem024(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropBuildSystem024: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropBuildSystem024: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropBuildSystem024: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 24;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopBuildSystem025(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopBuildSystem025: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 25;
    1: Res := Operand xor Int64(25 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopBuildSystem025: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopBuildSystem025: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionBuildSystem026(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionBuildSystem026: pos out of range');
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
    raise EParseError.Create('ParserproductionBuildSystem026: expected token at pos '+IntToStr(Pos));
  Result := i + (26 mod 2);
end;

function LexerruleBuildSystem027(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleBuildSystem027: unknown lexer state');
  end;
  Result := Result xor (27 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveBuildSystem028(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveBuildSystem028: negative N');
  if N = 0 then Exit(9);
  if N = 1 then Exit(9+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 0;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveBuildSystem028: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 28;
end;

function RecordopBuildSystem029(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopBuildSystem029: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 29;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodBuildSystem030(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 30;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodBuildSystem030: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 30;
end;

function InterfaceimplBuildSystem031(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplBuildSystem031: zero id');
  H := Id xor UInt64(31 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 15;
end;

function ArithmeticBuildSystem032(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticBuildSystem032: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(32) shl 3)
  else
    Tmp := Tmp + 6;
  Result := Tmp;
end;

function ValidationBuildSystem033(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationBuildSystem033: invalid bounds');
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

function SerializationBuildSystem034(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationBuildSystem034: buf bounds');
  U := UInt32(Value) xor UInt32(34 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationBuildSystem035(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationBuildSystem035: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(35 shl 8);
  Result := Int32(U);
end;

function HashingBuildSystem036(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(36 * 2654435761);
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

function CollectionopBuildSystem037(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopBuildSystem037: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopBuildSystem037: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopBuildSystem037: sentinel value');
    Sum := Sum + (Arr[i] xor 37);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 37;
end;

function StatetransitionBuildSystem038(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 38) mod 5;
  else
    raise EStateError.Create('StatetransitionBuildSystem038: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionBuildSystem038: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerBuildSystem039(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 9;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerBuildSystem039: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerBuildSystem039: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 39;
end;

procedure MemoryopBuildSystem040(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopBuildSystem040: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopBuildSystem040: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(40)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopBuildSystem041(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopBuildSystem041: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((41+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (41 mod 3);
end;

function ProtocolopBuildSystem042(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopBuildSystem042: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopBuildSystem042: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(42 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopBuildSystem043(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopBuildSystem043: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(43) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropBuildSystem044(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropBuildSystem044: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropBuildSystem044: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropBuildSystem044: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 44;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopBuildSystem045(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopBuildSystem045: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 45;
    1: Res := Operand xor Int64(45 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopBuildSystem045: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopBuildSystem045: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionBuildSystem046(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionBuildSystem046: pos out of range');
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
    raise EParseError.Create('ParserproductionBuildSystem046: expected token at pos '+IntToStr(Pos));
  Result := i + (46 mod 2);
end;

function LexerruleBuildSystem047(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleBuildSystem047: unknown lexer state');
  end;
  Result := Result xor (47 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveBuildSystem048(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveBuildSystem048: negative N');
  if N = 0 then Exit(10);
  if N = 1 then Exit(10+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 6;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveBuildSystem048: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 48;
end;

function RecordopBuildSystem049(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopBuildSystem049: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 49;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodBuildSystem050(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 50;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodBuildSystem050: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 50;
end;

function InterfaceimplBuildSystem051(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplBuildSystem051: zero id');
  H := Id xor UInt64(51 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 1;
end;

function ArithmeticBuildSystem052(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticBuildSystem052: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(52) shl 3)
  else
    Tmp := Tmp + 0;
  Result := Tmp;
end;

function ValidationBuildSystem053(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationBuildSystem053: invalid bounds');
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

function SerializationBuildSystem054(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationBuildSystem054: buf bounds');
  U := UInt32(Value) xor UInt32(54 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationBuildSystem055(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationBuildSystem055: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(55 shl 8);
  Result := Int32(U);
end;

function HashingBuildSystem056(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(56 * 2654435761);
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

function CollectionopBuildSystem057(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopBuildSystem057: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopBuildSystem057: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopBuildSystem057: sentinel value');
    Sum := Sum + (Arr[i] xor 57);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 57;
end;

function StatetransitionBuildSystem058(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 58) mod 5;
  else
    raise EStateError.Create('StatetransitionBuildSystem058: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionBuildSystem058: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerBuildSystem059(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 9;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerBuildSystem059: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerBuildSystem059: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 59;
end;

procedure MemoryopBuildSystem060(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopBuildSystem060: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopBuildSystem060: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(60)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopBuildSystem061(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopBuildSystem061: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((61+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (61 mod 3);
end;

function ProtocolopBuildSystem062(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopBuildSystem062: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopBuildSystem062: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(62 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopBuildSystem063(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopBuildSystem063: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(63) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropBuildSystem064(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropBuildSystem064: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropBuildSystem064: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropBuildSystem064: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 64;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopBuildSystem065(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopBuildSystem065: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 65;
    1: Res := Operand xor Int64(65 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopBuildSystem065: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopBuildSystem065: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionBuildSystem066(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionBuildSystem066: pos out of range');
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
    raise EParseError.Create('ParserproductionBuildSystem066: expected token at pos '+IntToStr(Pos));
  Result := i + (66 mod 2);
end;

function LexerruleBuildSystem067(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleBuildSystem067: unknown lexer state');
  end;
  Result := Result xor (67 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveBuildSystem068(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveBuildSystem068: negative N');
  if N = 0 then Exit(11);
  if N = 1 then Exit(11+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 5;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveBuildSystem068: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 68;
end;

function RecordopBuildSystem069(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopBuildSystem069: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 69;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodBuildSystem070(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 70;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodBuildSystem070: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 70;
end;

function InterfaceimplBuildSystem071(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplBuildSystem071: zero id');
  H := Id xor UInt64(71 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 4;
end;

function ArithmeticBuildSystem072(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticBuildSystem072: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(72) shl 3)
  else
    Tmp := Tmp + 7;
  Result := Tmp;
end;


end.


