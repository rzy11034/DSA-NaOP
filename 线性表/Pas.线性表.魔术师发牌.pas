unit Pas.线性表.魔术师发牌;

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
function CreateList: P_LinkNode;
var
  p, r, head: P_LinkNode;
  i: integer;
begin

  new(head);
  p := head;

  for i := 1 to 13 do
  begin
    new(r);
    r.data := 0;

    p.next := r;
    p := r;
  end;

  p.next := head.next;

  dispose(head);

  Result := p.next;
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
  target, temp: P_LinkNode;
  i, j: integer;
begin
  target := CreateList;
  PrintList(target);
  temp := target;

  j := 2;

  target.data := 1;

  while True do
  begin

    i := 1;
    while i <= j do
    begin
      temp := temp.next;

      if temp.data <> 0 then
        Continue;

      inc(i);
    end;

    if temp.data = 0 then
    begin
      temp.data := j;
      PrintList(target);

      inc(j);

      if j = 14 then
        Break;
    end;

  end;

  PrintList(target);
end;

end.
