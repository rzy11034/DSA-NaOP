unit Pas.ջ�����.����N�Ľ׳�;

interface

procedure Running();

implementation

function Factorial(n: integer): integer;
begin
  if n = 0 then
  begin
    Result := 1;
  end
  else
  begin
    Result := n * Factorial(n - 1);
  end;
end;

// ----------------------------------------------------------------------------
procedure Running();
begin
  Writeln(Factorial(5));
end;

end.
