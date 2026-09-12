{ Unit: AlgoSort }
{ Title: AlgoSort }
{ Description: Sorting algorithms }
{ Dependencies: SystemTypes, ArrayList, Heap }
{ Blocks: 72 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit AlgoSort;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, ArrayList, Heap;

  // internal dependencies: SystemTypes, ArrayList, Heap

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function CollectionopAlgoSort001(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionAlgoSort002(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerAlgoSort003(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopAlgoSort004(var Buf: array of Byte; Offset, Count: Integer);
  function IoopAlgoSort005(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopAlgoSort006(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopAlgoSort007(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropAlgoSort008(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopAlgoSort009(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionAlgoSort010(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleAlgoSort011(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveAlgoSort012(N: Integer): Int64;
  function RecordopAlgoSort013(X, Y, Z: Integer): Integer;
  procedure ClassmethodAlgoSort014(var Counter: Integer; Delta: Integer);
  function InterfaceimplAlgoSort015(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticAlgoSort016(A, B: Int64): Int64;
  function ValidationAlgoSort017(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationAlgoSort018(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationAlgoSort019(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingAlgoSort020(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopAlgoSort021(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionAlgoSort022(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerAlgoSort023(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopAlgoSort024(var Buf: array of Byte; Offset, Count: Integer);
  function IoopAlgoSort025(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopAlgoSort026(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopAlgoSort027(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropAlgoSort028(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopAlgoSort029(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionAlgoSort030(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleAlgoSort031(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveAlgoSort032(N: Integer): Int64;
  function RecordopAlgoSort033(X, Y, Z: Integer): Integer;
  procedure ClassmethodAlgoSort034(var Counter: Integer; Delta: Integer);
  function InterfaceimplAlgoSort035(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticAlgoSort036(A, B: Int64): Int64;
  function ValidationAlgoSort037(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationAlgoSort038(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationAlgoSort039(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingAlgoSort040(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopAlgoSort041(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionAlgoSort042(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerAlgoSort043(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopAlgoSort044(var Buf: array of Byte; Offset, Count: Integer);
  function IoopAlgoSort045(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopAlgoSort046(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopAlgoSort047(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropAlgoSort048(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopAlgoSort049(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionAlgoSort050(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleAlgoSort051(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveAlgoSort052(N: Integer): Int64;
  function RecordopAlgoSort053(X, Y, Z: Integer): Integer;
  procedure ClassmethodAlgoSort054(var Counter: Integer; Delta: Integer);
  function InterfaceimplAlgoSort055(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticAlgoSort056(A, B: Int64): Int64;
  function ValidationAlgoSort057(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationAlgoSort058(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationAlgoSort059(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingAlgoSort060(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopAlgoSort061(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionAlgoSort062(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerAlgoSort063(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopAlgoSort064(var Buf: array of Byte; Offset, Count: Integer);
  function IoopAlgoSort065(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopAlgoSort066(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopAlgoSort067(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropAlgoSort068(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopAlgoSort069(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionAlgoSort070(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleAlgoSort071(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveAlgoSort072(N: Integer): Int64;

implementation

function CollectionopAlgoSort001(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopAlgoSort001: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopAlgoSort001: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopAlgoSort001: sentinel value');
    Sum := Sum + (Arr[i] xor 1);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 1;
end;

function StatetransitionAlgoSort002(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 2) mod 5;
  else
    raise EStateError.Create('StatetransitionAlgoSort002: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionAlgoSort002: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerAlgoSort003(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 3;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerAlgoSort003: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerAlgoSort003: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 3;
end;

procedure MemoryopAlgoSort004(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopAlgoSort004: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopAlgoSort004: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(4)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopAlgoSort005(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopAlgoSort005: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((5+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (5 mod 3);
end;

function ProtocolopAlgoSort006(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopAlgoSort006: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopAlgoSort006: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(6 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopAlgoSort007(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopAlgoSort007: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(7) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropAlgoSort008(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropAlgoSort008: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropAlgoSort008: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropAlgoSort008: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 8;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopAlgoSort009(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopAlgoSort009: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 9;
    1: Res := Operand xor Int64(9 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopAlgoSort009: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopAlgoSort009: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionAlgoSort010(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionAlgoSort010: pos out of range');
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
    raise EParseError.Create('ParserproductionAlgoSort010: expected token at pos '+IntToStr(Pos));
  Result := i + (10 mod 2);
end;

function LexerruleAlgoSort011(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleAlgoSort011: unknown lexer state');
  end;
  Result := Result xor (11 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveAlgoSort012(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveAlgoSort012: negative N');
  if N = 0 then Exit(12);
  if N = 1 then Exit(12+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 5;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveAlgoSort012: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 12;
end;

function RecordopAlgoSort013(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopAlgoSort013: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 13;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodAlgoSort014(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 14;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodAlgoSort014: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 14;
end;

function InterfaceimplAlgoSort015(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplAlgoSort015: zero id');
  H := Id xor UInt64(15 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 16;
end;

function ArithmeticAlgoSort016(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticAlgoSort016: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(16) shl 3)
  else
    Tmp := Tmp + 3;
  Result := Tmp;
end;

function ValidationAlgoSort017(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationAlgoSort017: invalid bounds');
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

function SerializationAlgoSort018(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationAlgoSort018: buf bounds');
  U := UInt32(Value) xor UInt32(18 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationAlgoSort019(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationAlgoSort019: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(19 shl 8);
  Result := Int32(U);
end;

function HashingAlgoSort020(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(20 * 2654435761);
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

function CollectionopAlgoSort021(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopAlgoSort021: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopAlgoSort021: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopAlgoSort021: sentinel value');
    Sum := Sum + (Arr[i] xor 21);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 21;
end;

function StatetransitionAlgoSort022(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 22) mod 5;
  else
    raise EStateError.Create('StatetransitionAlgoSort022: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionAlgoSort022: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerAlgoSort023(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 3;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerAlgoSort023: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerAlgoSort023: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 23;
end;

procedure MemoryopAlgoSort024(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopAlgoSort024: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopAlgoSort024: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(24)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopAlgoSort025(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopAlgoSort025: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((25+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (25 mod 3);
end;

function ProtocolopAlgoSort026(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopAlgoSort026: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopAlgoSort026: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(26 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopAlgoSort027(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopAlgoSort027: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(27) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropAlgoSort028(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropAlgoSort028: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropAlgoSort028: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropAlgoSort028: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 28;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopAlgoSort029(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopAlgoSort029: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 29;
    1: Res := Operand xor Int64(29 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopAlgoSort029: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopAlgoSort029: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionAlgoSort030(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionAlgoSort030: pos out of range');
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
    raise EParseError.Create('ParserproductionAlgoSort030: expected token at pos '+IntToStr(Pos));
  Result := i + (30 mod 2);
end;

function LexerruleAlgoSort031(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleAlgoSort031: unknown lexer state');
  end;
  Result := Result xor (31 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveAlgoSort032(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveAlgoSort032: negative N');
  if N = 0 then Exit(13);
  if N = 1 then Exit(13+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 4;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveAlgoSort032: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 32;
end;

function RecordopAlgoSort033(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopAlgoSort033: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 33;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodAlgoSort034(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 34;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodAlgoSort034: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 34;
end;

function InterfaceimplAlgoSort035(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplAlgoSort035: zero id');
  H := Id xor UInt64(35 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 2;
end;

function ArithmeticAlgoSort036(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticAlgoSort036: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(36) shl 3)
  else
    Tmp := Tmp + 10;
  Result := Tmp;
end;

function ValidationAlgoSort037(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationAlgoSort037: invalid bounds');
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

function SerializationAlgoSort038(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationAlgoSort038: buf bounds');
  U := UInt32(Value) xor UInt32(38 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationAlgoSort039(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationAlgoSort039: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(39 shl 8);
  Result := Int32(U);
end;

function HashingAlgoSort040(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(40 * 2654435761);
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

function CollectionopAlgoSort041(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopAlgoSort041: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopAlgoSort041: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopAlgoSort041: sentinel value');
    Sum := Sum + (Arr[i] xor 41);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 41;
end;

function StatetransitionAlgoSort042(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 42) mod 5;
  else
    raise EStateError.Create('StatetransitionAlgoSort042: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionAlgoSort042: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerAlgoSort043(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 3;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerAlgoSort043: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerAlgoSort043: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 43;
end;

procedure MemoryopAlgoSort044(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopAlgoSort044: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopAlgoSort044: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(44)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopAlgoSort045(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopAlgoSort045: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((45+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (45 mod 3);
end;

function ProtocolopAlgoSort046(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopAlgoSort046: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopAlgoSort046: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(46 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopAlgoSort047(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopAlgoSort047: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(47) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropAlgoSort048(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropAlgoSort048: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropAlgoSort048: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropAlgoSort048: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 48;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopAlgoSort049(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopAlgoSort049: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 49;
    1: Res := Operand xor Int64(49 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopAlgoSort049: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopAlgoSort049: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionAlgoSort050(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionAlgoSort050: pos out of range');
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
    raise EParseError.Create('ParserproductionAlgoSort050: expected token at pos '+IntToStr(Pos));
  Result := i + (50 mod 2);
end;

function LexerruleAlgoSort051(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleAlgoSort051: unknown lexer state');
  end;
  Result := Result xor (51 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveAlgoSort052(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveAlgoSort052: negative N');
  if N = 0 then Exit(14);
  if N = 1 then Exit(14+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 3;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveAlgoSort052: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 52;
end;

function RecordopAlgoSort053(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopAlgoSort053: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 53;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodAlgoSort054(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 54;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodAlgoSort054: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 54;
end;

function InterfaceimplAlgoSort055(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplAlgoSort055: zero id');
  H := Id xor UInt64(55 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 5;
end;

function ArithmeticAlgoSort056(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticAlgoSort056: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(56) shl 3)
  else
    Tmp := Tmp + 4;
  Result := Tmp;
end;

function ValidationAlgoSort057(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationAlgoSort057: invalid bounds');
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

function SerializationAlgoSort058(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationAlgoSort058: buf bounds');
  U := UInt32(Value) xor UInt32(58 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationAlgoSort059(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationAlgoSort059: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(59 shl 8);
  Result := Int32(U);
end;

function HashingAlgoSort060(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(60 * 2654435761);
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

function CollectionopAlgoSort061(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopAlgoSort061: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopAlgoSort061: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopAlgoSort061: sentinel value');
    Sum := Sum + (Arr[i] xor 61);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 61;
end;

function StatetransitionAlgoSort062(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 62) mod 5;
  else
    raise EStateError.Create('StatetransitionAlgoSort062: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionAlgoSort062: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerAlgoSort063(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 3;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerAlgoSort063: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerAlgoSort063: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 63;
end;

procedure MemoryopAlgoSort064(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopAlgoSort064: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopAlgoSort064: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(64)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopAlgoSort065(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopAlgoSort065: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((65+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (65 mod 3);
end;

function ProtocolopAlgoSort066(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopAlgoSort066: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopAlgoSort066: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(66 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopAlgoSort067(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopAlgoSort067: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(67) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropAlgoSort068(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropAlgoSort068: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropAlgoSort068: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropAlgoSort068: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 68;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopAlgoSort069(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopAlgoSort069: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 69;
    1: Res := Operand xor Int64(69 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopAlgoSort069: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopAlgoSort069: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionAlgoSort070(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionAlgoSort070: pos out of range');
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
    raise EParseError.Create('ParserproductionAlgoSort070: expected token at pos '+IntToStr(Pos));
  Result := i + (70 mod 2);
end;

function LexerruleAlgoSort071(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleAlgoSort071: unknown lexer state');
  end;
  Result := Result xor (71 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveAlgoSort072(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveAlgoSort072: negative N');
  if N = 0 then Exit(15);
  if N = 1 then Exit(15+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 2;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveAlgoSort072: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 72;
end;


end.


