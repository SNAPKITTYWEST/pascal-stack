program DelphiBoundary;

{$mode delphi}{$H+}

type
  TExample = class
  private
    FValue: Integer;
  public
    property Value: Integer read FValue write FValue;
  end;

var
  E: TExample;

begin
  E := TExample.Create;
  try
    E.Value := 1;
    WriteLn(E.Value);
  finally
    E.Free;
  end;
end.
