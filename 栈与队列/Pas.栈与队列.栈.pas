unit Pas.Õ»Óë¶ÓÁÐ.Õ»;

interface

uses
  System.SysUtils;

type
  ElemType = integer;
  P_ElemType = ^ElemType;

  R_SqStack = record
    top: P_ElemType;
    base: P_ElemType;
    stackSize: integer;
  end;

const
  INIT_STACK_SIZE = 10;
  SIZE_OF_ELEM_TYPE = SizeOf(ElemType);

procedure Running();

implementation

procedure InitStack(var s: R_SqStack);
begin
  s.base := GetMemory(SIZE_OF_ELEM_TYPE * INIT_STACK_SIZE);
  s.top := s.base;
  s.stackSize := INIT_STACK_SIZE;
end;

// ---------------------------------------------------------------------------
function GetStackCount(s: R_SqStack): integer;
begin
  Result := (System.UInt32(s.top) - UInt32(s.base)) div SIZE_OF_ELEM_TYPE;
end;

// ---------------------------------------------------------------------------
procedure push(var s: R_SqStack; e: ElemType);
var
  j: integer;
begin
  j := GetStackCount(s);

  if j >= s.stackSize then
  begin
    s.base := ReallocMemory(s.base, (s.stackSize + 10) * SIZE_OF_ELEM_TYPE);
    s.top := s.base;
    inc(s.top, s.stackSize);
    s.stackSize := s.stackSize + 10;
  end;

  s.top^ := e;
  inc(s.top);

end;

// ---------------------------------------------------------------------------
procedure Pop(var s: R_SqStack; var e: ElemType);
begin
  if s.top = s.base then
    exit;

  dec(s.top);
  e := s.top^;
end;

// ----------------------------------------------------------------------------
function Peek(s: R_SqStack): ElemType;
begin
  dec(s.top, 3);
  exit(s.top^);
end;

// ---------------------------------------------------------------------------
procedure Running();
var
  i, j: integer;
  s: R_SqStack;
begin
  InitStack(s);

  for i := 1 to 10 do
    push(s, i);

  j := GetStackCount(s);

  Writeln(j);

  Writeln(Peek(s));

  while s.top <> s.base do
  begin
    dec(s.top, 1);
    Writeln(s.top^);
  end;

end;

end.
