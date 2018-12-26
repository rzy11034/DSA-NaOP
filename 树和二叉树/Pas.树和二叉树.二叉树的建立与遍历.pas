unit Pas.树和二叉树.二叉树的建立与遍历;

interface

type
  ElemType = char;
  P_BiTree = ^R_BiTree;

  R_BiTree = record
    data: ElemType;
    rChild, lChild: P_BiTree;
  end;

const
  SIZE_OF_R_BITNODE = SizeOf(R_BiTree);

procedure Running();

implementation

// 创建一棵二叉树， 约定用户遵照前序遍历的方式输入数据
procedure CreateBiTree(var tree: P_BiTree);
var
  c: char;
begin
  read(c);

  if c = ' ' then
  begin
    tree := nil;
  end
  else
  begin
    new(tree);

    tree.data := c;

    CreateBiTree(tree.rChild);
    CreateBiTree(tree.lChild);
  end;
end;

// ----------------------------------------------------------------------------
procedure visit(data: ElemType; level: integer);
begin
  Write(data, '位于第', level, '层', #10);
end;

// ----------------------------------------------------------------------------
// 前序遍历二叉树
procedure PreOrderTraverse(tree: P_BiTree; level: integer);
begin
  if tree <> nil then
  begin
    visit(tree.data, level);
    PreOrderTraverse(tree.lChild, level + 1);
    PreOrderTraverse(tree.rChild, level + 1);
  end;
end;

// ----------------------------------------------------------------------------
procedure Running();
var
  level: integer;
  t: P_BiTree;
begin
  t := nil;
  level := 1;

  CreateBiTree(t);
  PreOrderTraverse(t, level);

  Readln;
end;

end.
