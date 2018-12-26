unit Pas.查找.折半查找法;

interface

uses
  System.SysUtils;

type
  TArray = TArray<Integer>;

procedure Running();

implementation

// 折半查找法
procedure BinarySearch(n: Integer; A: TArray);

var
  L, H, Mid: Integer;
begin
  L := Low(A);
  H := High(A);
  Mid := 0;

  while Low(A) <= High(A) do
  begin
    Mid := (H + L) div 2;

    if (Mid = L) and (H = L) and (A[Mid] <> n) then
    begin
      Writeln('没有找到！');
      exit;
    end
    else if n < A[Mid] then
    begin
      H := Mid - 1
    end
    else if n > A[Mid] then
    begin
      L := Mid + 1
    end
    else
    begin
      Break
    end;
  end;

  Writeln(A[Mid], '的位置为：', Mid + 1);
end;

// ----------------------------------------------------------------------------
procedure InitArray(var A: TArray);
var
  i: Integer;
begin
  for i := Low(A) to High(A) do
    A[i] := i;
end;

// ----------------------------------------------------------------------------
procedure Print(A: array of Integer);
var
  i: Integer;
begin
  for i := 0 to Length(A) - 1 do
  begin
    Write(A[i], #32);
  end;
  Writeln;
end;

// ----------------------------------------------------------------------------
procedure Running();
var
  A: TArray;
begin
  SetLength(A, 20);
  InitArray(A);

  Print(A);

end;

end.
