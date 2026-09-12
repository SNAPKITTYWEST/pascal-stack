{ Unit: NetProtocol }
{ Title: NetProtocol }
{ Description: Network protocol }
{ Dependencies: SystemTypes, SerProtocol, ErrorModel }
{ Blocks: 79 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit NetProtocol;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, SerProtocol, ErrorModel;

  // internal dependencies: SystemTypes, SerProtocol, ErrorModel

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function AlgorithmicprimitiveNetProtocol001(N: Integer): Int64;
  function RecordopNetProtocol002(X, Y, Z: Integer): Integer;
  procedure ClassmethodNetProtocol003(var Counter: Integer; Delta: Integer);
  function InterfaceimplNetProtocol004(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticNetProtocol005(A, B: Int64): Int64;
  function ValidationNetProtocol006(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationNetProtocol007(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationNetProtocol008(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingNetProtocol009(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopNetProtocol010(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionNetProtocol011(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerNetProtocol012(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopNetProtocol013(var Buf: array of Byte; Offset, Count: Integer);
  function IoopNetProtocol014(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopNetProtocol015(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopNetProtocol016(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropNetProtocol017(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopNetProtocol018(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionNetProtocol019(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleNetProtocol020(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveNetProtocol021(N: Integer): Int64;
  function RecordopNetProtocol022(X, Y, Z: Integer): Integer;
  procedure ClassmethodNetProtocol023(var Counter: Integer; Delta: Integer);
  function InterfaceimplNetProtocol024(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticNetProtocol025(A, B: Int64): Int64;
  function ValidationNetProtocol026(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationNetProtocol027(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationNetProtocol028(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingNetProtocol029(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopNetProtocol030(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionNetProtocol031(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerNetProtocol032(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopNetProtocol033(var Buf: array of Byte; Offset, Count: Integer);
  function IoopNetProtocol034(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopNetProtocol035(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopNetProtocol036(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropNetProtocol037(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopNetProtocol038(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionNetProtocol039(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleNetProtocol040(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveNetProtocol041(N: Integer): Int64;
  function RecordopNetProtocol042(X, Y, Z: Integer): Integer;
  procedure ClassmethodNetProtocol043(var Counter: Integer; Delta: Integer);
  function InterfaceimplNetProtocol044(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticNetProtocol045(A, B: Int64): Int64;
  function ValidationNetProtocol046(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationNetProtocol047(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationNetProtocol048(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingNetProtocol049(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopNetProtocol050(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionNetProtocol051(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerNetProtocol052(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopNetProtocol053(var Buf: array of Byte; Offset, Count: Integer);
  function IoopNetProtocol054(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopNetProtocol055(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopNetProtocol056(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropNetProtocol057(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopNetProtocol058(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionNetProtocol059(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleNetProtocol060(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveNetProtocol061(N: Integer): Int64;
  function RecordopNetProtocol062(X, Y, Z: Integer): Integer;
  procedure ClassmethodNetProtocol063(var Counter: Integer; Delta: Integer);
  function InterfaceimplNetProtocol064(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticNetProtocol065(A, B: Int64): Int64;
  function ValidationNetProtocol066(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationNetProtocol067(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationNetProtocol068(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingNetProtocol069(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopNetProtocol070(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionNetProtocol071(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerNetProtocol072(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopNetProtocol073(var Buf: array of Byte; Offset, Count: Integer);
  function IoopNetProtocol074(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopNetProtocol075(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopNetProtocol076(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropNetProtocol077(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopNetProtocol078(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionNetProtocol079(const Input: AnsiString; Pos: Integer): Integer;

implementation

function AlgorithmicprimitiveNetProtocol001(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveNetProtocol001: negative N');
  if N = 0 then Exit(1);
  if N = 1 then Exit(1+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 1;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveNetProtocol001: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 1;
end;

function RecordopNetProtocol002(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopNetProtocol002: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 2;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodNetProtocol003(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 3;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodNetProtocol003: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 3;
end;

function InterfaceimplNetProtocol004(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplNetProtocol004: zero id');
  H := Id xor UInt64(4 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 5;
end;

function ArithmeticNetProtocol005(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticNetProtocol005: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(5) shl 3)
  else
    Tmp := Tmp + 5;
  Result := Tmp;
end;

function ValidationNetProtocol006(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationNetProtocol006: invalid bounds');
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

function SerializationNetProtocol007(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationNetProtocol007: buf bounds');
  U := UInt32(Value) xor UInt32(7 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationNetProtocol008(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationNetProtocol008: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(8 shl 8);
  Result := Int32(U);
end;

function HashingNetProtocol009(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(9 * 2654435761);
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

function CollectionopNetProtocol010(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopNetProtocol010: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopNetProtocol010: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopNetProtocol010: sentinel value');
    Sum := Sum + (Arr[i] xor 10);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 10;
end;

function StatetransitionNetProtocol011(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 11) mod 5;
  else
    raise EStateError.Create('StatetransitionNetProtocol011: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionNetProtocol011: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerNetProtocol012(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 2;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerNetProtocol012: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerNetProtocol012: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 12;
end;

procedure MemoryopNetProtocol013(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopNetProtocol013: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopNetProtocol013: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(13)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopNetProtocol014(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopNetProtocol014: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((14+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (14 mod 3);
end;

function ProtocolopNetProtocol015(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopNetProtocol015: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopNetProtocol015: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(15 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopNetProtocol016(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopNetProtocol016: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(16) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropNetProtocol017(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropNetProtocol017: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropNetProtocol017: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropNetProtocol017: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 17;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopNetProtocol018(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopNetProtocol018: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 18;
    1: Res := Operand xor Int64(18 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopNetProtocol018: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopNetProtocol018: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionNetProtocol019(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionNetProtocol019: pos out of range');
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
    raise EParseError.Create('ParserproductionNetProtocol019: expected token at pos '+IntToStr(Pos));
  Result := i + (19 mod 2);
end;

function LexerruleNetProtocol020(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleNetProtocol020: unknown lexer state');
  end;
  Result := Result xor (20 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveNetProtocol021(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveNetProtocol021: negative N');
  if N = 0 then Exit(2);
  if N = 1 then Exit(2+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 0;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveNetProtocol021: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 21;
end;

function RecordopNetProtocol022(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopNetProtocol022: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 22;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodNetProtocol023(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 23;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodNetProtocol023: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 23;
end;

function InterfaceimplNetProtocol024(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplNetProtocol024: zero id');
  H := Id xor UInt64(24 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 8;
end;

function ArithmeticNetProtocol025(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticNetProtocol025: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(25) shl 3)
  else
    Tmp := Tmp + 12;
  Result := Tmp;
end;

function ValidationNetProtocol026(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationNetProtocol026: invalid bounds');
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

function SerializationNetProtocol027(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationNetProtocol027: buf bounds');
  U := UInt32(Value) xor UInt32(27 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationNetProtocol028(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationNetProtocol028: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(28 shl 8);
  Result := Int32(U);
end;

function HashingNetProtocol029(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(29 * 2654435761);
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

function CollectionopNetProtocol030(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopNetProtocol030: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopNetProtocol030: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopNetProtocol030: sentinel value');
    Sum := Sum + (Arr[i] xor 30);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 30;
end;

function StatetransitionNetProtocol031(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 31) mod 5;
  else
    raise EStateError.Create('StatetransitionNetProtocol031: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionNetProtocol031: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerNetProtocol032(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 2;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerNetProtocol032: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerNetProtocol032: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 32;
end;

procedure MemoryopNetProtocol033(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopNetProtocol033: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopNetProtocol033: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(33)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopNetProtocol034(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopNetProtocol034: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((34+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (34 mod 3);
end;

function ProtocolopNetProtocol035(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopNetProtocol035: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopNetProtocol035: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(35 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopNetProtocol036(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopNetProtocol036: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(36) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropNetProtocol037(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropNetProtocol037: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropNetProtocol037: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropNetProtocol037: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 37;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopNetProtocol038(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopNetProtocol038: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 38;
    1: Res := Operand xor Int64(38 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopNetProtocol038: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopNetProtocol038: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionNetProtocol039(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionNetProtocol039: pos out of range');
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
    raise EParseError.Create('ParserproductionNetProtocol039: expected token at pos '+IntToStr(Pos));
  Result := i + (39 mod 2);
end;

function LexerruleNetProtocol040(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleNetProtocol040: unknown lexer state');
  end;
  Result := Result xor (40 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveNetProtocol041(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveNetProtocol041: negative N');
  if N = 0 then Exit(3);
  if N = 1 then Exit(3+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 6;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveNetProtocol041: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 41;
end;

function RecordopNetProtocol042(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopNetProtocol042: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 42;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodNetProtocol043(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 43;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodNetProtocol043: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 43;
end;

function InterfaceimplNetProtocol044(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplNetProtocol044: zero id');
  H := Id xor UInt64(44 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 11;
end;

function ArithmeticNetProtocol045(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticNetProtocol045: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(45) shl 3)
  else
    Tmp := Tmp + 6;
  Result := Tmp;
end;

function ValidationNetProtocol046(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationNetProtocol046: invalid bounds');
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

function SerializationNetProtocol047(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationNetProtocol047: buf bounds');
  U := UInt32(Value) xor UInt32(47 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationNetProtocol048(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationNetProtocol048: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(48 shl 8);
  Result := Int32(U);
end;

function HashingNetProtocol049(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(49 * 2654435761);
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

function CollectionopNetProtocol050(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopNetProtocol050: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopNetProtocol050: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopNetProtocol050: sentinel value');
    Sum := Sum + (Arr[i] xor 50);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 50;
end;

function StatetransitionNetProtocol051(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 51) mod 5;
  else
    raise EStateError.Create('StatetransitionNetProtocol051: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionNetProtocol051: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerNetProtocol052(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 2;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerNetProtocol052: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerNetProtocol052: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 52;
end;

procedure MemoryopNetProtocol053(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopNetProtocol053: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopNetProtocol053: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(53)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopNetProtocol054(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopNetProtocol054: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((54+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (54 mod 3);
end;

function ProtocolopNetProtocol055(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopNetProtocol055: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopNetProtocol055: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(55 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopNetProtocol056(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopNetProtocol056: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(56) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropNetProtocol057(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropNetProtocol057: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropNetProtocol057: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropNetProtocol057: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 57;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopNetProtocol058(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopNetProtocol058: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 58;
    1: Res := Operand xor Int64(58 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopNetProtocol058: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopNetProtocol058: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionNetProtocol059(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionNetProtocol059: pos out of range');
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
    raise EParseError.Create('ParserproductionNetProtocol059: expected token at pos '+IntToStr(Pos));
  Result := i + (59 mod 2);
end;

function LexerruleNetProtocol060(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleNetProtocol060: unknown lexer state');
  end;
  Result := Result xor (60 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveNetProtocol061(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveNetProtocol061: negative N');
  if N = 0 then Exit(4);
  if N = 1 then Exit(4+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 5;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveNetProtocol061: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 61;
end;

function RecordopNetProtocol062(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopNetProtocol062: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 62;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodNetProtocol063(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 63;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodNetProtocol063: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 5 = 0 then
    Counter := Counter xor 63;
end;

function InterfaceimplNetProtocol064(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplNetProtocol064: zero id');
  H := Id xor UInt64(64 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 14;
end;

function ArithmeticNetProtocol065(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticNetProtocol065: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(65) shl 3)
  else
    Tmp := Tmp + 0;
  Result := Tmp;
end;

function ValidationNetProtocol066(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationNetProtocol066: invalid bounds');
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

function SerializationNetProtocol067(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationNetProtocol067: buf bounds');
  U := UInt32(Value) xor UInt32(67 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationNetProtocol068(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationNetProtocol068: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(68 shl 8);
  Result := Int32(U);
end;

function HashingNetProtocol069(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(69 * 2654435761);
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

function CollectionopNetProtocol070(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopNetProtocol070: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopNetProtocol070: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopNetProtocol070: sentinel value');
    Sum := Sum + (Arr[i] xor 70);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 70;
end;

function StatetransitionNetProtocol071(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 71) mod 5;
  else
    raise EStateError.Create('StatetransitionNetProtocol071: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionNetProtocol071: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerNetProtocol072(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 2;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerNetProtocol072: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerNetProtocol072: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 72;
end;

procedure MemoryopNetProtocol073(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopNetProtocol073: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopNetProtocol073: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(73)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopNetProtocol074(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopNetProtocol074: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((74+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (74 mod 3);
end;

function ProtocolopNetProtocol075(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopNetProtocol075: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopNetProtocol075: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(75 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopNetProtocol076(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopNetProtocol076: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(76) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropNetProtocol077(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropNetProtocol077: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropNetProtocol077: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropNetProtocol077: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 77;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopNetProtocol078(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopNetProtocol078: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 78;
    1: Res := Operand xor Int64(78 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopNetProtocol078: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopNetProtocol078: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionNetProtocol079(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionNetProtocol079: pos out of range');
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
    raise EParseError.Create('ParserproductionNetProtocol079: expected token at pos '+IntToStr(Pos));
  Result := i + (79 mod 2);
end;


end.


