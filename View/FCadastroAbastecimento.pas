unit FCadastroAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FBaseCadastro, Vcl.ExtCtrls, uAbastecimento, uModelFormCrud,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, System.Math;

type
  TfrmCadastroAbastecimento = class(TfrmBaseCadastro, IModelFormCrud)
    dsTanques: TDataSource;
    dsDados: TDataSource;
    cdsTanques: TFDMemTable;
    cdsTanquesDESCRICAO: TStringField;
    cdsTanquesID: TLargeintField;
    cdsTanquesCAPACIDADE: TFloatField;
    cdsTanquesLIMITE_BOMBAS: TIntegerField;
    cdsTanquesID_COMBUSTIVEL: TLargeintField;
    cdsDados: TFDMemTable;
    cdsDadosID: TIntegerField;
    cdsDadosID_TANQUE: TLargeintField;
    cdsCombustivel: TFDMemTable;
    cdsCombustivelDESCRICAO: TStringField;
    cdsCombustivelID: TLargeintField;
    cdsCombustivelTAXA_IMPOSTO: TFloatField;
    cdsCombustivelVALOR_UNITARIO: TFloatField;
    dsCombustivel: TDataSource;
    dsBombas: TDataSource;
    cdsBombas: TFDMemTable;
    StringField1: TStringField;
    StringField2: TStringField;
    LargeintField1: TLargeintField;
    pnlCodigo: TPanel;
    Label3: TLabel;
    pnlLinha: TPanel;
    edtCodigo: TDBEdit;
    Label1: TLabel;
    cmbTanque: TDBLookupComboBox;
    Label2: TLabel;
    cmbCombustivel: TDBLookupComboBox;
    Label4: TLabel;
    cmbBomba: TDBLookupComboBox;
    cdsDadosDATA: TDateField;
    cdsDadosHORA: TTimeField;
    cdsDadosID_BOMBA: TLargeintField;
    cdsDadosQUANTIDADE: TFloatField;
    cdsDadosVALOR_UNITARIO: TFloatField;
    cdsDadosVALOR_TOTAL: TFloatField;
    cdsDadosTAXA_IMPOSTO: TFloatField;
    cdsDadosVALOR_IMPOSTO: TFloatField;
    cdsDadosID_COMBUSTIVEL: TLargeintField;
    Label5: TLabel;
    edtData: TDBEdit;
    Label6: TLabel;
    edtHora: TDBEdit;
    cdsBombasID: TLargeintField;
    Label7: TLabel;
    edtQuantidade: TDBEdit;
    Label8: TLabel;
    edtValorUnitario: TDBEdit;
    Label9: TLabel;
    edtValorTotal: TDBEdit;
    Label10: TLabel;
    edtTaxaImposto: TDBEdit;
    Label11: TLabel;
    edtValorImposto: TDBEdit;
    procedure cmbBombaClick(Sender: TObject);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure edtQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FAbastecimento: TAbastecimento;

    procedure ConfigurarTanque;
    procedure ConfigurarCombustivel;
    procedure CalcularValorTotalEImpostos;
  protected
    function Validar: Boolean; override;
    function Salvar: Boolean; override;
    procedure Apagar; override;
    procedure Carregar; override;
    procedure HabilitarDesabilitarCampos; override;
  public
    procedure InicializarObjeto; override;
  end;

var
  frmCadastroAbastecimento: TfrmCadastroAbastecimento;

implementation

uses
  Abast.Utils,
  uAbastecimentoRepository,
  uTanqueRepository,
  uBombaRepository,
  uCombustivelRepository,
  Abast.Utils.Strings,
  Abast.Types;

{$R *.dfm}

{ TfrmCadastroAbastecimento }

procedure TfrmCadastroAbastecimento.Apagar;
begin
  inherited;

end;

procedure TfrmCadastroAbastecimento.CalcularValorTotalEImpostos;
begin
  TAbastecimentoRepository.GetInstance.QueryParaObjeto( cdsDados, FAbastecimento );

  FAbastecimento.ValorTotal   := SimpleRoundTo(FAbastecimento.ValorUnitario * FAbastecimento.Quantidade);
  FAbastecimento.ValorImposto := SimpleRoundTo(FAbastecimento.ValorTotal * (FAbastecimento.TaxaImposto / 100));

  TAbastecimentoRepository.GetInstance.ObjetoParaQuery(FAbastecimento, cdsDados);
end;

procedure TfrmCadastroAbastecimento.Carregar;
var
  LAbastecimento: TAbastecimento;
  LQuery: TFDQuery;
begin
  if not cdsCombustivel.Active then
  begin
    LQuery := TAbastUtils.GetNewFireDACQuery;
    try
      LQuery.Open('SELECT * FROM COMBUSTIVEL');
      cdsCombustivel.CloneCursor( LQuery );
    finally
      FreeAndNil(LQuery);
    end;
  end;

  if not cdsBombas.Active then
  begin
    LQuery := TAbastUtils.GetNewFireDACQuery;
    try
      LQuery.Open('SELECT * FROM BOMBA');
      cdsBombas.CloneCursor( LQuery );
    finally
      FreeAndNil(LQuery);
    end;
  end;

  if not cdsTanques.Active then
  begin
    LQuery := TAbastUtils.GetNewFireDACQuery;
    try
      LQuery.Open('SELECT * FROM TANQUE');
      cdsTanques.CloneCursor( LQuery );
    finally
      FreeAndNil(LQuery);
    end;
  end;

  LAbastecimento := TAbastecimentoRepository.GetInstance.BuscarPorId( Id );

  if Assigned(LAbastecimento) then
  begin
    TAbastecimentoRepository.GetInstance.CopiarInstancia( LAbastecimento, FAbastecimento );
  end
  else
  begin
    TAbastecimentoRepository.GetInstance.LimparInstancia( FAbastecimento );

    FAbastecimento.Data := Date;
    FAbastecimento.Hora := Time;
  end;

  TAbastecimentoRepository.GetInstance.ObjetoParaQuery( FAbastecimento, cdsDados );

  Id := FAbastecimento.Id;

  if Assigned(LAbastecimento) then
    FreeAndNil( LAbastecimento );
end;

procedure TfrmCadastroAbastecimento.cmbBombaClick(Sender: TObject);
begin
  if FAbastecimento = nil then
    Exit;

  TAbastecimentoRepository.GetInstance.QueryParaObjeto( cdsDados, FAbastecimento );
  TBombaRepository.GetInstance.QueryParaObjeto( cdsBombas, FAbastecimento.Bomba );

  ConfigurarTanque;

  HabilitarDesabilitarCampos;
end;

procedure TfrmCadastroAbastecimento.ConfigurarCombustivel;
begin
  cmbCombustivel.KeyValue := Null;
  cmbCombustivel.KeyValue := FAbastecimento.Tanque.Combustivel.Id;
  cdsDados.FieldByName('ID_COMBUSTIVEL').Value := FAbastecimento.Tanque.Combustivel.Id;

  TCombustivelRepository.GetInstance.QueryParaObjeto( cdsCombustivel, FAbastecimento.Combustivel );

  FAbastecimento.ValorUnitario := FAbastecimento.Combustivel.ValorUnitario;
  FAbastecimento.TaxaImposto   := FAbastecimento.Combustivel.TaxaImposto;

  TAbastecimentoRepository.GetInstance.ObjetoParaQuery( FAbastecimento, cdsDados );

  if FAbastecimento.Quantidade <> 0 then
  begin
    CalcularValorTotalEImpostos;
    TAbastecimentoRepository.GetInstance.ObjetoParaQuery( FAbastecimento, cdsDados );
  end;
end;

procedure TfrmCadastroAbastecimento.ConfigurarTanque;
begin
  cmbTanque.KeyValue := Null;
  cmbTanque.KeyValue := FAbastecimento.Bomba.Tanque.Id;
  cdsDados.FieldByName('ID_TANQUE').Value := FAbastecimento.Bomba.Tanque.Id;

  TTanqueRepository.GetInstance.QueryParaObjeto( cdsTanques, FAbastecimento.Tanque );

  ConfigurarCombustivel;
end;

procedure TfrmCadastroAbastecimento.edtQuantidadeChange(Sender: TObject);
begin
  if (FAbastecimento = nil) or
    (AbastFormState = fsAView) or
    (SimpleRoundTo(cdsDados.FieldByName('QUANTIDADE').AsFloat) = SimpleRoundTo(FAbastecimento.Quantidade)) then
    Exit;

  edtQuantidade.OnChange := nil;
  try
    CalcularValorTotalEImpostos;
  finally
    edtQuantidade.OnChange := edtQuantidadeChange;
  end;
end;

procedure TfrmCadastroAbastecimento.edtQuantidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    cdsDados.FieldByName('QUANTIDADE').AsFloat := StrToFloatDef(edtQuantidade.Text,0);
    edtQuantidadeChange( edtQuantidade );
  end;
end;

procedure TfrmCadastroAbastecimento.edtQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := TAbastUtilsStrings.ValidarValorDecimaml( Key, edtQuantidade.Text );
end;

procedure TfrmCadastroAbastecimento.HabilitarDesabilitarCampos;
begin
  edtCodigo.Enabled := False;

  edtData.Enabled := False;
  edtHora.Enabled := False;

  cmbTanque.Enabled := False;
  cmbCombustivel.Enabled := False;

  edtQuantidade.Enabled := FAbastecimento.Bomba.Id <> 0;

  edtValorUnitario.ReadOnly := True;
  edtValorTotal.ReadOnly := True;
  edtTaxaImposto.ReadOnly := True;
  edtValorImposto.ReadOnly := True;
end;

procedure TfrmCadastroAbastecimento.InicializarObjeto;
begin
  FAbastecimento := TAbastecimento.Create;
  cdsDados.CreateDataSet;
end;

function TfrmCadastroAbastecimento.Salvar: Boolean;
begin
  Result := TAbastecimentoRepository.GetInstance.Salvar( FAbastecimento );
end;

function TfrmCadastroAbastecimento.Validar: Boolean;
begin
  TAbastecimentoRepository.GetInstance.QueryParaObjeto( cdsDados, FAbastecimento );
  Result := TAbastecimentoRepository.GetInstance.Validar( FAbastecimento );
end;

end.
