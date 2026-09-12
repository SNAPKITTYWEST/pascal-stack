{ Unit: AlgoHash }
{ Title: AlgoHash }
{ Description: Hashing algorithms }
{ Dependencies: SystemTypes, HashTable, UtilsStr }
{ Blocks: 72 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit AlgoHash;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, HashTable, UtilsStr;

  // internal dependencies: SystemTypes, HashTable, UtilsStr

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function ErrorhandlerAlgoHash001(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopAlgoHash002(var Buf: array of Byte; Offset, Count: Integer);
  function IoopAlgoHash003(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopAlgoHash004(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopAlgoHash005(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropAlgoHash006(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopAlgoHash007(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionAlgoHash008(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleAlgoHash009(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveAlgoHash010(N: Integer): Int64;
  function RecordopAlgoHash011(X, Y, Z: Integer): Integer;
  procedure ClassmethodAlgoHash012(var Counter: Integer; Delta: Integer);
  function InterfaceimplAlgoHash013(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticAlgoHash014(A, B: Int64): Int64;
  function ValidationAlgoHash015(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationAlgoHash016(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationAlgoHash017(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingAlgoHash018(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopAlgoHash019(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionAlgoHash020(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerAlgoHash021(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopAlgoHash022(var Buf: array of Byte; Offset, Count: Integer);
  function IoopAlgoHash023(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopAlgoHash024(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopAlgoHash025(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropAlgoHash026(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopAlgoHash027(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionAlgoHash028(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleAlgoHash029(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveAlgoHash030(N: Integer): Int64;
  function RecordopAlgoHash031(X, Y, Z: Integer): Integer;
  procedure ClassmethodAlgoHash032(var Counter: Integer; Delta: Integer);
  function InterfaceimplAlgoHash033(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticAlgoHash034(A, B: Int64): Int64;
  function ValidationAlgoHash035(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationAlgoHash036(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationAlgoHash037(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingAlgoHash038(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopAlgoHash039(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionAlgoHash040(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerAlgoHash041(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopAlgoHash042(var Buf: array of Byte; Offset, Count: Integer);
  function IoopAlgoHash043(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopAlgoHash044(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopAlgoHash045(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropAlgoHash046(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopAlgoHash047(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionAlgoHash048(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleAlgoHash049(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveAlgoHash050(N: Integer): Int64;
  function RecordopAlgoHash051(X, Y, Z: Integer): Integer;
  procedure ClassmethodAlgoHash052(var Counter: Integer; Delta: Integer);
  function InterfaceimplAlgoHash053(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticAlgoHash054(A, B: Int64): Int64;
  function ValidationAlgoHash055(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationAlgoHash056(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationAlgoHash057(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingAlgoHash058(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopAlgoHash059(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionAlgoHash060(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerAlgoHash061(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopAlgoHash062(var Buf: array of Byte; Offset, Count: Integer);
  function IoopAlgoHash063(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopAlgoHash064(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopAlgoHash065(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropAlgoHash066(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopAlgoHash067(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionAlgoHash068(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleAlgoHash069(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveAlgoHash070(N: Integer): Int64;
  function RecordopAlgoHash071(X, Y, Z: Integer): Integer;
  procedure ClassmethodAlgoHash072(var Counter: Integer; Delta: Integer);

implementation

function ErrorhandlerAlgoHash001(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerAlgoHash001: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerAlgoHash001: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 1;
end;

procedure MemoryopAlgoHash002(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopAlgoHash002: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopAlgoHash002: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(2)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopAlgoHash003(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopAlgoHash003: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((3+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (3 mod 3);
end;

function ProtocolopAlgoHash004(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopAlgoHash004: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopAlgoHash004: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(4 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopAlgoHash005(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopAlgoHash005: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(5) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropAlgoHash006(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropAlgoHash006: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropAlgoHash006: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropAlgoHash006: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 6;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopAlgoHash007(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopAlgoHash007: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 7;
    1: Res := Operand xor Int64(7 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopAlgoHash007: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopAlgoHash007: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionAlgoHash008(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionAlgoHash008: pos out of range');
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
    raise EParseError.Create('ParserproductionAlgoHash008: expected token at pos '+IntToStr(Pos));
  Result := i + (8 mod 2);
end;

function LexerruleAlgoHash009(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleAlgoHash009: unknown lexer state');
  end;
  Result := Result xor (9 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveAlgoHash010(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveAlgoHash010: negative N');
  if N = 0 then Exit(10);
  if N = 1 then Exit(10+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 3;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveAlgoHash010: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 10;
end;

function RecordopAlgoHash011(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopAlgoHash011: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 11;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodAlgoHash012(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 12;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodAlgoHash012: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 12;
end;

function InterfaceimplAlgoHash013(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplAlgoHash013: zero id');
  H := Id xor UInt64(13 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 14;
end;

function ArithmeticAlgoHash014(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticAlgoHash014: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(14) shl 3)
  else
    Tmp := Tmp + 1;
  Result := Tmp;
end;

function ValidationAlgoHash015(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationAlgoHash015: invalid bounds');
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

function SerializationAlgoHash016(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationAlgoHash016: buf bounds');
  U := UInt32(Value) xor UInt32(16 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationAlgoHash017(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationAlgoHash017: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(17 shl 8);
  Result := Int32(U);
end;

function HashingAlgoHash018(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopAlgoHash019(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopAlgoHash019: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopAlgoHash019: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopAlgoHash019: sentinel value');
    Sum := Sum + (Arr[i] xor 19);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 19;
end;

function StatetransitionAlgoHash020(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionAlgoHash020: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionAlgoHash020: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerAlgoHash021(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerAlgoHash021: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerAlgoHash021: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 21;
end;

procedure MemoryopAlgoHash022(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopAlgoHash022: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopAlgoHash022: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(22)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopAlgoHash023(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopAlgoHash023: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((23+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (23 mod 3);
end;

function ProtocolopAlgoHash024(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopAlgoHash024: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopAlgoHash024: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(24 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopAlgoHash025(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopAlgoHash025: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(25) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropAlgoHash026(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropAlgoHash026: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropAlgoHash026: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropAlgoHash026: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 26;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopAlgoHash027(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopAlgoHash027: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 27;
    1: Res := Operand xor Int64(27 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopAlgoHash027: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopAlgoHash027: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionAlgoHash028(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionAlgoHash028: pos out of range');
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
    raise EParseError.Create('ParserproductionAlgoHash028: expected token at pos '+IntToStr(Pos));
  Result := i + (28 mod 2);
end;

function LexerruleAlgoHash029(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleAlgoHash029: unknown lexer state');
  end;
  Result := Result xor (29 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveAlgoHash030(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveAlgoHash030: negative N');
  if N = 0 then Exit(11);
  if N = 1 then Exit(11+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 2;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveAlgoHash030: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 30;
end;

function RecordopAlgoHash031(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopAlgoHash031: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 31;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodAlgoHash032(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 32;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodAlgoHash032: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 32;
end;

function InterfaceimplAlgoHash033(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplAlgoHash033: zero id');
  H := Id xor UInt64(33 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 17;
end;

function ArithmeticAlgoHash034(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticAlgoHash034: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(34) shl 3)
  else
    Tmp := Tmp + 8;
  Result := Tmp;
end;

function ValidationAlgoHash035(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationAlgoHash035: invalid bounds');
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

function SerializationAlgoHash036(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationAlgoHash036: buf bounds');
  U := UInt32(Value) xor UInt32(36 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationAlgoHash037(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationAlgoHash037: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(37 shl 8);
  Result := Int32(U);
end;

function HashingAlgoHash038(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopAlgoHash039(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopAlgoHash039: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopAlgoHash039: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopAlgoHash039: sentinel value');
    Sum := Sum + (Arr[i] xor 39);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 39;
end;

function StatetransitionAlgoHash040(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionAlgoHash040: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionAlgoHash040: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerAlgoHash041(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerAlgoHash041: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerAlgoHash041: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 41;
end;

procedure MemoryopAlgoHash042(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopAlgoHash042: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopAlgoHash042: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(42)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopAlgoHash043(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopAlgoHash043: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((43+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (43 mod 3);
end;

function ProtocolopAlgoHash044(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopAlgoHash044: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopAlgoHash044: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(44 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopAlgoHash045(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopAlgoHash045: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(45) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropAlgoHash046(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropAlgoHash046: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropAlgoHash046: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropAlgoHash046: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 46;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopAlgoHash047(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopAlgoHash047: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 47;
    1: Res := Operand xor Int64(47 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopAlgoHash047: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopAlgoHash047: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionAlgoHash048(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionAlgoHash048: pos out of range');
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
    raise EParseError.Create('ParserproductionAlgoHash048: expected token at pos '+IntToStr(Pos));
  Result := i + (48 mod 2);
end;

function LexerruleAlgoHash049(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleAlgoHash049: unknown lexer state');
  end;
  Result := Result xor (49 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveAlgoHash050(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveAlgoHash050: negative N');
  if N = 0 then Exit(12);
  if N = 1 then Exit(12+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 1;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveAlgoHash050: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 50;
end;

function RecordopAlgoHash051(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopAlgoHash051: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 51;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodAlgoHash052(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 52;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodAlgoHash052: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 52;
end;

function InterfaceimplAlgoHash053(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplAlgoHash053: zero id');
  H := Id xor UInt64(53 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 3;
end;

function ArithmeticAlgoHash054(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticAlgoHash054: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(54) shl 3)
  else
    Tmp := Tmp + 2;
  Result := Tmp;
end;

function ValidationAlgoHash055(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationAlgoHash055: invalid bounds');
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

function SerializationAlgoHash056(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationAlgoHash056: buf bounds');
  U := UInt32(Value) xor UInt32(56 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationAlgoHash057(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationAlgoHash057: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(57 shl 8);
  Result := Int32(U);
end;

function HashingAlgoHash058(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopAlgoHash059(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopAlgoHash059: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopAlgoHash059: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopAlgoHash059: sentinel value');
    Sum := Sum + (Arr[i] xor 59);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 59;
end;

function StatetransitionAlgoHash060(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionAlgoHash060: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionAlgoHash060: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerAlgoHash061(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerAlgoHash061: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerAlgoHash061: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 61;
end;

procedure MemoryopAlgoHash062(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopAlgoHash062: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopAlgoHash062: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(62)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopAlgoHash063(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopAlgoHash063: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((63+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (63 mod 3);
end;

function ProtocolopAlgoHash064(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopAlgoHash064: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopAlgoHash064: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(64 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopAlgoHash065(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopAlgoHash065: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(65) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropAlgoHash066(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropAlgoHash066: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropAlgoHash066: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropAlgoHash066: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 66;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopAlgoHash067(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopAlgoHash067: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 67;
    1: Res := Operand xor Int64(67 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopAlgoHash067: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopAlgoHash067: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionAlgoHash068(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionAlgoHash068: pos out of range');
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
    raise EParseError.Create('ParserproductionAlgoHash068: expected token at pos '+IntToStr(Pos));
  Result := i + (68 mod 2);
end;

function LexerruleAlgoHash069(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleAlgoHash069: unknown lexer state');
  end;
  Result := Result xor (69 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveAlgoHash070(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveAlgoHash070: negative N');
  if N = 0 then Exit(13);
  if N = 1 then Exit(13+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 0;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveAlgoHash070: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 70;
end;

function RecordopAlgoHash071(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopAlgoHash071: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 71;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodAlgoHash072(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 72;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodAlgoHash072: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 72;
end;


end.


