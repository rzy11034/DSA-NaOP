unit Pas.线性表.双循环链表;

interface

type

  ElemType = char;

  P_DualNode = ^R_DualNode;

  R_DualNode = record
    data: ElemType;
    prior: P_DualNode;
    next: P_DualNode;
  end;

procedure Running();

implementation

// ---------------------------------------------------------------------------
function CreateDualNode: P_DualNode;
var
  head, target, temp: P_DualNode;
  i: Integer;
begin
  // s:= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  new(head);
  target := head;
  target.next := head;
  target.prior := head;

  for i := 65 to 90 do
  begin
    new(temp);
    temp.data := char(i);

    temp.prior := target;
    target.next := temp;
    target := temp;
  end;

  target.next := head.next;
  target.next.prior := target;
  Dispose(head);

  Result := target.next;

end;

procedure PrintList(dsList: P_DualNode);
var
  p: P_DualNode;
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
  target: P_DualNode;
  i, n: Integer;
begin
  Readln(n);

  target := CreateDualNode;

  if n > 0 then
    for i := 1 to n do
      target := target.next
  else
    for i := -1 downto n do
      target := target.prior;

  PrintList(target);
end;

end.
