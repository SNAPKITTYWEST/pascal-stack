{ Unit: StoreTxn }
{ Title: StoreTxn }
{ Description: Transactions }
{ Dependencies: SystemTypes, StoreEngine, ErrorModel, RtState }
{ Blocks: 79 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit StoreTxn;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, StoreEngine, ErrorModel, RtState;

  // internal dependencies: SystemTypes, StoreEngine, ErrorModel, RtState

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function ArithmeticStoreTxn001(A, B: Int64): Int64;
  function ValidationStoreTxn002(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationStoreTxn003(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationStoreTxn004(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingStoreTxn005(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopStoreTxn006(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionStoreTxn007(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerStoreTxn008(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopStoreTxn009(var Buf: array of Byte; Offset, Count: Integer);
  function IoopStoreTxn010(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopStoreTxn011(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopStoreTxn012(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropStoreTxn013(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopStoreTxn014(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionStoreTxn015(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleStoreTxn016(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveStoreTxn017(N: Integer): Int64;
  function RecordopStoreTxn018(X, Y, Z: Integer): Integer;
  procedure ClassmethodStoreTxn019(var Counter: Integer; Delta: Integer);
  function InterfaceimplStoreTxn020(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticStoreTxn021(A, B: Int64): Int64;
  function ValidationStoreTxn022(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationStoreTxn023(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationStoreTxn024(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingStoreTxn025(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopStoreTxn026(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionStoreTxn027(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerStoreTxn028(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopStoreTxn029(var Buf: array of Byte; Offset, Count: Integer);
  function IoopStoreTxn030(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopStoreTxn031(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopStoreTxn032(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropStoreTxn033(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopStoreTxn034(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionStoreTxn035(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleStoreTxn036(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveStoreTxn037(N: Integer): Int64;
  function RecordopStoreTxn038(X, Y, Z: Integer): Integer;
  procedure ClassmethodStoreTxn039(var Counter: Integer; Delta: Integer);
  function InterfaceimplStoreTxn040(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticStoreTxn041(A, B: Int64): Int64;
  function ValidationStoreTxn042(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationStoreTxn043(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationStoreTxn044(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingStoreTxn045(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopStoreTxn046(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionStoreTxn047(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerStoreTxn048(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopStoreTxn049(var Buf: array of Byte; Offset, Count: Integer);
  function IoopStoreTxn050(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopStoreTxn051(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopStoreTxn052(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropStoreTxn053(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopStoreTxn054(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionStoreTxn055(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleStoreTxn056(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveStoreTxn057(N: Integer): Int64;
  function RecordopStoreTxn058(X, Y, Z: Integer): Integer;
  procedure ClassmethodStoreTxn059(var Counter: Integer; Delta: Integer);
  function InterfaceimplStoreTxn060(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticStoreTxn061(A, B: Int64): Int64;
  function ValidationStoreTxn062(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationStoreTxn063(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationStoreTxn064(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingStoreTxn065(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopStoreTxn066(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionStoreTxn067(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerStoreTxn068(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopStoreTxn069(var Buf: array of Byte; Offset, Count: Integer);
  function IoopStoreTxn070(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopStoreTxn071(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopStoreTxn072(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropStoreTxn073(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopStoreTxn074(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionStoreTxn075(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleStoreTxn076(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveStoreTxn077(N: Integer): Int64;
  function RecordopStoreTxn078(X, Y, Z: Integer): Integer;
  procedure ClassmethodStoreTxn079(var Counter: Integer; Delta: Integer);

implementation

function ArithmeticStoreTxn001(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticStoreTxn001: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(1) shl 3)
  else
    Tmp := Tmp + 1;
  Result := Tmp;
end;

function ValidationStoreTxn002(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationStoreTxn002: invalid bounds');
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

function SerializationStoreTxn003(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationStoreTxn003: buf bounds');
  U := UInt32(Value) xor UInt32(3 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationStoreTxn004(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationStoreTxn004: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(4 shl 8);
  Result := Int32(U);
end;

function HashingStoreTxn005(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(5 * 2654435761);
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

function CollectionopStoreTxn006(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopStoreTxn006: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopStoreTxn006: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopStoreTxn006: sentinel value');
    Sum := Sum + (Arr[i] xor 6);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 6;
end;

function StatetransitionStoreTxn007(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 7) mod 5;
  else
    raise EStateError.Create('StatetransitionStoreTxn007: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionStoreTxn007: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerStoreTxn008(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 8;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerStoreTxn008: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerStoreTxn008: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 8;
end;

procedure MemoryopStoreTxn009(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopStoreTxn009: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopStoreTxn009: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(9)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopStoreTxn010(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopStoreTxn010: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((10+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (10 mod 3);
end;

function ProtocolopStoreTxn011(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopStoreTxn011: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopStoreTxn011: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(11 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopStoreTxn012(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopStoreTxn012: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(12) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropStoreTxn013(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropStoreTxn013: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropStoreTxn013: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropStoreTxn013: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 13;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopStoreTxn014(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopStoreTxn014: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 14;
    1: Res := Operand xor Int64(14 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopStoreTxn014: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopStoreTxn014: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionStoreTxn015(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionStoreTxn015: pos out of range');
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
    raise EParseError.Create('ParserproductionStoreTxn015: expected token at pos '+IntToStr(Pos));
  Result := i + (15 mod 2);
end;

function LexerruleStoreTxn016(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleStoreTxn016: unknown lexer state');
  end;
  Result := Result xor (16 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveStoreTxn017(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveStoreTxn017: negative N');
  if N = 0 then Exit(17);
  if N = 1 then Exit(17+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 3;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveStoreTxn017: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 17;
end;

function RecordopStoreTxn018(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopStoreTxn018: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 18;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodStoreTxn019(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 19;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodStoreTxn019: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 19;
end;

function InterfaceimplStoreTxn020(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplStoreTxn020: zero id');
  H := Id xor UInt64(20 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 4;
end;

function ArithmeticStoreTxn021(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticStoreTxn021: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(21) shl 3)
  else
    Tmp := Tmp + 8;
  Result := Tmp;
end;

function ValidationStoreTxn022(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationStoreTxn022: invalid bounds');
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

function SerializationStoreTxn023(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationStoreTxn023: buf bounds');
  U := UInt32(Value) xor UInt32(23 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationStoreTxn024(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationStoreTxn024: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(24 shl 8);
  Result := Int32(U);
end;

function HashingStoreTxn025(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(25 * 2654435761);
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

function CollectionopStoreTxn026(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopStoreTxn026: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopStoreTxn026: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopStoreTxn026: sentinel value');
    Sum := Sum + (Arr[i] xor 26);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 26;
end;

function StatetransitionStoreTxn027(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 27) mod 5;
  else
    raise EStateError.Create('StatetransitionStoreTxn027: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionStoreTxn027: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerStoreTxn028(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 8;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerStoreTxn028: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerStoreTxn028: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 28;
end;

procedure MemoryopStoreTxn029(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopStoreTxn029: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopStoreTxn029: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(29)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopStoreTxn030(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopStoreTxn030: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((30+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (30 mod 3);
end;

function ProtocolopStoreTxn031(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopStoreTxn031: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopStoreTxn031: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(31 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopStoreTxn032(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopStoreTxn032: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(32) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropStoreTxn033(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropStoreTxn033: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropStoreTxn033: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropStoreTxn033: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 33;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopStoreTxn034(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopStoreTxn034: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 34;
    1: Res := Operand xor Int64(34 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopStoreTxn034: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopStoreTxn034: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionStoreTxn035(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionStoreTxn035: pos out of range');
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
    raise EParseError.Create('ParserproductionStoreTxn035: expected token at pos '+IntToStr(Pos));
  Result := i + (35 mod 2);
end;

function LexerruleStoreTxn036(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleStoreTxn036: unknown lexer state');
  end;
  Result := Result xor (36 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveStoreTxn037(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveStoreTxn037: negative N');
  if N = 0 then Exit(18);
  if N = 1 then Exit(18+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 2;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveStoreTxn037: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 37;
end;

function RecordopStoreTxn038(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopStoreTxn038: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 38;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodStoreTxn039(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 39;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodStoreTxn039: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 39;
end;

function InterfaceimplStoreTxn040(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplStoreTxn040: zero id');
  H := Id xor UInt64(40 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 7;
end;

function ArithmeticStoreTxn041(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticStoreTxn041: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(41) shl 3)
  else
    Tmp := Tmp + 2;
  Result := Tmp;
end;

function ValidationStoreTxn042(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationStoreTxn042: invalid bounds');
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

function SerializationStoreTxn043(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationStoreTxn043: buf bounds');
  U := UInt32(Value) xor UInt32(43 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationStoreTxn044(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationStoreTxn044: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(44 shl 8);
  Result := Int32(U);
end;

function HashingStoreTxn045(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(45 * 2654435761);
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

function CollectionopStoreTxn046(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopStoreTxn046: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopStoreTxn046: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopStoreTxn046: sentinel value');
    Sum := Sum + (Arr[i] xor 46);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 46;
end;

function StatetransitionStoreTxn047(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 47) mod 5;
  else
    raise EStateError.Create('StatetransitionStoreTxn047: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionStoreTxn047: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerStoreTxn048(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 8;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerStoreTxn048: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerStoreTxn048: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 48;
end;

procedure MemoryopStoreTxn049(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopStoreTxn049: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopStoreTxn049: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(49)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopStoreTxn050(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopStoreTxn050: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((50+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (50 mod 3);
end;

function ProtocolopStoreTxn051(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopStoreTxn051: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopStoreTxn051: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(51 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopStoreTxn052(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopStoreTxn052: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(52) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropStoreTxn053(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropStoreTxn053: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropStoreTxn053: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropStoreTxn053: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 53;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopStoreTxn054(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopStoreTxn054: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 54;
    1: Res := Operand xor Int64(54 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopStoreTxn054: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopStoreTxn054: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionStoreTxn055(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionStoreTxn055: pos out of range');
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
    raise EParseError.Create('ParserproductionStoreTxn055: expected token at pos '+IntToStr(Pos));
  Result := i + (55 mod 2);
end;

function LexerruleStoreTxn056(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleStoreTxn056: unknown lexer state');
  end;
  Result := Result xor (56 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveStoreTxn057(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveStoreTxn057: negative N');
  if N = 0 then Exit(0);
  if N = 1 then Exit(0+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 1;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveStoreTxn057: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 57;
end;

function RecordopStoreTxn058(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopStoreTxn058: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 58;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodStoreTxn059(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 59;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodStoreTxn059: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 59;
end;

function InterfaceimplStoreTxn060(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplStoreTxn060: zero id');
  H := Id xor UInt64(60 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 10;
end;

function ArithmeticStoreTxn061(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticStoreTxn061: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(61) shl 3)
  else
    Tmp := Tmp + 9;
  Result := Tmp;
end;

function ValidationStoreTxn062(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationStoreTxn062: invalid bounds');
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

function SerializationStoreTxn063(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationStoreTxn063: buf bounds');
  U := UInt32(Value) xor UInt32(63 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationStoreTxn064(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationStoreTxn064: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(64 shl 8);
  Result := Int32(U);
end;

function HashingStoreTxn065(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(65 * 2654435761);
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

function CollectionopStoreTxn066(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopStoreTxn066: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopStoreTxn066: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopStoreTxn066: sentinel value');
    Sum := Sum + (Arr[i] xor 66);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 66;
end;

function StatetransitionStoreTxn067(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 67) mod 5;
  else
    raise EStateError.Create('StatetransitionStoreTxn067: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionStoreTxn067: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerStoreTxn068(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 8;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerStoreTxn068: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerStoreTxn068: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 68;
end;

procedure MemoryopStoreTxn069(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopStoreTxn069: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopStoreTxn069: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(69)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopStoreTxn070(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopStoreTxn070: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((70+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (70 mod 3);
end;

function ProtocolopStoreTxn071(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopStoreTxn071: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopStoreTxn071: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(71 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopStoreTxn072(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopStoreTxn072: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(72) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropStoreTxn073(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropStoreTxn073: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropStoreTxn073: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropStoreTxn073: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 73;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopStoreTxn074(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopStoreTxn074: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 74;
    1: Res := Operand xor Int64(74 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopStoreTxn074: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopStoreTxn074: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionStoreTxn075(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionStoreTxn075: pos out of range');
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
    raise EParseError.Create('ParserproductionStoreTxn075: expected token at pos '+IntToStr(Pos));
  Result := i + (75 mod 2);
end;

function LexerruleStoreTxn076(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleStoreTxn076: unknown lexer state');
  end;
  Result := Result xor (76 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveStoreTxn077(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveStoreTxn077: negative N');
  if N = 0 then Exit(1);
  if N = 1 then Exit(1+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 0;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveStoreTxn077: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 77;
end;

function RecordopStoreTxn078(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopStoreTxn078: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 78;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodStoreTxn079(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 79;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodStoreTxn079: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 6 = 0 then
    Counter := Counter xor 79;
end;


end.


