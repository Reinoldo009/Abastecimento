unit Abast.Utils;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, System.Classes;

type
  TAbastUtils = class
  public
    class function GetNewFireDACQuery: TFDQuery;
  end;

implementation

uses
  DMConexao;

{ TAbastUtils }

class function TAbastUtils.GetNewFireDACQuery: TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := vConexaoSistema;
  Result.Transaction := vTransacaoSistema;
end;

end.
