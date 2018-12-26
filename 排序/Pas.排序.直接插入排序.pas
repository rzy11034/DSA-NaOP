unit Pas.排序.直接插入排序;

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

procedure InsertSort(var k: array of TType);
var
  i, j, temp, n: Integer;
begin
  n := Length(k);

  for i := 1 to n - 1 do
  begin
    inc(count1);

    if (k[i] < k[i - 1]) then
    begin

      temp := k[i];

      j := i - 1;
      while (j >= 0) and (k[j] > temp) do
      begin
        inc(count2);
        k[j + 1] := k[j];
        dec(j);
      end;

      k[j + 1] := temp;
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

  InsertSort(k);

  for i := 0 to 9 do
    Write(k[i], ' ');

  Writeln;

  for i := 0 to 9 do
    Write(l[i], ' ');

  Writeln;

end;

end.
