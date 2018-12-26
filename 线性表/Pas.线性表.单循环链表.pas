unit Pas.���Ա�.��ѭ������;

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
  LIST_INIT_SIZE = 10;
  R_LINK_NODE_SIZE_OF = SizeOf(R_LinkNode);
  P_LINK_NODE_SIZE_OF = SizeOf(P_LinkNode);

function GetListLength(dsList: P_LinkNode): integer;
var
  target: P_LinkNode;
  j: integer;
begin
  target := dsList;
  j := 1;

  if dsList.next = nil then
  begin
    Result := -1;
    Exit
  end
  else
  begin
    while target.next <> dsList do
    begin
      target := target.next;
      inc(j);
    end;

    Result := j;
  end;
end;

// ----------------------------------------------------------------------

procedure InitList(var dsList: P_LinkNode);
var
  p, r, head: P_LinkNode;
  i: integer;
begin
  new(head);
  p := head;

  for i := 1 to 10 do
  begin
    new(r);
    r.data := i;

    p.next := r;
    p := r;
  end;

  p.next := head.next;

  dispose(head);

  dsList := p.next;
end;

// ---------------------------------------------------------------------------
procedure DeleteElem(var dsList: P_LinkNode; i: integer);
var
  target, temp: P_LinkNode;
  j: integer;
begin
  if i > GetListLength(dsList) then
    Exit;

  target := dsList;

  if i = 1 then
  begin

    while target.next <> dsList do
      target := target.next;

    temp := dsList;
    dsList := dsList.next;
    target.next := dsList;
    dispose(temp);
  end
  else
  begin
    j := 1;

    while j < i - 1 do
    begin
      target := target.next;
      inc(j);
    end;

    temp := target.next;
    target.next := temp.next;
    dispose(temp);
  end;
end;

// ----------------------------------------------------------------------
procedure InsertElem(var dsList: P_LinkNode; i: integer; e: ElemType);
var
  temp, target: P_LinkNode;
  j: integer;
begin

  if i > GetListLength(dsList) then
    Exit;

  if i = 1 then
  begin
    target := dsList;

    while target.next <> dsList do
      target := target.next;

    new(temp);
    temp.data := e;

    temp.next := dsList;
    target.next := temp;
    dsList := temp
  end
  else
  begin
    target := dsList;
    j := 1;

    while (j < i - 1) do
    begin
      target := target.next;
      inc(j)
    end;

    new(temp);
    temp.data := e;
    temp.next := target.next;
    target.next := temp;

  end;
end;

// ----------------------------------------------------------------------
procedure PrintList(dsList: P_LinkNode);
var
  p: P_LinkNode;
begin
  p := dsList;

  if GetListLength(dsList) < 1 then
  begin
    Write(-1);
    Exit
  end;

  while p.next <> dsList do
  begin
    Write(p.data, ' ');
    p := p.next;
  end;

  Write(p.data, ' ');

  Write(#10);
end;

// ----------------------------------------------------------------------
procedure ClearList(var dsList: P_LinkNode);
var
  target, temp: P_LinkNode;
begin
  if 1 > GetListLength(dsList) then
    Exit;

  target := dsList;

  while target.next <> dsList do
  begin
    temp := target.next;
    dsList.next := temp.next;
    dispose(temp);
  end;

  dsList.next := nil
end;

// ----------------------------------------------------------------------
function GetListElem(dsList: P_LinkNode; i: integer): ElemType;
var
  j: integer;
  target: P_LinkNode;
begin
  target := dsList;
  j := 1;

  if i > GetListLength(dsList) then
  begin
    Result := -1;
    Exit
  end;

  while j < i do
  begin
    target := target.next;
    inc(j);
  end;

  Result := target.data;
end;

// ----------------------------------------------------------------------
function GetListPos(dsList: P_LinkNode; e: ElemType): integer;
var
  i: integer;
  target: P_LinkNode;
begin
  i := 1;
  target := dsList;

  if GetListLength(dsList) < 1 then
  begin
    Result := -1;
    Exit;
  end;

  while True do
  begin

    if target.data = e then
    begin
      Break
    end
    else if i > GetListLength(dsList) then
    begin
      Result := -1;
      Exit;
    end
    else
    begin
      target := target.next;
      inc(i);
    end;

  end;

  Result := i;

end;

// ----------------------------------------------------------------------
procedure Running();
var
  r: P_LinkNode;
  location, v: integer;
  e: ElemType;

  procedure InitSreen();
  begin
    Writeln('1.��������');
    Writeln('2.�鿴����');
    Writeln('3.������');
    Writeln('4.��ȡiλ�õ�Ԫ��');
    Writeln('5.��ȡԪ��e��λ��');
    Writeln('6.��i��λ�ò���Ԫ��');
    Writeln('7.ɾ��i��λ��Ԫ��');
    Writeln('8.�������');
    Writeln('9.��ʾ�˵�');
    Writeln('0.�˳�');
    Writeln('��ѡ��.....');
  end;

begin
  new(r);
  InitSreen;
  v := -1;

  repeat
    case v of
      1: // 1.��������
        begin
          InitList(r);
          Writeln('��������:');
          PrintList(r);
        end;

      2: // 2.�鿴����
        begin
          Write('����Ԫ��:');
          PrintList(r);
        end;

      3: // 3.������
        begin
          Writeln('������Ϊ:', GetListLength(r));
        end;

      4: // 4.��ȡiλ�õ�Ԫ��
        begin
          Write('��ȡλ��:');
          Read(location);
          Writeln('λ��i�ϵ�Ԫ��Ϊ:', GetListElem(r, location));
        end;

      5: // 5.��ȡԪ��e��λ��
        begin
          Write('������ֵ:');
          Read(e);
          Writeln('��ȡԪ��e��λ��Ϊ:', GetListPos(r, e));
          PrintList(r);
        end;

      6: // 6.��i��λ�ò���Ԫ��
        begin
          Write('����λ��:');
          Read(location);
          Write('����ֵ:');
          Read(e);
          InsertElem(r, location, e);
          PrintList(r);
        end;

      7: // 7.ɾ��i��λ��Ԫ��
        begin
          Write('ɾ��λ��:');
          Read(location);
          DeleteElem(r, location);
          PrintList(r);
        end;

      8: // 8.�������
        begin
          ClearList(r);
          PrintList(r);
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
