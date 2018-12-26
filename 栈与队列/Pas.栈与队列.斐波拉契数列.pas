unit Pas.栈与队列.斐波拉契数列;

interface

procedure Running();

implementation

// 迭代斐波拉契数列
procedure Fibonacci_Iteration();
var
  i: integer;
  a: array [0 .. 39] of integer;
begin
  a[0] := 0;
  a[1] := 1;

  Write(a[0], ' ', a[1], ' ');

  for i := 2 to 10 do
  begin
    a[i] := a[i - 1] + a[i - 2];
    Write(a[i], ' ');
  end;

  Writeln;
end;

// ----------------------------------------------------------------------------
// 递归斐波拉契数列
function Fibonacci_Recursion(i: integer): integer;
begin
  if (i = 0) then
    Exit(0)
  else if i = 1 then
    Exit(1)
  else
    Exit(Fibonacci_Recursion(i - 1) + Fibonacci_Recursion(i - 2));
end;

// ----------------------------------------------------------------------------
procedure Running();
begin
  Writeln(Fibonacci_Recursion(10));
  Fibonacci_Iteration;
end;

end.
