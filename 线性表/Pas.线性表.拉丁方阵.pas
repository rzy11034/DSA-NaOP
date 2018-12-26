unit Pas.线性表.拉丁方阵;

interface

type

  ElemType = integer;

  P_LinkNode = ^R_LinkNode;

  R_LinkNode = record
    data: ElemType;
    next: P_LinkNode;
  end;

procedure Running();

implementation

// ---------------------------------------------------------------------------
function CreateList(n: integer): P_LinkNode;
var
  head, target, temp: P_LinkNode;
  i: integer;
begin
  new(head);
  target := head;

  for i := 1 to n do
  begin
    new(temp);
    temp.data := i;

    target.next := temp;
    target := temp;
  end;

  target.next := head.next;

  Dispose(head);

  Result := target.next;
end;

// ---------------------------------------------------------------------------
procedure PrintList(dsList: P_LinkNode);
var
  p: P_LinkNode;
begin
  p := dsList;

  while p.next <> dsList do
  begin
    Write(p.data, ' ');
    p := p.next;
  end;

  Write(p.data, ' ');

  Write(#10);
end;

// ---------------------------------------------------------------------------
procedure Running();
var
  head, temp: P_LinkNode;
  n, i: integer;
begin
  n := 10;
  head := CreateList(n);
  temp := head;

  // PrintList(head);

  for i := 1 to n do
  begin
    PrintList(temp);
    temp := temp.next;
  end;
end;

end.
