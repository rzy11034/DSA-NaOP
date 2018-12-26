unit Pas.树和二叉树.双亲孩子表示法;

interface

const
  MAX_TERR_SIZE = 100;

type
  ElemType = char;
  P_ChildNode = ^R_ChildNode;

  // 孩子结点
  R_ChildNode = record
    ChildNode: integer; // 孩子结点下标
    next: P_ChildNode; //
  end;

  // 表头结构
  R_TreeBox = record
    data: ElemType; // 存放在树中的结点的数据
    parent: integer; // 存放双亲的下标
    firstChild: P_ChildNode; // 指向第一个孩子的指针
  end;

  // 树结构
  R_Tree = record
    nodes: array [0 .. MAX_TERR_SIZE] of R_TreeBox;
    r, n: integer;
  end;

implementation

end.
