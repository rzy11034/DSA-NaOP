unit Pas.线性表.线性链表;

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

  // 获取线性链表第i个元素的值
function GetElem(LinkNode: P_LinkNode; i: integer; var e: ElemType): Boolean;
var
  p: P_LinkNode;
  j: integer;
begin
  p := LinkNode;
  j := 0;

  while (p <> nil) and (j < i) do // 寻找第i个结点
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

// 在线性链表i的位置插入元素e的值
function ListInsert(LinkNode: P_LinkNode; i: integer; e: ElemType): Boolean;
var
  p, s: P_LinkNode;
  j: integer;
begin
  p := LinkNode;
  j := 1;

  while (p <> nil) and (j < i) do // 寻找第i个结点
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

// 删除线性链表第i个元素的值
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

// 线性链表头插法
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

// 线性链表尾插法
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

// 合并线性链
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

// 获得线性链表的中间值
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

// 清空链表
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
    Writeln('1.创建链表(尾插法)');
    Writeln('2.查看链表');
    Writeln('3.链表长度');
    Writeln('4.中间结点值');
    Writeln('5.获取i位置的元素');
    Writeln('6.在i的位置插入元素');
    Writeln('7.删除i的位置元素');
    Writeln('8.清除链表');
    Writeln('9.显示菜单');
    Writeln('0.退出');
    Writeln('请选择.....');
  end;

begin
  Writeln('初始化LinkNode...');
  CreateListTail(p, LIST__INIT_SIZE);
  InitSreen;

  Readln(v);

  repeat
    case v of
      1: // 1.创建链表(尾插法)
        begin
          CreateListTail(p, LIST__INIT_SIZE);
          Write('创建链表:');
          PrintList(p);
        end;

      2: // 2.查看链表
        begin
          Write('链表元素:');
          PrintList(p);
        end;

      3: // 3.链表长度
        begin
          ListCount := 0;

          temp1 := p;

          while temp1.next <> nil do
          begin
            temp1 := temp1.next;
            inc(ListCount);
          end;

          Writeln('链表长度为:', ListCount);
        end;

      4: // 4.中间结点值
        begin
          Writeln('中间值为:', MidList(p));
        end;

      5: // 5.获取i位置的元素
        begin
          Write('获取位置:');
          Read(i);
          GetElem(p, i, e);
          Writeln('位置i上的元素为:', e);
        end;

      6: // 6.在i的位置插入元素
        begin
          Write('插入位置:');
          Read(i);
          write('   插入值:');
          Read(e);
          ListInsert(p, i, e);
          PrintList(p);
        end;

      7: // 7.删除i的位置元素
        begin
          Write('删除位置:');
          Read(i);
          ListDelete(p, i, e);
          PrintList(p);
        end;

      8: // 8.清除链表
        begin
          if p.next <> nil then
          begin
            ClearList(p);
            PrintList(p);
            Writeln('链表已清空');
          end
          else
          begin
            Writeln('链表已为空');
          end;
        end;

      9:
        begin // 9.显示菜单
          InitSreen;
        end;

      0: // 0.退出
        begin
          Break;
        end;
    end;

    // InitSreen;
    Readln(v);

  until (v = 0);

end;

end.
