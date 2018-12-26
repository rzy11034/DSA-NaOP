unit Pas.���Ͷ�����.˫�׺��ӱ�ʾ��;

interface

const
  MAX_TERR_SIZE = 100;

type
  ElemType = char;
  P_ChildNode = ^R_ChildNode;

  // ���ӽ��
  R_ChildNode = record
    ChildNode: integer; // ���ӽ���±�
    next: P_ChildNode; //
  end;

  // ��ͷ�ṹ
  R_TreeBox = record
    data: ElemType; // ��������еĽ�������
    parent: integer; // ���˫�׵��±�
    firstChild: P_ChildNode; // ָ���һ�����ӵ�ָ��
  end;

  // ���ṹ
  R_Tree = record
    nodes: array [0 .. MAX_TERR_SIZE] of R_TreeBox;
    r, n: integer;
  end;

implementation

end.
