unit Pas.线性表.约瑟夫问题;

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
function CreateList(n: integer): P_LinkNode;
var
  p, r, head: P_LinkNode;
  i: integer;
begin
  // Randomize;
  new(head);
  p := head;

  for i := 1 to n do
  begin
    new(r);
    r.data := i;

    p.next := r;
    p := r;
  end;

  p.next := head.next;

  dispose(head);

  Result := p.next;
end;

// ----------------------------------------------------------------------

procedure PrintList(dsList: P_LinkNode; m: integer);
var
  target, temp: P_LinkNode;
  i, n: integer;
begin
  target := dsList;
  n := GetListLength(dsList);

  if n < 1 then
  begin
    Write(-1);
    Exit
  end;

  m := m mod n;

  while target.next <> target do
  begin

    for i := 1 to m - 2 do
      target := target.next;

    Write(target.next.data, '->');

    temp := target.next;

    target.next := temp.next;
    dispose(temp);

    target := target.next;

  end;

  Writeln(target.data);

  Writeln;

end;

// ----------------------------------------------------------------------

procedure Running();
var
  p: P_LinkNode;
begin
  p := CreateList(41);
  PrintList(p, 3);
end;

end.
