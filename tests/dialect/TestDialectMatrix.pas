program TestDialectMatrix;

{$mode objfpc}{$H+}

uses
  SysUtils;

const
  DialectCount = 8;

type
  TDialectInfo = record
    Name: string;
    Boundary: string;
  end;

const
  Dialects: array[0..DialectCount - 1] of TDialectInfo = (
    (Name: 'ISO 7185';       Boundary: 'dialects/iso7185'),
    (Name: 'ISO 10206';      Boundary: 'dialects/iso10206'),
    (Name: 'Turbo Pascal';   Boundary: 'dialects/turbo'),
    (Name: 'Object Pascal';  Boundary: 'dialects/objectpascal'),
    (Name: 'Delphi Pascal';  Boundary: 'dialects/delphi'),
    (Name: 'PascalABC.NET';  Boundary: 'dialects/pascalabcnet'),
    (Name: 'ObjFPC';         Boundary: 'handcrafted+expanded'),
    (Name: 'FPC Delphi';     Boundary: 'src+tools+tests')
  );

var
  I: Integer;

begin
  for I := Low(Dialects) to High(Dialects) do
    if (Dialects[I].Name = '') or (Dialects[I].Boundary = '') then
      Halt(1);

  WriteLn('DIALECT_MATRIX_OK');
  WriteLn('COUNT=', DialectCount);
end.
