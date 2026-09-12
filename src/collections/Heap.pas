{ Unit: Heap }
{ Title: Heap }
{ Description: Heap priority queue }
{ Dependencies: SystemTypes, MemArena }
{ Blocks: 72 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit Heap;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, MemArena;

  // internal dependencies: SystemTypes, MemArena

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function ErrorhandlerHeap001(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopHeap002(var Buf: array of Byte; Offset, Count: Integer);
  function IoopHeap003(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopHeap004(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopHeap005(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropHeap006(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopHeap007(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionHeap008(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleHeap009(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveHeap010(N: Integer): Int64;
  function RecordopHeap011(X, Y, Z: Integer): Integer;
  procedure ClassmethodHeap012(var Counter: Integer; Delta: Integer);
  function InterfaceimplHeap013(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticHeap014(A, B: Int64): Int64;
  function ValidationHeap015(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationHeap016(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationHeap017(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingHeap018(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopHeap019(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionHeap020(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerHeap021(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopHeap022(var Buf: array of Byte; Offset, Count: Integer);
  function IoopHeap023(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopHeap024(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopHeap025(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropHeap026(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopHeap027(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionHeap028(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleHeap029(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveHeap030(N: Integer): Int64;
  function RecordopHeap031(X, Y, Z: Integer): Integer;
  procedure ClassmethodHeap032(var Counter: Integer; Delta: Integer);
  function InterfaceimplHeap033(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticHeap034(A, B: Int64): Int64;
  function ValidationHeap035(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationHeap036(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationHeap037(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingHeap038(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopHeap039(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionHeap040(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerHeap041(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopHeap042(var Buf: array of Byte; Offset, Count: Integer);
  function IoopHeap043(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopHeap044(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopHeap045(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropHeap046(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopHeap047(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionHeap048(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleHeap049(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveHeap050(N: Integer): Int64;
  function RecordopHeap051(X, Y, Z: Integer): Integer;
  procedure ClassmethodHeap052(var Counter: Integer; Delta: Integer);
  function InterfaceimplHeap053(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticHeap054(A, B: Int64): Int64;
  function ValidationHeap055(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationHeap056(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationHeap057(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingHeap058(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopHeap059(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionHeap060(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerHeap061(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopHeap062(var Buf: array of Byte; Offset, Count: Integer);
  function IoopHeap063(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopHeap064(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopHeap065(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropHeap066(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopHeap067(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionHeap068(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleHeap069(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveHeap070(N: Integer): Int64;
  function RecordopHeap071(X, Y, Z: Integer): Integer;
  procedure ClassmethodHeap072(var Counter: Integer; Delta: Integer);

implementation

function ErrorhandlerHeap001(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerHeap001: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerHeap001: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 1;
end;

procedure MemoryopHeap002(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopHeap002: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopHeap002: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(2)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopHeap003(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopHeap003: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((3+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (3 mod 3);
end;

function ProtocolopHeap004(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopHeap004: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopHeap004: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(4 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopHeap005(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopHeap005: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(5) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropHeap006(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropHeap006: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropHeap006: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropHeap006: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 6;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopHeap007(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopHeap007: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 7;
    1: Res := Operand xor Int64(7 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopHeap007: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopHeap007: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionHeap008(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionHeap008: pos out of range');
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
    raise EParseError.Create('ParserproductionHeap008: expected token at pos '+IntToStr(Pos));
  Result := i + (8 mod 2);
end;

function LexerruleHeap009(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleHeap009: unknown lexer state');
  end;
  Result := Result xor (9 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveHeap010(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveHeap010: negative N');
  if N = 0 then Exit(10);
  if N = 1 then Exit(10+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 3;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveHeap010: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 10;
end;

function RecordopHeap011(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopHeap011: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 11;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodHeap012(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 12;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodHeap012: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 12;
end;

function InterfaceimplHeap013(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplHeap013: zero id');
  H := Id xor UInt64(13 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 14;
end;

function ArithmeticHeap014(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticHeap014: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(14) shl 3)
  else
    Tmp := Tmp + 1;
  Result := Tmp;
end;

function ValidationHeap015(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationHeap015: invalid bounds');
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

function SerializationHeap016(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationHeap016: buf bounds');
  U := UInt32(Value) xor UInt32(16 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationHeap017(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationHeap017: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(17 shl 8);
  Result := Int32(U);
end;

function HashingHeap018(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopHeap019(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopHeap019: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopHeap019: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopHeap019: sentinel value');
    Sum := Sum + (Arr[i] xor 19);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 19;
end;

function StatetransitionHeap020(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionHeap020: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionHeap020: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerHeap021(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerHeap021: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerHeap021: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 21;
end;

procedure MemoryopHeap022(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopHeap022: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopHeap022: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(22)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopHeap023(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopHeap023: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((23+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (23 mod 3);
end;

function ProtocolopHeap024(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopHeap024: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopHeap024: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(24 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopHeap025(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopHeap025: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(25) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropHeap026(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropHeap026: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropHeap026: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropHeap026: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 26;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopHeap027(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopHeap027: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 27;
    1: Res := Operand xor Int64(27 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopHeap027: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopHeap027: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionHeap028(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionHeap028: pos out of range');
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
    raise EParseError.Create('ParserproductionHeap028: expected token at pos '+IntToStr(Pos));
  Result := i + (28 mod 2);
end;

function LexerruleHeap029(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleHeap029: unknown lexer state');
  end;
  Result := Result xor (29 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveHeap030(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveHeap030: negative N');
  if N = 0 then Exit(11);
  if N = 1 then Exit(11+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 2;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveHeap030: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 30;
end;

function RecordopHeap031(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopHeap031: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 31;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodHeap032(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 32;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodHeap032: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 32;
end;

function InterfaceimplHeap033(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplHeap033: zero id');
  H := Id xor UInt64(33 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 17;
end;

function ArithmeticHeap034(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticHeap034: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(34) shl 3)
  else
    Tmp := Tmp + 8;
  Result := Tmp;
end;

function ValidationHeap035(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationHeap035: invalid bounds');
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

function SerializationHeap036(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationHeap036: buf bounds');
  U := UInt32(Value) xor UInt32(36 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationHeap037(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationHeap037: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(37 shl 8);
  Result := Int32(U);
end;

function HashingHeap038(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopHeap039(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopHeap039: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopHeap039: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopHeap039: sentinel value');
    Sum := Sum + (Arr[i] xor 39);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 39;
end;

function StatetransitionHeap040(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionHeap040: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionHeap040: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerHeap041(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerHeap041: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerHeap041: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 41;
end;

procedure MemoryopHeap042(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopHeap042: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopHeap042: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(42)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopHeap043(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopHeap043: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((43+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (43 mod 3);
end;

function ProtocolopHeap044(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopHeap044: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopHeap044: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(44 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopHeap045(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopHeap045: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(45) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropHeap046(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropHeap046: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropHeap046: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropHeap046: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 46;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopHeap047(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopHeap047: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 47;
    1: Res := Operand xor Int64(47 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopHeap047: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopHeap047: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionHeap048(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionHeap048: pos out of range');
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
    raise EParseError.Create('ParserproductionHeap048: expected token at pos '+IntToStr(Pos));
  Result := i + (48 mod 2);
end;

function LexerruleHeap049(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleHeap049: unknown lexer state');
  end;
  Result := Result xor (49 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveHeap050(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveHeap050: negative N');
  if N = 0 then Exit(12);
  if N = 1 then Exit(12+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 1;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveHeap050: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 50;
end;

function RecordopHeap051(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopHeap051: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 51;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodHeap052(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 52;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodHeap052: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 52;
end;

function InterfaceimplHeap053(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplHeap053: zero id');
  H := Id xor UInt64(53 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 3;
end;

function ArithmeticHeap054(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticHeap054: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(54) shl 3)
  else
    Tmp := Tmp + 2;
  Result := Tmp;
end;

function ValidationHeap055(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationHeap055: invalid bounds');
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

function SerializationHeap056(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationHeap056: buf bounds');
  U := UInt32(Value) xor UInt32(56 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationHeap057(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationHeap057: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(57 shl 8);
  Result := Int32(U);
end;

function HashingHeap058(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopHeap059(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopHeap059: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopHeap059: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopHeap059: sentinel value');
    Sum := Sum + (Arr[i] xor 59);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 59;
end;

function StatetransitionHeap060(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionHeap060: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionHeap060: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerHeap061(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerHeap061: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerHeap061: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 61;
end;

procedure MemoryopHeap062(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopHeap062: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopHeap062: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(62)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopHeap063(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopHeap063: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((63+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (63 mod 3);
end;

function ProtocolopHeap064(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopHeap064: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopHeap064: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(64 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopHeap065(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopHeap065: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(65) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropHeap066(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropHeap066: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropHeap066: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropHeap066: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 66;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopHeap067(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopHeap067: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 67;
    1: Res := Operand xor Int64(67 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopHeap067: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopHeap067: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionHeap068(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionHeap068: pos out of range');
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
    raise EParseError.Create('ParserproductionHeap068: expected token at pos '+IntToStr(Pos));
  Result := i + (68 mod 2);
end;

function LexerruleHeap069(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleHeap069: unknown lexer state');
  end;
  Result := Result xor (69 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveHeap070(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveHeap070: negative N');
  if N = 0 then Exit(13);
  if N = 1 then Exit(13+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 0;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveHeap070: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 70;
end;

function RecordopHeap071(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopHeap071: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 71;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodHeap072(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 72;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodHeap072: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 72;
end;


end.


