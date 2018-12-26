unit Pas.查找.顺序查找法;

interface

type

  R_Student = record
    Num: Integer;
    Name: string;
    Results: 0 .. 100;
  end;

  Tarray = array of R_Student;

procedure Running();

implementation

{$REGION '算法例子'}

// 顺序查找，a为要查找的数组，n为要查找的数组的长度，key为要查找的关键字
function Sq_Search(var a: array of Integer; n: Integer; key: Integer): Integer;
var
  i: Integer;
begin
  for i := 1 to n do
  begin
    if a[i] = key then
    begin
      exit(i)
    end;
  end;

  exit(0);
end;

// 顺序查找优化方案，a为要查找的数组，n为要查找的数组的长度，key为要查找的关键字
function Sq_Search1(var a: array of Integer; n: Integer; key: Integer): Integer;
var
  i: Integer;
begin
  i := n;
  a[0] := key;

  while (a[i] <> key) do
  begin
    inc(i);
  end;

  exit(0);
end;
{$ENDREGION}

// ----------------------------------------------------------------------------
procedure Print(a: Tarray);
var
  i: Integer;
begin
  for i := 0 to Length(a) - 1 do
  begin
    Writeln(a[i].Name, '的学号为：', a[i].Num, #9, '成绩：', a[i].Results);
  end;
end;

// ----------------------------------------------------------------------------
procedure InitArray(i: Integer; a: Tarray);
begin
  if i >= 5 then
  begin
    Print(a);
    exit;
  end
  else
  begin
    a[i].Num := i + 1020;
    a[i].Name := Chr(65 + i);
    a[i].Results := 89 + i;
    InitArray(i + 1, a);
  end;
end;

// ----------------------------------------------------------------------------
procedure Search(n: Integer; a: Tarray);
var
  MyElem: R_Student;
begin
  for MyElem in a do
  begin
    if MyElem.Results = n then
    begin
      Writeln(MyElem.Name, '的学号为：', MyElem.Num, #9, '成绩：', MyElem.Results);
      break;
    end;
  end;
end;

// ----------------------------------------------------------------------------
procedure Running();
var
  a: Tarray;
begin
  SetLength(a, 5);
  InitArray(0, a);
  Writeln;

  Search(1022, a);
end;

end.
