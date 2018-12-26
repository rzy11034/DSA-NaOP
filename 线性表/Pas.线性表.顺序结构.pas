unit Pas.线性表.顺序结构;

interface

procedure Running;

implementation

const
  OK = True;
  ERROR = False;
  LIST__INIT_SIZE = 100;

type
  Status = integer;
  ElemType = integer;

  R_sqList = record
    data: array [0 .. LIST__INIT_SIZE] of ElemType;
    length: integer;
  end;

{$REGION 'function GetElem'}

  // 取得顺序线性表当中元素
function GetElem(sqList: R_sqList; i: integer; var e: ElemType): Boolean;
begin

  // 如果顺序线性表的长度为0, 并且i不满足范围要求，返回ERROR
  if (sqList.length = 0) or (i < 1) or (i > sqList.length) then
  begin
    Result := ERROR;
  end
  else
  begin
    e := sqList.data[i - 1];
    Result := OK
  end;

end;
{$ENDREGION}
// ----------------------------------------------------------------------

{$REGION 'function ListInsert'}

// 顺序线性表插入
function ListInsert(var sqList: R_sqList; i: integer; e: ElemType): Boolean;
var
  k: integer;
begin
  if (sqList.length = LIST__INIT_SIZE) then // 顺序线性表已满
  begin
    Result := ERROR;
    Exit
  end
  else if (i < 1) or (i > sqList.length) then // i不在范围内
  begin
    Result := ERROR;
    Exit
  end
  else if (i <= sqList.length) then // 插入元素不在表尾
  begin
    // 将要插入数据位置后元素后移一位
    for k := sqList.length - 1 downto i - 1 do
    begin
      sqList.data[k + 1] := sqList.data[k];
    end;
  end;

  sqList.data[i - 1] := e;
  inc(sqList.length);
  Result := OK;
end;
{$ENDREGION}
// ----------------------------------------------------------------------

{$REGION 'function ListDelete'}

// 顺序线性表删除元素
function ListDelete(var sqList: R_sqList; i: integer): Boolean;
var
  j: integer;
begin
  if (sqList.length = 0) then // 顺序线性表为空
  begin
    Result := ERROR;
    Exit
  end
  else if (i < 1) or (i > sqList.length) then // i不在范围内
  begin
    Result := ERROR;
    Exit
  end
  else
  begin
    for j := i to sqList.length do
      sqList.data[j - 1] := sqList.data[j];

    dec(sqList.length);
    Result := OK
  end;
end;
{$ENDREGION}
// ----------------------------------------------------------------------

{$REGION 'procedure MergeList'}

// 已知顺序线性表sqList_a，sqList_b的元素值按非递减排列，
// 所生成的新顺序线性表sqList_c的元素值也按非递减排列。
procedure MergeList(sqList_a, sqList_b: R_sqList; var sqList_c: R_sqList);
var
  ia, ib, ic: integer;
begin
  ia := 1; // 初始化指针
  ib := 1;
  ic := 0;

  while (ia <= sqList_a.length) and (ib <= sqList_b.length) do // 归并
  begin
    if sqList_a.data[ia - 1] <= sqList_c.data[ib - 1] then
    begin
      sqList_c.data[ic] := sqList_a.data[ia - 1];
      inc(ia);
      inc(ic);
    end
    else
    begin
      sqList_c.data[ic] := sqList_b.data[ib - 1];
      inc(ic);
      inc(ib);
    end;
  end;

  while (ia <= sqList_a.length) do // 将剩余的sqList_a并入sqLisit_c
  begin
    sqList_c.data[ic] := sqList_a.data[ia - 1];
    inc(ia);
    inc(ic);
  end;

  while ib <= sqList_a.length do // 将剩余的sqList_b并入sqLisit_c
  begin
    sqList_c.data[ic] := sqList_b.data[ib - 1];
    inc(ic);
    inc(ib);
  end;

  sqList_c.length := ic + 1;
end;
{$ENDREGION}
// ----------------------------------------------------------------------

procedure Running;
begin

end;

end.
