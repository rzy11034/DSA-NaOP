unit Pas.��.KMP�㷨;

interface

uses
  System.SysUtils;

procedure Running();

implementation

procedure GetNext(const t: string; var next: array of integer);
var
  i, j: integer;
begin
  i := 1;
  j := 0;
  next[i-1] := 0;

  while (i < t.Length) do
  begin
    if (t[i] = t[j]) or (j = 0) then
    begin
      inc(i);
      inc(j);
      next[i-1] := j;
    end
    else
      j := next[j-1];
  end;
end;

// ----------------------------------------------------------------------------
// �����Ӵ�t������s��pos���ַ�֮���λ��
// �������ڣ��򷵻�0
function IndexKMP(const s: string; t: string): integer;
var
  i, j: integer;
  next: array [1 .. 4] of integer;
begin
  i := 1;
  j := 1;
  // SetLength(next , t.Length);
  GetNext(t, next);

  // for k := Low(next) to High(next) do
  // Write(next[k], ' ');

  while (i <= s.Length) and (j <= t.Length) do
  begin
    if (j = 0) or (s[i] = t[j]) then
    begin
      inc(i);
      inc(j);
    end
    else
      j := next[j]
  end;

  if (j > t.Length) then
    result := i - t.Length
  else
    result := 0
end;

// ----------------------------------------------------------------------------
procedure Running();
var
  s, t: string;
begin
  s := 'acabaabcaabaabcac';
  t := 'bcac';

  Writeln(s, #10, t, #10, IndexKMP(s, t), #32, pos(t, s));
end;

end.
