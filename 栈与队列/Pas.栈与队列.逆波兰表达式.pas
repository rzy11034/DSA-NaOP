unit Pas.栈与队列.逆波兰表达式;

interface

uses
  System.Math,
  System.SysUtils,
  System.Character;

type
  ElemType = double;
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
  c: char;
  d, e: double;
begin
  InitStack(s);
  c := #0;
  str := '';

  Writeln('请按逆波兰表达式输入待计算数据，数据与运算符之间用空格隔开，以#作为结束标志...');
  Read(c);

  while c <> '#' do
  begin
    str := '';

    while c.IsDigit or (c = '.') do
    begin
      str := str + c;
      Read(c);

      if c = ' ' then
      begin
        Push(s, StrToFloat(str));
      end;
    end;

    case c of
      '-':
        begin
          Pop(s, e);
          Pop(s, d);
          Push(s, d - e);
        end;

      '+':
        begin
          Pop(s, e);
          Pop(s, d);
          Push(s, d + e);
        end;

      '*':
        begin
          Pop(s, e);
          Pop(s, d);
          Push(s, d * e);
        end;

      '/':
        begin
          Pop(s, e);
          Pop(s, d);

          if e > 0 then
            Push(s, d / e)
          else
            Writeln('输入错误');
        end;
    end;

    Read(c);
  end;

  Pop(s, d);

  str := FormatFloat('#.####', d);
  Writeln('计算结果为:', str);
  Readln;
end;

end.
