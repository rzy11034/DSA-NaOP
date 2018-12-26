unit Pas.���Ա�.��������;

interface

type
  Status = integer;
  ElemType = integer;

  P_LinkNode = ^R_LinkNode;

  R_LinkNode = record
    data: ElemType;
    next: P_LinkNode;
  end;

procedure Running();

implementation

const
  OK = True;
  ERROR = False;
  LIST__INIT_SIZE = 10;

  // ��ȡ���������i��Ԫ�ص�ֵ
function GetElem(LinkNode: P_LinkNode; i: integer; var e: ElemType): Boolean;
var
  p: P_LinkNode;
  j: integer;
begin
  p := LinkNode;
  j := 0;

  while (p <> nil) and (j < i) do // Ѱ�ҵ�i�����
  begin
    p := p.next;
    inc(j);
  end;

  if (j > i) or (p = nil) then
  begin
    Result := ERROR;
  end
  else
  begin
    e := p.data;
    Result := OK;
  end;

end;

// ----------------------------------------------------------------------

// ����������i��λ�ò���Ԫ��e��ֵ
function ListInsert(LinkNode: P_LinkNode; i: integer; e: ElemType): Boolean;
var
  p, s: P_LinkNode;
  j: integer;
begin
  p := LinkNode;
  j := 1;

  while (p <> nil) and (j < i) do // Ѱ�ҵ�i�����
  begin
    p := p.next;
    inc(j);
  end;

  if (p = nil) or (j > i) then
  begin
    Result := ERROR;
    Exit
  end
  else
  begin
    new(s);

    s.data := e;
    s.next := p.next;
    p.next := s;

    Result := OK
  end;
end;

// ----------------------------------------------------------------------

// ɾ�����������i��Ԫ�ص�ֵ
function ListDelete(LinkNode: P_LinkNode; i: integer; var e: ElemType): Boolean;
var
  p, s: P_LinkNode;
  j: integer;
begin
  p := LinkNode;
  j := 1;

  while (p <> nil) and (j < i) do
  begin
    p := p.next;
    inc(j);
  end;

  if (p = nil) or (j > i) then
  begin
    Result := ERROR;
    Exit
  end
  else
  begin
    s := p.next;
    p.next := s.next;

    e := s.data;

    Dispose(s);

    Result := OK
  end;
end;

// ----------------------------------------------------------------------

// ��������ͷ�巨
procedure CreateListHead(var LinkNode: P_LinkNode; n: integer);
var
  p: P_LinkNode;
  i: integer;
begin
  new(LinkNode);
  LinkNode.next := nil;

  for i := 0 to n - 1 do
  begin
    new(p);
    p.data := i;
    p.next := LinkNode.next;
    LinkNode.next := p;
  end;
end;

// ----------------------------------------------------------------------

// ��������β�巨
procedure CreateListTail(var LinkNode: P_LinkNode; n: integer);
var
  p, r: P_LinkNode;
  i: integer;
begin
  Randomize;
  new(LinkNode);

{$IF true}
  r := LinkNode;
  for i := 0 to n - 1 do
  begin
    new(p);
    p.data := i;

    r.next := p;
    r := p
  end;
{$ELSE}  // ERROR
  for i := 0 to n - 1 do
  begin
    new(p);
    p.data := Random(100);

    LinkNode.next := p;
    LinkNode := p;
  end;
{$ENDIF}
end;

// ----------------------------------------------------------------------

// �ϲ�������
procedure MegerList(sqList_a, sqList_b: P_LinkNode; var sqList_c: P_LinkNode);
var
  c, p: P_LinkNode;
begin
  new(sqList_c);
  c := sqList_c;

  sqList_a := sqList_a.next;
  sqList_b := sqList_b.next;

  while (sqList_a <> nil) or (sqList_b <> nil) do
  begin
    new(p);

{$IF true}
    if sqList_a = nil then
    begin
      p.data := sqList_b.data;
      sqList_b := sqList_b.next;
    end
    else if sqList_b = nil then
    begin
      p.data := sqList_a.data;
      sqList_a := sqList_a.next;
    end
    else if sqList_a.data = sqList_b.data then
    begin
      p.data := sqList_a.data;
      sqList_a := sqList_a.next;
      sqList_b := sqList_b.next;
    end
    else if sqList_a.data < sqList_b.data then
    begin
      p.data := sqList_a.data;
      sqList_a := sqList_a.next;
    end
    else
    begin
      p.data := sqList_b.data;
      sqList_b := sqList_b.next;
    end;

{$ELSE}  // ERROR
    if sqList_a.data < sqList_b.data then
    begin
      p.data := sqList_a.data;
      sqList_a := sqList_a.next;
    end
    else if sqList_a.data = sqList_b.data then
    begin
      p.data := sqList_a.data;
      sqList_a := sqList_a.next;
      sqList_b := sqList_b.next;
    end
    else if sqList_a = nil then
    begin
      p.data := sqList_b.data;
      sqList_b := sqList_b.next;
    end
    else if sqList_b = nil then
    begin
      p.data := sqList_a.data;
      sqList_a := sqList_a.next;
    end
    else
    begin
      p.data := sqList_b.data;
      sqList_b := sqList_b.next;
    end;

{$ENDIF}
    c.next := p;
    c := p;
  end;
end;

// ----------------------------------------------------------------------

// �������������м�ֵ
function MidList(sqList: P_LinkNode): ElemType;
var
  temp: P_LinkNode;
begin
  temp := sqList;

  while sqList.next <> nil do
  begin
    if sqList.next.next <> nil then
    begin
      sqList := sqList.next.next;
      temp := temp.next;
    end
    else
    begin
      sqList := sqList.next
    end;
  end;

  Result := temp.next.data
end;

// ----------------------------------------------------------------------

// �������
procedure ClearList(var sqList: P_LinkNode);
var
  p, q: P_LinkNode;
begin
  p := sqList;

  while p.next <> nil do
  begin
    q := p.next.next;

    if p.next <> nil then
    begin
      Dispose(p.next);
      p.next := q;
    end
    else
    begin
      Dispose(p.next);
    end;
  end;
end;

// ----------------------------------------------------------------------

procedure PrintList(p: P_LinkNode);
begin
  while p.next <> nil do
  begin
    p := p.next;
    Write(p.data, ' ');
  end;

  Write(#10);
end;

// ----------------------------------------------------------------------

procedure Running();
var
  temp1, p: P_LinkNode;
  i, v, ListCount: integer;
  e: ElemType;

  procedure InitSreen();
  begin
    Writeln('1.��������(β�巨)');
    Writeln('2.�鿴����');
    Writeln('3.������');
    Writeln('4.�м���ֵ');
    Writeln('5.��ȡiλ�õ�Ԫ��');
    Writeln('6.��i��λ�ò���Ԫ��');
    Writeln('7.ɾ��i��λ��Ԫ��');
    Writeln('8.�������');
    Writeln('9.��ʾ�˵�');
    Writeln('0.�˳�');
    Writeln('��ѡ��.....');
  end;

begin
  Writeln('��ʼ��LinkNode...');
  CreateListTail(p, LIST__INIT_SIZE);
  InitSreen;

  Readln(v);

  repeat
    case v of
      1: // 1.��������(β�巨)
        begin
          CreateListTail(p, LIST__INIT_SIZE);
          Write('��������:');
          PrintList(p);
        end;

      2: // 2.�鿴����
        begin
          Write('����Ԫ��:');
          PrintList(p);
        end;

      3: // 3.������
        begin
          ListCount := 0;

          temp1 := p;

          while temp1.next <> nil do
          begin
            temp1 := temp1.next;
            inc(ListCount);
          end;

          Writeln('������Ϊ:', ListCount);
        end;

      4: // 4.�м���ֵ
        begin
          Writeln('�м�ֵΪ:', MidList(p));
        end;

      5: // 5.��ȡiλ�õ�Ԫ��
        begin
          Write('��ȡλ��:');
          Read(i);
          GetElem(p, i, e);
          Writeln('λ��i�ϵ�Ԫ��Ϊ:', e);
        end;

      6: // 6.��i��λ�ò���Ԫ��
        begin
          Write('����λ��:');
          Read(i);
          write('   ����ֵ:');
          Read(e);
          ListInsert(p, i, e);
          PrintList(p);
        end;

      7: // 7.ɾ��i��λ��Ԫ��
        begin
          Write('ɾ��λ��:');
          Read(i);
          ListDelete(p, i, e);
          PrintList(p);
        end;

      8: // 8.�������
        begin
          if p.next <> nil then
          begin
            ClearList(p);
            PrintList(p);
            Writeln('���������');
          end
          else
          begin
            Writeln('������Ϊ��');
          end;
        end;

      9:
        begin // 9.��ʾ�˵�
          InitSreen;
        end;

      0: // 0.�˳�
        begin
          Break;
        end;
    end;

    // InitSreen;
    Readln(v);

  until (v = 0);

end;

end.
