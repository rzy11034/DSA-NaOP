unit Pas.排序.选择排序;

interface

const
  SIZE = 9;

type
  TType = Integer;

const
  A: array [0 .. SIZE] of TType = (5, 2, 6, 0, 3, 9, 1, 7, 4, 8);

var
  count1: Integer = 0;
  count2: Integer = 0;

procedure Running();

implementation

procedure SelectSort(var k: array of TType);
var
  i, j, n, temp, min: Integer;
begin
  n := Length(k);

  count1 := 0;
  count2 := 0;

  for i := 0 to n - 2 do
  begin
    min := i;
    inc(count1);

    for j := i + 1 to n - 1 do
    begin
      if k[j] < k[min] then
        min := j;
    end;

    if (min <> i) then
    begin
      inc(count2);
      temp := k[min];
      k[min] := k[i];
      k[i] := temp;
    end;
  end;

  Write('总共进行了', count1, '次比较,进行了', count2, '次移动.', #10);
end;

// ----------------------------------------------------------------------------
procedure Running();
var
  i: Integer;
  k, l: array [0 .. SIZE] of TType;
begin
  for i := Low(A) to High(A) do
  begin
    k[i] := A[i];
    l[i] := A[i];
  end;

  SelectSort(k);

  for i := 0 to 9 do
    Write(k[i], ' ');

  Writeln;

  for i := 0 to 9 do
    Write(l[i], ' ');

  Writeln;

end;

end.
