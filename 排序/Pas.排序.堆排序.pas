unit Pas.排序.堆排序;

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
// 堆筛选函数
// 已知 k[first~last] 中除了 first 之外均满足堆的定义
// 本函数进行调整，使 k[first~last] 成为一个大顶堆
procedure HeapAdjust(var k: array of TType; first, last: Integer);
var
  lChild, temp: Integer;
begin
  temp := k[first];

  // 因为根结点的序号为0而不是1，所以i结点左孩子和右孩子分别为2i+1和2i+2
  lChild := 2 * first + 1;
  // rChild := 2 * first + 2;

  while (lChild <= last) do
  begin

    // 左右孩子的比较
    if (lChild < last) and (k[lChild] < k[lChild + 1]) then
      inc(lChild);

    // 左右孩子中获胜者与父亲的比较
    if (temp > k[lChild]) then
      Break;

    // 将孩子结点上位，则以孩子结点的位置进行下一轮的筛选
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

  // 先建立大顶堆
  for i := n div 2 downto 0 do
  begin
    HeapAdjust(k, i, n);
  end;

  // 进行排序
  for i := n downto 0 do
  begin
    Swap(k[0], k[i]); // 最后一个元素和第一元素进行交换
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
