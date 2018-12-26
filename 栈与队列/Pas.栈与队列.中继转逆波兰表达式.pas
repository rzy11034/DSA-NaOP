unit Pas.栈与队列.中继转逆波兰表达式;

interface

uses
  System.Math,
  System.SysUtils,
  System.Character;

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

// ----------------------------------------------------------------------------
procedure Running();
var
  s: R_SqStack;
  str: string;
  c, e, space: char;
begin
  InitStack(s);
  c := #0;
  str := '';
  space := ' ';

  Writeln('请按中继表达式输入待计算数据，数据与运算符之间用空格隔开，以#作为结束标志...');
  Read(c);

  while c <> '#' do
  begin

    while c.IsDigit do
    begin
      str := str + c;
      read(c);

      if not c.IsDigit then
        str := str + space;
    end;

    if c = ')' then
    begin
      Pop(s, e);

      while e <> '(' do
      begin
        str := str + e + space;
        Pop(s, e);
      end;
    end
    else if (c = '+') or (c = '-') then
    begin

      if GetStackCount(s) = 0 then
        Push(s, c)
      else
      begin
        repeat
          Pop(s, e);

          if e = '(' then
            Push(s, e)
          else
            str := str + e + space;

        until ((GetStackCount(s) = 0) or (e = '('));

        Push(s, c);
      end;
    end
    else if (c = '*') or (c = '/') or (c = '(') then
    begin
      Push(s, c);
    end
    else if c = '#' then
      break
    else
    begin
      Writeln('输入错误!');
      exit;
    end;

    Read(c);
  end;

  while s.top <> s.base do
  begin
    Pop(s, e);
    str := str + e + space;
  end;

  Writeln(str);
  readln;

end;

end.
