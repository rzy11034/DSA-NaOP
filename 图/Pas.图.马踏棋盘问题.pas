unit Pas.图.马踏棋盘问题;

interface

uses
  System.UITypes,
  System.SysUtils;

const
  MAX = 8;

type
  TChessMaxVal = 1 .. MAX;
  Tarray_Chess = array [TChessMaxVal, TChessMaxVal] of Integer;

var
  chess: Tarray_Chess;
  ChessMaxVal: TChessMaxVal;
  sets: set of TChessMaxVal = [1 .. MAX];

procedure Running;

implementation

// 找到下一步基于(x,y)可走的位置
function NextXY(var x, y: Integer; count: Integer): Boolean;
var
  m, n: Integer;
begin

  case count of
    1:
      begin
        m := x - 2;
        n := y - 1;
      end;

    2:
      begin
        m := x - 2;
        n := y + 1;
      end;

    3:
      begin
        m := x - 1;
        n := y + 2;
      end;

    4:
      begin
        m := x + 1;
        n := y + 2;
      end;

    5:
      begin
        m := x + 2;
        n := y + 1;
      end;

    6:
      begin
        m := x + 2;
        n := y - 1;
      end;

    7:
      begin
        m := x + 1;
        n := y - 2;
      end;

    8:
      begin
        m := x - 1;
        n := y - 2;
      end;

  else
    begin
      Result := false;
      exit
    end;

  end;

  if (m in sets) and (n in sets) and (chess[m, n] = 0) then
  begin
    x := m;
    y := n;
    Result := true;
  end
  else
    Result := false;

end;

// ----------------------------------------------------------------------------
procedure Print();
var
  i, j: Integer;
begin
  for i := low(chess) to high(chess) do
  begin
    for j := low(chess[1]) to high(chess[1]) do
    begin
      Write(format('%2d', [chess[i, j]]), #9);
    end;

    Writeln;
  end;
end;

// ----------------------------------------------------------------------------
// 深度优先遍历法
// (x, y)为棋盘位置
// tag为每一步的标记，每走一步，tag+1
function TravelChessBoard(x, y: Integer; tag: Integer): Boolean;
var
  flag: Boolean;
  count, x1, y1: Integer;
begin
  count := 1;
  x1 := x;
  y1 := y;

  chess[x, y] := tag;

  if (tag = MAX * MAX) then
  begin
    Print;
    Result := true;
  end
  else
  begin
    flag := NextXY(x1, y1, count);
    while (flag = false) and (count <= 8) do
    begin
      inc(count);
      flag := NextXY(x1, y1, count);
    end;

    while flag do
    begin
      if TravelChessBoard(x1, y1, tag + 1) then
      begin
        Result := true;
        exit
      end;

      inc(count);
      flag := NextXY(x1, y1, count);
      while (flag = false) and (count <= 8) do
      begin
        x1 := x;
        y1 := y;
        inc(count);
        flag := NextXY(x1, y1, count);
      end;
    end;

    if flag = false then
      chess[x, y] := 0;

    Result := false;
  end;

end;

// ----------------------------------------------------------------------------
procedure Running;
var
  c_start, c_end: TDateTime;
begin

  c_start := Now;

  if (not TravelChessBoard(1, 1, 1)) then
  begin
    Writeln('asdf');
  end;

  c_end := Now;

  Writeln(TimeToStr(c_end - c_start));

end;

end.
