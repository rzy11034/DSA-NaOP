unit Pas.栈与队列.循环队列;

interface

uses
  System.SysUtils;

const
  MAX_SIZE = 100;

type
  ElemType = char;
  P_ElemType = ^ElemType;
  Tarr = array of ElemType;
  Size = 0 .. MAX_SIZE;

  R_CycleQueue = record
    base: P_ElemType;
    front, rear: Size;
  end;

const
  SIZE_OF_ELEM_TYPE = SizeOf(ElemType);

procedure Running();

implementation

procedure InitCycleQueue(var q: R_CycleQueue);
begin
  q.base := GetMemory(SIZE_OF_ELEM_TYPE * MAX_SIZE);
  q.front := 0;
  q.rear := 0;
end;

// ----------------------------------------------------------------------------
procedure InsertCycleQueue(var q: R_CycleQueue; e: ElemType);
begin
  if ((q.rear + 1) mod MAX_SIZE) = q.front then
    exit;

  Tarr(q.base)[q.rear] := e;

  q.rear := (q.rear + 1) mod MAX_SIZE;
end;

// ----------------------------------------------------------------------------
procedure DeleteCycleQueue(var q: R_CycleQueue; var e: ElemType);
begin
  if q.front = q.rear then
    exit;

  e := Tarr(q.base)[q.front];
  q.front := (q.front + 1) mod MAX_SIZE;
end;

// ----------------------------------------------------------------------------
procedure Running();
var
  q: R_CycleQueue;
  i: Integer;
  e: ElemType;
begin
  InitCycleQueue(q);

  for i := 1 to 5 do
    InsertCycleQueue(q, char(i + 48));

  for i := 1 to 10 do
  begin
    DeleteCycleQueue(q, e);

    Write(e, ' ');
  end;

end;

end.
