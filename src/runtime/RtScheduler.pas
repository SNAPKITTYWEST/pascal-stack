{ Unit: RtScheduler }
{ Title: RtScheduler }
{ Description: Scheduler }
{ Dependencies: SystemTypes, RtState, Queue, Heap }
{ Blocks: 72 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit RtScheduler;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, RtState, Queue, Heap;

  // internal dependencies: SystemTypes, RtState, Queue, Heap

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function ValidationRtScheduler001(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationRtScheduler002(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationRtScheduler003(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingRtScheduler004(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopRtScheduler005(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionRtScheduler006(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerRtScheduler007(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopRtScheduler008(var Buf: array of Byte; Offset, Count: Integer);
  function IoopRtScheduler009(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopRtScheduler010(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopRtScheduler011(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropRtScheduler012(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopRtScheduler013(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionRtScheduler014(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleRtScheduler015(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveRtScheduler016(N: Integer): Int64;
  function RecordopRtScheduler017(X, Y, Z: Integer): Integer;
  procedure ClassmethodRtScheduler018(var Counter: Integer; Delta: Integer);
  function InterfaceimplRtScheduler019(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticRtScheduler020(A, B: Int64): Int64;
  function ValidationRtScheduler021(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationRtScheduler022(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationRtScheduler023(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingRtScheduler024(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopRtScheduler025(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionRtScheduler026(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerRtScheduler027(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopRtScheduler028(var Buf: array of Byte; Offset, Count: Integer);
  function IoopRtScheduler029(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopRtScheduler030(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopRtScheduler031(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropRtScheduler032(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopRtScheduler033(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionRtScheduler034(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleRtScheduler035(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveRtScheduler036(N: Integer): Int64;
  function RecordopRtScheduler037(X, Y, Z: Integer): Integer;
  procedure ClassmethodRtScheduler038(var Counter: Integer; Delta: Integer);
  function InterfaceimplRtScheduler039(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticRtScheduler040(A, B: Int64): Int64;
  function ValidationRtScheduler041(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationRtScheduler042(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationRtScheduler043(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingRtScheduler044(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopRtScheduler045(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionRtScheduler046(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerRtScheduler047(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopRtScheduler048(var Buf: array of Byte; Offset, Count: Integer);
  function IoopRtScheduler049(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopRtScheduler050(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopRtScheduler051(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropRtScheduler052(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopRtScheduler053(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionRtScheduler054(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleRtScheduler055(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveRtScheduler056(N: Integer): Int64;
  function RecordopRtScheduler057(X, Y, Z: Integer): Integer;
  procedure ClassmethodRtScheduler058(var Counter: Integer; Delta: Integer);
  function InterfaceimplRtScheduler059(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticRtScheduler060(A, B: Int64): Int64;
  function ValidationRtScheduler061(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationRtScheduler062(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationRtScheduler063(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingRtScheduler064(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopRtScheduler065(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionRtScheduler066(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerRtScheduler067(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopRtScheduler068(var Buf: array of Byte; Offset, Count: Integer);
  function IoopRtScheduler069(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopRtScheduler070(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopRtScheduler071(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropRtScheduler072(Priority, Age, Deadline: Integer): Integer;

implementation

function ValidationRtScheduler001(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationRtScheduler001: invalid bounds');
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

function SerializationRtScheduler002(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationRtScheduler002: buf bounds');
  U := UInt32(Value) xor UInt32(2 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationRtScheduler003(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationRtScheduler003: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(3 shl 8);
  Result := Int32(U);
end;

function HashingRtScheduler004(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(4 * 2654435761);
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

function CollectionopRtScheduler005(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopRtScheduler005: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopRtScheduler005: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopRtScheduler005: sentinel value');
    Sum := Sum + (Arr[i] xor 5);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 5;
end;

function StatetransitionRtScheduler006(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 6) mod 5;
  else
    raise EStateError.Create('StatetransitionRtScheduler006: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionRtScheduler006: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerRtScheduler007(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 7;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerRtScheduler007: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerRtScheduler007: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 7;
end;

procedure MemoryopRtScheduler008(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopRtScheduler008: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopRtScheduler008: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(8)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopRtScheduler009(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopRtScheduler009: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((9+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (9 mod 3);
end;

function ProtocolopRtScheduler010(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopRtScheduler010: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopRtScheduler010: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(10 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopRtScheduler011(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopRtScheduler011: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(11) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropRtScheduler012(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropRtScheduler012: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropRtScheduler012: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropRtScheduler012: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 12;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopRtScheduler013(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopRtScheduler013: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 13;
    1: Res := Operand xor Int64(13 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopRtScheduler013: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopRtScheduler013: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionRtScheduler014(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionRtScheduler014: pos out of range');
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
    raise EParseError.Create('ParserproductionRtScheduler014: expected token at pos '+IntToStr(Pos));
  Result := i + (14 mod 2);
end;

function LexerruleRtScheduler015(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleRtScheduler015: unknown lexer state');
  end;
  Result := Result xor (15 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveRtScheduler016(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveRtScheduler016: negative N');
  if N = 0 then Exit(16);
  if N = 1 then Exit(16+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 2;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveRtScheduler016: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 16;
end;

function RecordopRtScheduler017(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopRtScheduler017: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 17;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodRtScheduler018(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 18;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodRtScheduler018: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 18;
end;

function InterfaceimplRtScheduler019(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplRtScheduler019: zero id');
  H := Id xor UInt64(19 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 3;
end;

function ArithmeticRtScheduler020(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticRtScheduler020: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(20) shl 3)
  else
    Tmp := Tmp + 7;
  Result := Tmp;
end;

function ValidationRtScheduler021(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationRtScheduler021: invalid bounds');
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

function SerializationRtScheduler022(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationRtScheduler022: buf bounds');
  U := UInt32(Value) xor UInt32(22 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationRtScheduler023(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationRtScheduler023: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(23 shl 8);
  Result := Int32(U);
end;

function HashingRtScheduler024(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(24 * 2654435761);
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

function CollectionopRtScheduler025(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopRtScheduler025: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopRtScheduler025: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopRtScheduler025: sentinel value');
    Sum := Sum + (Arr[i] xor 25);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 25;
end;

function StatetransitionRtScheduler026(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 26) mod 5;
  else
    raise EStateError.Create('StatetransitionRtScheduler026: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionRtScheduler026: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerRtScheduler027(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 7;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerRtScheduler027: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerRtScheduler027: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 27;
end;

procedure MemoryopRtScheduler028(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopRtScheduler028: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopRtScheduler028: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(28)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopRtScheduler029(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopRtScheduler029: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((29+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (29 mod 3);
end;

function ProtocolopRtScheduler030(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopRtScheduler030: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopRtScheduler030: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(30 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopRtScheduler031(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopRtScheduler031: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(31) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropRtScheduler032(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropRtScheduler032: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropRtScheduler032: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropRtScheduler032: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 32;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopRtScheduler033(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopRtScheduler033: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 33;
    1: Res := Operand xor Int64(33 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopRtScheduler033: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopRtScheduler033: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionRtScheduler034(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionRtScheduler034: pos out of range');
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
    raise EParseError.Create('ParserproductionRtScheduler034: expected token at pos '+IntToStr(Pos));
  Result := i + (34 mod 2);
end;

function LexerruleRtScheduler035(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleRtScheduler035: unknown lexer state');
  end;
  Result := Result xor (35 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveRtScheduler036(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveRtScheduler036: negative N');
  if N = 0 then Exit(17);
  if N = 1 then Exit(17+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 1;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveRtScheduler036: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 36;
end;

function RecordopRtScheduler037(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopRtScheduler037: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 37;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodRtScheduler038(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 38;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodRtScheduler038: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 38;
end;

function InterfaceimplRtScheduler039(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplRtScheduler039: zero id');
  H := Id xor UInt64(39 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 6;
end;

function ArithmeticRtScheduler040(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticRtScheduler040: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(40) shl 3)
  else
    Tmp := Tmp + 1;
  Result := Tmp;
end;

function ValidationRtScheduler041(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationRtScheduler041: invalid bounds');
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

function SerializationRtScheduler042(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationRtScheduler042: buf bounds');
  U := UInt32(Value) xor UInt32(42 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationRtScheduler043(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationRtScheduler043: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(43 shl 8);
  Result := Int32(U);
end;

function HashingRtScheduler044(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(44 * 2654435761);
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

function CollectionopRtScheduler045(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopRtScheduler045: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopRtScheduler045: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopRtScheduler045: sentinel value');
    Sum := Sum + (Arr[i] xor 45);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 45;
end;

function StatetransitionRtScheduler046(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 46) mod 5;
  else
    raise EStateError.Create('StatetransitionRtScheduler046: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionRtScheduler046: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerRtScheduler047(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 7;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerRtScheduler047: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerRtScheduler047: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 47;
end;

procedure MemoryopRtScheduler048(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopRtScheduler048: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopRtScheduler048: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(48)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopRtScheduler049(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopRtScheduler049: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((49+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (49 mod 3);
end;

function ProtocolopRtScheduler050(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopRtScheduler050: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopRtScheduler050: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(50 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopRtScheduler051(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopRtScheduler051: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(51) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropRtScheduler052(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropRtScheduler052: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropRtScheduler052: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropRtScheduler052: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 52;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopRtScheduler053(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopRtScheduler053: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 53;
    1: Res := Operand xor Int64(53 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopRtScheduler053: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopRtScheduler053: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionRtScheduler054(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionRtScheduler054: pos out of range');
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
    raise EParseError.Create('ParserproductionRtScheduler054: expected token at pos '+IntToStr(Pos));
  Result := i + (54 mod 2);
end;

function LexerruleRtScheduler055(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleRtScheduler055: unknown lexer state');
  end;
  Result := Result xor (55 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveRtScheduler056(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveRtScheduler056: negative N');
  if N = 0 then Exit(18);
  if N = 1 then Exit(18+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 0;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveRtScheduler056: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 56;
end;

function RecordopRtScheduler057(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopRtScheduler057: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 57;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodRtScheduler058(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 58;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodRtScheduler058: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 58;
end;

function InterfaceimplRtScheduler059(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplRtScheduler059: zero id');
  H := Id xor UInt64(59 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 9;
end;

function ArithmeticRtScheduler060(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticRtScheduler060: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(60) shl 3)
  else
    Tmp := Tmp + 8;
  Result := Tmp;
end;

function ValidationRtScheduler061(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationRtScheduler061: invalid bounds');
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

function SerializationRtScheduler062(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationRtScheduler062: buf bounds');
  U := UInt32(Value) xor UInt32(62 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationRtScheduler063(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationRtScheduler063: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(63 shl 8);
  Result := Int32(U);
end;

function HashingRtScheduler064(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(64 * 2654435761);
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

function CollectionopRtScheduler065(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopRtScheduler065: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopRtScheduler065: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopRtScheduler065: sentinel value');
    Sum := Sum + (Arr[i] xor 65);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 65;
end;

function StatetransitionRtScheduler066(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 66) mod 5;
  else
    raise EStateError.Create('StatetransitionRtScheduler066: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionRtScheduler066: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerRtScheduler067(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 7;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerRtScheduler067: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerRtScheduler067: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 67;
end;

procedure MemoryopRtScheduler068(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopRtScheduler068: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopRtScheduler068: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(68)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopRtScheduler069(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopRtScheduler069: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((69+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (69 mod 3);
end;

function ProtocolopRtScheduler070(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopRtScheduler070: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopRtScheduler070: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(70 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopRtScheduler071(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopRtScheduler071: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(71) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropRtScheduler072(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropRtScheduler072: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropRtScheduler072: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropRtScheduler072: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 72;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;


end.


