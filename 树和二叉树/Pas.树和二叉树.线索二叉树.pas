unit Pas.树和二叉树.线索二叉树;

interface

type
  ElemType = char;
  P_BiThrTree = ^R_BiThrTree;

  // 线索存储位
  // Link: 表示左右孩子的指针
  // Tread: 表示指向前驱后继的线索
  PointerTag = (Link, Thread);

  R_BiThrTree = record
    data: ElemType;
    rChild, lChild: P_BiThrTree;
    lTag, rTag: PointerTag;
  end;

  // 全局变量，始终指向刚访问过的结点
var
  pre: P_BiThrTree;

const
  SIZE_OF_R_BITNODE = SizeOf(R_BiThrTree);

procedure Running();

implementation

// 创建一棵二叉树,约定用户遵照前序遍历的方式输入数据
procedure CreateBiThrTree(var t: P_BiThrTree);
var
  c: char;
begin
  read(c);

  if c = ' ' then
  begin
    t := nil
  end
  else
  begin
    new(t);
    t.data := c;
    t.lTag := PointerTag.Link;
    t.rTag := PointerTag.Link;

    CreateBiThrTree(t.lChild);
    CreateBiThrTree(t.rChild);
  end;
end;

// ----------------------------------------------------------------------------
// 中序遍历线索化
procedure InThreading(t: P_BiThrTree);
begin
  if t <> nil then
  begin
    InThreading(t.lChild); // 递归左孩子线索化

    // 如果该结点没有左孩子，
    // 设置ltag为Thread,并把lChild指向刚刚访问的结点
    if t.lChild = nil then
    begin
      t.lTag := PointerTag.Thread;
      t.lChild := pre
    end;

    if pre.rChild = nil then
    begin
      pre.rTag := PointerTag.Thread;
      pre.rChild := t;
    end;

    pre := t;

    InThreading(t.rChild); // 递归右孩子线索化
  end

end;

// ----------------------------------------------------------------------------
procedure InOrderThreading(var p: P_BiThrTree; t: P_BiThrTree);
begin
  new(p);

  p.lTag := PointerTag.Link;
  p.rTag := PointerTag.Thread;
  p.rChild := p;

  if t = nil then
    p.lChild := p
  else
  begin
    p.lChild := t;
    pre := p;
    InThreading(t);
    pre.rChild := p;
    pre.rTag := PointerTag.Thread;
    p.rChild := pre;
  end;
end;

// ----------------------------------------------------------------------------
procedure visit(data: ElemType);
begin
  Write(data);
end;

// ----------------------------------------------------------------------------
// 中序遍历线索二叉树
procedure InOrderTraverse(t: P_BiThrTree);
var
  p: P_BiThrTree;
begin
  p := t.lChild;

  while p <> t do
  begin
    while p.lTag = PointerTag.Link do
    begin
      p := p.lChild;
    end;

    visit(p.data);

    while (p.rTag = PointerTag.Thread) and (p.rChild <> t) do
    begin
      p := p.rChild;
      visit(p.data);
    end;

    p := p.rChild;
  end;
end;

// ----------------------------------------------------------------------------
procedure Running();
var
  p, t: P_BiThrTree;

begin
  CreateBiThrTree(t);

  InOrderThreading(p, t);

  InOrderTraverse(p);

  Writeln;
  readln;
end;

end.
