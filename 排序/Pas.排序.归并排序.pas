unit Pas.排序.归并排序;

interface

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

{$REGION '归并排序的递归版'}

// 实现归并，并把最后结果存放到 lList 里。
procedure Merging_Recersion(var lList: TMyArray; lListSize: Integer;
  var rList: TMyArray; rListSize: Integer);
var
  i, j, k: Integer;
  temp: TMyArray;
begin
  SetLength(temp, lListSize + rListSize);
  i := 0;
  k := 0;
  j := 0;

  while ((i < lListSize) and (j < rListSize)) do
  begin
    if (lList[i] < rList[j]) then
    begin
      temp[k] := lList[i];
      inc(i)
    end
    else
    begin
      temp[k] := rList[j];
      inc(j)
    end;

    inc(k)
  end;

  while (i < lListSize) do
  begin
    temp[k] := lList[i];
    inc(k);
    inc(i);
  end;

  while (j < rListSize) do
  begin
    temp[k] := rList[j];
    inc(k);
    inc(j);
  end;

  lList := temp;
end;

// ----------------------------------------------------------------------------
procedure MergeSort_Recersion(var k: TMyArray);
var
  i, lListSize, rListSize: Integer;
  temp, lList, rList: TMyArray;
begin
  if Length(k) > 1 then
  begin
    lListSize := Length(k) div 2;
    rListSize := Length(k) - lListSize;

    lList := System.Copy(k, 0, lListSize);
    rList := System.Copy(k, lListSize, rListSize);

    MergeSort_Recersion(lList);
    MergeSort_Recersion(rList);

    Merging_Recersion(lList, lListSize, rList, rListSize);

    k := lList;
  end;
end;

{$ENDREGION}
// ----------------------------------------------------------------------------

{$REGION '归并排序的迭代版'}

procedure MergeSort_Iteration(var k: TMyArray);
var
	i, n, next, left_min, left_max, right_min, right_max: Integer;
	temp: TMyArray;
begin
	n:= Length(k);
	SetLength(temp, n);

	i := 1;
	while i < n do
	begin

		left_min := 0;
		while left_min < n - i do
		begin
			right_min := left_min + i;
			left_max := right_min;
			right_max := left_max + i;

			left_min := right_max;
		end;

		if ( right_max > n) then
			right_max := n;

		next := 0;

		while (left_min < left_max) and (right_min < right_max) do
		begin
			if (k[left_min] < k[right_min]) then
			begin
				temp[next] := k[left_min];
				inc(next); inc(left_min)
			end
			else
			begin
				temp[next] := k[right_min];
				inc(next); inc(right_min)
			end;
		end;

		while (left_min < left_max) do
		begin
			dec(right_max); dec(left_max);
			k[right_max] := k[left_max];
		end;

		while (next > 0) do
		begin
			dec(right_min); dec(next);
			k[right_min] := temp[next];
		end;

		i:= i*2;
	end;

  k := temp;
end;


{$ENDREGION}

// ----------------------------------------------------------------------------
procedure Running();
var
  i: Integer;
  l, k: TMyArray;
begin
  k := System.Copy(A);
  l := System.Copy(k);

  MergeSort_Recersion(k);
  MergeSort_Iteration(l);

  for i := Low(k) to High(k) do
    Write(k[i], ' ');

  Writeln;

  for i := Low(l) to High(l) do
    Write(l[i], ' ');

  Writeln;

end;

end.
