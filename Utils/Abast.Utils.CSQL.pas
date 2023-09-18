unit Abast.Utils.CSQL;

interface

uses
  System.Classes, System.SysUtils, System.StrUtils;

type
  TAbastUtilsCSQL = class
  public
    class function GetSqlSelectById( ATableName, AColumnId: string ): string;

    class function GetSqlSelectByFilter( ATableName, AFilter: string ): string;

    class function GetSqlDeleteById( ATableName, AColumnId: string ): string;

    class function GetSqlDeleteByFilter( ATableName, AFilter: string ): string;

    class function GetSqlInsert( ATableName: string; AColumns: TArray<string> ): string;

    class function GetSqlUpdateById( ATableName: string; AColumns: TArray<string>; AColumnId: string  ): string;

    class function GetSqlUpdateByFilter( ATableName: string; AColumns: TArray<string>; AFilter: string  ): string;
  end;

implementation

{ TAbastUtilsCSQL }

class function TAbastUtilsCSQL.GetSqlDeleteByFilter(ATableName,
  AFilter: string): string;
begin
  Result := Format('DELETE FROM %s WHERE %s', [ATableName, AFilter]);
end;

class function TAbastUtilsCSQL.GetSqlDeleteById(ATableName,
  AColumnId: string): string;
begin
  Result := Format('DELETE FROM %s WHERE %s = :%s', [ATableName, AColumnId, AColumnId]);
end;

class function TAbastUtilsCSQL.GetSqlInsert(ATableName: string; AColumns: TArray<string>): string;
var
  LColumn, LValues, LColumns: string;
begin
  LValues := EmptyStr;
  LColumns := EmptyStr;

  for LColumn in AColumns do
  begin
    LValues := Concat(LValues, IfThen(not LValues.IsEmpty, ', ' ), ':', LColumn);
    LColumns := Concat(LColumns, IfThen(not LColumns.IsEmpty, ', ' ), LColumn);
  end;

  Result := Format('INSERT INTO %s (%s) VALUES(%s) RETURNING ID, %s', [ATableName, LColumns, LValues, LColumns]);
end;

class function TAbastUtilsCSQL.GetSqlSelectByFilter(ATableName,
  AFilter: string): string;
begin
  Result := Format('SELECT FIRST 1 * FROM %s WHERE %s', [ATableName, AFilter]);
end;

class function TAbastUtilsCSQL.GetSqlSelectById(ATableName,
  AColumnId: string): string;
begin
  Result := Format('SELECT FIRST 1 * FROM %s WHERE %s = :%s', [ATableName, AColumnId, AColumnId]);
end;

class function TAbastUtilsCSQL.GetSqlUpdateByFilter(ATableName: string;
  AColumns: TArray<string>; AFilter: string): string;
var
  LValues, LColumn: string;
begin
  LValues := EmptyStr;

  for LColumn in AColumns do
  begin
    LValues := Concat(LValues, IfThen(not LValues.IsEmpty, ', ' ), LColumn, ' = :', LColumn);
  end;

  Result := Format('UPDATE %s SET %s WHERE %s', [ATableName, LValues, AFilter]);
end;

class function TAbastUtilsCSQL.GetSqlUpdateById(ATableName: string;
  AColumns: TArray<string>; AColumnId: string): string;
var
  LValues, LColumn: string;
begin
  LValues := EmptyStr;

  for LColumn in AColumns do
  begin
    LValues := Concat(LValues, IfThen(not LValues.IsEmpty, ', ' ), LColumn, ' = :', LColumn);
  end;

  Result := Format('UPDATE %s SET %s WHERE %s = :%s', [ATableName, LValues, AColumnId, AColumnId]);
end;

end.
