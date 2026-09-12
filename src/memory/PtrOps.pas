{ Unit: PtrOps }
{ Title: PtrOps }
{ Description: Pointer operations & safety }
{ Dependencies: SystemTypes, MemArena }
{ Blocks: 72 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit PtrOps;

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

  function StorageopPtrOps001(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropPtrOps002(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopPtrOps003(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionPtrOps004(const Input: AnsiString; Pos: Integer): Integer;
  function LexerrulePtrOps005(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitivePtrOps006(N: Integer): Int64;
  function RecordopPtrOps007(X, Y, Z: Integer): Integer;
  procedure ClassmethodPtrOps008(var Counter: Integer; Delta: Integer);
  function InterfaceimplPtrOps009(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticPtrOps010(A, B: Int64): Int64;
  function ValidationPtrOps011(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationPtrOps012(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationPtrOps013(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingPtrOps014(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopPtrOps015(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionPtrOps016(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerPtrOps017(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopPtrOps018(var Buf: array of Byte; Offset, Count: Integer);
  function IoopPtrOps019(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopPtrOps020(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopPtrOps021(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropPtrOps022(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopPtrOps023(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionPtrOps024(const Input: AnsiString; Pos: Integer): Integer;
  function LexerrulePtrOps025(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitivePtrOps026(N: Integer): Int64;
  function RecordopPtrOps027(X, Y, Z: Integer): Integer;
  procedure ClassmethodPtrOps028(var Counter: Integer; Delta: Integer);
  function InterfaceimplPtrOps029(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticPtrOps030(A, B: Int64): Int64;
  function ValidationPtrOps031(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationPtrOps032(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationPtrOps033(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingPtrOps034(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopPtrOps035(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionPtrOps036(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerPtrOps037(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopPtrOps038(var Buf: array of Byte; Offset, Count: Integer);
  function IoopPtrOps039(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopPtrOps040(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopPtrOps041(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropPtrOps042(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopPtrOps043(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionPtrOps044(const Input: AnsiString; Pos: Integer): Integer;
  function LexerrulePtrOps045(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitivePtrOps046(N: Integer): Int64;
  function RecordopPtrOps047(X, Y, Z: Integer): Integer;
  procedure ClassmethodPtrOps048(var Counter: Integer; Delta: Integer);
  function InterfaceimplPtrOps049(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticPtrOps050(A, B: Int64): Int64;
  function ValidationPtrOps051(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationPtrOps052(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationPtrOps053(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingPtrOps054(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopPtrOps055(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionPtrOps056(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerPtrOps057(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopPtrOps058(var Buf: array of Byte; Offset, Count: Integer);
  function IoopPtrOps059(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopPtrOps060(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopPtrOps061(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropPtrOps062(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopPtrOps063(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionPtrOps064(const Input: AnsiString; Pos: Integer): Integer;
  function LexerrulePtrOps065(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitivePtrOps066(N: Integer): Int64;
  function RecordopPtrOps067(X, Y, Z: Integer): Integer;
  procedure ClassmethodPtrOps068(var Counter: Integer; Delta: Integer);
  function InterfaceimplPtrOps069(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticPtrOps070(A, B: Int64): Int64;
  function ValidationPtrOps071(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationPtrOps072(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;

implementation

function StorageopPtrOps001(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopPtrOps001: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(1) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropPtrOps002(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropPtrOps002: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropPtrOps002: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropPtrOps002: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 2;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopPtrOps003(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopPtrOps003: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 3;
    1: Res := Operand xor Int64(3 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopPtrOps003: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopPtrOps003: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionPtrOps004(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionPtrOps004: pos out of range');
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
    raise EParseError.Create('ParserproductionPtrOps004: expected token at pos '+IntToStr(Pos));
  Result := i + (4 mod 2);
end;

function LexerrulePtrOps005(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerrulePtrOps005: unknown lexer state');
  end;
  Result := Result xor (5 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitivePtrOps006(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitivePtrOps006: negative N');
  if N = 0 then Exit(6);
  if N = 1 then Exit(6+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 6;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitivePtrOps006: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 6;
end;

function RecordopPtrOps007(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopPtrOps007: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 7;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodPtrOps008(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 8;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodPtrOps008: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 8;
end;

function InterfaceimplPtrOps009(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplPtrOps009: zero id');
  H := Id xor UInt64(9 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 10;
end;

function ArithmeticPtrOps010(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticPtrOps010: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(10) shl 3)
  else
    Tmp := Tmp + 10;
  Result := Tmp;
end;

function ValidationPtrOps011(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationPtrOps011: invalid bounds');
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

function SerializationPtrOps012(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationPtrOps012: buf bounds');
  U := UInt32(Value) xor UInt32(12 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationPtrOps013(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationPtrOps013: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(13 shl 8);
  Result := Int32(U);
end;

function HashingPtrOps014(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(14 * 2654435761);
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

function CollectionopPtrOps015(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopPtrOps015: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopPtrOps015: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopPtrOps015: sentinel value');
    Sum := Sum + (Arr[i] xor 15);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 15;
end;

function StatetransitionPtrOps016(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 16) mod 5;
  else
    raise EStateError.Create('StatetransitionPtrOps016: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionPtrOps016: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerPtrOps017(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 7;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerPtrOps017: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerPtrOps017: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 17;
end;

procedure MemoryopPtrOps018(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopPtrOps018: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopPtrOps018: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(18)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopPtrOps019(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopPtrOps019: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((19+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (19 mod 3);
end;

function ProtocolopPtrOps020(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopPtrOps020: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopPtrOps020: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(20 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopPtrOps021(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopPtrOps021: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(21) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropPtrOps022(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropPtrOps022: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropPtrOps022: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropPtrOps022: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 22;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopPtrOps023(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopPtrOps023: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 23;
    1: Res := Operand xor Int64(23 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopPtrOps023: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopPtrOps023: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionPtrOps024(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionPtrOps024: pos out of range');
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
    raise EParseError.Create('ParserproductionPtrOps024: expected token at pos '+IntToStr(Pos));
  Result := i + (24 mod 2);
end;

function LexerrulePtrOps025(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerrulePtrOps025: unknown lexer state');
  end;
  Result := Result xor (25 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitivePtrOps026(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitivePtrOps026: negative N');
  if N = 0 then Exit(7);
  if N = 1 then Exit(7+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 5;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitivePtrOps026: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 26;
end;

function RecordopPtrOps027(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopPtrOps027: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 27;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodPtrOps028(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 28;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodPtrOps028: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 28;
end;

function InterfaceimplPtrOps029(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplPtrOps029: zero id');
  H := Id xor UInt64(29 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 13;
end;

function ArithmeticPtrOps030(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticPtrOps030: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(30) shl 3)
  else
    Tmp := Tmp + 4;
  Result := Tmp;
end;

function ValidationPtrOps031(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationPtrOps031: invalid bounds');
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

function SerializationPtrOps032(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationPtrOps032: buf bounds');
  U := UInt32(Value) xor UInt32(32 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationPtrOps033(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationPtrOps033: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(33 shl 8);
  Result := Int32(U);
end;

function HashingPtrOps034(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(34 * 2654435761);
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

function CollectionopPtrOps035(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopPtrOps035: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopPtrOps035: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopPtrOps035: sentinel value');
    Sum := Sum + (Arr[i] xor 35);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 35;
end;

function StatetransitionPtrOps036(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 36) mod 5;
  else
    raise EStateError.Create('StatetransitionPtrOps036: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionPtrOps036: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerPtrOps037(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 7;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerPtrOps037: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerPtrOps037: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 37;
end;

procedure MemoryopPtrOps038(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopPtrOps038: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopPtrOps038: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(38)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopPtrOps039(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopPtrOps039: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((39+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (39 mod 3);
end;

function ProtocolopPtrOps040(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopPtrOps040: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopPtrOps040: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(40 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopPtrOps041(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopPtrOps041: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(41) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropPtrOps042(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropPtrOps042: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropPtrOps042: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropPtrOps042: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 42;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopPtrOps043(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopPtrOps043: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 43;
    1: Res := Operand xor Int64(43 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopPtrOps043: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopPtrOps043: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionPtrOps044(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionPtrOps044: pos out of range');
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
    raise EParseError.Create('ParserproductionPtrOps044: expected token at pos '+IntToStr(Pos));
  Result := i + (44 mod 2);
end;

function LexerrulePtrOps045(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerrulePtrOps045: unknown lexer state');
  end;
  Result := Result xor (45 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitivePtrOps046(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitivePtrOps046: negative N');
  if N = 0 then Exit(8);
  if N = 1 then Exit(8+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 4;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitivePtrOps046: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 46;
end;

function RecordopPtrOps047(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopPtrOps047: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 47;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodPtrOps048(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 48;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodPtrOps048: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 48;
end;

function InterfaceimplPtrOps049(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplPtrOps049: zero id');
  H := Id xor UInt64(49 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 16;
end;

function ArithmeticPtrOps050(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticPtrOps050: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(50) shl 3)
  else
    Tmp := Tmp + 11;
  Result := Tmp;
end;

function ValidationPtrOps051(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationPtrOps051: invalid bounds');
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

function SerializationPtrOps052(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationPtrOps052: buf bounds');
  U := UInt32(Value) xor UInt32(52 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationPtrOps053(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationPtrOps053: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(53 shl 8);
  Result := Int32(U);
end;

function HashingPtrOps054(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(54 * 2654435761);
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

function CollectionopPtrOps055(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopPtrOps055: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopPtrOps055: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopPtrOps055: sentinel value');
    Sum := Sum + (Arr[i] xor 55);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 55;
end;

function StatetransitionPtrOps056(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 56) mod 5;
  else
    raise EStateError.Create('StatetransitionPtrOps056: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionPtrOps056: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerPtrOps057(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 7;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerPtrOps057: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerPtrOps057: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 57;
end;

procedure MemoryopPtrOps058(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopPtrOps058: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopPtrOps058: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(58)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopPtrOps059(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopPtrOps059: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((59+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (59 mod 3);
end;

function ProtocolopPtrOps060(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopPtrOps060: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopPtrOps060: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(60 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopPtrOps061(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopPtrOps061: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(61) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropPtrOps062(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropPtrOps062: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropPtrOps062: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropPtrOps062: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 62;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopPtrOps063(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopPtrOps063: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 63;
    1: Res := Operand xor Int64(63 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopPtrOps063: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopPtrOps063: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionPtrOps064(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionPtrOps064: pos out of range');
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
    raise EParseError.Create('ParserproductionPtrOps064: expected token at pos '+IntToStr(Pos));
  Result := i + (64 mod 2);
end;

function LexerrulePtrOps065(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerrulePtrOps065: unknown lexer state');
  end;
  Result := Result xor (65 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitivePtrOps066(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitivePtrOps066: negative N');
  if N = 0 then Exit(9);
  if N = 1 then Exit(9+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 3;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitivePtrOps066: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 66;
end;

function RecordopPtrOps067(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopPtrOps067: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 67;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodPtrOps068(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 68;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodPtrOps068: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 68;
end;

function InterfaceimplPtrOps069(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplPtrOps069: zero id');
  H := Id xor UInt64(69 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 2;
end;

function ArithmeticPtrOps070(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticPtrOps070: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(70) shl 3)
  else
    Tmp := Tmp + 5;
  Result := Tmp;
end;

function ValidationPtrOps071(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationPtrOps071: invalid bounds');
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

function SerializationPtrOps072(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationPtrOps072: buf bounds');
  U := UInt32(Value) xor UInt32(72 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;


end.


