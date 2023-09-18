unit uAbastecimentoRepository;

interface

uses
  uReposoritory, uAbastecimento, FireDAC.Comp.Client, FireDAC.Stan.Param, Data.DB,
  System.SysUtils, Vcl.Forms;

type
  TAbastecimentoRepository = class(TInterfacedObject, IReposoritory<TAbastecimento>)
  private
    class var FRepository: TAbastecimentoRepository;
    class procedure Initialize;

    procedure ObjetoParaQueryParams( AObjeto: TAbastecimento; AQuery: TFDQuery );
  public
    constructor Create;

    procedure QueryParaObjeto( AQuery: TDataSet; AObjeto: TAbastecimento );
    procedure ObjetoParaQuery( AObjeto: TAbastecimento; AQuery: TDataSet );

    class function GetInstance: TAbastecimentoRepository;

    procedure CopiarInstancia( AOrigem, ADestino: TAbastecimento );
    procedure LimparInstancia( AObjeto: TAbastecimento );

    function BuscarPorId( AId: Integer ): TAbastecimento;
    function BuscarPorFiltro( AFiltro: string ): TAbastecimento;

    function Validar( AValue: TAbastecimento ): Boolean;
    function Salvar( AValue: TAbastecimento ): Boolean;

    function ValidarExclusao( AValue: Integer ): Boolean;
    function Excluir( AValue: Integer ): Boolean;

    function GetSqlConsulta: string;
    function GetTabela: string;

    procedure ShowFormulario( AValue: Integer );
  end;

  const
    TABLE_NAME = string('ABASTECIMENTO');

implementation

uses
  Abast.Utils, Abast.Utils.CSQL, Abast.Msgs, uTanqueRepository, uBombaRepository, uCombustivelRepository, FCadastroAbastecimento;

{ TCombustivelRepository }

function TAbastecimentoRepository.BuscarPorFiltro(
  AFiltro: string): TAbastecimento;
var
  LQuery: TFDQuery;
begin
  Result := TAbastecimento.Create;
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

function TAbastecimentoRepository.BuscarPorId(AId: Integer): TAbastecimento;
var
  LQuery: TFDQuery;
begin
  Result := TAbastecimento.Create;
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

procedure TAbastecimentoRepository.CopiarInstancia(AOrigem,
  ADestino: TAbastecimento);
begin
  ADestino.Id := AOrigem.Id;
  ADestino.Data := AOrigem.Data;
  ADestino.Hora := AOrigem.Hora;
  ADestino.Quantidade := AOrigem.Quantidade;
  ADestino.ValorUnitario := AOrigem.ValorUnitario;
  ADestino.ValorTotal := AOrigem.ValorTotal;
  ADestino.TaxaImposto := AOrigem.TaxaImposto;
  ADestino.ValorImposto := AOrigem.ValorImposto;
  TBombaRepository.GetInstance.CopiarInstancia( AOrigem.Bomba, ADestino.Bomba );
  TTanqueRepository.GetInstance.CopiarInstancia( AOrigem.Tanque, ADestino.Tanque );
  TCombustivelRepository.GetInstance.CopiarInstancia( AOrigem.Combustivel, ADestino.Combustivel );
end;

constructor TAbastecimentoRepository.Create;
begin
  raise Exception.Create('Utilizar metódo GetInstance');
end;

function TAbastecimentoRepository.Excluir(AValue: Integer): Boolean;
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

class function TAbastecimentoRepository.GetInstance: TAbastecimentoRepository;
begin
  if FRepository = nil then
    Initialize;

  Result := FRepository;
end;

function TAbastecimentoRepository.GetSqlConsulta: string;
begin
  Result :=
    'SELECT' + sLineBreak +
    '    ABASTECIMENTO.ID,' + sLineBreak +
    '    ABASTECIMENTO.ID as "Código",' + sLineBreak +
    '    DATA as "Data",' + sLineBreak +
    '    HORA as "Hora",' + sLineBreak +
    '    ID_BOMBA as "Código da Bomba",' + sLineBreak +
    '    BOMBA.DESCRICAO as "Bomba",' + sLineBreak +
    '    QUANTIDADE as "Quantidade",' + sLineBreak +
    '    ABASTECIMENTO.VALOR_UNITARIO as "Valor Unitário",' + sLineBreak +
    '    VALOR_TOTAL as "Valor Total",' + sLineBreak +
    '    ABASTECIMENTO.TAXA_IMPOSTO as "Taxa de Imposto",' + sLineBreak +
    '    VALOR_IMPOSTO as "Valor de Imposto",' + sLineBreak +
    '    ABASTECIMENTO.ID_TANQUE as "Código do Tanque",' + sLineBreak +
    '    TANQUE.DESCRICAO AS "Tanque",' + sLineBreak +
    '    ABASTECIMENTO.ID_COMBUSTIVEL as "Código do Combustível",' + sLineBreak +
    '    COMBUSTIVEL.DESCRICAO as "Combustível"' + sLineBreak +
    'FROM ABASTECIMENTO' + sLineBreak +
    'JOIN BOMBA ON BOMBA.ID = ABASTECIMENTO.ID_BOMBA' + sLineBreak +
    'JOIN COMBUSTIVEL ON COMBUSTIVEL.ID = ABASTECIMENTO.ID_COMBUSTIVEL' + sLineBreak +
    'JOIN TANQUE ON TANQUE.ID_COMBUSTIVEL = COMBUSTIVEL.ID';
end;

function TAbastecimentoRepository.GetTabela: string;
begin
  Result := TABLE_NAME;
end;

class procedure TAbastecimentoRepository.Initialize;
begin
  if Assigned(FRepository) then
    Exit;

  FRepository := inherited Create;
end;

procedure TAbastecimentoRepository.LimparInstancia(AObjeto: TAbastecimento);
begin
  AObjeto.Id := 0;
  AObjeto.Data := 0;
  AObjeto.Hora := 0;
  AObjeto.Quantidade := 0;
  AObjeto.ValorUnitario := 0;
  AObjeto.ValorTotal := 0;
  AObjeto.TaxaImposto := 0;
  AObjeto.ValorImposto := 0;
  TBombaRepository.GetInstance.LimparInstancia( AObjeto.Bomba );
  TTanqueRepository.GetInstance.LimparInstancia( AObjeto.Tanque );
  TCombustivelRepository.GetInstance.LimparInstancia( AObjeto.Combustivel );
end;

procedure TAbastecimentoRepository.ObjetoParaQuery(AObjeto: TAbastecimento; AQuery: TDataSet);
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

  AQuery.FieldByName('DATA').Value := AObjeto.Data;
  AQuery.FieldByName('HORA').Value := AObjeto.Hora;
  AQuery.FieldByName('QUANTIDADE').Value := AObjeto.Quantidade;
  AQuery.FieldByName('VALOR_UNITARIO').Value := AObjeto.ValorUnitario;
  AQuery.FieldByName('VALOR_TOTAL').Value := AObjeto.ValorTotal;
  AQuery.FieldByName('TAXA_IMPOSTO').Value := AObjeto.TaxaImposto;
  AQuery.FieldByName('VALOR_IMPOSTO').Value := AObjeto.ValorImposto;

  AQuery.FieldByName('ID_BOMBA').Value := AObjeto.Bomba.Id;
  AQuery.FieldByName('ID_TANQUE').Value := AObjeto.Tanque.Id;
  AQuery.FieldByName('ID_COMBUSTIVEL').Value := AObjeto.Combustivel.Id;

  if LControlInsertPost then
    AQuery.Post;
end;

procedure TAbastecimentoRepository.ObjetoParaQueryParams(AObjeto: TAbastecimento;
  AQuery: TFDQuery);
begin
  AQuery.Prepare;

  if Assigned(AQuery.FindParam('ID')) then
    AQuery.ParamByName('ID').Value := AObjeto.Id;

  AQuery.ParamByName('DATA').Value := AObjeto.Data;
  AQuery.ParamByName('HORA').Value := AObjeto.Hora;
  AQuery.ParamByName('QUANTIDADE').Value := AObjeto.Quantidade;
  AQuery.ParamByName('VALOR_UNITARIO').Value := AObjeto.ValorUnitario;
  AQuery.ParamByName('VALOR_TOTAL').Value := AObjeto.ValorTotal;
  AQuery.ParamByName('TAXA_IMPOSTO').Value := AObjeto.TaxaImposto;
  AQuery.ParamByName('VALOR_IMPOSTO').Value := AObjeto.ValorImposto;

  AQuery.ParamByName('ID_BOMBA').Value := AObjeto.Bomba.Id;
  AQuery.ParamByName('ID_TANQUE').Value := AObjeto.Tanque.Id;
  AQuery.ParamByName('ID_COMBUSTIVEL').Value := AObjeto.Combustivel.Id;
end;

procedure TAbastecimentoRepository.QueryParaObjeto(AQuery: TDataSet;
  AObjeto: TAbastecimento);
begin
  AObjeto.Id := AQuery.FieldByName('ID').AsInteger;
  AObjeto.Data := AQuery.FieldByName('DATA').AsDateTime;
  AObjeto.Hora := AQuery.FieldByName('HORA').AsDateTime;
  AObjeto.Bomba.Id := AQuery.FieldByName('ID_BOMBA').AsInteger;
  AObjeto.Tanque.Id := AQuery.FieldByName('ID_TANQUE').AsInteger;
  AObjeto.Combustivel.Id := AQuery.FieldByName('ID_COMBUSTIVEL').AsInteger;
  AObjeto.Quantidade := AQuery.FieldByName('QUANTIDADE').AsFloat;
  AObjeto.ValorUnitario := AQuery.FieldByName('VALOR_UNITARIO').AsFloat;
  AObjeto.ValorTotal := AQuery.FieldByName('VALOR_TOTAL').AsFloat;
  AObjeto.TaxaImposto := AQuery.FieldByName('TAXA_IMPOSTO').AsFloat;
  AObjeto.ValorImposto := AQuery.FieldByName('VALOR_IMPOSTO').AsFloat;
end;

function TAbastecimentoRepository.Salvar(AValue: TAbastecimento): Boolean;
var
  LQuery: TFDQuery;
  LColumns: TArray<string>;
begin
  Result := False;

  SetLength( LColumns, 10 );
  LColumns[0] := 'DATA';
  LColumns[1] := 'HORA';
  LColumns[2] := 'ID_BOMBA';
  LColumns[3] := 'QUANTIDADE';
  LColumns[4] := 'VALOR_UNITARIO';
  LColumns[5] := 'TAXA_IMPOSTO';
  LColumns[6] := 'VALOR_IMPOSTO';
  LColumns[7] := 'VALOR_TOTAL';
  LColumns[8] := 'ID_TANQUE';
  LColumns[9] := 'ID_COMBUSTIVEL';

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

procedure TAbastecimentoRepository.ShowFormulario(AValue: Integer);
var
  LForm: TfrmCadastroAbastecimento;
begin
  LForm := TfrmCadastroAbastecimento.Create(Application);

  LForm.InicializarObjeto;
  LForm.Id := AValue;
  LForm.CarregarFormulario;
  LForm.ShowModal;

  FreeAndNil(LForm);
end;

function TAbastecimentoRepository.Validar(AValue: TAbastecimento): Boolean;
begin
  Result := True;

  if AValue.Data = 0 then
  begin
    msgAlert('Não é possível salvar o Abastecimento sem informar a Data');
    Exit(False);
  end;

  if AValue.Hora = 0 then
  begin
    msgAlert('Não é possível salvar o Abastecimento sem informar a Hora');
    Exit(False);
  end;

  if AValue.Bomba.Id = 0 then
  begin
    msgAlert('Não é possível salvar o Abastecimento sem informar a Bomba');
    Exit(False);
  end;

  if AValue.Quantidade = 0 then
  begin
    msgAlert('Não é possível salvar o Abastecimento sem informar a Quantidade');
    Exit(False);
  end;
end;

function TAbastecimentoRepository.ValidarExclusao(AValue: Integer): Boolean;
begin
  Exit(True);
end;

initialization
  TAbastecimentoRepository.Initialize;

end.
