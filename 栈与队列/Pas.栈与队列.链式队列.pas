unit Pas.栈与队列.链式队列;

interface

type
  ElemType = integer;
  P_LinkNode = ^R_LinkNode;

  R_LinkNode = record
    data: ElemType;
    next: P_LinkNode;
  end;

  R_LinkQueue = record
    front, rear: P_LinkNode;
  end;

procedure Running();

implementation

procedure InitQueue(var q: R_LinkQueue);
begin
  new(q.front);

  q.rear := q.front;
  q.front.next := nil;

end;

// ----------------------------------------------------------------------------
procedure InsertQueue(var q: R_LinkQueue; e: ElemType);
var
  p: P_LinkNode;
begin
  new(p);
  p.data := e;
  p.next := nil;
  q.rear.next := p;
  q.rear := p;
end;

// ----------------------------------------------------------------------------
procedure DeleteQueue(var q: R_LinkQueue; var e: ElemType);
var
  p: P_LinkNode;
begin
  if q.front = q.rear then
    Exit;

  p := q.front.next;
  e := p.data;
  q.front.next := p.next;

  if q.rear = p then
    q.rear := q.front;

  dispose(p);
end;

// ----------------------------------------------------------------------------
procedure DestroyQueue(var q: R_LinkQueue);
begin
  while q.front.next <> nil do
  begin
    q.rear := q.front.next;
    dispose(q.front);
    q.front := q.rear;
  end;
end;

// ----------------------------------------------------------------------------
procedure Running();
var
  q: R_LinkQueue;
  i: integer;
  e: ElemType;
begin
  InitQueue(q);

  for i := 1 to 20 do
    InsertQueue(q, i);

  while q.front.next <> nil do
  begin
    DeleteQueue(q, e);
    Write(e, ' ');
  end;

  Writeln;
end;

end.
