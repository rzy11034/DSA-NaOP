unit Pas.线性表.密码问题;

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

// ---------------------------------------------------------------------------
function CreateList(n: integer): P_LinkNode;
var
  p, r, head: P_LinkNode;
  i: integer;
begin
  Randomize;
  new(head);
  p := head;

  for i := 1 to n do
  begin
    new(r);
    r.data := i + 2;

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

// ---------------------------------------------------------------------------
function PassWord(dsList: P_LinkNode; var i: integer): P_LinkNode;
var
  target, temp: P_LinkNode;
  j: integer;
begin
  target := dsList;

  for j := 1 to i - 2 do
  begin
    target := target.next;
  end;

  temp := target.next;
  target.next := temp.next;

  i := temp.data;
  Write(i, ' ');

  dispose(temp);
  temp.next := nil;

  Result := target.next;
end;

// ---------------------------------------------------------------------------
procedure Running();
const
  ii = 6;
var
  p: P_LinkNode;
  j, m: integer;
begin
  p := CreateList(ii);
  PrintList(p);
  j := p.data;
  m := ii;

  while m >= 1 do
  begin
    p := PassWord(p, j);
    dec(m);
  end;

  Writeln
end;

end.
