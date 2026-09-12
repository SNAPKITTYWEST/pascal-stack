program ObjectPascalBoundary;

type
  TAnimal = object
    procedure Speak;
  end;

procedure TAnimal.Speak;
begin
  WriteLn('OBJECT_PASCAL_BOUNDARY');
end;

var
  A: TAnimal;

begin
  A.Speak;
end.
