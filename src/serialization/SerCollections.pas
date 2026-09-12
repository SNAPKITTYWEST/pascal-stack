{ Unit: SerCollections }
{ Title: SerCollections }
{ Description: Collection serialization }
{ Dependencies: SystemTypes, SerBuffer, ArrayList, HashTable }
{ Blocks: 79 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit SerCollections;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, SerBuffer, ArrayList, HashTable;

  // internal dependencies: SystemTypes, SerBuffer, ArrayList, HashTable

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function ScheduleropSerCollections001(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopSerCollections002(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionSerCollections003(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleSerCollections004(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveSerCollections005(N: Integer): Int64;
  function RecordopSerCollections006(X, Y, Z: Integer): Integer;
  procedure ClassmethodSerCollections007(var Counter: Integer; Delta: Integer);
  function InterfaceimplSerCollections008(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticSerCollections009(A, B: Int64): Int64;
  function ValidationSerCollections010(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationSerCollections011(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationSerCollections012(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingSerCollections013(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopSerCollections014(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionSerCollections015(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerSerCollections016(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopSerCollections017(var Buf: array of Byte; Offset, Count: Integer);
  function IoopSerCollections018(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopSerCollections019(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopSerCollections020(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropSerCollections021(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopSerCollections022(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionSerCollections023(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleSerCollections024(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveSerCollections025(N: Integer): Int64;
  function RecordopSerCollections026(X, Y, Z: Integer): Integer;
  procedure ClassmethodSerCollections027(var Counter: Integer; Delta: Integer);
  function InterfaceimplSerCollections028(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticSerCollections029(A, B: Int64): Int64;
  function ValidationSerCollections030(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationSerCollections031(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationSerCollections032(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingSerCollections033(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopSerCollections034(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionSerCollections035(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerSerCollections036(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopSerCollections037(var Buf: array of Byte; Offset, Count: Integer);
  function IoopSerCollections038(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopSerCollections039(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopSerCollections040(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropSerCollections041(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopSerCollections042(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionSerCollections043(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleSerCollections044(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveSerCollections045(N: Integer): Int64;
  function RecordopSerCollections046(X, Y, Z: Integer): Integer;
  procedure ClassmethodSerCollections047(var Counter: Integer; Delta: Integer);
  function InterfaceimplSerCollections048(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticSerCollections049(A, B: Int64): Int64;
  function ValidationSerCollections050(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationSerCollections051(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationSerCollections052(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingSerCollections053(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopSerCollections054(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionSerCollections055(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerSerCollections056(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopSerCollections057(var Buf: array of Byte; Offset, Count: Integer);
  function IoopSerCollections058(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopSerCollections059(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopSerCollections060(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropSerCollections061(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopSerCollections062(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionSerCollections063(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleSerCollections064(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveSerCollections065(N: Integer): Int64;
  function RecordopSerCollections066(X, Y, Z: Integer): Integer;
  procedure ClassmethodSerCollections067(var Counter: Integer; Delta: Integer);
  function InterfaceimplSerCollections068(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticSerCollections069(A, B: Int64): Int64;
  function ValidationSerCollections070(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationSerCollections071(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationSerCollections072(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingSerCollections073(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopSerCollections074(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionSerCollections075(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerSerCollections076(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopSerCollections077(var Buf: array of Byte; Offset, Count: Integer);
  function IoopSerCollections078(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopSerCollections079(PacketType: Byte; PayloadLen: Integer): UInt32;

implementation

function ScheduleropSerCollections001(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropSerCollections001: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropSerCollections001: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropSerCollections001: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 1;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopSerCollections002(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopSerCollections002: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 2;
    1: Res := Operand xor Int64(2 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopSerCollections002: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopSerCollections002: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionSerCollections003(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionSerCollections003: pos out of range');
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
    raise EParseError.Create('ParserproductionSerCollections003: expected token at pos '+IntToStr(Pos));
  Result := i + (3 mod 2);
end;

function LexerruleSerCollections004(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleSerCollections004: unknown lexer state');
  end;
  Result := Result xor (4 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveSerCollections005(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveSerCollections005: negative N');
  if N = 0 then Exit(5);
  if N = 1 then Exit(5+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 5;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveSerCollections005: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 5;
end;

function RecordopSerCollections006(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopSerCollections006: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 6;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodSerCollections007(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 7;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodSerCollections007: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 7;
end;

function InterfaceimplSerCollections008(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplSerCollections008: zero id');
  H := Id xor UInt64(8 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 9;
end;

function ArithmeticSerCollections009(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticSerCollections009: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(9) shl 3)
  else
    Tmp := Tmp + 9;
  Result := Tmp;
end;

function ValidationSerCollections010(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationSerCollections010: invalid bounds');
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

function SerializationSerCollections011(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationSerCollections011: buf bounds');
  U := UInt32(Value) xor UInt32(11 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationSerCollections012(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationSerCollections012: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(12 shl 8);
  Result := Int32(U);
end;

function HashingSerCollections013(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(13 * 2654435761);
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

function CollectionopSerCollections014(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopSerCollections014: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopSerCollections014: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopSerCollections014: sentinel value');
    Sum := Sum + (Arr[i] xor 14);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 14;
end;

function StatetransitionSerCollections015(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 15) mod 5;
  else
    raise EStateError.Create('StatetransitionSerCollections015: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionSerCollections015: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerSerCollections016(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 6;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerSerCollections016: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerSerCollections016: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 16;
end;

procedure MemoryopSerCollections017(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopSerCollections017: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopSerCollections017: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(17)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopSerCollections018(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopSerCollections018: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((18+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (18 mod 3);
end;

function ProtocolopSerCollections019(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopSerCollections019: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopSerCollections019: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(19 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopSerCollections020(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopSerCollections020: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(20) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropSerCollections021(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropSerCollections021: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropSerCollections021: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropSerCollections021: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 21;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopSerCollections022(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopSerCollections022: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 22;
    1: Res := Operand xor Int64(22 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopSerCollections022: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopSerCollections022: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionSerCollections023(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionSerCollections023: pos out of range');
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
    raise EParseError.Create('ParserproductionSerCollections023: expected token at pos '+IntToStr(Pos));
  Result := i + (23 mod 2);
end;

function LexerruleSerCollections024(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleSerCollections024: unknown lexer state');
  end;
  Result := Result xor (24 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveSerCollections025(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveSerCollections025: negative N');
  if N = 0 then Exit(6);
  if N = 1 then Exit(6+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 4;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveSerCollections025: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 25;
end;

function RecordopSerCollections026(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopSerCollections026: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 26;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodSerCollections027(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 27;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodSerCollections027: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 27;
end;

function InterfaceimplSerCollections028(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplSerCollections028: zero id');
  H := Id xor UInt64(28 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 12;
end;

function ArithmeticSerCollections029(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticSerCollections029: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(29) shl 3)
  else
    Tmp := Tmp + 3;
  Result := Tmp;
end;

function ValidationSerCollections030(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationSerCollections030: invalid bounds');
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

function SerializationSerCollections031(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationSerCollections031: buf bounds');
  U := UInt32(Value) xor UInt32(31 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationSerCollections032(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationSerCollections032: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(32 shl 8);
  Result := Int32(U);
end;

function HashingSerCollections033(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(33 * 2654435761);
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

function CollectionopSerCollections034(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopSerCollections034: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopSerCollections034: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopSerCollections034: sentinel value');
    Sum := Sum + (Arr[i] xor 34);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 34;
end;

function StatetransitionSerCollections035(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 35) mod 5;
  else
    raise EStateError.Create('StatetransitionSerCollections035: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionSerCollections035: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerSerCollections036(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 6;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerSerCollections036: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerSerCollections036: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 36;
end;

procedure MemoryopSerCollections037(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopSerCollections037: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopSerCollections037: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(37)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopSerCollections038(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopSerCollections038: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((38+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (38 mod 3);
end;

function ProtocolopSerCollections039(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopSerCollections039: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopSerCollections039: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(39 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopSerCollections040(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopSerCollections040: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(40) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropSerCollections041(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropSerCollections041: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropSerCollections041: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropSerCollections041: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 41;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopSerCollections042(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopSerCollections042: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 42;
    1: Res := Operand xor Int64(42 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopSerCollections042: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopSerCollections042: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionSerCollections043(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionSerCollections043: pos out of range');
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
    raise EParseError.Create('ParserproductionSerCollections043: expected token at pos '+IntToStr(Pos));
  Result := i + (43 mod 2);
end;

function LexerruleSerCollections044(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleSerCollections044: unknown lexer state');
  end;
  Result := Result xor (44 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveSerCollections045(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveSerCollections045: negative N');
  if N = 0 then Exit(7);
  if N = 1 then Exit(7+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 3;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveSerCollections045: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 45;
end;

function RecordopSerCollections046(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopSerCollections046: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 46;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodSerCollections047(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 47;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodSerCollections047: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 47;
end;

function InterfaceimplSerCollections048(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplSerCollections048: zero id');
  H := Id xor UInt64(48 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 15;
end;

function ArithmeticSerCollections049(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticSerCollections049: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(49) shl 3)
  else
    Tmp := Tmp + 10;
  Result := Tmp;
end;

function ValidationSerCollections050(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationSerCollections050: invalid bounds');
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

function SerializationSerCollections051(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationSerCollections051: buf bounds');
  U := UInt32(Value) xor UInt32(51 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationSerCollections052(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationSerCollections052: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(52 shl 8);
  Result := Int32(U);
end;

function HashingSerCollections053(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(53 * 2654435761);
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

function CollectionopSerCollections054(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopSerCollections054: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopSerCollections054: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopSerCollections054: sentinel value');
    Sum := Sum + (Arr[i] xor 54);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 54;
end;

function StatetransitionSerCollections055(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 55) mod 5;
  else
    raise EStateError.Create('StatetransitionSerCollections055: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionSerCollections055: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerSerCollections056(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 6;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerSerCollections056: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerSerCollections056: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 56;
end;

procedure MemoryopSerCollections057(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopSerCollections057: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopSerCollections057: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(57)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopSerCollections058(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopSerCollections058: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((58+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (58 mod 3);
end;

function ProtocolopSerCollections059(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopSerCollections059: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopSerCollections059: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(59 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopSerCollections060(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopSerCollections060: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(60) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropSerCollections061(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropSerCollections061: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropSerCollections061: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropSerCollections061: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 61;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopSerCollections062(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopSerCollections062: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 62;
    1: Res := Operand xor Int64(62 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopSerCollections062: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopSerCollections062: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionSerCollections063(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionSerCollections063: pos out of range');
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
    raise EParseError.Create('ParserproductionSerCollections063: expected token at pos '+IntToStr(Pos));
  Result := i + (63 mod 2);
end;

function LexerruleSerCollections064(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleSerCollections064: unknown lexer state');
  end;
  Result := Result xor (64 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveSerCollections065(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveSerCollections065: negative N');
  if N = 0 then Exit(8);
  if N = 1 then Exit(8+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 2;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveSerCollections065: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 65;
end;

function RecordopSerCollections066(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopSerCollections066: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 66;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodSerCollections067(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 67;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodSerCollections067: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 67;
end;

function InterfaceimplSerCollections068(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplSerCollections068: zero id');
  H := Id xor UInt64(68 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 1;
end;

function ArithmeticSerCollections069(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticSerCollections069: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(69) shl 3)
  else
    Tmp := Tmp + 4;
  Result := Tmp;
end;

function ValidationSerCollections070(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationSerCollections070: invalid bounds');
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

function SerializationSerCollections071(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationSerCollections071: buf bounds');
  U := UInt32(Value) xor UInt32(71 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationSerCollections072(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationSerCollections072: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(72 shl 8);
  Result := Int32(U);
end;

function HashingSerCollections073(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(73 * 2654435761);
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

function CollectionopSerCollections074(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopSerCollections074: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopSerCollections074: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopSerCollections074: sentinel value');
    Sum := Sum + (Arr[i] xor 74);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 74;
end;

function StatetransitionSerCollections075(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 75) mod 5;
  else
    raise EStateError.Create('StatetransitionSerCollections075: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionSerCollections075: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerSerCollections076(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 6;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerSerCollections076: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerSerCollections076: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 76;
end;

procedure MemoryopSerCollections077(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopSerCollections077: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopSerCollections077: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(77)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopSerCollections078(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopSerCollections078: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((78+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (78 mod 3);
end;

function ProtocolopSerCollections079(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopSerCollections079: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopSerCollections079: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(79 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;


end.


