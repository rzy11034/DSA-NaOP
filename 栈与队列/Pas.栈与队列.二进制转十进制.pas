unit Pas.栈与队列.二进制转十进制;

interface

uses
  System.Math;

type
  ElemType = char;
  P_ElemType = ^ElemType;

  R_SqStack = record
    top: P_ElemType;
    base: P_ElemType;
    stackSize: integer;
  end;

const
  INIT_STACK_SIZE = 20;
  SIZE_OF_ELEM_TYPE = SizeOf(ElemType);

procedure Running();

implementation

// ---------------------------------------------------------------------------
procedure InitStack(var s: R_SqStack);
begin
  s.base := GetMemory(INIT_STACK_SIZE * SIZE_OF_ELEM_TYPE);
  s.top := s.base;
  s.stackSize := INIT_STACK_SIZE;
end;

// ---------------------------------------------------------------------------
function GetStackCount(s: R_SqStack): integer;
begin
  Result := (cardinal(s.top) - cardinal(s.base)) div SIZE_OF_ELEM_TYPE;
end;

// ---------------------------------------------------------------------------
procedure Push(var s: R_SqStack; e: ElemType);
begin
  if GetStackCount(s) >= s.stackSize then
  begin
    s.base := ReallocMemory(s.base, (s.stackSize + 10) * SIZE_OF_ELEM_TYPE);
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

// ---------------------------------------------------------------------------
procedure Running();
var
  c: char;
  s: R_SqStack;
  i: integer;
  sum: integer;
begin
  InitStack(s);
  sum := 0;

  Writeln('请输入一个二进制数, 输入''#''号键结束...');

  read(c);
  while c <> '#' do
  begin
    Push(s, c);
    read(c);
  end;

  Readln;
  Writeln('当前栈大小为:', GetStackCount(s));

  for i := 0 to GetStackCount(s) - 1 do
  begin
    Pop(s, c);

    sum := sum + (ord(c) - 48) * Trunc(Power(2, i));
  end;

  Writeln(sum);

end;

end.
