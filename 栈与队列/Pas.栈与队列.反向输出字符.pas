unit Pas.ջ�����.��������ַ�;

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
