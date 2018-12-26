unit Pas.ջ�����.�˻ʺ�����;

interface

type
  T_Chess = array [1 .. 8, 1 .. 8] of integer;

var
  count: integer = 0;

procedure Running();

implementation

function Danger(rows, cols: integer; vChess: T_Chess): Boolean;
var
  i, j: integer;
  flag: Boolean;
begin
  flag := false;

  // �ж��еķ���
  for i := 1 to 8 do
  begin
    if vChess[i][cols] <> 0 then
    begin
      flag := true;
      break;
    end;
  end;

  // �ж����Ϸ�
  i := rows;
  j := cols;
  while (i >= 1) and (j >= 1) do
  begin
    if vChess[i][j] <> 0 then
    begin
      flag := true;
      break;
    end;

    dec(i);
    dec(j);
  end;

  // �ж����·�
  i := rows;
  j := cols;
  while (i <= 8) and (j <= 8) do
  begin
    if vChess[i][j] <> 0 then
    begin
      flag := true;
      break;
    end;

    inc(i);
    inc(j);
  end;

  // �ж����Ϸ�
  i := rows;
  j := cols;
  while (i <= 8) and (j >= 1) do
  begin
    if vChess[i][j] <> 0 then
    begin
      flag := true;
      break;
    end;

    inc(i);
    dec(j);
  end;

  // �ж����Ϸ�
  i := rows;
  j := cols;
  while (i >= 1) and (j <= 8) do
  begin
    if vChess[i][j] <> 0 then
    begin
      flag := true;
      break;
    end;

    dec(i);
    inc(j);
  end;

  Result := flag;
end;

// ----------------------------------------------------------------------------
// ����rows:��ʾ��ʾ��
// ����cols:��ʾ����
// ����vChess:��ʾ����
procedure Queen(rows: integer; cols: integer; vChess: T_Chess);
var
  tempChess: T_Chess;
  i, j: integer;
begin
  for i := 1 to 8 do
    for j := 1 to 8 do
      tempChess[i][j] := vChess[i][j];

  if rows = 9 then
  begin
    Writeln('��', count + 1, '�ַ���:');

    for i := 1 to 8 do
    begin
      for j := 1 to 8 do
      begin
        write(tempChess[i][j], ' ');
      end;
      Writeln;
    end;
    Writeln;
    inc(count);
  end
  else // �ж����λ���Ƿ���Σ��, ���û��Σ�ռ�������
  begin
    for j := 1 to cols do
    begin
      if not(Danger(rows, j, tempChess)) then
      begin
        for i := 1 to 8 do
        begin
          tempChess[rows][i] := 0;
        end;

        tempChess[rows][j] := 1;

        Queen(rows + 1, cols, tempChess);
      end;
    end;
  end;

end;

// ----------------------------------------------------------------------------
procedure Running();
var
  chess: T_Chess;
  i, j: integer;
begin

  for i := 1 to 8 do
  begin
    for j := 1 to 8 do
    begin
      chess[i][j] := 0
    end;
  end;

  Queen(1, 8, chess);

end;

end.
