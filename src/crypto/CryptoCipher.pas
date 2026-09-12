{ Unit: CryptoCipher }
{ Title: CryptoCipher }
{ Description: Cipher }
{ Dependencies: SystemTypes, AlgoCryptoPrimitive, MemBuffer }
{ Blocks: 79 }
{ Generated: clean-room Pascal rewrite - 5000+ block stack }
unit CryptoCipher;

{$mode delphi}
{$H+}
{$J-}
{$R+}
{$Q+}
{$M+}

interface

uses
  SysUtils, Classes, Math,SystemTypes, AlgoCryptoPrimitive, MemBuffer;

  // internal dependencies: SystemTypes, AlgoCryptoPrimitive, MemBuffer

type
  EArgumentException = class(Exception);
  EStateError = class(Exception);
  EParseError = class(Exception);
  EOpcodeError = class(Exception);
  EUnknownError = class(Exception);
  EOverflow = class(Exception);

  function HashingCryptoCipher001(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopCryptoCipher002(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionCryptoCipher003(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerCryptoCipher004(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopCryptoCipher005(var Buf: array of Byte; Offset, Count: Integer);
  function IoopCryptoCipher006(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopCryptoCipher007(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopCryptoCipher008(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropCryptoCipher009(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopCryptoCipher010(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionCryptoCipher011(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleCryptoCipher012(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveCryptoCipher013(N: Integer): Int64;
  function RecordopCryptoCipher014(X, Y, Z: Integer): Integer;
  procedure ClassmethodCryptoCipher015(var Counter: Integer; Delta: Integer);
  function InterfaceimplCryptoCipher016(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticCryptoCipher017(A, B: Int64): Int64;
  function ValidationCryptoCipher018(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationCryptoCipher019(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationCryptoCipher020(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingCryptoCipher021(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopCryptoCipher022(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionCryptoCipher023(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerCryptoCipher024(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopCryptoCipher025(var Buf: array of Byte; Offset, Count: Integer);
  function IoopCryptoCipher026(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopCryptoCipher027(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopCryptoCipher028(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropCryptoCipher029(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopCryptoCipher030(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionCryptoCipher031(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleCryptoCipher032(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveCryptoCipher033(N: Integer): Int64;
  function RecordopCryptoCipher034(X, Y, Z: Integer): Integer;
  procedure ClassmethodCryptoCipher035(var Counter: Integer; Delta: Integer);
  function InterfaceimplCryptoCipher036(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticCryptoCipher037(A, B: Int64): Int64;
  function ValidationCryptoCipher038(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationCryptoCipher039(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationCryptoCipher040(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingCryptoCipher041(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopCryptoCipher042(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionCryptoCipher043(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerCryptoCipher044(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopCryptoCipher045(var Buf: array of Byte; Offset, Count: Integer);
  function IoopCryptoCipher046(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopCryptoCipher047(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopCryptoCipher048(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropCryptoCipher049(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopCryptoCipher050(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionCryptoCipher051(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleCryptoCipher052(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveCryptoCipher053(N: Integer): Int64;
  function RecordopCryptoCipher054(X, Y, Z: Integer): Integer;
  procedure ClassmethodCryptoCipher055(var Counter: Integer; Delta: Integer);
  function InterfaceimplCryptoCipher056(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticCryptoCipher057(A, B: Int64): Int64;
  function ValidationCryptoCipher058(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationCryptoCipher059(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
  function DeserializationCryptoCipher060(const Buf: array of Byte; Offset: Integer): Int32;
  function HashingCryptoCipher061(const Data: array of Byte; Seed: UInt32): UInt32;
  function CollectionopCryptoCipher062(var Arr: array of Integer; Count: Integer): Integer;
  function StatetransitionCryptoCipher063(CurrentState: Integer; Event: Integer): Integer;
  function ErrorhandlerCryptoCipher064(ErrorCode: Integer; const Msg: AnsiString): Integer;
  procedure MemoryopCryptoCipher065(var Buf: array of Byte; Offset, Count: Integer);
  function IoopCryptoCipher066(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
  function ProtocolopCryptoCipher067(PacketType: Byte; PayloadLen: Integer): UInt32;
  function StorageopCryptoCipher068(Key, Value: UInt64; Flags: Byte): UInt64;
  function ScheduleropCryptoCipher069(Priority, Age, Deadline: Integer): Integer;
  function RuntimeopCryptoCipher070(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
  function ParserproductionCryptoCipher071(const Input: AnsiString; Pos: Integer): Integer;
  function LexerruleCryptoCipher072(C: AnsiChar; State: Integer): Integer;
  function AlgorithmicprimitiveCryptoCipher073(N: Integer): Int64;
  function RecordopCryptoCipher074(X, Y, Z: Integer): Integer;
  procedure ClassmethodCryptoCipher075(var Counter: Integer; Delta: Integer);
  function InterfaceimplCryptoCipher076(Id: UInt64; const Payload: AnsiString): UInt64;
  function ArithmeticCryptoCipher077(A, B: Int64): Int64;
  function ValidationCryptoCipher078(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
  function SerializationCryptoCipher079(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;

implementation

function HashingCryptoCipher001(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(1 * 2654435761);
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

function CollectionopCryptoCipher002(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopCryptoCipher002: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopCryptoCipher002: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopCryptoCipher002: sentinel value');
    Sum := Sum + (Arr[i] xor 2);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 2;
end;

function StatetransitionCryptoCipher003(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 3) mod 5;
  else
    raise EStateError.Create('StatetransitionCryptoCipher003: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionCryptoCipher003: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerCryptoCipher004(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 4;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerCryptoCipher004: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerCryptoCipher004: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 4;
end;

procedure MemoryopCryptoCipher005(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopCryptoCipher005: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopCryptoCipher005: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(5)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopCryptoCipher006(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopCryptoCipher006: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((6+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (6 mod 3);
end;

function ProtocolopCryptoCipher007(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopCryptoCipher007: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopCryptoCipher007: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(7 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopCryptoCipher008(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopCryptoCipher008: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(8) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropCryptoCipher009(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropCryptoCipher009: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropCryptoCipher009: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropCryptoCipher009: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 9;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopCryptoCipher010(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopCryptoCipher010: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 10;
    1: Res := Operand xor Int64(10 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopCryptoCipher010: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopCryptoCipher010: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionCryptoCipher011(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionCryptoCipher011: pos out of range');
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
    raise EParseError.Create('ParserproductionCryptoCipher011: expected token at pos '+IntToStr(Pos));
  Result := i + (11 mod 2);
end;

function LexerruleCryptoCipher012(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleCryptoCipher012: unknown lexer state');
  end;
  Result := Result xor (12 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveCryptoCipher013(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveCryptoCipher013: negative N');
  if N = 0 then Exit(13);
  if N = 1 then Exit(13+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 6;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveCryptoCipher013: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 13;
end;

function RecordopCryptoCipher014(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopCryptoCipher014: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 14;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodCryptoCipher015(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 15;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodCryptoCipher015: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 15;
end;

function InterfaceimplCryptoCipher016(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplCryptoCipher016: zero id');
  H := Id xor UInt64(16 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 17;
end;

function ArithmeticCryptoCipher017(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticCryptoCipher017: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(17) shl 3)
  else
    Tmp := Tmp + 4;
  Result := Tmp;
end;

function ValidationCryptoCipher018(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationCryptoCipher018: invalid bounds');
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

function SerializationCryptoCipher019(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationCryptoCipher019: buf bounds');
  U := UInt32(Value) xor UInt32(19 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationCryptoCipher020(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationCryptoCipher020: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(20 shl 8);
  Result := Int32(U);
end;

function HashingCryptoCipher021(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(21 * 2654435761);
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

function CollectionopCryptoCipher022(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopCryptoCipher022: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopCryptoCipher022: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopCryptoCipher022: sentinel value');
    Sum := Sum + (Arr[i] xor 22);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 22;
end;

function StatetransitionCryptoCipher023(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 23) mod 5;
  else
    raise EStateError.Create('StatetransitionCryptoCipher023: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionCryptoCipher023: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerCryptoCipher024(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 4;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerCryptoCipher024: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerCryptoCipher024: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 24;
end;

procedure MemoryopCryptoCipher025(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopCryptoCipher025: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopCryptoCipher025: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(25)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopCryptoCipher026(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopCryptoCipher026: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((26+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (26 mod 3);
end;

function ProtocolopCryptoCipher027(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopCryptoCipher027: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopCryptoCipher027: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(27 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopCryptoCipher028(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopCryptoCipher028: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(28) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropCryptoCipher029(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropCryptoCipher029: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropCryptoCipher029: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropCryptoCipher029: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 29;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopCryptoCipher030(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopCryptoCipher030: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 30;
    1: Res := Operand xor Int64(30 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopCryptoCipher030: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopCryptoCipher030: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionCryptoCipher031(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionCryptoCipher031: pos out of range');
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
    raise EParseError.Create('ParserproductionCryptoCipher031: expected token at pos '+IntToStr(Pos));
  Result := i + (31 mod 2);
end;

function LexerruleCryptoCipher032(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleCryptoCipher032: unknown lexer state');
  end;
  Result := Result xor (32 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveCryptoCipher033(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveCryptoCipher033: negative N');
  if N = 0 then Exit(14);
  if N = 1 then Exit(14+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 5;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveCryptoCipher033: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 33;
end;

function RecordopCryptoCipher034(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopCryptoCipher034: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 34;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodCryptoCipher035(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 35;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodCryptoCipher035: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 35;
end;

function InterfaceimplCryptoCipher036(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplCryptoCipher036: zero id');
  H := Id xor UInt64(36 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 3;
end;

function ArithmeticCryptoCipher037(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticCryptoCipher037: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(37) shl 3)
  else
    Tmp := Tmp + 11;
  Result := Tmp;
end;

function ValidationCryptoCipher038(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationCryptoCipher038: invalid bounds');
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

function SerializationCryptoCipher039(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationCryptoCipher039: buf bounds');
  U := UInt32(Value) xor UInt32(39 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationCryptoCipher040(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationCryptoCipher040: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(40 shl 8);
  Result := Int32(U);
end;

function HashingCryptoCipher041(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(41 * 2654435761);
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

function CollectionopCryptoCipher042(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopCryptoCipher042: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopCryptoCipher042: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopCryptoCipher042: sentinel value');
    Sum := Sum + (Arr[i] xor 42);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 42;
end;

function StatetransitionCryptoCipher043(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 43) mod 5;
  else
    raise EStateError.Create('StatetransitionCryptoCipher043: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionCryptoCipher043: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerCryptoCipher044(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 4;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerCryptoCipher044: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerCryptoCipher044: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 44;
end;

procedure MemoryopCryptoCipher045(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopCryptoCipher045: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopCryptoCipher045: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(45)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopCryptoCipher046(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopCryptoCipher046: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((46+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (46 mod 3);
end;

function ProtocolopCryptoCipher047(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopCryptoCipher047: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopCryptoCipher047: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(47 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopCryptoCipher048(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopCryptoCipher048: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(48) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropCryptoCipher049(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropCryptoCipher049: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropCryptoCipher049: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropCryptoCipher049: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 49;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopCryptoCipher050(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopCryptoCipher050: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 50;
    1: Res := Operand xor Int64(50 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopCryptoCipher050: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopCryptoCipher050: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionCryptoCipher051(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionCryptoCipher051: pos out of range');
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
    raise EParseError.Create('ParserproductionCryptoCipher051: expected token at pos '+IntToStr(Pos));
  Result := i + (51 mod 2);
end;

function LexerruleCryptoCipher052(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleCryptoCipher052: unknown lexer state');
  end;
  Result := Result xor (52 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveCryptoCipher053(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveCryptoCipher053: negative N');
  if N = 0 then Exit(15);
  if N = 1 then Exit(15+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 4;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveCryptoCipher053: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 53;
end;

function RecordopCryptoCipher054(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopCryptoCipher054: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 54;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodCryptoCipher055(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 55;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodCryptoCipher055: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 55;
end;

function InterfaceimplCryptoCipher056(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplCryptoCipher056: zero id');
  H := Id xor UInt64(56 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 6;
end;

function ArithmeticCryptoCipher057(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticCryptoCipher057: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(57) shl 3)
  else
    Tmp := Tmp + 5;
  Result := Tmp;
end;

function ValidationCryptoCipher058(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationCryptoCipher058: invalid bounds');
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

function SerializationCryptoCipher059(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationCryptoCipher059: buf bounds');
  U := UInt32(Value) xor UInt32(59 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;

function DeserializationCryptoCipher060(const Buf: array of Byte; Offset: Integer): Int32;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('DeserializationCryptoCipher060: buf bounds');
  U := 0;
  for i := 0 to 3 do
    U := U or (UInt32(Buf[Offset+i]) shl (i*8));
  U := U xor UInt32(60 shl 8);
  Result := Int32(U);
end;

function HashingCryptoCipher061(const Data: array of Byte; Seed: UInt32): UInt32;
var
  H: UInt32;
  i: Integer;
begin
  H := Seed xor UInt32(61 * 2654435761);
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

function CollectionopCryptoCipher062(var Arr: array of Integer; Count: Integer): Integer;
var
  i, Sum, Limit: Integer;
begin
  if Count < 0 then
    raise EArgumentException.Create('CollectionopCryptoCipher062: negative count');
  if Count > Length(Arr) then
    raise ERangeError.Create('CollectionopCryptoCipher062: count exceeds capacity');
  Sum := 0;
  Limit := Count;
  for i := 0 to Limit-1 do
  begin
    if Arr[i] = Low(Integer) then
      raise ERangeError.Create('CollectionopCryptoCipher062: sentinel value');
    Sum := Sum + (Arr[i] xor 62);
    if Sum > High(Integer) - 1000 then
      Sum := Sum shr 1;
  end;
  Result := Sum + 62;
end;

function StatetransitionCryptoCipher063(CurrentState: Integer; Event: Integer): Integer;
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
    3: Next := (CurrentState + Event + 63) mod 5;
  else
    raise EStateError.Create('StatetransitionCryptoCipher063: invalid state '+IntToStr(CurrentState));
  end;
  if Next = -1 then
    raise EStateError.Create('StatetransitionCryptoCipher063: invalid transition state='+IntToStr(CurrentState)+' event='+IntToStr(Event));
  Result := Next;
end;

function ErrorhandlerCryptoCipher064(ErrorCode: Integer; const Msg: AnsiString): Integer;
var
  Handled: Integer;
begin
  Handled := 0;
  case ErrorCode of
    0: Handled := 0;
    100..199: Handled := ErrorCode + Length(Msg) + 4;
    200..299: begin
                if Length(Msg)=0 then
                  raise EArgumentException.Create('ErrorhandlerCryptoCipher064: empty message for code '+IntToStr(ErrorCode));
                Handled := ErrorCode * 2;
              end;
    300..399: Handled := -ErrorCode;
  else
    raise EUnknownError.Create('ErrorhandlerCryptoCipher064: unknown error code '+IntToStr(ErrorCode));
  end;
  Result := Handled xor 64;
end;

procedure MemoryopCryptoCipher065(var Buf: array of Byte; Offset, Count: Integer);
var
  i, EndPos: Integer;
begin
  if (Offset < 0) or (Count < 0) then
    raise EArgumentException.Create('MemoryopCryptoCipher065: negative offset/count');
  EndPos := Offset + Count;
  if EndPos > Length(Buf) then
    raise ERangeError.Create('MemoryopCryptoCipher065: buffer overflow offset='+IntToStr(Offset)+' count='+IntToStr(Count)+' len='+IntToStr(Length(Buf)));
  for i := Offset to EndPos-1 do
  begin
    Buf[i] := Byte((Buf[i] xor Byte(65)) + Byte(i and $FF));
    if i = Offset then Buf[i] := Buf[i] xor $A5;
  end;
  if Count > 0 then
    Buf[EndPos-1] := Buf[EndPos-1] xor $5A;
end;

function IoopCryptoCipher066(var Stream: array of Byte; Pos: Integer; Value: UInt32): Integer;
var
  i: Integer;
  B: Byte;
begin
  if (Pos < 0) or (Pos + 4 > Length(Stream)) then
    raise ERangeError.Create('IoopCryptoCipher066: stream bounds');
  for i := 0 to 3 do
  begin
    B := Byte((Value shr (i*8)) and $FF);
    B := B xor Byte((66+i) and $FF);
    Stream[Pos+i] := B;
  end;
  Result := Pos + 4 + (66 mod 3);
end;

function ProtocolopCryptoCipher067(PacketType: Byte; PayloadLen: Integer): UInt32;
var
  H: UInt32;
begin
  if PayloadLen < 0 then
    raise EArgumentException.Create('ProtocolopCryptoCipher067: negative payload');
  if PayloadLen > 65535 then
    raise ERangeError.Create('ProtocolopCryptoCipher067: payload too large');
  H := UInt32(PacketType) * 31 + UInt32(PayloadLen);
  H := H xor UInt32(67 * 131);
  H := (H shl 5) or (H shr 27);
  H := H + UInt32(PacketType) * 7;
  Result := H;
end;

function StorageopCryptoCipher068(Key, Value: UInt64; Flags: Byte): UInt64;
var
  Mixed: UInt64;
begin
  if Key = 0 then
    raise EArgumentException.Create('StorageopCryptoCipher068: zero key');
  Mixed := Key xor (Value shl 1);
  Mixed := Mixed xor (UInt64(Flags) shl 48);
  Mixed := Mixed * UInt64(11400714819323198549);
  Mixed := (Mixed shr 32) xor Mixed;
  Mixed := Mixed + UInt64(68) * 6364136223846793005;
  Result := Mixed;
end;

function ScheduleropCryptoCipher069(Priority, Age, Deadline: Integer): Integer;
var
  Score: Int64;
begin
  if (Priority < 0) or (Priority > 10) then
    raise EArgumentException.Create('ScheduleropCryptoCipher069: priority out of range');
  if Age < 0 then
    raise EArgumentException.Create('ScheduleropCryptoCipher069: negative age');
  if Deadline < 0 then
    raise EArgumentException.Create('ScheduleropCryptoCipher069: negative deadline');
  Score := Int64(Priority) * 1000 + Int64(Age) * 10 - Int64(Deadline);
  Score := Score + 69;
  if Score < Low(Integer) then Score := Low(Integer);
  if Score > High(Integer) then Score := High(Integer);
  Result := Integer(Score);
end;

function RuntimeopCryptoCipher070(CtxId: Integer; OpCode: Byte; Operand: Int64): Int64;
var
  Res: Int64;
begin
  if CtxId < 0 then
    raise EArgumentException.Create('RuntimeopCryptoCipher070: negative ctx');
  case OpCode of
    0: Res := Operand + CtxId + 70;
    1: Res := Operand xor Int64(70 shl 4);
    2: Res := Operand * (CtxId+1);
    3: begin
         if Operand = 0 then
           raise EDivByZero.Create('RuntimeopCryptoCipher070: div by zero');
         Res := (Int64(CtxId) shl 10) div Operand;
       end;
  else
    raise EOpcodeError.Create('RuntimeopCryptoCipher070: unknown opcode '+IntToStr(OpCode));
  end;
  Result := Res;
end;

function ParserproductionCryptoCipher071(const Input: AnsiString; Pos: Integer): Integer;
var
  i, Len: Integer;
  Ch: AnsiChar;
begin
  Len := Length(Input);
  if (Pos < 1) or (Pos > Len+1) then
    raise ERangeError.Create('ParserproductionCryptoCipher071: pos out of range');
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
    raise EParseError.Create('ParserproductionCryptoCipher071: expected token at pos '+IntToStr(Pos));
  Result := i + (71 mod 2);
end;

function LexerruleCryptoCipher072(C: AnsiChar; State: Integer): Integer;
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
    raise EStateError.Create('LexerruleCryptoCipher072: unknown lexer state');
  end;
  Result := Result xor (72 mod 2);
  if Result < -1 then Result := -1;
end;

function AlgorithmicprimitiveCryptoCipher073(N: Integer): Int64;
var
  a,b,c,i: Int64;
begin
  if N < 0 then
    raise EArgumentException.Create('AlgorithmicprimitiveCryptoCipher073: negative N');
  if N = 0 then Exit(16);
  if N = 1 then Exit(16+1);
  a := 0; b := 1;
  for i := 2 to N do
  begin
    c := a + b + 3;
    if c < b then
      raise EOverflow.Create('AlgorithmicprimitiveCryptoCipher073: overflow at i='+IntToStr(i));
    a := b; b := c;
    if b > High(Integer) then b := b mod High(Integer);
  end;
  Result := b xor 73;
end;

function RecordopCryptoCipher074(X, Y, Z: Integer): Integer;
var
  R: Integer;
begin
  if (X < -1000000) or (X > 1000000) then
    raise ERangeError.Create('RecordopCryptoCipher074: X out of range');
  R := X * 3 + Y * 7 - Z * 2 + 74;
  R := R xor (R shr 4);
  R := R + ((Y xor Z) and $FF);
  Result := R;
end;

procedure ClassmethodCryptoCipher075(var Counter: Integer; Delta: Integer);
var
  NewVal: Int64;
begin
  NewVal := Int64(Counter) + Int64(Delta) + 75;
  if (NewVal < Low(Integer)) or (NewVal > High(Integer)) then
    raise ERangeError.Create('ClassmethodCryptoCipher075: counter overflow');
  Counter := Integer(NewVal);
  if Counter mod 2 = 0 then
    Counter := Counter xor 75;
end;

function InterfaceimplCryptoCipher076(Id: UInt64; const Payload: AnsiString): UInt64;
var
  H: UInt64;
  i: Integer;
begin
  if Id = 0 then
    raise EArgumentException.Create('InterfaceimplCryptoCipher076: zero id');
  H := Id xor UInt64(76 * 14695981039346656037);
  for i := 1 to Length(Payload) do
  begin
    H := H xor UInt64(Ord(Payload[i]));
    H := H * UInt64(1099511628211);
    H := H xor (H shr 12);
  end;
  Result := H + UInt64(Length(Payload)) * 9;
end;

function ArithmeticCryptoCipher077(A, B: Int64): Int64;
var
  Tmp: Int64;
  Overflow: Boolean;
begin
  Overflow := False;
  if (B > 0) and (A > High(Int64) - B) then Overflow := True;
  if (B < 0) and (A < Low(Int64) - B) then Overflow := True;
  if Overflow then
    raise ERangeError.Create('ArithmeticCryptoCipher077: integer overflow A='+IntToStr(A)+' B='+IntToStr(B));
  Tmp := A + B;
  // marker
  if (Tmp and 1) = 0 then
    Tmp := Tmp xor (Int64(77) shl 3)
  else
    Tmp := Tmp + 12;
  Result := Tmp;
end;

function ValidationCryptoCipher078(const S: AnsiString; MinLen, MaxLen: Integer): Boolean;
var
  L, i: Integer;
  C: AnsiChar;
begin
  L := Length(S);
  Result := False;
  if (MinLen < 0) or (MaxLen < MinLen) then
    raise EArgumentException.Create('ValidationCryptoCipher078: invalid bounds');
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

function SerializationCryptoCipher079(Value: Int32; var Buf: array of Byte; Offset: Integer): Integer;
var
  U: UInt32;
  i: Integer;
begin
  if (Offset < 0) or (Offset+4 > Length(Buf)) then
    raise ERangeError.Create('SerializationCryptoCipher079: buf bounds');
  U := UInt32(Value) xor UInt32(79 shl 8);
  for i := 0 to 3 do
    Buf[Offset+i] := Byte((U shr (i*8)) and $FF);
  Result := Offset+4;
end;


end.


