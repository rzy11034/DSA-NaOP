unit Pas.栈与队列.二进制转八进制;

interface

uses
  System.Math,
  System.SysUtils;

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
  bit, oxd: R_SqStack;
  c: char;
  i, sum: integer;
begin
  InitStack(bit);
  InitStack(oxd);

  Writeln('请输入一个二进制数, 输入''#''号键结束...');

  read(c);
  while c <> '#' do
  begin
    Push(bit, c);
    read(c);
  end;

  Readln;
  Writeln('当前bit栈大小为:', GetStackCount(bit));

  while bit.top <> bit.base do
  begin
    sum := 0;

    for i := 0 to 2 do
    begin

      if bit.top <> bit.base then
      begin
        Pop(bit, c);
        sum := sum + (ord(c) - 48) * Trunc(Power(2, i));
      end
      else
      begin
        Break;

      end;

    end;

    Push(oxd, char(sum + 48));

  end;

  Writeln('当前oxd栈大小为:', GetStackCount(oxd));

  while oxd.top <> oxd.base do
  begin
    Pop(oxd, c);
    Write(c);
  end;

  Writeln;
end;

end.
