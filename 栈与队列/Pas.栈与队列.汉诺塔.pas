unit Pas.栈与队列.汉诺塔;

interface

procedure Running();

implementation

procedure Move(n: integer; x, y, z: char);
begin
  if n = 1 then
    Writeln(x, '-->', z)
  else
  begin
    Move(n - 1, x, z, y); // 将n-1个盘子从x借助z移到y上
    Writeln(x, '-->', z); // 将第n个盘子从x借助移到z上
    Move(n - 1, y, x, z); // 将n-1个盘子从y借助x移到z上
  end;
end;

// ----------------------------------------------------------------------------
procedure Running();
var
  n: integer;
begin
  Write('请输入汉诺塔的层数:');
  Read(n);
  Writeln('移动的步骤如下:');

  Move(n, 'X', 'Y', 'Z');

  Readln;
end;

end.
