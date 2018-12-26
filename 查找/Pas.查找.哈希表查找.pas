unit Pas.查找.哈希表查找;

interface

uses
  System.SysUtils;

const
  HASHSIZE = 12;
  NULLKEY = -32768;

type
  P__HashTable = ^R_HashTable;

  R_HashTable = record
    elem: ^Integer; // 数据元素的基址，动态分配数组
    count: Integer; // 当前数据元素的个数
  end;

  TArray_Int = array of Integer;

implementation

function InitHashTable(var h: R_HashTable): Integer;
var
  i: Integer;
begin
  h.count := HASHSIZE;
  h.elem := GetMemory(HASHSIZE * SizeOf(Integer));

  if (h.elem = nil) then
    exit(-1);

  for i := 0 to HASHSIZE - 1 do
  begin
    TArray_Int(h.elem)[i] := NULLKEY;
  end;

  exit(0);
end;

// 使用除留余数法
function Hash(key: Integer): Integer;
begin
  Result := key mod HASHSIZE;
end;

// 插入关键字到散列表
procedure InsertHash(var h: R_HashTable; key: Integer);
var
  addr: Integer;
begin
  addr := Hash(key);

  while (TArray_Int(h.elem)[addr] <> NULLKEY) do // 如果不为空，则冲突出现
  begin
    addr := (addr + 1) mod HASHSIZE; // 开放定址法的线性探测
  end;

  TArray_Int(h.elem)[addr] := key;
end;

// 散列表查找关键字
function SearchHash(h: R_HashTable; key: Integer; var addr: Integer): Integer;
begin
  addr := Hash(key);

  while (TArray_Int(h.elem)[addr] <> key) do
  begin
    addr := (addr + 1) mod HASHSIZE;

    if (TArray_Int(h.elem)[addr] = NULLKEY) and (addr = Hash(key)) then
    begin
      exit(-1)
    end;
  end;

  exit(0);
end;

end.
