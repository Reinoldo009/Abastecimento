unit uTanqueRepository;

interface

uses
  uReposoritory, uTanque, FireDAC.Comp.Client, FireDAC.Stan.Param, Data.DB,
  System.SysUtils, Vcl.Forms;

type
  TTanqueRepository = class(TInterfacedObject, IReposoritory<TTanque>)
  private
    class var FRepository: TTanqueRepository;
    class procedure Initialize;

    procedure ObjetoParaQueryParams( AObjeto: TTanque; AQuery: TFDQuery );

  public
    constructor Create;

    procedure QueryParaObjeto( AQuery: TDataSet; AObjeto: TTanque );
    procedure ObjetoParaQuery( AObjeto: TTanque; AQuery: TDataSet );

    class function GetInstance: TTanqueRepository;

    procedure CopiarInstancia( AOrigem, ADestino: TTanque );
    procedure LimparInstancia( AObjeto: TTanque );

    function BuscarPorId( AId: Integer ): TTanque;
    function BuscarPorFiltro( AFiltro: string ): TTanque;

    function Validar( AValue: TTanque ): Boolean;
    function Salvar( AValue: TTanque ): Boolean;

    function ValidarExclusao( AValue: Integer ): Boolean;
    function Excluir( AValue: Integer ): Boolean;

    function GetSqlConsulta: string;
    function GetTabela: string;

    procedure ShowFormulario( AValue: Integer );
  end;

  const
    TABLE_NAME = string('TANQUE');

implementation

uses
  Abast.Utils, Abast.Utils.CSQL, Abast.Msgs, uBombaRepository, FCadastroTanque, uCombustivelRepository, uAbastecimentoRepository, uBomba, uAbastecimento;

{ TCombustivelRepository }

function TTanqueRepository.Excluir(AValue: Integer): Boolean;
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

function TTanqueRepository.BuscarPorFiltro(AFiltro: string): TTanque;
var
  LQuery: TFDQuery;
begin
  Result := TTanque.Create;
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

function TTanqueRepository.BuscarPorId(AId: Integer): TTanque;
var
  LQuery: TFDQuery;
begin
  Result := TTanque.Create;
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

procedure TTanqueRepository.CopiarInstancia(AOrigem, ADestino: TTanque);
begin
  ADestino.Id := AOrigem.Id;
  ADestino.Descricao := AOrigem.Descricao;
  ADestino.Capacidade := AOrigem.Capacidade;
  ADestino.LimiteBombas := AOrigem.LimiteBombas;
  TCombustivelRepository.GetInstance.CopiarInstancia( AOrigem.Combustivel, ADestino.Combustivel );
end;

constructor TTanqueRepository.Create;
begin
  raise Exception.Create('Utilizar metódo GetInstance');
end;

class function TTanqueRepository.GetInstance: TTanqueRepository;
begin
  if FRepository = nil then Initialize;

  Result := FRepository;
end;

function TTanqueRepository.GetSqlConsulta: string;
begin
  Result :=
    'SELECT' + sLineBreak +
    '  T.ID,' + sLineBreak +
    '  T.ID "Código",' + sLineBreak +
    '  T.DESCRICAO "Descrição do Tanque",' + sLineBreak +
    '  T.CAPACIDADE "Capacidade do Tanque",' + sLineBreak +
    '  T.ID_COMBUSTIVEL "Código do Combustível",' + sLineBreak +
    '  C.DESCRICAO "Descrição do Combustível",' + sLineBreak +
    '  T.LIMITE_BOMBAS "Limite de Bombas"' + sLineBreak +
    'FROM TANQUE T' + sLineBreak +
    'JOIN COMBUSTIVEL C' + sLineBreak +
    '  ON T.ID_COMBUSTIVEL = C.ID';
end;

function TTanqueRepository.GetTabela: string;
begin
  Result := TABLE_NAME;
end;

class procedure TTanqueRepository.Initialize;
begin
  if Assigned(FRepository) then
    Exit;

  FRepository := inherited Create;
end;

procedure TTanqueRepository.LimparInstancia(AObjeto: TTanque);
begin
  AObjeto.Id := 0;
  AObjeto.Descricao := EmptyStr;
  AObjeto.Capacidade := 0;
  AObjeto.LimiteBombas := 2;
  TCombustivelRepository.GetInstance.LimparInstancia( AObjeto.Combustivel );
end;

procedure TTanqueRepository.ObjetoParaQuery(AObjeto: TTanque; AQuery: TDataSet);
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
  AQuery.FieldByName('CAPACIDADE').Value := AObjeto.Capacidade;
  AQuery.FieldByName('ID_COMBUSTIVEL').Value := AObjeto.Combustivel.Id;
  AQuery.FieldByName('LIMITE_BOMBAS').Value := AObjeto.LimiteBombas;

  if LControlInsertPost then
    AQuery.Post;
end;

procedure TTanqueRepository.ObjetoParaQueryParams(AObjeto: TTanque; AQuery: TFDQuery);
begin
  if Assigned(AQuery.FindParam('ID')) then
    AQuery.ParamByName('ID').Value := AObjeto.Id;

  AQuery.ParamByName('DESCRICAO').Value := AObjeto.Descricao;
  AQuery.ParamByName('CAPACIDADE').Value := AObjeto.Capacidade;
  AQuery.ParamByName('ID_COMBUSTIVEL').Value := AObjeto.Combustivel.Id;
  AQuery.ParamByName('LIMITE_BOMBAS').Value := AObjeto.LimiteBombas;
end;

procedure TTanqueRepository.QueryParaObjeto(AQuery: TDataSet;
  AObjeto: TTanque);
begin
  AObjeto.Id             := AQuery.FieldByName('ID').AsInteger;
  AObjeto.Descricao      := AQuery.FieldByName('DESCRICAO').AsString;
  AObjeto.Capacidade     := AQuery.FieldByName('CAPACIDADE').AsFloat;
  AObjeto.Combustivel.Id := AQuery.FieldByName('ID_COMBUSTIVEL').AsInteger;
  AObjeto.LimiteBombas   := AQuery.FieldByName('LIMITE_BOMBAS').AsInteger;
end;

function TTanqueRepository.Salvar(AValue: TTanque): Boolean;
var
  LQuery: TFDQuery;
  LColumns: TArray<string>;
begin
  Result := False;

  SetLength( LColumns, 4 );
  LColumns[0] := 'DESCRICAO';
  LColumns[1] := 'CAPACIDADE';
  LColumns[2] := 'ID_COMBUSTIVEL';
  LColumns[3] := 'LIMITE_BOMBAS';

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

procedure TTanqueRepository.ShowFormulario(AValue: Integer);
var
  LForm: TfrmCadastroTanque;
begin
  LForm := TfrmCadastroTanque.Create(Application);

  LForm.InicializarObjeto;
  LForm.Id := AValue;
  LForm.CarregarFormulario;
  LForm.ShowModal;

  FreeAndNil(LForm);
end;

function TTanqueRepository.Validar(AValue: TTanque): Boolean;
begin
  Result := True;

  if AValue.Descricao.Trim.IsEmpty then
  begin
    msgAlert('Não é possível salvar sem informar a Descrição');
    Exit(False);
  end;

  if AValue.Combustivel.Id = 0 then
  begin
    msgAlert('Não é possível salvar sem informar o Combustível');
    Exit(False);
  end;

  if AValue.LimiteBombas = 0 then
  begin
    msgAlert('Não é possível salvar sem informar o Limite de Bombas');
    Exit(False);
  end;
end;

function TTanqueRepository.ValidarExclusao(AValue: Integer): Boolean;
var
  LBomba: TBomba;
  LAbastecimento: TAbastecimento;
begin
  Result := True;

  LBomba := TBombaRepository.GetInstance.BuscarPorFiltro( 'ID_TANQUE = ' + AValue.ToString );
  LAbastecimento := TAbastecimentoRepository.GetInstance.BuscarPorFiltro( 'ID_TANQUE = ' + AValue.ToString );

  try
    if Assigned(LBomba) then
    begin
      msgAlert('Não é possível excluir o Tanque porque o mesmo está vinculado a uma ou mais Bombas');
      Exit(False);
    end;

    if Assigned(LAbastecimento) then
    begin
      msgAlert('Não é possível excluir o Tanque porque o mesmo está vinculado a um ou mais Abastecimentos');
      Exit(False);
    end;
  finally
    if Assigned(LBomba) then
      FreeAndNil(LBomba);

    if Assigned(LAbastecimento) then
      FreeAndNil(LAbastecimento);
  end;
end;

initialization
  TTanqueRepository.Initialize;

end.
