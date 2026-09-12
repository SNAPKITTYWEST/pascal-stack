program PascalDialect;

{$mode objfpc}{$H+}

uses
  SysUtils;

type
  TDialect = (
    dISO7185,
    dISO10206,
    dTurbo,
    dObjectPascal,
    dDelphi,
    dPascalABCNet
  );

function DialectName(D: TDialect): string;
begin
  case D of
    dISO7185:      Result := 'iso7185';
    dISO10206:     Result := 'iso10206';
    dTurbo:        Result := 'turbo';
    dObjectPascal: Result := 'objectpascal';
    dDelphi:       Result := 'delphi';
    dPascalABCNet: Result := 'pascalabcnet';
  end;
end;

function ParseDialect(const S: string; out D: TDialect): Boolean;
var
  L: string;
begin
  L := LowerCase(S);
  Result := True;

  if L = 'iso7185' then
    D := dISO7185
  else if L = 'iso10206' then
    D := dISO10206
  else if L = 'turbo' then
    D := dTurbo
  else if L = 'objectpascal' then
    D := dObjectPascal
  else if L = 'delphi' then
    D := dDelphi
  else if L = 'pascalabcnet' then
    D := dPascalABCNet
  else
    Result := False;
end;

procedure FailClosed;
begin
  WriteLn('ERROR: explicit Pascal dialect required.');
  Halt(2);
end;

var
  D: TDialect;

begin
  if ParamCount <> 2 then
  begin
    WriteLn(
      'Usage: pascal-dialect ',
      '<iso7185|iso10206|turbo|objectpascal|delphi|pascalabcnet> ',
      '<source.pas>'
    );
    Halt(2);
  end;

  if not ParseDialect(ParamStr(1), D) then
    FailClosed;

  WriteLn('DIALECT=', DialectName(D));
  WriteLn('SOURCE=', ParamStr(2));
  WriteLn('FAIL_CLOSED=TRUE');

  case D of
    dISO7185:
      WriteLn('MODE=ISO_7185_STANDARD_BASELINE');

    dISO10206:
      WriteLn('MODE=ISO_10206_EXTENDED');

    dTurbo:
      WriteLn('MODE=TURBO_PASCAL_COMPATIBILITY');

    dObjectPascal:
      WriteLn('MODE=OBJECT_PASCAL_FAMILY');

    dDelphi:
      WriteLn('MODE=FPC_DELPHI_COMPATIBILITY');

    dPascalABCNet:
      WriteLn('MODE=PASCALABC_NET_COMPATIBILITY');
  end;
end.
