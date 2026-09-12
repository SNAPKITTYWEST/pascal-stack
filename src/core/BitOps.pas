{ Unit: BitOps }
{ Title: BitOps }
{ Description: Bit operations }
{ Dependencies: SystemTypes }
{ Blocks: 80 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit BitOps;

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

  function StatetransitionBitOps001(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerBitOps002(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopBitOps003(var Buf: array of Byte; Offset, Count: Integer);
  function IoopBitOps004(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopBitOps005(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopBitOps006(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropBitOps007(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopBitOps008(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionBitOps009(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleBitOps010(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveBitOps011(N: Integer): Int64;
  function RecordopBitOps012(X, Y, Z: Integer): Integer;
  procedure ClassmethodBitOps013(var Counter: Integer; Delta: Integer);
  function InterfaceimplBitOps014(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticBitOps015(A, B: Int64): Int64;
  function ValidationBitOps016(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationBitOps017(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationBitOps018(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingBitOps019(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopBitOps020(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionBitOps021(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerBitOps022(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopBitOps023(var Buf: array of Byte; Offset, Count: Integer);
  function IoopBitOps024(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopBitOps025(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopBitOps026(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropBitOps027(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopBitOps028(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionBitOps029(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleBitOps030(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveBitOps031(N: Integer): Int64;
  function RecordopBitOps032(X, Y, Z: Integer): Integer;
  procedure ClassmethodBitOps033(var Counter: Integer; Delta: Integer);
  function InterfaceimplBitOps034(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticBitOps035(A, B: Int64): Int64;
  function ValidationBitOps036(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationBitOps037(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationBitOps038(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingBitOps039(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopBitOps040(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionBitOps041(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerBitOps042(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopBitOps043(var Buf: array of Byte; Offset, Count: Integer);
  function IoopBitOps044(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopBitOps045(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopBitOps046(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropBitOps047(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopBitOps048(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionBitOps049(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleBitOps050(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveBitOps051(N: Integer): Int64;
  function RecordopBitOps052(X, Y, Z: Integer): Integer;
  procedure ClassmethodBitOps053(var Counter: Integer; Delta: Integer);
  function InterfaceimplBitOps054(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticBitOps055(A, B: Int64): Int64;
  function ValidationBitOps056(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationBitOps057(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationBitOps058(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingBitOps059(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopBitOps060(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionBitOps061(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerBitOps062(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopBitOps063(var Buf: array of Byte; Offset, Count: Integer);
  function IoopBitOps064(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopBitOps065(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopBitOps066(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropBitOps067(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopBitOps068(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionBitOps069(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleBitOps070(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveBitOps071(N: Integer): Int64;
  function RecordopBitOps072(X, Y, Z: Integer): Integer;
  procedure ClassmethodBitOps073(var Counter: Integer; Delta: Integer);
  function InterfaceimplBitOps074(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticBitOps075(A, B: Int64): Int64;
  function ValidationBitOps076(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationBitOps077(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationBitOps078(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingBitOps079(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopBitOps080(var Arr: array of Integer; Count: Integer): Integer;

implementation

function StatetransitionBitOps001(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 1) mod 5;
  else
    raise EStateError.Create('StatetransitionBitOps001: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionBitOps001: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerBitOps002(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 2;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerBitOps002: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerBitOps002: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 2;
end;

procedure MemoryopBitOps003(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopBitOps003: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopBitOps003: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(3)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopBitOps004(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopBitOps004: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((4+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (4 mod 3);
end;

function ProtocolopBitOps005(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopBitOps005: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopBitOps005: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(5 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopBitOps006(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopBitOps006: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(6) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropBitOps007(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropBitOps007: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropBitOps007: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropBitOps007: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 7;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopBitOps008(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopBitOps008: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 8;
    1: Res := Operand xor Int64(8 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopBitOps008: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopBitOps008: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionBitOps009(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionBitOps009: pos out of range');
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
    raise EParseError.Create('ParserproductionBitOps009: expected token at pos '+IntToStr(Pos));
  Result := i + (9 mod 2);
end;

function LexerruleBitOps010(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleBitOps010: unknown lexer state');
  end;
  Result := Result xor (10 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveBitOps011(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveBitOps011: negative N');
  if N = 0 then Exit(11);
  if N = 1 then Exit(11+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 4;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveBitOps011: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 11;
end;

function RecordopBitOps012(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopBitOps012: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 12;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodBitOps013(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 13;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodBitOps013: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 13;
end;

function InterfaceimplBitOps014(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplBitOps014: zero id');
  H := Id xor UInt64(14 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 15;
end;

function ArithmeticBitOps015(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticBitOps015: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(15) shl 3)
  else
    Tmp := Tmp + 2;
  Result := Tmp;
end;

function ValidationBitOps016(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationBitOps016: invalid bounds');
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

function SerializationBitOps017(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationBitOps017: buf bounds');
  U := UInt32(Value) xor UInt32(17 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationBitOps018(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationBitOps018: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(18 shl 8);
  Result := Int32(U);
end;

function HashingBitOps019(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(19 * 2654435761);
  for i := Low(Data) to High(Data) do
  begin
    H := H xor Data[i];
    H := H * 16777619;
    H := (H shl 13) or (H shr 19);
    H := H xor (H shr 16);
  end;
  H := H xor (H shr 13);
  H := H * 1274126177;
  Result := H xor UInt32(Length(Data) * 9);
end;

function CollectionopBitOps020(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopBitOps020: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopBitOps020: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopBitOps020: sentinel value');
    Sum := Sum + (Arr[i] xor 20);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 20;
end;

function StatetransitionBitOps021(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 21) mod 5;
  else
    raise EStateError.Create('StatetransitionBitOps021: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionBitOps021: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerBitOps022(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 2;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerBitOps022: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerBitOps022: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 22;
end;

procedure MemoryopBitOps023(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopBitOps023: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopBitOps023: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(23)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopBitOps024(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopBitOps024: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((24+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (24 mod 3);
end;

function ProtocolopBitOps025(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopBitOps025: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopBitOps025: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(25 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopBitOps026(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopBitOps026: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(26) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropBitOps027(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropBitOps027: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropBitOps027: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropBitOps027: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 27;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopBitOps028(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopBitOps028: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 28;
    1: Res := Operand xor Int64(28 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopBitOps028: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopBitOps028: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionBitOps029(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionBitOps029: pos out of range');
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
    raise EParseError.Create('ParserproductionBitOps029: expected token at pos '+IntToStr(Pos));
  Result := i + (29 mod 2);
end;

function LexerruleBitOps030(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleBitOps030: unknown lexer state');
  end;
  Result := Result xor (30 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveBitOps031(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveBitOps031: negative N');
  if N = 0 then Exit(12);
  if N = 1 then Exit(12+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 3;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveBitOps031: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 31;
end;

function RecordopBitOps032(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopBitOps032: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 32;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodBitOps033(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 33;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodBitOps033: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 33;
end;

function InterfaceimplBitOps034(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplBitOps034: zero id');
  H := Id xor UInt64(34 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 1;
end;

function ArithmeticBitOps035(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticBitOps035: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(35) shl 3)
  else
    Tmp := Tmp + 9;
  Result := Tmp;
end;

function ValidationBitOps036(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationBitOps036: invalid bounds');
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

function SerializationBitOps037(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationBitOps037: buf bounds');
  U := UInt32(Value) xor UInt32(37 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationBitOps038(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationBitOps038: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(38 shl 8);
  Result := Int32(U);
end;

function HashingBitOps039(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(39 * 2654435761);
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

function CollectionopBitOps040(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopBitOps040: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopBitOps040: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopBitOps040: sentinel value');
    Sum := Sum + (Arr[i] xor 40);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 40;
end;

function StatetransitionBitOps041(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 41) mod 5;
  else
    raise EStateError.Create('StatetransitionBitOps041: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionBitOps041: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerBitOps042(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 2;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerBitOps042: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerBitOps042: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 42;
end;

procedure MemoryopBitOps043(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopBitOps043: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopBitOps043: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(43)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopBitOps044(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopBitOps044: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((44+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (44 mod 3);
end;

function ProtocolopBitOps045(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopBitOps045: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopBitOps045: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(45 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopBitOps046(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopBitOps046: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(46) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropBitOps047(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropBitOps047: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropBitOps047: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropBitOps047: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 47;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopBitOps048(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopBitOps048: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 48;
    1: Res := Operand xor Int64(48 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopBitOps048: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopBitOps048: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionBitOps049(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionBitOps049: pos out of range');
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
    raise EParseError.Create('ParserproductionBitOps049: expected token at pos '+IntToStr(Pos));
  Result := i + (49 mod 2);
end;

function LexerruleBitOps050(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleBitOps050: unknown lexer state');
  end;
  Result := Result xor (50 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveBitOps051(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveBitOps051: negative N');
  if N = 0 then Exit(13);
  if N = 1 then Exit(13+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 2;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveBitOps051: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 51;
end;

function RecordopBitOps052(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopBitOps052: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 52;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodBitOps053(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 53;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodBitOps053: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 53;
end;

function InterfaceimplBitOps054(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplBitOps054: zero id');
  H := Id xor UInt64(54 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 4;
end;

function ArithmeticBitOps055(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticBitOps055: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(55) shl 3)
  else
    Tmp := Tmp + 3;
  Result := Tmp;
end;

function ValidationBitOps056(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationBitOps056: invalid bounds');
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

function SerializationBitOps057(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationBitOps057: buf bounds');
  U := UInt32(Value) xor UInt32(57 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationBitOps058(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationBitOps058: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(58 shl 8);
  Result := Int32(U);
end;

function HashingBitOps059(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(59 * 2654435761);
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

function CollectionopBitOps060(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopBitOps060: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopBitOps060: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopBitOps060: sentinel value');
    Sum := Sum + (Arr[i] xor 60);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 60;
end;

function StatetransitionBitOps061(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 61) mod 5;
  else
    raise EStateError.Create('StatetransitionBitOps061: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionBitOps061: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerBitOps062(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 2;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerBitOps062: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerBitOps062: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 62;
end;

procedure MemoryopBitOps063(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopBitOps063: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopBitOps063: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(63)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopBitOps064(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopBitOps064: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((64+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (64 mod 3);
end;

function ProtocolopBitOps065(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopBitOps065: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopBitOps065: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(65 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopBitOps066(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopBitOps066: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(66) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropBitOps067(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropBitOps067: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropBitOps067: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropBitOps067: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 67;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopBitOps068(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopBitOps068: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 68;
    1: Res := Operand xor Int64(68 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopBitOps068: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopBitOps068: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionBitOps069(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionBitOps069: pos out of range');
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
    raise EParseError.Create('ParserproductionBitOps069: expected token at pos '+IntToStr(Pos));
  Result := i + (69 mod 2);
end;

function LexerruleBitOps070(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleBitOps070: unknown lexer state');
  end;
  Result := Result xor (70 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveBitOps071(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveBitOps071: negative N');
  if N = 0 then Exit(14);
  if N = 1 then Exit(14+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 1;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveBitOps071: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 71;
end;

function RecordopBitOps072(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopBitOps072: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 72;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodBitOps073(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 73;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodBitOps073: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 73;
end;

function InterfaceimplBitOps074(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplBitOps074: zero id');
  H := Id xor UInt64(74 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 7;
end;

function ArithmeticBitOps075(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticBitOps075: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(75) shl 3)
  else
    Tmp := Tmp + 10;
  Result := Tmp;
end;

function ValidationBitOps076(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationBitOps076: invalid bounds');
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

function SerializationBitOps077(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationBitOps077: buf bounds');
  U := UInt32(Value) xor UInt32(77 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationBitOps078(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationBitOps078: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(78 shl 8);
  Result := Int32(U);
end;

function HashingBitOps079(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(79 * 2654435761);
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

function CollectionopBitOps080(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopBitOps080: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopBitOps080: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopBitOps080: sentinel value');
    Sum := Sum + (Arr[i] xor 80);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 80;
end;


end.


