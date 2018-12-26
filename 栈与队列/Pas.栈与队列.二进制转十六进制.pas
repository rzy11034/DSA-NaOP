unit Pas.栈与队列.二进制转十六进制;

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
  bit, hex: R_SqStack;
  c: char;
  i, sum: integer;
  str: string;
begin
  InitStack(bit);
  InitStack(hex);


  Writeln('请输入一个二进制数, 输入''#''号键结束...');

  read(c);
  while c <> '#' do
  begin
    Push(bit, c);
    read(c);
  end;

  Readln;
  Writeln('当前bit栈大小为:', GetStackCount(bit));
  Writeln(bit.base^);

  while bit.top <> bit.base do
  begin
    sum := 0;

    for i := 0 to 3 do
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

    str := IntToHex(sum, 1);
    Push(hex, str[1]);

  end;

  Writeln('当前hex栈大小为:', GetStackCount(hex));

  while hex.top <> hex.base do
  begin
    Pop(hex, c);
    Write(c);
  end;

  Writeln;
end;

end.
