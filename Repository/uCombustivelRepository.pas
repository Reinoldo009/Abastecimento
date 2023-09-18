unit uCombustivelRepository;

interface

uses
  uReposoritory, uCombustivel, FireDAC.Comp.Client, FireDAC.Stan.Param, Data.DB,
  System.SysUtils, Vcl.Forms;

type
  TCombustivelRepository = class(TInterfacedObject, IReposoritory<TCombustivel>)
  private
    class var FRepository: TCombustivelRepository;
    class procedure Initialize;

    procedure ObjetoParaQueryParams( AObjeto: TCombustivel; AQuery: TFDQuery );
  public
    constructor Create;

    procedure QueryParaObjeto( AQuery: TDataSet; AObjeto: TCombustivel );
    procedure ObjetoParaQuery( AObjeto: TCombustivel; AQuery: TDataSet );

    class function GetInstance: TCombustivelRepository;

    procedure CopiarInstancia( AOrigem, ADestino: TCombustivel );
    procedure LimparInstancia( AObjeto: TCombustivel );

    function BuscarPorId( AId: Integer ): TCombustivel;
    function BuscarPorFiltro( AFiltro: string ): TCombustivel;

    function Validar( AValue: TCombustivel ): Boolean;
    function Salvar( AValue: TCombustivel ): Boolean;

    function ValidarExclusao( AValue: Integer ): Boolean;
    function Excluir( AValue: Integer ): Boolean;

    function GetSqlConsulta: string;
    function GetTabela: string;

    procedure ShowFormulario( AValue: Integer );
  end;

  const
    TABLE_NAME = string('COMBUSTIVEL');

implementation

uses
  Abast.Utils, Abast.Utils.CSQL, Abast.Msgs, uTanqueRepository, FCadastroCombustivel, uAbastecimentoRepository, uTanque, uAbastecimento;

{ TCombustivelRepository }

function TCombustivelRepository.Excluir(AValue: Integer): Boolean;
var
  LQuery: TFDQuery;
begin
  Result := False;

  if AValue = 0 then
    Exit;

  if not ValidarExclusao( AValue ) then
    Exit;

  LQuery := TAbastUtils.GetNewFireDACQuery;
  try
    LQuery.Transaction.StartTransaction;
    try
      LQuery.Close;
      LQuery.SQL.Text := TAbastUtilsCSQL.GetSqlDeleteById( TABLE_NAME, 'ID' );
      LQuery.ParamByName('ID').Value := AValue;
      LQuery.ExecSQL;
      Result := True;
      LQuery.Transaction.Commit;

      msgInfo('Registro excluído com sucesso');
    except
      on E: Exception do
      begin
        LQuery.Transaction.Rollback;
        msgError('Falha ao excluir Combustível' + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil( LQuery );
  end;
end;

function TCombustivelRepository.BuscarPorFiltro(AFiltro: string): TCombustivel;
var
  LQuery: TFDQuery;
begin
  Result := TCombustivel.Create;
  LQuery := TAbastUtils.GetNewFireDACQuery;
  try
    LQuery.Close;
    LQuery.SQL.Text := TAbastUtilsCSQL.GetSqlSelectByFilter( TABLE_NAME, AFiltro );
    LQuery.Open;

    if not LQuery.IsEmpty then
      QueryParaObjeto( LQuery, Result )
    else
      FreeAndNil(Result);

  finally
    FreeAndNil( LQuery );
  end;
end;

function TCombustivelRepository.BuscarPorId(AId: Integer): TCombustivel;
var
  LQuery: TFDQuery;
begin
  Result := TCombustivel.Create;
  LQuery := TAbastUtils.GetNewFireDACQuery;
  try
    LQuery.Close;
    LQuery.SQL.Text := TAbastUtilsCSQL.GetSqlSelectById( TABLE_NAME, 'ID' );
    LQuery.ParamByName('ID').Value := AId;
    LQuery.Open;

    if not LQuery.IsEmpty then
      QueryParaObjeto( LQuery, Result )
    else
      FreeAndNil(Result);

  finally
    FreeAndNil( LQuery );
  end;
end;

procedure TCombustivelRepository.CopiarInstancia(AOrigem,
  ADestino: TCombustivel);
begin
  ADestino.Id := AOrigem.Id;
  ADestino.Descricao := AOrigem.Descricao;
  ADestino.ValorUnitario := AOrigem.ValorUnitario;
  ADestino.TaxaImposto := AOrigem.TaxaImposto;
end;

constructor TCombustivelRepository.Create;
begin
  raise Exception.Create('Utilizar metódo GetInstance');
end;

class function TCombustivelRepository.GetInstance: TCombustivelRepository;
begin
  if FRepository = nil then Initialize;

  Result := FRepository;
end;

function TCombustivelRepository.GetSqlConsulta: string;
begin
  Result :=
    'SELECT' + sLineBreak +
    '  C.ID,' + sLineBreak +
    '  C.ID AS "Código",' + sLineBreak +
    '  C.DESCRICAO AS "Descrição do Combustível",' + sLineBreak +
    '  C.VALOR_UNITARIO AS "Valor Unitário",' + sLineBreak +
    '  C.TAXA_IMPOSTO AS "Taxa de Imposto"' + sLineBreak +
    'FROM COMBUSTIVEL C';
end;

function TCombustivelRepository.GetTabela: string;
begin
  Result := TABLE_NAME;
end;

class procedure TCombustivelRepository.Initialize;
begin
  if Assigned(FRepository) then
    Exit;

  FRepository := inherited Create;
end;

procedure TCombustivelRepository.LimparInstancia(AObjeto: TCombustivel);
begin
  AObjeto.Id := 0;
  AObjeto.Descricao := EmptyStr;
  AObjeto.ValorUnitario := 0;
  AObjeto.TaxaImposto := 0;
end;

procedure TCombustivelRepository.ObjetoParaQuery(AObjeto: TCombustivel; AQuery: TDataSet);
var
  LControlInsertPost: Boolean;
begin
  LControlInsertPost := not (AQuery.State in dsEditModes);

  if LControlInsertPost then
  begin
    if AQuery.IsEmpty then
      AQuery.Append
    else
      AQuery.Edit;
  end;

  if Assigned(AQuery.FindField('ID')) then
    AQuery.FieldByName('ID').Value := AObjeto.Id;

  AQuery.FieldByName('DESCRICAO').Value := AObjeto.Descricao;
  AQuery.FieldByName('VALOR_UNITARIO').Value := AObjeto.ValorUnitario;
  AQuery.FieldByName('TAXA_IMPOSTO').Value := AObjeto.TaxaImposto;

  if LControlInsertPost then
    AQuery.Post;
end;

procedure TCombustivelRepository.ObjetoParaQueryParams(AObjeto: TCombustivel; AQuery: TFDQuery);
begin
  if Assigned(AQuery.FindParam('ID')) then
    AQuery.ParamByName('ID').Value := AObjeto.Id;

  AQuery.ParamByName('DESCRICAO').Value := AObjeto.Descricao;
  AQuery.ParamByName('VALOR_UNITARIO').Value := AObjeto.ValorUnitario;
  AQuery.ParamByName('TAXA_IMPOSTO').Value := AObjeto.TaxaImposto;
end;

procedure TCombustivelRepository.QueryParaObjeto(AQuery: TDataSet;
  AObjeto: TCombustivel);
begin
  AObjeto.Id            := AQuery.FieldByName('ID').AsInteger;
  AObjeto.Descricao     := AQuery.FieldByName('DESCRICAO').AsString;
  AObjeto.ValorUnitario := AQuery.FieldByName('VALOR_UNITARIO').AsFloat;
  AObjeto.TaxaImposto   := AQuery.FieldByName('TAXA_IMPOSTO').AsFloat;
end;

function TCombustivelRepository.Salvar(AValue: TCombustivel): Boolean;
var
  LQuery: TFDQuery;
  LColumns: TArray<string>;
begin
  Result := False;

  SetLength( LColumns, 3 );
  LColumns[0] := 'DESCRICAO';
  LColumns[1] := 'VALOR_UNITARIO';
  LColumns[2] := 'TAXA_IMPOSTO';

  LQuery := TAbastUtils.GetNewFireDACQuery;
  try
    LQuery.Transaction.StartTransaction;
    try
      LQuery.Close;

      if AValue.Id = 0 then
        LQuery.SQL.Text := TAbastUtilsCSQL.GetSqlInsert( TABLE_NAME, LColumns )
      else
        LQuery.SQL.Text := TAbastUtilsCSQL.GetSqlUpdateById( TABLE_NAME, LColumns, 'ID' );

      ObjetoParaQueryParams( AValue, LQuery );

      if AValue.Id = 0 then
      begin
        LQuery.Open;
        QueryParaObjeto( LQuery, AValue );
      end
      else
        LQuery.ExecSQL;

      Result := True;
      LQuery.Transaction.Commit;

      msgInfo('Registro salvo com sucesso');
    except
      on E: Exception do
      begin
        LQuery.Transaction.Rollback;
        msgError('Falha ao salvar Registro' + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil( LQuery );
  end;
end;

procedure TCombustivelRepository.ShowFormulario(AValue: Integer);
var
  LForm: TfrmCadastroCombustivel;
begin
  LForm := TfrmCadastroCombustivel.Create(Application);

  LForm.InicializarObjeto;
  LForm.Id := AValue;
  LForm.CarregarFormulario;
  LForm.ShowModal;

  FreeAndNil(LForm);
end;

function TCombustivelRepository.Validar(AValue: TCombustivel): Boolean;
begin
  Result := True;

  if AValue.Descricao.Trim.IsEmpty then
  begin
    msgAlert('Não é possível salvar sem informar a Descrição');
    Exit(False);
  end;

  if AValue.ValorUnitario = 0 then
  begin
    msgAlert('Não é possível salvar sem informar o Valor Unitário');
    Exit(False);
  end;

  if AValue.TaxaImposto = 0 then
  begin
    msgAlert('Não é possível salvar sem informar a Taxa de Imposto');
    Exit(False);
  end;
end;

function TCombustivelRepository.ValidarExclusao(AValue: Integer): Boolean;
var
  LTanque: TTanque;
  LAbastecimento: TAbastecimento;
begin
  Result := True;

  LTanque := TTanqueRepository.GetInstance.BuscarPorFiltro( 'ID_COMBUSTIVEL = ' + AValue.ToString );
  LAbastecimento := TAbastecimentoRepository.GetInstance.BuscarPorFiltro( 'ID_COMBUSTIVEL = ' + AValue.ToString );

  try
    if Assigned(LTanque) then
    begin
      msgAlert('Não é possível excluir o Combustível porque o mesmo está vinculado a um ou mais Tanques');
      Exit(False);
    end;

    if Assigned(LAbastecimento) then
    begin
      msgAlert('Não é possível excluir o Combustível porque o mesma está vinculado a um ou mais Abastecimentos');
      Exit(False);
    end;
  finally
    if Assigned(LTanque) then
      FreeAndNil(LTanque);

    if Assigned(LAbastecimento) then
      FreeAndNil(LAbastecimento);
  end;
end;

initialization
  TCombustivelRepository.Initialize;

end.

