unit Pas.排序.希尔排序;

interface

const
  SIZE = 9;

type
  TType = Integer;

const
  TARRAY: array [0 .. SIZE] of TType = (5, 2, 6, 0, 3, 9, 1, 7, 4, 8);

var
  count1: Integer = 0;
  count2: Integer = 0;

procedure Running();

implementation

procedure ShellSort(var a: array of Integer);
var
  gap, i, j, temp: Integer;
begin
  gap := Length(a);

  while gap > 1 do
  begin
    Inc(count1);
    gap := gap div 2;

    for j := gap - 1 to SIZE do
    begin
      temp := a[j];
      i := j - gap;

      while (i >= 0) and (a[i] > temp) do
      begin
        inc(count2);
        a[i + gap] := a[i];
        i := i - gap;
      end;

      a[i + gap] := temp;
    end;
  end;

  Write('总共进行了', count1, '次比较,进行了', count2, '次移动.', #10);
end;

// ----------------------------------------------------------------------------
procedure Running();
var
  i: Integer;
  a: array [0 .. SIZE] of Integer;
begin
  for i := 0 to Length(a) - 1 do
    a[i] := TARRAY[i];


  ShellSort(a);

  for i := 0 to Length(a) - 1 do
    Write(a[i], ' ');

end;

end.
