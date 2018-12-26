unit Pas.≈≈–Ú.øÏÀŸ≈≈–Ú;

interface

uses
  System.Generics.Collections;

const
  SIZE = 9;

type
  Tint = Integer;
  TMyArray = TArray<Tint>;
  PtrTMyArray = ^TMyArray;

const
  A: TMyArray = [5, 2, 6, 0, 3, 9, 1, 7, 4, 8];

var
  count1: Integer = 0;
  count2: Integer = 0;

procedure Running();

implementation

procedure Swap(var A: Integer; var b: Integer);
var
  temp: Integer;
begin
  temp := A;
  A := b;
  b := temp;
end;

// ----------------------------------------------------------------------------
function Partition(var k: TMyArray; first, last: Integer): Integer;
var
  point: Integer;
begin
  point := k[first];

  while (first < last) do
  begin
    while (first < last) and (k[last] >= point) do
    begin
      dec(last)
    end;

    Swap(k[first], k[last]);

    while (first < last) and (k[first] <= point) do
    begin
      inc(first)
    end;

    Swap(k[first], k[last]);

  end;

  Result := first;
end;

// ----------------------------------------------------------------------------
procedure QSort(var k: TMyArray; first, last: Integer);
var
  point: Integer;
begin
  if (first < last) then
  begin
    point := Partition(k, first, last);
    QSort(k, first, point - 1);
    QSort(k, point + 1, last);
  end;
end;

procedure QuickSort(var k: TMyArray);
begin
  QSort(k, 0, Length(k) - 1);
end;

// ----------------------------------------------------------------------------
procedure Running();
var
  i: Integer;
  l, k: TMyArray;
begin
  k := System.Copy(A);
  l := System.Copy(k);

  QuickSort(k);

  for i := Low(k) to High(k) do
    Write(k[i], ' ');
  Writeln;

  for i := Low(l) to High(l) do
    Write(l[i], ' ');

  Writeln;
end;

end.
