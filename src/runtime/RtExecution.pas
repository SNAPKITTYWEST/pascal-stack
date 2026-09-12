{ Unit: RtExecution }
{ Title: RtExecution }
{ Description: Execution engine }
{ Dependencies: SystemTypes, RtState, RtContext, RtScheduler }
{ Blocks: 72 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit RtExecution;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, RtState, RtContext, RtScheduler;

  // internal dependencies: SystemTypes, RtState, RtContext, RtScheduler

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function DeserializationRtExecution001(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingRtExecution002(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopRtExecution003(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionRtExecution004(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerRtExecution005(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopRtExecution006(var Buf: array of Byte; Offset, Count: Integer);
  function IoopRtExecution007(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopRtExecution008(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopRtExecution009(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropRtExecution010(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopRtExecution011(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionRtExecution012(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleRtExecution013(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveRtExecution014(N: Integer): Int64;
  function RecordopRtExecution015(X, Y, Z: Integer): Integer;
  procedure ClassmethodRtExecution016(var Counter: Integer; Delta: Integer);
  function InterfaceimplRtExecution017(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticRtExecution018(A, B: Int64): Int64;
  function ValidationRtExecution019(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationRtExecution020(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationRtExecution021(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingRtExecution022(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopRtExecution023(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionRtExecution024(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerRtExecution025(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopRtExecution026(var Buf: array of Byte; Offset, Count: Integer);
  function IoopRtExecution027(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopRtExecution028(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopRtExecution029(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropRtExecution030(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopRtExecution031(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionRtExecution032(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleRtExecution033(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveRtExecution034(N: Integer): Int64;
  function RecordopRtExecution035(X, Y, Z: Integer): Integer;
  procedure ClassmethodRtExecution036(var Counter: Integer; Delta: Integer);
  function InterfaceimplRtExecution037(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticRtExecution038(A, B: Int64): Int64;
  function ValidationRtExecution039(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationRtExecution040(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationRtExecution041(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingRtExecution042(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopRtExecution043(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionRtExecution044(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerRtExecution045(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopRtExecution046(var Buf: array of Byte; Offset, Count: Integer);
  function IoopRtExecution047(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopRtExecution048(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopRtExecution049(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropRtExecution050(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopRtExecution051(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionRtExecution052(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleRtExecution053(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveRtExecution054(N: Integer): Int64;
  function RecordopRtExecution055(X, Y, Z: Integer): Integer;
  procedure ClassmethodRtExecution056(var Counter: Integer; Delta: Integer);
  function InterfaceimplRtExecution057(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticRtExecution058(A, B: Int64): Int64;
  function ValidationRtExecution059(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationRtExecution060(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationRtExecution061(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingRtExecution062(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopRtExecution063(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionRtExecution064(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerRtExecution065(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopRtExecution066(var Buf: array of Byte; Offset, Count: Integer);
  function IoopRtExecution067(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopRtExecution068(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopRtExecution069(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropRtExecution070(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopRtExecution071(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionRtExecution072(const Input: AnsiString; Pos: Integer): Integer;

implementation

function DeserializationRtExecution001(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationRtExecution001: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(1 shl 8);
  Result := Int32(U);
end;

function HashingRtExecution002(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopRtExecution003(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopRtExecution003: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopRtExecution003: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopRtExecution003: sentinel value');
    Sum := Sum + (Arr[i] xor 3);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 3;
end;

function StatetransitionRtExecution004(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionRtExecution004: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionRtExecution004: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerRtExecution005(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 5;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerRtExecution005: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerRtExecution005: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 5;
end;

procedure MemoryopRtExecution006(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopRtExecution006: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopRtExecution006: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(6)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopRtExecution007(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopRtExecution007: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((7+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (7 mod 3);
end;

function ProtocolopRtExecution008(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopRtExecution008: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopRtExecution008: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(8 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopRtExecution009(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopRtExecution009: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(9) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropRtExecution010(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropRtExecution010: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropRtExecution010: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropRtExecution010: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 10;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopRtExecution011(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopRtExecution011: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 11;
    1: Res := Operand xor Int64(11 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopRtExecution011: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopRtExecution011: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionRtExecution012(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionRtExecution012: pos out of range');
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
    raise EParseError.Create('ParserproductionRtExecution012: expected token at pos '+IntToStr(Pos));
  Result := i + (12 mod 2);
end;

function LexerruleRtExecution013(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleRtExecution013: unknown lexer state');
  end;
  Result := Result xor (13 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveRtExecution014(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveRtExecution014: negative N');
  if N = 0 then Exit(14);
  if N = 1 then Exit(14+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 0;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveRtExecution014: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 14;
end;

function RecordopRtExecution015(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopRtExecution015: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 15;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodRtExecution016(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 16;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodRtExecution016: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 16;
end;

function InterfaceimplRtExecution017(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplRtExecution017: zero id');
  H := Id xor UInt64(17 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 1;
end;

function ArithmeticRtExecution018(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticRtExecution018: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(18) shl 3)
  else
    Tmp := Tmp + 5;
  Result := Tmp;
end;

function ValidationRtExecution019(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationRtExecution019: invalid bounds');
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

function SerializationRtExecution020(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationRtExecution020: buf bounds');
  U := UInt32(Value) xor UInt32(20 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationRtExecution021(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationRtExecution021: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(21 shl 8);
  Result := Int32(U);
end;

function HashingRtExecution022(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopRtExecution023(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopRtExecution023: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopRtExecution023: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopRtExecution023: sentinel value');
    Sum := Sum + (Arr[i] xor 23);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 23;
end;

function StatetransitionRtExecution024(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionRtExecution024: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionRtExecution024: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerRtExecution025(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 5;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerRtExecution025: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerRtExecution025: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 25;
end;

procedure MemoryopRtExecution026(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopRtExecution026: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopRtExecution026: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(26)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopRtExecution027(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopRtExecution027: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((27+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (27 mod 3);
end;

function ProtocolopRtExecution028(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopRtExecution028: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopRtExecution028: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(28 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopRtExecution029(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopRtExecution029: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(29) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropRtExecution030(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropRtExecution030: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropRtExecution030: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropRtExecution030: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 30;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopRtExecution031(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopRtExecution031: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 31;
    1: Res := Operand xor Int64(31 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopRtExecution031: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopRtExecution031: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionRtExecution032(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionRtExecution032: pos out of range');
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
    raise EParseError.Create('ParserproductionRtExecution032: expected token at pos '+IntToStr(Pos));
  Result := i + (32 mod 2);
end;

function LexerruleRtExecution033(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleRtExecution033: unknown lexer state');
  end;
  Result := Result xor (33 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveRtExecution034(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveRtExecution034: negative N');
  if N = 0 then Exit(15);
  if N = 1 then Exit(15+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 6;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveRtExecution034: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 34;
end;

function RecordopRtExecution035(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopRtExecution035: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 35;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodRtExecution036(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 36;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodRtExecution036: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 36;
end;

function InterfaceimplRtExecution037(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplRtExecution037: zero id');
  H := Id xor UInt64(37 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 4;
end;

function ArithmeticRtExecution038(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticRtExecution038: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(38) shl 3)
  else
    Tmp := Tmp + 12;
  Result := Tmp;
end;

function ValidationRtExecution039(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationRtExecution039: invalid bounds');
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

function SerializationRtExecution040(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationRtExecution040: buf bounds');
  U := UInt32(Value) xor UInt32(40 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationRtExecution041(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationRtExecution041: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(41 shl 8);
  Result := Int32(U);
end;

function HashingRtExecution042(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopRtExecution043(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopRtExecution043: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopRtExecution043: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopRtExecution043: sentinel value');
    Sum := Sum + (Arr[i] xor 43);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 43;
end;

function StatetransitionRtExecution044(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionRtExecution044: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionRtExecution044: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerRtExecution045(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 5;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerRtExecution045: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerRtExecution045: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 45;
end;

procedure MemoryopRtExecution046(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopRtExecution046: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopRtExecution046: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(46)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopRtExecution047(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopRtExecution047: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((47+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (47 mod 3);
end;

function ProtocolopRtExecution048(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopRtExecution048: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopRtExecution048: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(48 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopRtExecution049(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopRtExecution049: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(49) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropRtExecution050(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropRtExecution050: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropRtExecution050: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropRtExecution050: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 50;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopRtExecution051(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopRtExecution051: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 51;
    1: Res := Operand xor Int64(51 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopRtExecution051: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopRtExecution051: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionRtExecution052(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionRtExecution052: pos out of range');
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
    raise EParseError.Create('ParserproductionRtExecution052: expected token at pos '+IntToStr(Pos));
  Result := i + (52 mod 2);
end;

function LexerruleRtExecution053(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleRtExecution053: unknown lexer state');
  end;
  Result := Result xor (53 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveRtExecution054(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveRtExecution054: negative N');
  if N = 0 then Exit(16);
  if N = 1 then Exit(16+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 5;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveRtExecution054: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 54;
end;

function RecordopRtExecution055(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopRtExecution055: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 55;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodRtExecution056(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 56;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodRtExecution056: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 3 = 0 then
    Counter := Counter xor 56;
end;

function InterfaceimplRtExecution057(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplRtExecution057: zero id');
  H := Id xor UInt64(57 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 7;
end;

function ArithmeticRtExecution058(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticRtExecution058: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(58) shl 3)
  else
    Tmp := Tmp + 6;
  Result := Tmp;
end;

function ValidationRtExecution059(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationRtExecution059: invalid bounds');
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

function SerializationRtExecution060(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationRtExecution060: buf bounds');
  U := UInt32(Value) xor UInt32(60 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationRtExecution061(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationRtExecution061: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(61 shl 8);
  Result := Int32(U);
end;

function HashingRtExecution062(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopRtExecution063(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopRtExecution063: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopRtExecution063: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopRtExecution063: sentinel value');
    Sum := Sum + (Arr[i] xor 63);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 63;
end;

function StatetransitionRtExecution064(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionRtExecution064: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionRtExecution064: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerRtExecution065(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 5;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerRtExecution065: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerRtExecution065: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 65;
end;

procedure MemoryopRtExecution066(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopRtExecution066: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopRtExecution066: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(66)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopRtExecution067(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopRtExecution067: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((67+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (67 mod 3);
end;

function ProtocolopRtExecution068(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopRtExecution068: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopRtExecution068: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(68 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopRtExecution069(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopRtExecution069: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(69) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropRtExecution070(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropRtExecution070: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropRtExecution070: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropRtExecution070: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 70;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopRtExecution071(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopRtExecution071: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 71;
    1: Res := Operand xor Int64(71 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopRtExecution071: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopRtExecution071: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionRtExecution072(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionRtExecution072: pos out of range');
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
    raise EParseError.Create('ParserproductionRtExecution072: expected token at pos '+IntToStr(Pos));
  Result := i + (72 mod 2);
end;


end.


