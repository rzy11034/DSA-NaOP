unit Pas.����.ð������;

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

// αð������
procedure BubbleSort_α(var k: array of TType);
var
  i, j, temp, n: Integer;
begin
  n := Length(k);

  count1 := 0;
  count2 := 0;

  for i := 0 to n - 2 do
  begin
    for j := i to n - 1 do
    begin
      inc(count1);

      if (k[i] > k[j]) then
      begin
        inc(count2);
        temp := k[j];
        k[j] := k[i];
        k[i] := temp;
      end;
    end;
  end;

  Write('�ܹ�������', count1, '�αȽ�,������', count2, '���ƶ�.', #10);
end;

// ----------------------------------------------------------------------------
// ��ð������
procedure BubbleSort(var k: array of TType);
var
  i, pass, temp: Integer;
  sorted: boolean;
begin
  sorted := false;
  pass := 1;

  count1 := 0;
  count2 := 0;

  while not sorted do
  begin
    sorted := True;
    inc(pass);

    for i := 0 to Length(k) - pass do
    begin
      inc(count1);

      if (k[i] > k[i + 1]) then
      begin
        inc(count2);
        temp := k[i + 1];
        k[i + 1] := k[i];
        k[i] := temp;
        sorted := false;
      end;
    end;
  end;

  Write('�ܹ�������', count1, '�αȽ�,������', count2, '���ƶ�.', #10);
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

  BubbleSort(k);
  BubbleSort_α(l);

  for i := 0 to 9 do
    Write(k[i], ' ');

  Writeln;

  for i := 0 to 9 do
    Write(l[i], ' ');

end;

end.
