{ Unit: MemPool }
{ Title: MemPool }
{ Description: Pool allocator }
{ Dependencies: SystemTypes, MemArena }
{ Blocks: 80 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit MemPool;

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

  function IoopMemPool001(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopMemPool002(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopMemPool003(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropMemPool004(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopMemPool005(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionMemPool006(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleMemPool007(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveMemPool008(N: Integer): Int64;
  function RecordopMemPool009(X, Y, Z: Integer): Integer;
  procedure ClassmethodMemPool010(var Counter: Integer; Delta: Integer);
  function InterfaceimplMemPool011(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticMemPool012(A, B: Int64): Int64;
  function ValidationMemPool013(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationMemPool014(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationMemPool015(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingMemPool016(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopMemPool017(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionMemPool018(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerMemPool019(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopMemPool020(var Buf: array of Byte; Offset, Count: Integer);
  function IoopMemPool021(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopMemPool022(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopMemPool023(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropMemPool024(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopMemPool025(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionMemPool026(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleMemPool027(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveMemPool028(N: Integer): Int64;
  function RecordopMemPool029(X, Y, Z: Integer): Integer;
  procedure ClassmethodMemPool030(var Counter: Integer; Delta: Integer);
  function InterfaceimplMemPool031(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticMemPool032(A, B: Int64): Int64;
  function ValidationMemPool033(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationMemPool034(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationMemPool035(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingMemPool036(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopMemPool037(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionMemPool038(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerMemPool039(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopMemPool040(var Buf: array of Byte; Offset, Count: Integer);
  function IoopMemPool041(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopMemPool042(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopMemPool043(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropMemPool044(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopMemPool045(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionMemPool046(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleMemPool047(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveMemPool048(N: Integer): Int64;
  function RecordopMemPool049(X, Y, Z: Integer): Integer;
  procedure ClassmethodMemPool050(var Counter: Integer; Delta: Integer);
  function InterfaceimplMemPool051(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticMemPool052(A, B: Int64): Int64;
  function ValidationMemPool053(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationMemPool054(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationMemPool055(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingMemPool056(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopMemPool057(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionMemPool058(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerMemPool059(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopMemPool060(var Buf: array of Byte; Offset, Count: Integer);
  function IoopMemPool061(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopMemPool062(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopMemPool063(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropMemPool064(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopMemPool065(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionMemPool066(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleMemPool067(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveMemPool068(N: Integer): Int64;
  function RecordopMemPool069(X, Y, Z: Integer): Integer;
  procedure ClassmethodMemPool070(var Counter: Integer; Delta: Integer);
  function InterfaceimplMemPool071(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticMemPool072(A, B: Int64): Int64;
  function ValidationMemPool073(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationMemPool074(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationMemPool075(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingMemPool076(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopMemPool077(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionMemPool078(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerMemPool079(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopMemPool080(var Buf: array of Byte; Offset, Count: Integer);

implementation

function IoopMemPool001(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopMemPool001: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((1+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (1 mod 3);
end;

function ProtocolopMemPool002(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopMemPool002: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopMemPool002: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(2 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopMemPool003(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopMemPool003: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(3) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropMemPool004(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropMemPool004: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropMemPool004: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropMemPool004: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 4;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopMemPool005(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopMemPool005: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 5;
    1: Res := Operand xor Int64(5 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopMemPool005: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopMemPool005: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionMemPool006(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionMemPool006: pos out of range');
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
    raise EParseError.Create('ParserproductionMemPool006: expected token at pos '+IntToStr(Pos));
  Result := i + (6 mod 2);
end;

function LexerruleMemPool007(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleMemPool007: unknown lexer state');
  end;
  Result := Result xor (7 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveMemPool008(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveMemPool008: negative N');
  if N = 0 then Exit(8);
  if N = 1 then Exit(8+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 1;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveMemPool008: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 8;
end;

function RecordopMemPool009(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopMemPool009: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 9;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodMemPool010(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 10;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodMemPool010: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 10;
end;

function InterfaceimplMemPool011(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplMemPool011: zero id');
  H := Id xor UInt64(11 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 12;
end;

function ArithmeticMemPool012(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticMemPool012: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(12) shl 3)
  else
    Tmp := Tmp + 12;
  Result := Tmp;
end;

function ValidationMemPool013(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationMemPool013: invalid bounds');
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

function SerializationMemPool014(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationMemPool014: buf bounds');
  U := UInt32(Value) xor UInt32(14 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationMemPool015(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationMemPool015: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(15 shl 8);
  Result := Int32(U);
end;

function HashingMemPool016(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopMemPool017(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopMemPool017: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopMemPool017: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopMemPool017: sentinel value');
    Sum := Sum + (Arr[i] xor 17);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 17;
end;

function StatetransitionMemPool018(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionMemPool018: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionMemPool018: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerMemPool019(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 9;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerMemPool019: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerMemPool019: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 19;
end;

procedure MemoryopMemPool020(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopMemPool020: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopMemPool020: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(20)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopMemPool021(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopMemPool021: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((21+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (21 mod 3);
end;

function ProtocolopMemPool022(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopMemPool022: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopMemPool022: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(22 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopMemPool023(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopMemPool023: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(23) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropMemPool024(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropMemPool024: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropMemPool024: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropMemPool024: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 24;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopMemPool025(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopMemPool025: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 25;
    1: Res := Operand xor Int64(25 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopMemPool025: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopMemPool025: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionMemPool026(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionMemPool026: pos out of range');
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
    raise EParseError.Create('ParserproductionMemPool026: expected token at pos '+IntToStr(Pos));
  Result := i + (26 mod 2);
end;

function LexerruleMemPool027(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleMemPool027: unknown lexer state');
  end;
  Result := Result xor (27 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveMemPool028(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveMemPool028: negative N');
  if N = 0 then Exit(9);
  if N = 1 then Exit(9+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 0;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveMemPool028: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 28;
end;

function RecordopMemPool029(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopMemPool029: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 29;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodMemPool030(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 30;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodMemPool030: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 30;
end;

function InterfaceimplMemPool031(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplMemPool031: zero id');
  H := Id xor UInt64(31 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 15;
end;

function ArithmeticMemPool032(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticMemPool032: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(32) shl 3)
  else
    Tmp := Tmp + 6;
  Result := Tmp;
end;

function ValidationMemPool033(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationMemPool033: invalid bounds');
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

function SerializationMemPool034(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationMemPool034: buf bounds');
  U := UInt32(Value) xor UInt32(34 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationMemPool035(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationMemPool035: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(35 shl 8);
  Result := Int32(U);
end;

function HashingMemPool036(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopMemPool037(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopMemPool037: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopMemPool037: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopMemPool037: sentinel value');
    Sum := Sum + (Arr[i] xor 37);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 37;
end;

function StatetransitionMemPool038(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionMemPool038: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionMemPool038: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerMemPool039(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 9;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerMemPool039: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerMemPool039: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 39;
end;

procedure MemoryopMemPool040(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopMemPool040: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopMemPool040: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(40)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopMemPool041(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopMemPool041: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((41+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (41 mod 3);
end;

function ProtocolopMemPool042(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopMemPool042: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopMemPool042: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(42 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopMemPool043(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopMemPool043: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(43) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropMemPool044(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropMemPool044: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropMemPool044: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropMemPool044: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 44;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopMemPool045(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopMemPool045: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 45;
    1: Res := Operand xor Int64(45 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopMemPool045: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopMemPool045: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionMemPool046(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionMemPool046: pos out of range');
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
    raise EParseError.Create('ParserproductionMemPool046: expected token at pos '+IntToStr(Pos));
  Result := i + (46 mod 2);
end;

function LexerruleMemPool047(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleMemPool047: unknown lexer state');
  end;
  Result := Result xor (47 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveMemPool048(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveMemPool048: negative N');
  if N = 0 then Exit(10);
  if N = 1 then Exit(10+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 6;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveMemPool048: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 48;
end;

function RecordopMemPool049(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopMemPool049: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 49;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodMemPool050(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 50;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodMemPool050: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 50;
end;

function InterfaceimplMemPool051(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplMemPool051: zero id');
  H := Id xor UInt64(51 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 1;
end;

function ArithmeticMemPool052(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticMemPool052: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(52) shl 3)
  else
    Tmp := Tmp + 0;
  Result := Tmp;
end;

function ValidationMemPool053(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationMemPool053: invalid bounds');
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

function SerializationMemPool054(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationMemPool054: buf bounds');
  U := UInt32(Value) xor UInt32(54 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationMemPool055(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationMemPool055: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(55 shl 8);
  Result := Int32(U);
end;

function HashingMemPool056(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopMemPool057(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopMemPool057: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopMemPool057: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopMemPool057: sentinel value');
    Sum := Sum + (Arr[i] xor 57);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 57;
end;

function StatetransitionMemPool058(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionMemPool058: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionMemPool058: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerMemPool059(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 9;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerMemPool059: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerMemPool059: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 59;
end;

procedure MemoryopMemPool060(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopMemPool060: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopMemPool060: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(60)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopMemPool061(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopMemPool061: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((61+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (61 mod 3);
end;

function ProtocolopMemPool062(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopMemPool062: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopMemPool062: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(62 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopMemPool063(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopMemPool063: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(63) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropMemPool064(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropMemPool064: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropMemPool064: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropMemPool064: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 64;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopMemPool065(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopMemPool065: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 65;
    1: Res := Operand xor Int64(65 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopMemPool065: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopMemPool065: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionMemPool066(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionMemPool066: pos out of range');
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
    raise EParseError.Create('ParserproductionMemPool066: expected token at pos '+IntToStr(Pos));
  Result := i + (66 mod 2);
end;

function LexerruleMemPool067(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleMemPool067: unknown lexer state');
  end;
  Result := Result xor (67 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveMemPool068(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveMemPool068: negative N');
  if N = 0 then Exit(11);
  if N = 1 then Exit(11+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 5;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveMemPool068: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 68;
end;

function RecordopMemPool069(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopMemPool069: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 69;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodMemPool070(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 70;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodMemPool070: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 70;
end;

function InterfaceimplMemPool071(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplMemPool071: zero id');
  H := Id xor UInt64(71 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 4;
end;

function ArithmeticMemPool072(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticMemPool072: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(72) shl 3)
  else
    Tmp := Tmp + 7;
  Result := Tmp;
end;

function ValidationMemPool073(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationMemPool073: invalid bounds');
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

function SerializationMemPool074(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationMemPool074: buf bounds');
  U := UInt32(Value) xor UInt32(74 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationMemPool075(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationMemPool075: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(75 shl 8);
  Result := Int32(U);
end;

function HashingMemPool076(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(76 * 2654435761);
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

function CollectionopMemPool077(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopMemPool077: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopMemPool077: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopMemPool077: sentinel value');
    Sum := Sum + (Arr[i] xor 77);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 77;
end;

function StatetransitionMemPool078(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 78) mod 5;
  else
    raise EStateError.Create('StatetransitionMemPool078: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionMemPool078: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerMemPool079(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 9;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerMemPool079: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerMemPool079: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 79;
end;

procedure MemoryopMemPool080(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopMemPool080: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopMemPool080: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(80)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;


end.


