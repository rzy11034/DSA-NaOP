unit Pas.线性表.静态链表;

interface

const
  MAX_SIZE = 1000;

type
  R_Component = record
    data: integer;
    cur: 0 .. MAX_SIZE;
  end;

  staticList = array [0 .. MAX_SIZE] of R_Component;
procedure Running();

implementation

procedure Running();
begin

end;

end.
