unit Pas.����.������;

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

procedure Swap(var a: Integer; var b: Integer);
var
  temp: Integer;
begin
  temp := a;
  a := b;
  b := temp;
end;

// ----------------------------------------------------------------------------
// ��ɸѡ����
// ��֪ k[first~last] �г��� first ֮�������ѵĶ���
// ���������е�����ʹ k[first~last] ��Ϊһ���󶥶�
procedure HeapAdjust(var k: array of TType; first, last: Integer);
var
  lChild, temp: Integer;
begin
  temp := k[first];

  // ��Ϊ���������Ϊ0������1������i������Ӻ��Һ��ӷֱ�Ϊ2i+1��2i+2
  lChild := 2 * first + 1;
  // rChild := 2 * first + 2;

  while (lChild <= last) do
  begin

    // ���Һ��ӵıȽ�
    if (lChild < last) and (k[lChild] < k[lChild + 1]) then
      inc(lChild);

    // ���Һ����л�ʤ���븸�׵ıȽ�
    if (temp > k[lChild]) then
      Break;

    // �����ӽ����λ�����Ժ��ӽ���λ�ý�����һ�ֵ�ɸѡ
    k[first] := k[lChild];
    first := lChild;

    lChild := lChild * 2;
  end;

  k[first] := temp;

end;

// ----------------------------------------------------------------------------
procedure HeapSort(var k: array of Integer);
var
  i, n: Integer;
begin
  n := Length(k) - 1;

  // �Ƚ����󶥶�
  for i := n div 2 downto 0 do
  begin
    HeapAdjust(k, i, n);
  end;

  // ��������
  for i := n downto 0 do
  begin
    Swap(k[0], k[i]); // ���һ��Ԫ�غ͵�һԪ�ؽ��н���
    HeapAdjust(k, 0, i - 1);
  end;
end;

// ----------------------------------------------------------------------------
procedure Running();
var
  i: Integer;
  a: array [0 .. SIZE] of Integer;
begin
  for i := 0 to Length(a) - 1 do
    a[i] := TARRAY[i];

  HeapSort(a);

  for i := 0 to Length(a) - 1 do
    Write(a[i], ' ');

  Writeln;

end;

end.
