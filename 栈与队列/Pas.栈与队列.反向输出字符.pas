unit Pas.栈与队列.反向输出字符;

interface

procedure Running();

implementation

procedure Print();
var
  c: char;
begin
  read(c);

  if c <> '#' then
    Print;
  if c <> '#' then
    Write(c);
end;

procedure Running();
begin
  Print
end;

end.
