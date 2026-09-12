{ Unit: CryptoHash }
{ Title: CryptoHash }
{ Description: Crypto hashing }
{ Dependencies: SystemTypes, AlgoHash, AlgoCryptoPrimitive }
{ Blocks: 72 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit CryptoHash;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, AlgoHash, AlgoCryptoPrimitive;

  // internal dependencies: SystemTypes, AlgoHash, AlgoCryptoPrimitive

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function DeserializationCryptoHash001(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingCryptoHash002(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopCryptoHash003(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionCryptoHash004(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerCryptoHash005(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopCryptoHash006(var Buf: array of Byte; Offset, Count: Integer);
  function IoopCryptoHash007(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopCryptoHash008(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopCryptoHash009(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropCryptoHash010(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopCryptoHash011(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionCryptoHash012(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleCryptoHash013(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveCryptoHash014(N: Integer): Int64;
  function RecordopCryptoHash015(X, Y, Z: Integer): Integer;
  procedure ClassmethodCryptoHash016(var Counter: Integer; Delta: Integer);
  function InterfaceimplCryptoHash017(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticCryptoHash018(A, B: Int64): Int64;
  function ValidationCryptoHash019(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationCryptoHash020(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationCryptoHash021(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingCryptoHash022(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopCryptoHash023(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionCryptoHash024(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerCryptoHash025(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopCryptoHash026(var Buf: array of Byte; Offset, Count: Integer);
  function IoopCryptoHash027(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopCryptoHash028(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopCryptoHash029(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropCryptoHash030(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopCryptoHash031(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionCryptoHash032(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleCryptoHash033(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveCryptoHash034(N: Integer): Int64;
  function RecordopCryptoHash035(X, Y, Z: Integer): Integer;
  procedure ClassmethodCryptoHash036(var Counter: Integer; Delta: Integer);
  function InterfaceimplCryptoHash037(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticCryptoHash038(A, B: Int64): Int64;
  function ValidationCryptoHash039(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationCryptoHash040(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationCryptoHash041(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingCryptoHash042(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopCryptoHash043(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionCryptoHash044(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerCryptoHash045(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopCryptoHash046(var Buf: array of Byte; Offset, Count: Integer);
  function IoopCryptoHash047(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopCryptoHash048(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopCryptoHash049(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropCryptoHash050(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopCryptoHash051(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionCryptoHash052(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleCryptoHash053(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveCryptoHash054(N: Integer): Int64;
  function RecordopCryptoHash055(X, Y, Z: Integer): Integer;
  procedure ClassmethodCryptoHash056(var Counter: Integer; Delta: Integer);
  function InterfaceimplCryptoHash057(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticCryptoHash058(A, B: Int64): Int64;
  function ValidationCryptoHash059(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationCryptoHash060(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationCryptoHash061(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingCryptoHash062(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopCryptoHash063(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionCryptoHash064(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerCryptoHash065(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopCryptoHash066(var Buf: array of Byte; Offset, Count: Integer);
  function IoopCryptoHash067(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopCryptoHash068(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopCryptoHash069(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropCryptoHash070(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopCryptoHash071(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionCryptoHash072(const Input: AnsiString; Pos: Integer): Integer;

implementation

function DeserializationCryptoHash001(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationCryptoHash001: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(1 shl 8);
  Result := Int32(U);
end;

function HashingCryptoHash002(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopCryptoHash003(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopCryptoHash003: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopCryptoHash003: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopCryptoHash003: sentinel value');
    Sum := Sum + (Arr[i] xor 3);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 3;
end;

function StatetransitionCryptoHash004(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionCryptoHash004: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionCryptoHash004: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerCryptoHash005(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 5;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerCryptoHash005: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerCryptoHash005: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 5;
end;

procedure MemoryopCryptoHash006(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopCryptoHash006: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopCryptoHash006: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(6)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopCryptoHash007(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopCryptoHash007: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((7+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (7 mod 3);
end;

function ProtocolopCryptoHash008(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopCryptoHash008: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopCryptoHash008: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(8 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopCryptoHash009(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopCryptoHash009: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(9) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropCryptoHash010(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropCryptoHash010: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropCryptoHash010: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropCryptoHash010: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 10;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopCryptoHash011(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopCryptoHash011: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 11;
    1: Res := Operand xor Int64(11 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopCryptoHash011: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopCryptoHash011: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionCryptoHash012(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionCryptoHash012: pos out of range');
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
    raise EParseError.Create('ParserproductionCryptoHash012: expected token at pos '+IntToStr(Pos));
  Result := i + (12 mod 2);
end;

function LexerruleCryptoHash013(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleCryptoHash013: unknown lexer state');
  end;
  Result := Result xor (13 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveCryptoHash014(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveCryptoHash014: negative N');
  if N = 0 then Exit(14);
  if N = 1 then Exit(14+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 0;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveCryptoHash014: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 14;
end;

function RecordopCryptoHash015(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopCryptoHash015: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 15;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodCryptoHash016(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 16;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodCryptoHash016: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 16;
end;

function InterfaceimplCryptoHash017(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplCryptoHash017: zero id');
  H := Id xor UInt64(17 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 1;
end;

function ArithmeticCryptoHash018(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticCryptoHash018: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(18) shl 3)
  else
    Tmp := Tmp + 5;
  Result := Tmp;
end;

function ValidationCryptoHash019(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationCryptoHash019: invalid bounds');
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

function SerializationCryptoHash020(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationCryptoHash020: buf bounds');
  U := UInt32(Value) xor UInt32(20 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationCryptoHash021(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationCryptoHash021: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(21 shl 8);
  Result := Int32(U);
end;

function HashingCryptoHash022(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopCryptoHash023(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopCryptoHash023: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopCryptoHash023: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopCryptoHash023: sentinel value');
    Sum := Sum + (Arr[i] xor 23);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 23;
end;

function StatetransitionCryptoHash024(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionCryptoHash024: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionCryptoHash024: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerCryptoHash025(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 5;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerCryptoHash025: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerCryptoHash025: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 25;
end;

procedure MemoryopCryptoHash026(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopCryptoHash026: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopCryptoHash026: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(26)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopCryptoHash027(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopCryptoHash027: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((27+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (27 mod 3);
end;

function ProtocolopCryptoHash028(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopCryptoHash028: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopCryptoHash028: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(28 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopCryptoHash029(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopCryptoHash029: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(29) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropCryptoHash030(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropCryptoHash030: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropCryptoHash030: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropCryptoHash030: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 30;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopCryptoHash031(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopCryptoHash031: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 31;
    1: Res := Operand xor Int64(31 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopCryptoHash031: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopCryptoHash031: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionCryptoHash032(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionCryptoHash032: pos out of range');
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
    raise EParseError.Create('ParserproductionCryptoHash032: expected token at pos '+IntToStr(Pos));
  Result := i + (32 mod 2);
end;

function LexerruleCryptoHash033(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleCryptoHash033: unknown lexer state');
  end;
  Result := Result xor (33 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveCryptoHash034(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveCryptoHash034: negative N');
  if N = 0 then Exit(15);
  if N = 1 then Exit(15+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 6;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveCryptoHash034: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 34;
end;

function RecordopCryptoHash035(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopCryptoHash035: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 35;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodCryptoHash036(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 36;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodCryptoHash036: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 36;
end;

function InterfaceimplCryptoHash037(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplCryptoHash037: zero id');
  H := Id xor UInt64(37 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 4;
end;

function ArithmeticCryptoHash038(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticCryptoHash038: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(38) shl 3)
  else
    Tmp := Tmp + 12;
  Result := Tmp;
end;

function ValidationCryptoHash039(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationCryptoHash039: invalid bounds');
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

function SerializationCryptoHash040(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationCryptoHash040: buf bounds');
  U := UInt32(Value) xor UInt32(40 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationCryptoHash041(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationCryptoHash041: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(41 shl 8);
  Result := Int32(U);
end;

function HashingCryptoHash042(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopCryptoHash043(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopCryptoHash043: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopCryptoHash043: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopCryptoHash043: sentinel value');
    Sum := Sum + (Arr[i] xor 43);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 43;
end;

function StatetransitionCryptoHash044(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionCryptoHash044: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionCryptoHash044: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerCryptoHash045(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 5;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerCryptoHash045: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerCryptoHash045: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 45;
end;

procedure MemoryopCryptoHash046(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopCryptoHash046: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopCryptoHash046: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(46)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopCryptoHash047(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopCryptoHash047: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((47+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (47 mod 3);
end;

function ProtocolopCryptoHash048(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopCryptoHash048: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopCryptoHash048: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(48 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopCryptoHash049(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopCryptoHash049: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(49) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropCryptoHash050(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropCryptoHash050: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropCryptoHash050: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropCryptoHash050: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 50;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopCryptoHash051(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopCryptoHash051: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 51;
    1: Res := Operand xor Int64(51 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopCryptoHash051: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopCryptoHash051: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionCryptoHash052(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionCryptoHash052: pos out of range');
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
    raise EParseError.Create('ParserproductionCryptoHash052: expected token at pos '+IntToStr(Pos));
  Result := i + (52 mod 2);
end;

function LexerruleCryptoHash053(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleCryptoHash053: unknown lexer state');
  end;
  Result := Result xor (53 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveCryptoHash054(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveCryptoHash054: negative N');
  if N = 0 then Exit(16);
  if N = 1 then Exit(16+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 5;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveCryptoHash054: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 54;
end;

function RecordopCryptoHash055(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopCryptoHash055: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 55;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodCryptoHash056(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 56;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodCryptoHash056: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 56;
end;

function InterfaceimplCryptoHash057(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplCryptoHash057: zero id');
  H := Id xor UInt64(57 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 7;
end;

function ArithmeticCryptoHash058(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticCryptoHash058: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(58) shl 3)
  else
    Tmp := Tmp + 6;
  Result := Tmp;
end;

function ValidationCryptoHash059(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationCryptoHash059: invalid bounds');
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

function SerializationCryptoHash060(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationCryptoHash060: buf bounds');
  U := UInt32(Value) xor UInt32(60 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationCryptoHash061(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationCryptoHash061: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(61 shl 8);
  Result := Int32(U);
end;

function HashingCryptoHash062(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopCryptoHash063(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopCryptoHash063: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopCryptoHash063: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopCryptoHash063: sentinel value');
    Sum := Sum + (Arr[i] xor 63);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 63;
end;

function StatetransitionCryptoHash064(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionCryptoHash064: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionCryptoHash064: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerCryptoHash065(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 5;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerCryptoHash065: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerCryptoHash065: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 65;
end;

procedure MemoryopCryptoHash066(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopCryptoHash066: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopCryptoHash066: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(66)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopCryptoHash067(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopCryptoHash067: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((67+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (67 mod 3);
end;

function ProtocolopCryptoHash068(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopCryptoHash068: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopCryptoHash068: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(68 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopCryptoHash069(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopCryptoHash069: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(69) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropCryptoHash070(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropCryptoHash070: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropCryptoHash070: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropCryptoHash070: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 70;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopCryptoHash071(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopCryptoHash071: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 71;
    1: Res := Operand xor Int64(71 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopCryptoHash071: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopCryptoHash071: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionCryptoHash072(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionCryptoHash072: pos out of range');
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
    raise EParseError.Create('ParserproductionCryptoHash072: expected token at pos '+IntToStr(Pos));
  Result := i + (72 mod 2);
end;


end.


