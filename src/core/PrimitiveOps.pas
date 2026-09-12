{ Unit: PrimitiveOps }
{ Title: PrimitiveOps }
{ Description: Primitive operations arithmetic/logic }
{ Dependencies: SystemTypes }
{ Blocks: 80 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit PrimitiveOps;

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

  function DeserializationPrimitiveOps001(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingPrimitiveOps002(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopPrimitiveOps003(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionPrimitiveOps004(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerPrimitiveOps005(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopPrimitiveOps006(var Buf: array of Byte; Offset, Count: Integer);
  function IoopPrimitiveOps007(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopPrimitiveOps008(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopPrimitiveOps009(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropPrimitiveOps010(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopPrimitiveOps011(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionPrimitiveOps012(const Input: AnsiString; Pos: Integer): Integer;
  function LexerrulePrimitiveOps013(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitivePrimitiveOps014(N: Integer): Int64;
  function RecordopPrimitiveOps015(X, Y, Z: Integer): Integer;
  procedure ClassmethodPrimitiveOps016(var Counter: Integer; Delta: Integer);
  function InterfaceimplPrimitiveOps017(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticPrimitiveOps018(A, B: Int64): Int64;
  function ValidationPrimitiveOps019(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationPrimitiveOps020(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationPrimitiveOps021(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingPrimitiveOps022(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopPrimitiveOps023(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionPrimitiveOps024(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerPrimitiveOps025(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopPrimitiveOps026(var Buf: array of Byte; Offset, Count: Integer);
  function IoopPrimitiveOps027(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopPrimitiveOps028(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopPrimitiveOps029(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropPrimitiveOps030(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopPrimitiveOps031(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionPrimitiveOps032(const Input: AnsiString; Pos: Integer): Integer;
  function LexerrulePrimitiveOps033(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitivePrimitiveOps034(N: Integer): Int64;
  function RecordopPrimitiveOps035(X, Y, Z: Integer): Integer;
  procedure ClassmethodPrimitiveOps036(var Counter: Integer; Delta: Integer);
  function InterfaceimplPrimitiveOps037(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticPrimitiveOps038(A, B: Int64): Int64;
  function ValidationPrimitiveOps039(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationPrimitiveOps040(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationPrimitiveOps041(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingPrimitiveOps042(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopPrimitiveOps043(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionPrimitiveOps044(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerPrimitiveOps045(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopPrimitiveOps046(var Buf: array of Byte; Offset, Count: Integer);
  function IoopPrimitiveOps047(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopPrimitiveOps048(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopPrimitiveOps049(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropPrimitiveOps050(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopPrimitiveOps051(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionPrimitiveOps052(const Input: AnsiString; Pos: Integer): Integer;
  function LexerrulePrimitiveOps053(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitivePrimitiveOps054(N: Integer): Int64;
  function RecordopPrimitiveOps055(X, Y, Z: Integer): Integer;
  procedure ClassmethodPrimitiveOps056(var Counter: Integer; Delta: Integer);
  function InterfaceimplPrimitiveOps057(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticPrimitiveOps058(A, B: Int64): Int64;
  function ValidationPrimitiveOps059(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationPrimitiveOps060(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationPrimitiveOps061(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingPrimitiveOps062(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopPrimitiveOps063(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionPrimitiveOps064(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerPrimitiveOps065(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopPrimitiveOps066(var Buf: array of Byte; Offset, Count: Integer);
  function IoopPrimitiveOps067(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopPrimitiveOps068(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopPrimitiveOps069(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropPrimitiveOps070(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopPrimitiveOps071(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionPrimitiveOps072(const Input: AnsiString; Pos: Integer): Integer;
  function LexerrulePrimitiveOps073(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitivePrimitiveOps074(N: Integer): Int64;
  function RecordopPrimitiveOps075(X, Y, Z: Integer): Integer;
  procedure ClassmethodPrimitiveOps076(var Counter: Integer; Delta: Integer);
  function InterfaceimplPrimitiveOps077(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticPrimitiveOps078(A, B: Int64): Int64;
  function ValidationPrimitiveOps079(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationPrimitiveOps080(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;

implementation

function DeserializationPrimitiveOps001(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationPrimitiveOps001: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(1 shl 8);
  Result := Int32(U);
end;

function HashingPrimitiveOps002(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(2 * 2654435761);
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

function CollectionopPrimitiveOps003(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopPrimitiveOps003: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopPrimitiveOps003: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopPrimitiveOps003: sentinel value');
    Sum := Sum + (Arr[i] xor 3);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 3;
end;

function StatetransitionPrimitiveOps004(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 4) mod 5;
  else
    raise EStateError.Create('StatetransitionPrimitiveOps004: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionPrimitiveOps004: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerPrimitiveOps005(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 5;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerPrimitiveOps005: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerPrimitiveOps005: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 5;
end;

procedure MemoryopPrimitiveOps006(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopPrimitiveOps006: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopPrimitiveOps006: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(6)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopPrimitiveOps007(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopPrimitiveOps007: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((7+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (7 mod 3);
end;

function ProtocolopPrimitiveOps008(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopPrimitiveOps008: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopPrimitiveOps008: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(8 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopPrimitiveOps009(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopPrimitiveOps009: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(9) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropPrimitiveOps010(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropPrimitiveOps010: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropPrimitiveOps010: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropPrimitiveOps010: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 10;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopPrimitiveOps011(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopPrimitiveOps011: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 11;
    1: Res := Operand xor Int64(11 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopPrimitiveOps011: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopPrimitiveOps011: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionPrimitiveOps012(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionPrimitiveOps012: pos out of range');
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
    raise EParseError.Create('ParserproductionPrimitiveOps012: expected token at pos '+IntToStr(Pos));
  Result := i + (12 mod 2);
end;

function LexerrulePrimitiveOps013(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerrulePrimitiveOps013: unknown lexer state');
  end;
  Result := Result xor (13 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitivePrimitiveOps014(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitivePrimitiveOps014: negative N');
  if N = 0 then Exit(14);
  if N = 1 then Exit(14+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 0;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitivePrimitiveOps014: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 14;
end;

function RecordopPrimitiveOps015(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopPrimitiveOps015: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 15;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodPrimitiveOps016(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 16;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodPrimitiveOps016: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 16;
end;

function InterfaceimplPrimitiveOps017(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplPrimitiveOps017: zero id');
  H := Id xor UInt64(17 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 1;
end;

function ArithmeticPrimitiveOps018(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticPrimitiveOps018: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(18) shl 3)
  else
    Tmp := Tmp + 5;
  Result := Tmp;
end;

function ValidationPrimitiveOps019(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationPrimitiveOps019: invalid bounds');
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

function SerializationPrimitiveOps020(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationPrimitiveOps020: buf bounds');
  U := UInt32(Value) xor UInt32(20 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationPrimitiveOps021(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationPrimitiveOps021: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(21 shl 8);
  Result := Int32(U);
end;

function HashingPrimitiveOps022(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(22 * 2654435761);
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

function CollectionopPrimitiveOps023(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopPrimitiveOps023: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopPrimitiveOps023: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopPrimitiveOps023: sentinel value');
    Sum := Sum + (Arr[i] xor 23);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 23;
end;

function StatetransitionPrimitiveOps024(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 24) mod 5;
  else
    raise EStateError.Create('StatetransitionPrimitiveOps024: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionPrimitiveOps024: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerPrimitiveOps025(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 5;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerPrimitiveOps025: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerPrimitiveOps025: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 25;
end;

procedure MemoryopPrimitiveOps026(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopPrimitiveOps026: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopPrimitiveOps026: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(26)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopPrimitiveOps027(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopPrimitiveOps027: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((27+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (27 mod 3);
end;

function ProtocolopPrimitiveOps028(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopPrimitiveOps028: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopPrimitiveOps028: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(28 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopPrimitiveOps029(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopPrimitiveOps029: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(29) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropPrimitiveOps030(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropPrimitiveOps030: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropPrimitiveOps030: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropPrimitiveOps030: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 30;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopPrimitiveOps031(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopPrimitiveOps031: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 31;
    1: Res := Operand xor Int64(31 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopPrimitiveOps031: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopPrimitiveOps031: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionPrimitiveOps032(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionPrimitiveOps032: pos out of range');
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
    raise EParseError.Create('ParserproductionPrimitiveOps032: expected token at pos '+IntToStr(Pos));
  Result := i + (32 mod 2);
end;

function LexerrulePrimitiveOps033(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerrulePrimitiveOps033: unknown lexer state');
  end;
  Result := Result xor (33 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitivePrimitiveOps034(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitivePrimitiveOps034: negative N');
  if N = 0 then Exit(15);
  if N = 1 then Exit(15+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 6;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitivePrimitiveOps034: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 34;
end;

function RecordopPrimitiveOps035(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopPrimitiveOps035: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 35;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodPrimitiveOps036(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 36;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodPrimitiveOps036: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 36;
end;

function InterfaceimplPrimitiveOps037(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplPrimitiveOps037: zero id');
  H := Id xor UInt64(37 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 4;
end;

function ArithmeticPrimitiveOps038(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticPrimitiveOps038: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(38) shl 3)
  else
    Tmp := Tmp + 12;
  Result := Tmp;
end;

function ValidationPrimitiveOps039(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationPrimitiveOps039: invalid bounds');
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

function SerializationPrimitiveOps040(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationPrimitiveOps040: buf bounds');
  U := UInt32(Value) xor UInt32(40 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationPrimitiveOps041(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationPrimitiveOps041: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(41 shl 8);
  Result := Int32(U);
end;

function HashingPrimitiveOps042(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(42 * 2654435761);
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

function CollectionopPrimitiveOps043(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopPrimitiveOps043: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopPrimitiveOps043: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopPrimitiveOps043: sentinel value');
    Sum := Sum + (Arr[i] xor 43);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 43;
end;

function StatetransitionPrimitiveOps044(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 44) mod 5;
  else
    raise EStateError.Create('StatetransitionPrimitiveOps044: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionPrimitiveOps044: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerPrimitiveOps045(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 5;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerPrimitiveOps045: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerPrimitiveOps045: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 45;
end;

procedure MemoryopPrimitiveOps046(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopPrimitiveOps046: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopPrimitiveOps046: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(46)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopPrimitiveOps047(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopPrimitiveOps047: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((47+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (47 mod 3);
end;

function ProtocolopPrimitiveOps048(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopPrimitiveOps048: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopPrimitiveOps048: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(48 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopPrimitiveOps049(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopPrimitiveOps049: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(49) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropPrimitiveOps050(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropPrimitiveOps050: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropPrimitiveOps050: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropPrimitiveOps050: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 50;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopPrimitiveOps051(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopPrimitiveOps051: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 51;
    1: Res := Operand xor Int64(51 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopPrimitiveOps051: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopPrimitiveOps051: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionPrimitiveOps052(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionPrimitiveOps052: pos out of range');
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
    raise EParseError.Create('ParserproductionPrimitiveOps052: expected token at pos '+IntToStr(Pos));
  Result := i + (52 mod 2);
end;

function LexerrulePrimitiveOps053(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerrulePrimitiveOps053: unknown lexer state');
  end;
  Result := Result xor (53 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitivePrimitiveOps054(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitivePrimitiveOps054: negative N');
  if N = 0 then Exit(16);
  if N = 1 then Exit(16+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 5;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitivePrimitiveOps054: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 54;
end;

function RecordopPrimitiveOps055(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopPrimitiveOps055: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 55;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodPrimitiveOps056(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 56;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodPrimitiveOps056: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 56;
end;

function InterfaceimplPrimitiveOps057(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplPrimitiveOps057: zero id');
  H := Id xor UInt64(57 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 7;
end;

function ArithmeticPrimitiveOps058(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticPrimitiveOps058: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(58) shl 3)
  else
    Tmp := Tmp + 6;
  Result := Tmp;
end;

function ValidationPrimitiveOps059(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationPrimitiveOps059: invalid bounds');
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

function SerializationPrimitiveOps060(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationPrimitiveOps060: buf bounds');
  U := UInt32(Value) xor UInt32(60 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationPrimitiveOps061(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationPrimitiveOps061: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(61 shl 8);
  Result := Int32(U);
end;

function HashingPrimitiveOps062(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(62 * 2654435761);
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

function CollectionopPrimitiveOps063(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopPrimitiveOps063: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopPrimitiveOps063: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopPrimitiveOps063: sentinel value');
    Sum := Sum + (Arr[i] xor 63);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 63;
end;

function StatetransitionPrimitiveOps064(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 64) mod 5;
  else
    raise EStateError.Create('StatetransitionPrimitiveOps064: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionPrimitiveOps064: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerPrimitiveOps065(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 5;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerPrimitiveOps065: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerPrimitiveOps065: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 65;
end;

procedure MemoryopPrimitiveOps066(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopPrimitiveOps066: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopPrimitiveOps066: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(66)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopPrimitiveOps067(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopPrimitiveOps067: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((67+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (67 mod 3);
end;

function ProtocolopPrimitiveOps068(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopPrimitiveOps068: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopPrimitiveOps068: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(68 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopPrimitiveOps069(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopPrimitiveOps069: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(69) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropPrimitiveOps070(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropPrimitiveOps070: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropPrimitiveOps070: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropPrimitiveOps070: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 70;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopPrimitiveOps071(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopPrimitiveOps071: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 71;
    1: Res := Operand xor Int64(71 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopPrimitiveOps071: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopPrimitiveOps071: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionPrimitiveOps072(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionPrimitiveOps072: pos out of range');
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
    raise EParseError.Create('ParserproductionPrimitiveOps072: expected token at pos '+IntToStr(Pos));
  Result := i + (72 mod 2);
end;

function LexerrulePrimitiveOps073(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerrulePrimitiveOps073: unknown lexer state');
  end;
  Result := Result xor (73 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitivePrimitiveOps074(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitivePrimitiveOps074: negative N');
  if N = 0 then Exit(17);
  if N = 1 then Exit(17+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 4;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitivePrimitiveOps074: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 74;
end;

function RecordopPrimitiveOps075(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopPrimitiveOps075: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 75;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodPrimitiveOps076(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 76;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodPrimitiveOps076: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 76;
end;

function InterfaceimplPrimitiveOps077(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplPrimitiveOps077: zero id');
  H := Id xor UInt64(77 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 10;
end;

function ArithmeticPrimitiveOps078(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticPrimitiveOps078: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(78) shl 3)
  else
    Tmp := Tmp + 0;
  Result := Tmp;
end;

function ValidationPrimitiveOps079(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationPrimitiveOps079: invalid bounds');
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

function SerializationPrimitiveOps080(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationPrimitiveOps080: buf bounds');
  U := UInt32(Value) xor UInt32(80 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;


end.


