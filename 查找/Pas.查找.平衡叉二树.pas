unit Pas.查找.平衡叉二树;

interface

type
  TArray = TArray<Integer>;
  Elem = Integer;
  AvlMode = (LH = -1, EH = 0, RH = 1);

  // 二叉树的链表结点结构定义
  P_BinaryTree = ^R_BinaryNode;

  R_BinaryNode = record
    data: Elem;
    bf: AvlMode;
    lChild, rChild: P_BinaryTree;
  end;

var
  A: TArray = [3, 2, 1, 4, 5, 6, 7, 10, 9, 8];

procedure Running;

implementation

procedure R_Rotate(var T: P_BinaryTree);
var
  L: P_BinaryTree;
begin
  L := T.lChild;
  T.lChild := L.rChild;
  L.rChild := T;
  T := L;
end;

// ----------------------------------------------------------------------------
procedure L_Rotate(var T: P_BinaryTree);
var
  R: P_BinaryTree;
begin
  R := T.rChild;
  T.rChild := R.lChild;
  R.lChild := T;
  T := R;
end;

// ----------------------------------------------------------------------------
procedure LeftBalance(var T: P_BinaryTree);
var
  L, Lr: P_BinaryTree;
begin
  L := T.lChild;

  case L.bf of
    LH:
      begin
        T.bf := AvlMode.EH;
        L.bf := AvlMode.EH;
        R_Rotate(T);
      end;

    RH:
      begin
        Lr := L.rChild;
        case Lr.bf of
          LH:
            begin
              T.bf := AvlMode.RH;
              L.bf := AvlMode.EH;
            end;

          EH:
            begin
              T.bf := AvlMode.EH;
              L.bf := AvlMode.EH;
            end;

          RH:
            begin
              T.bf := AvlMode.EH;
              L.bf := AvlMode.LH;
            end;
        end; // case end
        Lr.bf := AvlMode.EH;
        L_Rotate(T.lChild);
        R_Rotate(T.rChild)
      end;
  end; // case end
end;

// ----------------------------------------------------------------------------
procedure RightBalance(var T: P_BinaryTree);
var
  R, Rl: P_BinaryTree;
begin
  R := T.rChild;

  case R.bf of
    LH:
      begin
        T.bf := AvlMode.EH;
        R.bf := AvlMode.EH;
        L_Rotate(T);
      end;

    RH:
      begin
        Rl := R.lChild;
        case Rl.bf of
          LH:
            begin
              T.bf := AvlMode.RH;
              R.bf := AvlMode.EH;
            end;

          EH:
            begin
              T.bf := AvlMode.EH;
              R.bf := AvlMode.EH;
            end;

          RH:
            begin
              T.bf := AvlMode.EH;
              R.bf := AvlMode.LH;
            end;
        end; // case end
        Rl.bf := AvlMode.EH;
        R_Rotate(T.rChild);
        L_Rotate(T.lChild);
      end;
  end; // case end
end;

// ----------------------------------------------------------------------------
function InsertAVL(var T: P_BinaryTree; key: Elem; var taller: boolean)
  : boolean;
begin
  if (T = nil) then
  begin
    new(T);
    T.data := key;
    T.lChild := nil;
    T.rChild := nil;
    T.bf := AvlMode.EH;
  end
  else
  begin
    if (key = T.data) then
    begin
      taller := false;
      Exit(false);
    end;

    if (key < T.data) then
    begin
      if (not InsertAVL(T.lChild, key, taller)) then
        Exit(false);

      if (taller) then
      begin
        case (T.bf) of
          LH:
            begin
              LeftBalance(T);
              taller := false;
            end;

          EH:
            begin
              T.bf := AvlMode.LH;
              taller := true;
            end;

          RH:
            begin
              T.bf := AvlMode.EH;
              taller := false;
            end;
        end;
      end;
    end
    else
    begin
      if (not InsertAVL(T.rChild, key, taller)) then
        Exit(false);

      if (taller) then
      begin
        case (T.bf) of
          LH:
            begin
              T.bf := AvlMode.EH;
              taller := false;
            end;

          EH:
            begin
              T.bf := AvlMode.RH;
              taller := true;
            end;

          RH:
            begin
              RightBalance(T);
              taller := false;
            end;
        end;
      end;
    end;
  end;

  Result := false;
end;

// ----------------------------------------------------------------------------
// 左序遍历二叉树
procedure PreOrderTraverse(T: P_BinaryTree);
begin
  if T <> nil then
  begin
    PreOrderTraverse(T.lChild);
    Write(T.data, ' ');
    PreOrderTraverse(T.rChild);
  end;
end;

// ----------------------------------------------------------------------------
procedure CreateAVL(var T: P_BinaryTree);
var
  i: Integer;
  bool: boolean;
begin
  T := nil;
  bool := true;

  for i := Low(A) to High(A) do
    InsertAVL(T, A[i], bool);
end;

// ----------------------------------------------------------------------------
procedure Running();
var
  T: P_BinaryTree;
begin
  CreateAVL(T);

  PreOrderTraverse(T);

  writeln;
end;

end.
