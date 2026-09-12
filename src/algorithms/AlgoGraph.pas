{ Unit: AlgoGraph }
{ Title: AlgoGraph }
{ Description: Graph algorithms }
{ Dependencies: SystemTypes, Graph, Queue, Heap }
{ Blocks: 79 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit AlgoGraph;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, Graph, Queue, Heap;

  // internal dependencies: SystemTypes, Graph, Queue, Heap

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  procedure MemoryopAlgoGraph001(var Buf: array of Byte; Offset, Count: Integer);
  function IoopAlgoGraph002(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopAlgoGraph003(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopAlgoGraph004(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropAlgoGraph005(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopAlgoGraph006(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionAlgoGraph007(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleAlgoGraph008(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveAlgoGraph009(N: Integer): Int64;
  function RecordopAlgoGraph010(X, Y, Z: Integer): Integer;
  procedure ClassmethodAlgoGraph011(var Counter: Integer; Delta: Integer);
  function InterfaceimplAlgoGraph012(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticAlgoGraph013(A, B: Int64): Int64;
  function ValidationAlgoGraph014(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationAlgoGraph015(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationAlgoGraph016(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingAlgoGraph017(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopAlgoGraph018(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionAlgoGraph019(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerAlgoGraph020(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopAlgoGraph021(var Buf: array of Byte; Offset, Count: Integer);
  function IoopAlgoGraph022(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopAlgoGraph023(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopAlgoGraph024(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropAlgoGraph025(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopAlgoGraph026(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionAlgoGraph027(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleAlgoGraph028(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveAlgoGraph029(N: Integer): Int64;
  function RecordopAlgoGraph030(X, Y, Z: Integer): Integer;
  procedure ClassmethodAlgoGraph031(var Counter: Integer; Delta: Integer);
  function InterfaceimplAlgoGraph032(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticAlgoGraph033(A, B: Int64): Int64;
  function ValidationAlgoGraph034(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationAlgoGraph035(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationAlgoGraph036(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingAlgoGraph037(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopAlgoGraph038(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionAlgoGraph039(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerAlgoGraph040(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopAlgoGraph041(var Buf: array of Byte; Offset, Count: Integer);
  function IoopAlgoGraph042(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopAlgoGraph043(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopAlgoGraph044(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropAlgoGraph045(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopAlgoGraph046(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionAlgoGraph047(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleAlgoGraph048(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveAlgoGraph049(N: Integer): Int64;
  function RecordopAlgoGraph050(X, Y, Z: Integer): Integer;
  procedure ClassmethodAlgoGraph051(var Counter: Integer; Delta: Integer);
  function InterfaceimplAlgoGraph052(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticAlgoGraph053(A, B: Int64): Int64;
  function ValidationAlgoGraph054(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationAlgoGraph055(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationAlgoGraph056(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingAlgoGraph057(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopAlgoGraph058(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionAlgoGraph059(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerAlgoGraph060(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopAlgoGraph061(var Buf: array of Byte; Offset, Count: Integer);
  function IoopAlgoGraph062(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopAlgoGraph063(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopAlgoGraph064(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropAlgoGraph065(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopAlgoGraph066(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionAlgoGraph067(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleAlgoGraph068(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveAlgoGraph069(N: Integer): Int64;
  function RecordopAlgoGraph070(X, Y, Z: Integer): Integer;
  procedure ClassmethodAlgoGraph071(var Counter: Integer; Delta: Integer);
  function InterfaceimplAlgoGraph072(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticAlgoGraph073(A, B: Int64): Int64;
  function ValidationAlgoGraph074(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationAlgoGraph075(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationAlgoGraph076(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingAlgoGraph077(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopAlgoGraph078(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionAlgoGraph079(CurrentState: Integer; Event: Integer): Integer;

implementation

procedure MemoryopAlgoGraph001(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopAlgoGraph001: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopAlgoGraph001: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(1)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopAlgoGraph002(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopAlgoGraph002: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((2+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (2 mod 3);
end;

function ProtocolopAlgoGraph003(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopAlgoGraph003: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopAlgoGraph003: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(3 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopAlgoGraph004(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopAlgoGraph004: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(4) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropAlgoGraph005(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropAlgoGraph005: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropAlgoGraph005: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropAlgoGraph005: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 5;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopAlgoGraph006(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopAlgoGraph006: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 6;
    1: Res := Operand xor Int64(6 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopAlgoGraph006: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopAlgoGraph006: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionAlgoGraph007(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionAlgoGraph007: pos out of range');
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
    raise EParseError.Create('ParserproductionAlgoGraph007: expected token at pos '+IntToStr(Pos));
  Result := i + (7 mod 2);
end;

function LexerruleAlgoGraph008(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleAlgoGraph008: unknown lexer state');
  end;
  Result := Result xor (8 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveAlgoGraph009(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveAlgoGraph009: negative N');
  if N = 0 then Exit(9);
  if N = 1 then Exit(9+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 2;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveAlgoGraph009: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 9;
end;

function RecordopAlgoGraph010(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopAlgoGraph010: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 10;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodAlgoGraph011(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 11;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodAlgoGraph011: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 11;
end;

function InterfaceimplAlgoGraph012(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplAlgoGraph012: zero id');
  H := Id xor UInt64(12 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 13;
end;

function ArithmeticAlgoGraph013(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticAlgoGraph013: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(13) shl 3)
  else
    Tmp := Tmp + 0;
  Result := Tmp;
end;

function ValidationAlgoGraph014(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationAlgoGraph014: invalid bounds');
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

function SerializationAlgoGraph015(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationAlgoGraph015: buf bounds');
  U := UInt32(Value) xor UInt32(15 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationAlgoGraph016(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationAlgoGraph016: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(16 shl 8);
  Result := Int32(U);
end;

function HashingAlgoGraph017(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(17 * 2654435761);
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

function CollectionopAlgoGraph018(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopAlgoGraph018: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopAlgoGraph018: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopAlgoGraph018: sentinel value');
    Sum := Sum + (Arr[i] xor 18);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 18;
end;

function StatetransitionAlgoGraph019(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 19) mod 5;
  else
    raise EStateError.Create('StatetransitionAlgoGraph019: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionAlgoGraph019: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerAlgoGraph020(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 0;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerAlgoGraph020: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerAlgoGraph020: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 20;
end;

procedure MemoryopAlgoGraph021(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopAlgoGraph021: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopAlgoGraph021: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(21)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopAlgoGraph022(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopAlgoGraph022: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((22+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (22 mod 3);
end;

function ProtocolopAlgoGraph023(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopAlgoGraph023: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopAlgoGraph023: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(23 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopAlgoGraph024(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopAlgoGraph024: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(24) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropAlgoGraph025(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropAlgoGraph025: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropAlgoGraph025: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropAlgoGraph025: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 25;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopAlgoGraph026(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopAlgoGraph026: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 26;
    1: Res := Operand xor Int64(26 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopAlgoGraph026: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopAlgoGraph026: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionAlgoGraph027(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionAlgoGraph027: pos out of range');
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
    raise EParseError.Create('ParserproductionAlgoGraph027: expected token at pos '+IntToStr(Pos));
  Result := i + (27 mod 2);
end;

function LexerruleAlgoGraph028(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleAlgoGraph028: unknown lexer state');
  end;
  Result := Result xor (28 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveAlgoGraph029(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveAlgoGraph029: negative N');
  if N = 0 then Exit(10);
  if N = 1 then Exit(10+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 1;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveAlgoGraph029: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 29;
end;

function RecordopAlgoGraph030(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopAlgoGraph030: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 30;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodAlgoGraph031(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 31;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodAlgoGraph031: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 31;
end;

function InterfaceimplAlgoGraph032(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplAlgoGraph032: zero id');
  H := Id xor UInt64(32 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 16;
end;

function ArithmeticAlgoGraph033(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticAlgoGraph033: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(33) shl 3)
  else
    Tmp := Tmp + 7;
  Result := Tmp;
end;

function ValidationAlgoGraph034(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationAlgoGraph034: invalid bounds');
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

function SerializationAlgoGraph035(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationAlgoGraph035: buf bounds');
  U := UInt32(Value) xor UInt32(35 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationAlgoGraph036(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationAlgoGraph036: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(36 shl 8);
  Result := Int32(U);
end;

function HashingAlgoGraph037(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(37 * 2654435761);
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

function CollectionopAlgoGraph038(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopAlgoGraph038: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopAlgoGraph038: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopAlgoGraph038: sentinel value');
    Sum := Sum + (Arr[i] xor 38);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 38;
end;

function StatetransitionAlgoGraph039(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 39) mod 5;
  else
    raise EStateError.Create('StatetransitionAlgoGraph039: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionAlgoGraph039: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerAlgoGraph040(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 0;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerAlgoGraph040: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerAlgoGraph040: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 40;
end;

procedure MemoryopAlgoGraph041(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopAlgoGraph041: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopAlgoGraph041: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(41)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopAlgoGraph042(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopAlgoGraph042: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((42+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (42 mod 3);
end;

function ProtocolopAlgoGraph043(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopAlgoGraph043: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopAlgoGraph043: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(43 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopAlgoGraph044(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopAlgoGraph044: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(44) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropAlgoGraph045(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropAlgoGraph045: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropAlgoGraph045: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropAlgoGraph045: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 45;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopAlgoGraph046(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopAlgoGraph046: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 46;
    1: Res := Operand xor Int64(46 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopAlgoGraph046: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopAlgoGraph046: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionAlgoGraph047(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionAlgoGraph047: pos out of range');
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
    raise EParseError.Create('ParserproductionAlgoGraph047: expected token at pos '+IntToStr(Pos));
  Result := i + (47 mod 2);
end;

function LexerruleAlgoGraph048(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleAlgoGraph048: unknown lexer state');
  end;
  Result := Result xor (48 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveAlgoGraph049(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveAlgoGraph049: negative N');
  if N = 0 then Exit(11);
  if N = 1 then Exit(11+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 0;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveAlgoGraph049: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 49;
end;

function RecordopAlgoGraph050(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopAlgoGraph050: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 50;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodAlgoGraph051(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 51;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodAlgoGraph051: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 51;
end;

function InterfaceimplAlgoGraph052(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplAlgoGraph052: zero id');
  H := Id xor UInt64(52 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 2;
end;

function ArithmeticAlgoGraph053(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticAlgoGraph053: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(53) shl 3)
  else
    Tmp := Tmp + 1;
  Result := Tmp;
end;

function ValidationAlgoGraph054(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationAlgoGraph054: invalid bounds');
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

function SerializationAlgoGraph055(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationAlgoGraph055: buf bounds');
  U := UInt32(Value) xor UInt32(55 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationAlgoGraph056(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationAlgoGraph056: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(56 shl 8);
  Result := Int32(U);
end;

function HashingAlgoGraph057(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(57 * 2654435761);
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

function CollectionopAlgoGraph058(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopAlgoGraph058: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopAlgoGraph058: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopAlgoGraph058: sentinel value');
    Sum := Sum + (Arr[i] xor 58);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 58;
end;

function StatetransitionAlgoGraph059(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 59) mod 5;
  else
    raise EStateError.Create('StatetransitionAlgoGraph059: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionAlgoGraph059: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerAlgoGraph060(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 0;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerAlgoGraph060: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerAlgoGraph060: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 60;
end;

procedure MemoryopAlgoGraph061(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopAlgoGraph061: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopAlgoGraph061: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(61)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopAlgoGraph062(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopAlgoGraph062: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((62+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (62 mod 3);
end;

function ProtocolopAlgoGraph063(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopAlgoGraph063: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopAlgoGraph063: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(63 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopAlgoGraph064(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopAlgoGraph064: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(64) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropAlgoGraph065(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropAlgoGraph065: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropAlgoGraph065: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropAlgoGraph065: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 65;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopAlgoGraph066(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopAlgoGraph066: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 66;
    1: Res := Operand xor Int64(66 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopAlgoGraph066: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopAlgoGraph066: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionAlgoGraph067(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionAlgoGraph067: pos out of range');
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
    raise EParseError.Create('ParserproductionAlgoGraph067: expected token at pos '+IntToStr(Pos));
  Result := i + (67 mod 2);
end;

function LexerruleAlgoGraph068(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleAlgoGraph068: unknown lexer state');
  end;
  Result := Result xor (68 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveAlgoGraph069(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveAlgoGraph069: negative N');
  if N = 0 then Exit(12);
  if N = 1 then Exit(12+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 6;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveAlgoGraph069: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 69;
end;

function RecordopAlgoGraph070(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopAlgoGraph070: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 70;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodAlgoGraph071(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 71;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodAlgoGraph071: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 71;
end;

function InterfaceimplAlgoGraph072(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplAlgoGraph072: zero id');
  H := Id xor UInt64(72 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 5;
end;

function ArithmeticAlgoGraph073(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticAlgoGraph073: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(73) shl 3)
  else
    Tmp := Tmp + 8;
  Result := Tmp;
end;

function ValidationAlgoGraph074(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationAlgoGraph074: invalid bounds');
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

function SerializationAlgoGraph075(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationAlgoGraph075: buf bounds');
  U := UInt32(Value) xor UInt32(75 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationAlgoGraph076(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationAlgoGraph076: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(76 shl 8);
  Result := Int32(U);
end;

function HashingAlgoGraph077(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(77 * 2654435761);
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

function CollectionopAlgoGraph078(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopAlgoGraph078: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopAlgoGraph078: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopAlgoGraph078: sentinel value');
    Sum := Sum + (Arr[i] xor 78);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 78;
end;

function StatetransitionAlgoGraph079(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 79) mod 5;
  else
    raise EStateError.Create('StatetransitionAlgoGraph079: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionAlgoGraph079: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;


end.


