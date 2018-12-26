unit Pas.¥Æ.BFÀ„∑®;

interface

uses
  System.SysUtils;

procedure Running();

implementation

function BF_index(s, t: string): integer;
var
  i, j: integer;
begin
  i := 1;
  j := 1;

  while (i <= s.Length) and (j <= t.Length) do
  begin
    if s[i] = t[j] then
    begin
      i := i + 1;
      j := j + 1
    end
    else
    begin
      i := i - j + 2;
      j := 1;
    end;
  end;

  if j > t.Length then
    Result := i - t.Length
  else
    Result := 0;
end;

// ----------------------------------------------------------------------------
procedure Running();
var
  s, t: string;
begin
  s := 'acabaabcaabaabcac';
  t := 'bcaa';

  Writeln(s, #10, t, #10, BF_index(s, t));
end;

end.
