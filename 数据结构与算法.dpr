program 数据结构与算法;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  Pas.查找.哈希表查找 in '查找\Pas.查找.哈希表查找.pas',
  Pas.查找.平衡叉二树 in '查找\Pas.查找.平衡叉二树.pas',
  Pas.查找.顺序查找法 in '查找\Pas.查找.顺序查找法.pas',
  Pas.查找.折半查找法 in '查找\Pas.查找.折半查找法.pas',
  Pas.串.BF算法 in '串\Pas.串.BF算法.pas',
  Pas.串.KMP算法 in '串\Pas.串.KMP算法.pas',
  Pas.排序.冒泡排序 in '排序\Pas.排序.冒泡排序.pas',
  Pas.树和二叉树.二叉树的建立与遍历 in '树和二叉树\Pas.树和二叉树.二叉树的建立与遍历.pas',
  Pas.树和二叉树.双亲孩子表示法 in '树和二叉树\Pas.树和二叉树.双亲孩子表示法.pas',
  Pas.树和二叉树.线索二叉树 in '树和二叉树\Pas.树和二叉树.线索二叉树.pas',
  Pas.图.马踏棋盘问题 in '图\Pas.图.马踏棋盘问题.pas',
  Pas.线性表.单循环链表 in '线性表\Pas.线性表.单循环链表.pas',
  Pas.线性表.静态链表 in '线性表\Pas.线性表.静态链表.pas',
  Pas.线性表.拉丁方阵 in '线性表\Pas.线性表.拉丁方阵.pas',
  Pas.线性表.密码问题 in '线性表\Pas.线性表.密码问题.pas',
  Pas.线性表.魔术师发牌 in '线性表\Pas.线性表.魔术师发牌.pas',
  Pas.线性表.双循环链表 in '线性表\Pas.线性表.双循环链表.pas',
  Pas.线性表.顺序结构 in '线性表\Pas.线性表.顺序结构.pas',
  Pas.线性表.线性链表 in '线性表\Pas.线性表.线性链表.pas',
  Pas.线性表.约瑟夫问题 in '线性表\Pas.线性表.约瑟夫问题.pas',
  Pas.栈与队列.八皇后问题 in '栈与队列\Pas.栈与队列.八皇后问题.pas',
  Pas.栈与队列.二进制转八进制 in '栈与队列\Pas.栈与队列.二进制转八进制.pas',
  Pas.栈与队列.二进制转十进制 in '栈与队列\Pas.栈与队列.二进制转十进制.pas',
  Pas.栈与队列.二进制转十六进制 in '栈与队列\Pas.栈与队列.二进制转十六进制.pas',
  Pas.栈与队列.反向输出字符 in '栈与队列\Pas.栈与队列.反向输出字符.pas',
  Pas.栈与队列.斐波拉契数列 in '栈与队列\Pas.栈与队列.斐波拉契数列.pas',
  Pas.栈与队列.汉诺塔 in '栈与队列\Pas.栈与队列.汉诺塔.pas',
  Pas.栈与队列.计算N的阶乘 in '栈与队列\Pas.栈与队列.计算N的阶乘.pas',
  Pas.栈与队列.链式队列 in '栈与队列\Pas.栈与队列.链式队列.pas',
  Pas.栈与队列.逆波兰表达式 in '栈与队列\Pas.栈与队列.逆波兰表达式.pas',
  Pas.栈与队列.循环队列 in '栈与队列\Pas.栈与队列.循环队列.pas',
  Pas.栈与队列.栈 in '栈与队列\Pas.栈与队列.栈.pas',
  Pas.栈与队列.中继转逆波兰表达式 in '栈与队列\Pas.栈与队列.中继转逆波兰表达式.pas',
  Pas.排序.选择排序 in '排序\Pas.排序.选择排序.pas',
  Pas.排序.直接插入排序 in '排序\Pas.排序.直接插入排序.pas',
  Pas.排序.希尔排序 in '排序\Pas.排序.希尔排序.pas',
  Pas.排序.堆排序 in '排序\Pas.排序.堆排序.pas',
  Pas.Main in 'Pas.Main.pas',
  Pas.排序.归并排序 in '排序\Pas.排序.归并排序.pas',
  Pas.排序.快速排序 in '排序\Pas.排序.快速排序.pas';

begin
  try
    Main;
    Write('按任意键继续......');
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
