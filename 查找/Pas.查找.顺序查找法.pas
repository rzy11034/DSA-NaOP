unit Pas.����.˳����ҷ�;

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

{$REGION '�㷨����'}

// ˳����ң�aΪҪ���ҵ����飬nΪҪ���ҵ�����ĳ��ȣ�keyΪҪ���ҵĹؼ���
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

// ˳������Ż�������aΪҪ���ҵ����飬nΪҪ���ҵ�����ĳ��ȣ�keyΪҪ���ҵĹؼ���
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
    Writeln(a[i].Name, '��ѧ��Ϊ��', a[i].Num, #9, '�ɼ���', a[i].Results);
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
      Writeln(MyElem.Name, '��ѧ��Ϊ��', MyElem.Num, #9, '�ɼ���', MyElem.Results);
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
