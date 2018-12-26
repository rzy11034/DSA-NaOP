unit Pas.���Ͷ�����.����������;

interface

type
  ElemType = char;
  P_BiThrTree = ^R_BiThrTree;

  // �����洢λ
  // Link: ��ʾ���Һ��ӵ�ָ��
  // Tread: ��ʾָ��ǰ����̵�����
  PointerTag = (Link, Thread);

  R_BiThrTree = record
    data: ElemType;
    rChild, lChild: P_BiThrTree;
    lTag, rTag: PointerTag;
  end;

  // ȫ�ֱ�����ʼ��ָ��շ��ʹ��Ľ��
var
  pre: P_BiThrTree;

const
  SIZE_OF_R_BITNODE = SizeOf(R_BiThrTree);

procedure Running();

implementation

// ����һ�ö�����,Լ���û�����ǰ������ķ�ʽ��������
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
// �������������
procedure InThreading(t: P_BiThrTree);
begin
  if t <> nil then
  begin
    InThreading(t.lChild); // �ݹ�����������

    // ����ý��û�����ӣ�
    // ����ltagΪThread,����lChildָ��ոշ��ʵĽ��
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

    InThreading(t.rChild); // �ݹ��Һ���������
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
// �����������������
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
