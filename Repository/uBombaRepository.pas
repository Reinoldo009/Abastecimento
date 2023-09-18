unit uBombaRepository;

interface

uses
  uReposoritory, uBomba, FireDAC.Comp.Client, FireDAC.Stan.Param, Data.DB,
  System.SysUtils, Vcl.Forms;

type
  TBombaRepository = class(TInterfacedObject, IReposoritory<TBomba>)
  private
    class var FRepository: TBombaRepository;
    class procedure Initialize;

    procedure ObjetoParaQueryParams( AObjeto: TBomba; AQuery: TFDQuery );
  public
    constructor Create;

    class function GetInstance: TBombaRepository;

    procedure QueryParaObjeto( AQuery: TDataSet; AObjeto: TBomba );
    procedure ObjetoParaQuery( AObjeto: TBomba; AQuery: TDataSet );

    procedure CopiarInstancia( AOrigem, ADestino: TBomba );
    procedure LimparInstancia( AObjeto: TBomba );

    function BuscarPorId( AId: Integer ): TBomba;
    function BuscarPorFiltro( AFiltro: string ): TBomba;

    function Validar( AValue: TBomba ): Boolean;
    function Salvar( AValue: TBomba ): Boolean;

    function ValidarExclusao( AValue: Integer ): Boolean;
    function Excluir( AValue: Integer ): Boolean;

    function GetSqlConsulta: string;
    function GetTabela: string;

    procedure ShowFormulario( AValue: Integer );
  end;

  const
    TABLE_NAME = string('BOMBA');

implementation

uses
  Abast.Utils, Abast.Utils.CSQL, Abast.Msgs, uTanqueRepository, FCadastroBomba, uAbastecimentoRepository, uAbastecimento, uTanque;

{ TCombustivelRepository }

function TBombaRepository.Excluir(AValue: Integer): Boolean;
var
  LQuery: TFDQuery;
begin
  Result := False;

  if AValue = 0 then
    Exit;

  if not ValidarExclusao(AValue) then
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

function TBombaRepository.BuscarPorFiltro(AFiltro: string): TBomba;
var
  LQuery: TFDQuery;
begin
  Result := TBomba.Create;
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

function TBombaRepository.BuscarPorId(AId: Integer): TBomba;
var
  LQuery: TFDQuery;
begin
  Result := TBomba.Create;
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

procedure TBombaRepository.CopiarInstancia(AOrigem, ADestino: TBomba);
begin
  ADestino.Id := AOrigem.Id;
  ADestino.NumeroBomba := AOrigem.NumeroBomba;
  ADestino.Descricao := AOrigem.Descricao;
  TTanqueRepository.GetInstance.CopiarInstancia( AOrigem.Tanque, ADestino.Tanque );
end;

constructor TBombaRepository.Create;
begin
  raise Exception.Create('Utilizar metódo GetInstance');
end;

class function TBombaRepository.GetInstance: TBombaRepository;
begin
  if FRepository = nil then Initialize;

  Result := FRepository;
end;

function TBombaRepository.GetSqlConsulta: string;
begin
  Result :=
    'SELECT' + sLineBreak +
    '  B.ID,' + sLineBreak +
    '  B.ID AS "Código",' + sLineBreak +
    '  B.NUMERO_BOMBA AS "Número da Bomba",' + sLineBreak +
    '  B.DESCRICAO AS "Descrição da Bomba",' + sLineBreak +
    '  B.ID_TANQUE AS "Código do Tanque",' + sLineBreak +
    '  T.DESCRICAO AS "Descrição do Tanque"' + sLineBreak +
    'FROM BOMBA B' + sLineBreak +
    'JOIN TANQUE T' + sLineBreak +
    '  ON B.ID_TANQUE = T.ID';
end;

function TBombaRepository.GetTabela: string;
begin
  Result := TABLE_NAME;
end;

class procedure TBombaRepository.Initialize;
begin
  if Assigned(FRepository) then
    Exit;

  FRepository := inherited Create;
end;

procedure TBombaRepository.LimparInstancia(AObjeto: TBomba);
begin
  AObjeto.Id := 0;
  AObjeto.NumeroBomba := EmptyStr;
  AObjeto.Descricao := EmptyStr;
  TTanqueRepository.GetInstance.LimparInstancia( AObjeto.Tanque );
end;

procedure TBombaRepository.ObjetoParaQuery(AObjeto: TBomba;
  AQuery: TDataSet);
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

  AQuery.FieldByName('NUMERO_BOMBA').Value := AObjeto.NumeroBomba;
  AQuery.FieldByName('DESCRICAO').Value := AObjeto.Descricao;
  AQuery.FieldByName('ID_TANQUE').Value := AObjeto.Tanque.Id;

  if LControlInsertPost then
    AQuery.Post;
end;

procedure TBombaRepository.ObjetoParaQueryParams(AObjeto: TBomba;
  AQuery: TFDQuery);
begin
  if Assigned(AQuery.FindParam('ID')) then
    AQuery.ParamByName('ID').Value := AObjeto.Id;

  AQuery.ParamByName('NUMERO_BOMBA').Value := AObjeto.NumeroBomba;
  AQuery.ParamByName('DESCRICAO').Value := AObjeto.Descricao;
  AQuery.ParamByName('ID_TANQUE').Value := AObjeto.Tanque.Id;
end;

procedure TBombaRepository.QueryParaObjeto(AQuery: TDataSet;
  AObjeto: TBomba);
begin
  AObjeto.Id := AQuery.FieldByName('ID').AsInteger;
  AObjeto.NumeroBomba := AQuery.FieldByName('NUMERO_BOMBA').AsString;
  AObjeto.Descricao := AQuery.FieldByName('DESCRICAO').AsString;
  AObjeto.Tanque.Id := AQuery.FieldByName('ID_TANQUE').AsInteger;
end;

function TBombaRepository.Salvar(AValue: TBomba): Boolean;
var
  LQuery: TFDQuery;
  LColumns: TArray<string>;
begin
  Result := False;

  SetLength( LColumns, 3 );
  LColumns[0] := 'NUMERO_BOMBA';
  LColumns[1] := 'DESCRICAO';
  LColumns[2] := 'ID_TANQUE';

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

procedure TBombaRepository.ShowFormulario(AValue: Integer);
var
  LForm: TfrmCadastroBomba;
begin
  LForm := TfrmCadastroBomba.Create(Application);

  LForm.InicializarObjeto;
  LForm.Id := AValue;
  LForm.CarregarFormulario;
  LForm.ShowModal;

  FreeAndNil(LForm);
end;

function TBombaRepository.Validar(AValue: TBomba): Boolean;
var
  LQuery: TFDQuery;
  LTanque: TTanque;
begin
  Result := True;

  if AValue.NumeroBomba.Trim.IsEmpty then
  begin
    msgAlert('Não é possível salvar sem informar o Número da Bomba');
    Exit(False);
  end;

  if AValue.Descricao.Trim.IsEmpty then
  begin
    msgAlert('Não é possível salvar sem informar a Descrição');
    Exit(False);
  end;

  if AValue.Tanque.Id = 0 then
  begin
    msgAlert('Não é possível salvar sem informar o Tanque');
    Exit(False);
  end;

  LTanque := TTanqueRepository.GetInstance.BuscarPorId( AValue.Tanque.Id );
  LQuery := TAbastUtils.GetNewFireDACQuery;
  try
    LQuery.Open('SELECT COUNT(0) AS RET FROM BOMBA WHERE ID_TANQUE = ' + LTanque.Id.ToString + ' AND ID <> ' + AValue.Id.ToString);

    if LQuery.FieldByName('RET').AsInteger >= LTanque.LimiteBombas then
    begin
      msgAlert('Não é possível salvar mais Bombas para o Tanque ' + LTanque.Descricao.QuotedString);
      Exit(False);
    end;

    LQuery.Close;
  finally
    FreeAndNil(LTanque);
    FreeAndNil(LQuery);
  end;
end;

function TBombaRepository.ValidarExclusao(AValue: Integer): Boolean;
var
  LAbastecimento: TAbastecimento;
begin
  Result := True;

  LAbastecimento := TAbastecimentoRepository.GetInstance.BuscarPorFiltro( 'ID_BOMBA = ' + AValue.ToString );

  try
    if Assigned(LAbastecimento) then
    begin
      msgAlert('Não é possível excluir a Bomba porque a mesma está vinculado a um ou mais Abastecimentos');
      Exit(False);
    end;
  finally
    if Assigned(LAbastecimento) then
      FreeAndNil(LAbastecimento);
  end;
end;

initialization
  TBombaRepository.Initialize;

end.
