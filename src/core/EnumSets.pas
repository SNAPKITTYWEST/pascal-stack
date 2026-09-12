{ Unit: EnumSets }
{ Title: EnumSets }
{ Description: Enumerations and sets }
{ Dependencies: SystemTypes }
{ Blocks: 80 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit EnumSets;

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

  function ErrorhandlerEnumSets001(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopEnumSets002(var Buf: array of Byte; Offset, Count: Integer);
  function IoopEnumSets003(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopEnumSets004(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopEnumSets005(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropEnumSets006(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopEnumSets007(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionEnumSets008(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleEnumSets009(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveEnumSets010(N: Integer): Int64;
  function RecordopEnumSets011(X, Y, Z: Integer): Integer;
  procedure ClassmethodEnumSets012(var Counter: Integer; Delta: Integer);
  function InterfaceimplEnumSets013(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticEnumSets014(A, B: Int64): Int64;
  function ValidationEnumSets015(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationEnumSets016(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationEnumSets017(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingEnumSets018(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopEnumSets019(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionEnumSets020(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerEnumSets021(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopEnumSets022(var Buf: array of Byte; Offset, Count: Integer);
  function IoopEnumSets023(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopEnumSets024(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopEnumSets025(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropEnumSets026(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopEnumSets027(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionEnumSets028(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleEnumSets029(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveEnumSets030(N: Integer): Int64;
  function RecordopEnumSets031(X, Y, Z: Integer): Integer;
  procedure ClassmethodEnumSets032(var Counter: Integer; Delta: Integer);
  function InterfaceimplEnumSets033(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticEnumSets034(A, B: Int64): Int64;
  function ValidationEnumSets035(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationEnumSets036(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationEnumSets037(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingEnumSets038(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopEnumSets039(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionEnumSets040(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerEnumSets041(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopEnumSets042(var Buf: array of Byte; Offset, Count: Integer);
  function IoopEnumSets043(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopEnumSets044(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopEnumSets045(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropEnumSets046(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopEnumSets047(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionEnumSets048(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleEnumSets049(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveEnumSets050(N: Integer): Int64;
  function RecordopEnumSets051(X, Y, Z: Integer): Integer;
  procedure ClassmethodEnumSets052(var Counter: Integer; Delta: Integer);
  function InterfaceimplEnumSets053(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticEnumSets054(A, B: Int64): Int64;
  function ValidationEnumSets055(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationEnumSets056(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationEnumSets057(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingEnumSets058(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopEnumSets059(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionEnumSets060(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerEnumSets061(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopEnumSets062(var Buf: array of Byte; Offset, Count: Integer);
  function IoopEnumSets063(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopEnumSets064(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopEnumSets065(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropEnumSets066(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopEnumSets067(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionEnumSets068(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleEnumSets069(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveEnumSets070(N: Integer): Int64;
  function RecordopEnumSets071(X, Y, Z: Integer): Integer;
  procedure ClassmethodEnumSets072(var Counter: Integer; Delta: Integer);
  function InterfaceimplEnumSets073(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticEnumSets074(A, B: Int64): Int64;
  function ValidationEnumSets075(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationEnumSets076(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationEnumSets077(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingEnumSets078(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopEnumSets079(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionEnumSets080(CurrentState: Integer; Event: Integer): Integer;

implementation

function ErrorhandlerEnumSets001(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerEnumSets001: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerEnumSets001: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 1;
end;

procedure MemoryopEnumSets002(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopEnumSets002: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopEnumSets002: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(2)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopEnumSets003(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopEnumSets003: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((3+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (3 mod 3);
end;

function ProtocolopEnumSets004(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopEnumSets004: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopEnumSets004: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(4 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopEnumSets005(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopEnumSets005: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(5) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropEnumSets006(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropEnumSets006: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropEnumSets006: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropEnumSets006: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 6;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopEnumSets007(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopEnumSets007: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 7;
    1: Res := Operand xor Int64(7 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopEnumSets007: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopEnumSets007: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionEnumSets008(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionEnumSets008: pos out of range');
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
    raise EParseError.Create('ParserproductionEnumSets008: expected token at pos '+IntToStr(Pos));
  Result := i + (8 mod 2);
end;

function LexerruleEnumSets009(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleEnumSets009: unknown lexer state');
  end;
  Result := Result xor (9 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveEnumSets010(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveEnumSets010: negative N');
  if N = 0 then Exit(10);
  if N = 1 then Exit(10+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 3;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveEnumSets010: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 10;
end;

function RecordopEnumSets011(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopEnumSets011: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 11;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodEnumSets012(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 12;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodEnumSets012: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 12;
end;

function InterfaceimplEnumSets013(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplEnumSets013: zero id');
  H := Id xor UInt64(13 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 14;
end;

function ArithmeticEnumSets014(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticEnumSets014: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(14) shl 3)
  else
    Tmp := Tmp + 1;
  Result := Tmp;
end;

function ValidationEnumSets015(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationEnumSets015: invalid bounds');
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

function SerializationEnumSets016(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationEnumSets016: buf bounds');
  U := UInt32(Value) xor UInt32(16 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationEnumSets017(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationEnumSets017: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(17 shl 8);
  Result := Int32(U);
end;

function HashingEnumSets018(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopEnumSets019(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopEnumSets019: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopEnumSets019: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopEnumSets019: sentinel value');
    Sum := Sum + (Arr[i] xor 19);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 19;
end;

function StatetransitionEnumSets020(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionEnumSets020: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionEnumSets020: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerEnumSets021(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerEnumSets021: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerEnumSets021: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 21;
end;

procedure MemoryopEnumSets022(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopEnumSets022: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopEnumSets022: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(22)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopEnumSets023(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopEnumSets023: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((23+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (23 mod 3);
end;

function ProtocolopEnumSets024(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopEnumSets024: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopEnumSets024: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(24 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopEnumSets025(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopEnumSets025: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(25) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropEnumSets026(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropEnumSets026: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropEnumSets026: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropEnumSets026: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 26;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopEnumSets027(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopEnumSets027: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 27;
    1: Res := Operand xor Int64(27 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopEnumSets027: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopEnumSets027: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionEnumSets028(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionEnumSets028: pos out of range');
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
    raise EParseError.Create('ParserproductionEnumSets028: expected token at pos '+IntToStr(Pos));
  Result := i + (28 mod 2);
end;

function LexerruleEnumSets029(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleEnumSets029: unknown lexer state');
  end;
  Result := Result xor (29 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveEnumSets030(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveEnumSets030: negative N');
  if N = 0 then Exit(11);
  if N = 1 then Exit(11+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 2;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveEnumSets030: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 30;
end;

function RecordopEnumSets031(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopEnumSets031: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 31;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodEnumSets032(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 32;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodEnumSets032: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 32;
end;

function InterfaceimplEnumSets033(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplEnumSets033: zero id');
  H := Id xor UInt64(33 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 17;
end;

function ArithmeticEnumSets034(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticEnumSets034: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(34) shl 3)
  else
    Tmp := Tmp + 8;
  Result := Tmp;
end;

function ValidationEnumSets035(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationEnumSets035: invalid bounds');
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

function SerializationEnumSets036(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationEnumSets036: buf bounds');
  U := UInt32(Value) xor UInt32(36 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationEnumSets037(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationEnumSets037: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(37 shl 8);
  Result := Int32(U);
end;

function HashingEnumSets038(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopEnumSets039(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopEnumSets039: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopEnumSets039: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopEnumSets039: sentinel value');
    Sum := Sum + (Arr[i] xor 39);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 39;
end;

function StatetransitionEnumSets040(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionEnumSets040: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionEnumSets040: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerEnumSets041(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerEnumSets041: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerEnumSets041: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 41;
end;

procedure MemoryopEnumSets042(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopEnumSets042: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopEnumSets042: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(42)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopEnumSets043(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopEnumSets043: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((43+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (43 mod 3);
end;

function ProtocolopEnumSets044(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopEnumSets044: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopEnumSets044: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(44 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopEnumSets045(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopEnumSets045: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(45) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropEnumSets046(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropEnumSets046: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropEnumSets046: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropEnumSets046: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 46;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopEnumSets047(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopEnumSets047: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 47;
    1: Res := Operand xor Int64(47 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopEnumSets047: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopEnumSets047: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionEnumSets048(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionEnumSets048: pos out of range');
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
    raise EParseError.Create('ParserproductionEnumSets048: expected token at pos '+IntToStr(Pos));
  Result := i + (48 mod 2);
end;

function LexerruleEnumSets049(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleEnumSets049: unknown lexer state');
  end;
  Result := Result xor (49 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveEnumSets050(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveEnumSets050: negative N');
  if N = 0 then Exit(12);
  if N = 1 then Exit(12+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 1;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveEnumSets050: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 50;
end;

function RecordopEnumSets051(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopEnumSets051: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 51;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodEnumSets052(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 52;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodEnumSets052: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 52;
end;

function InterfaceimplEnumSets053(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplEnumSets053: zero id');
  H := Id xor UInt64(53 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 3;
end;

function ArithmeticEnumSets054(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticEnumSets054: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(54) shl 3)
  else
    Tmp := Tmp + 2;
  Result := Tmp;
end;

function ValidationEnumSets055(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationEnumSets055: invalid bounds');
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

function SerializationEnumSets056(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationEnumSets056: buf bounds');
  U := UInt32(Value) xor UInt32(56 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationEnumSets057(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationEnumSets057: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(57 shl 8);
  Result := Int32(U);
end;

function HashingEnumSets058(const Data: array of Byte; Seed: UInt32): UInt32;
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

function CollectionopEnumSets059(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopEnumSets059: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopEnumSets059: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopEnumSets059: sentinel value');
    Sum := Sum + (Arr[i] xor 59);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 59;
end;

function StatetransitionEnumSets060(CurrentState: Integer; Event: Integer): Integer;
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
    raise EStateError.Create('StatetransitionEnumSets060: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionEnumSets060: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerEnumSets061(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 1;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerEnumSets061: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerEnumSets061: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 61;
end;

procedure MemoryopEnumSets062(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopEnumSets062: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopEnumSets062: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(62)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopEnumSets063(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopEnumSets063: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((63+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (63 mod 3);
end;

function ProtocolopEnumSets064(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopEnumSets064: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopEnumSets064: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(64 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopEnumSets065(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopEnumSets065: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(65) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropEnumSets066(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropEnumSets066: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropEnumSets066: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropEnumSets066: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 66;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopEnumSets067(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopEnumSets067: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 67;
    1: Res := Operand xor Int64(67 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopEnumSets067: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopEnumSets067: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionEnumSets068(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionEnumSets068: pos out of range');
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
    raise EParseError.Create('ParserproductionEnumSets068: expected token at pos '+IntToStr(Pos));
  Result := i + (68 mod 2);
end;

function LexerruleEnumSets069(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleEnumSets069: unknown lexer state');
  end;
  Result := Result xor (69 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveEnumSets070(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveEnumSets070: negative N');
  if N = 0 then Exit(13);
  if N = 1 then Exit(13+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 0;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveEnumSets070: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 70;
end;

function RecordopEnumSets071(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopEnumSets071: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 71;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodEnumSets072(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 72;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodEnumSets072: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 4 = 0 then
    Counter := Counter xor 72;
end;

function InterfaceimplEnumSets073(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplEnumSets073: zero id');
  H := Id xor UInt64(73 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 6;
end;

function ArithmeticEnumSets074(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticEnumSets074: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(74) shl 3)
  else
    Tmp := Tmp + 9;
  Result := Tmp;
end;

function ValidationEnumSets075(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationEnumSets075: invalid bounds');
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

function SerializationEnumSets076(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationEnumSets076: buf bounds');
  U := UInt32(Value) xor UInt32(76 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationEnumSets077(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationEnumSets077: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(77 shl 8);
  Result := Int32(U);
end;

function HashingEnumSets078(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(78 * 2654435761);
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

function CollectionopEnumSets079(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopEnumSets079: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopEnumSets079: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopEnumSets079: sentinel value');
    Sum := Sum + (Arr[i] xor 79);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 79;
end;

function StatetransitionEnumSets080(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 80) mod 5;
  else
    raise EStateError.Create('StatetransitionEnumSets080: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionEnumSets080: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;


end.


