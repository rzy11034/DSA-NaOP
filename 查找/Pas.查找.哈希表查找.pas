unit Pas.����.��ϣ�����;

interface

uses
  System.SysUtils;

const
  HASHSIZE = 12;
  NULLKEY = -32768;

type
  P__HashTable = ^R_HashTable;

  R_HashTable = record
    elem: ^Integer; // ����Ԫ�صĻ�ַ����̬��������
    count: Integer; // ��ǰ����Ԫ�صĸ���
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

// ʹ�ó���������
function Hash(key: Integer): Integer;
begin
  Result := key mod HASHSIZE;
end;

// ����ؼ��ֵ�ɢ�б�
procedure InsertHash(var h: R_HashTable; key: Integer);
var
  addr: Integer;
begin
  addr := Hash(key);

  while (TArray_Int(h.elem)[addr] <> NULLKEY) do // �����Ϊ�գ����ͻ����
  begin
    addr := (addr + 1) mod HASHSIZE; // ���Ŷ�ַ��������̽��
  end;

  TArray_Int(h.elem)[addr] := key;
end;

// ɢ�б���ҹؼ���
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
