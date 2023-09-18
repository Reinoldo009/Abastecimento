unit FCadastroTanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FBaseCadastro, Vcl.ExtCtrls, uModelFormCrud, uTanque,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Samples.Spin, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls;

type
  TfrmCadastroTanque = class(TfrmBaseCadastro, IModelFormCrud)
    pnlCodigo: TPanel;
    pnlLinha: TPanel;
    cdsCombustivel: TFDMemTable;
    cdsCombustivelDESCRICAO: TStringField;
    dsCombustivel: TDataSource;
    Label1: TLabel;
    cdsDados: TFDMemTable;
    cdsDadosID: TIntegerField;
    cdsDadosDESCRICAO: TStringField;
    cdsDadosCAPACIDADE: TFloatField;
    cdsDadosLIMITE_BOMBAS: TIntegerField;
    cdsDadosID_COMBUSTIVEL: TIntegerField;
    dsDados: TDataSource;
    Label4: TLabel;
    edtDescricao: TDBEdit;
    Label5: TLabel;
    edtCapacidade: TDBEdit;
    Label6: TLabel;
    edtLimiteBombas: TDBEdit;
    Label3: TLabel;
    edtCodigo: TDBEdit;
    cdsCombustivelID: TLargeintField;
    cdsCombustivelTAXA_IMPOSTO: TFloatField;
    cdsCombustivelVALOR_UNITARIO: TFloatField;
    cmbCombustivel: TDBLookupComboBox;
  private
    FTanque: TTanque;
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
  frmCadastroTanque: TfrmCadastroTanque;

implementation

uses
  uTanqueRepository, Abast.Utils;

{$R *.dfm}

{ TfrmBaseCadastro1 }

procedure TfrmCadastroTanque.Apagar;
begin

end;

procedure TfrmCadastroTanque.Carregar;
var
  LTanque: TTanque;
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

  LTanque := TTanqueRepository.GetInstance.BuscarPorId( Id );

  if Assigned(LTanque) then
  begin
    TTanqueRepository.GetInstance.CopiarInstancia( LTanque, FTanque );
  end
  else
  begin
    TTanqueRepository.GetInstance.LimparInstancia( FTanque );
  end;

  TTanqueRepository.GetInstance.ObjetoParaQuery( FTanque, cdsDados );

  Id := FTanque.Id;

  if Assigned(LTanque) then
    FreeAndNil( LTanque );
end;

procedure TfrmCadastroTanque.HabilitarDesabilitarCampos;
begin
  edtCodigo.Enabled := False;
end;

procedure TfrmCadastroTanque.InicializarObjeto;
begin
  FTanque := TTanque.Create;
  cdsDados.CreateDataSet;
end;

function TfrmCadastroTanque.Salvar: Boolean;
begin
  Result := TTanqueRepository.GetInstance.Salvar( FTanque );
end;

function TfrmCadastroTanque.Validar: Boolean;
begin
  TTanqueRepository.GetInstance.QueryParaObjeto( cdsDados, FTanque );
  Result := TTanqueRepository.GetInstance.Validar( FTanque );
end;

end.
