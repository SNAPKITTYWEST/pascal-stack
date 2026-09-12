program ISO7185Core;

const
  MaxValue = 10;

type
  TIndex = 1..MaxValue;
  TColor = (Red, Green, Blue);
  TValues = array[TIndex] of Integer;
  TRecord = record
    Value: Integer;
    Color: TColor;
  end;

var
  I: TIndex;
  Values: TValues;
  R: TRecord;

begin
  R.Value := 0;
  R.Color := Red;
  for I := Low(TValues) to High(TValues) do
    Values[I] := I;
  WriteLn(R.Value + Values[MaxValue]);
end.
