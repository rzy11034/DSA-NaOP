unit Pas.ջ�����.��ŵ��;

interface

procedure Running();

implementation

procedure Move(n: integer; x, y, z: char);
begin
  if n = 1 then
    Writeln(x, '-->', z)
  else
  begin
    Move(n - 1, x, z, y); // ��n-1�����Ӵ�x����z�Ƶ�y��
    Writeln(x, '-->', z); // ����n�����Ӵ�x�����Ƶ�z��
    Move(n - 1, y, x, z); // ��n-1�����Ӵ�y����x�Ƶ�z��
  end;
end;

// ----------------------------------------------------------------------------
procedure Running();
var
  n: integer;
begin
  Write('�����뺺ŵ���Ĳ���:');
  Read(n);
  Writeln('�ƶ��Ĳ�������:');

  Move(n, 'X', 'Y', 'Z');

  Readln;
end;

end.
