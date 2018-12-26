unit Pas.���Ա�.˳��ṹ;

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

  // ȡ��˳�����Ա���Ԫ��
function GetElem(sqList: R_sqList; i: integer; var e: ElemType): Boolean;
begin

  // ���˳�����Ա�ĳ���Ϊ0, ����i�����㷶ΧҪ�󣬷���ERROR
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

// ˳�����Ա����
function ListInsert(var sqList: R_sqList; i: integer; e: ElemType): Boolean;
var
  k: integer;
begin
  if (sqList.length = LIST__INIT_SIZE) then // ˳�����Ա�����
  begin
    Result := ERROR;
    Exit
  end
  else if (i < 1) or (i > sqList.length) then // i���ڷ�Χ��
  begin
    Result := ERROR;
    Exit
  end
  else if (i <= sqList.length) then // ����Ԫ�ز��ڱ�β
  begin
    // ��Ҫ��������λ�ú�Ԫ�غ���һλ
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

// ˳�����Ա�ɾ��Ԫ��
function ListDelete(var sqList: R_sqList; i: integer): Boolean;
var
  j: integer;
begin
  if (sqList.length = 0) then // ˳�����Ա�Ϊ��
  begin
    Result := ERROR;
    Exit
  end
  else if (i < 1) or (i > sqList.length) then // i���ڷ�Χ��
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

// ��֪˳�����Ա�sqList_a��sqList_b��Ԫ��ֵ���ǵݼ����У�
// �����ɵ���˳�����Ա�sqList_c��Ԫ��ֵҲ���ǵݼ����С�
procedure MergeList(sqList_a, sqList_b: R_sqList; var sqList_c: R_sqList);
var
  ia, ib, ic: integer;
begin
  ia := 1; // ��ʼ��ָ��
  ib := 1;
  ic := 0;

  while (ia <= sqList_a.length) and (ib <= sqList_b.length) do // �鲢
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

  while (ia <= sqList_a.length) do // ��ʣ���sqList_a����sqLisit_c
  begin
    sqList_c.data[ic] := sqList_a.data[ia - 1];
    inc(ia);
    inc(ic);
  end;

  while ib <= sqList_a.length do // ��ʣ���sqList_b����sqLisit_c
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
