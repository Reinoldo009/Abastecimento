unit FCadastroCombustivel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FBaseCadastro, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uCombustivel,
  uModelFormCrud;

type
  TfrmCadastroCombustivel = class(TfrmBaseCadastro, IModelFormCrud)
    pnlCodigo: TPanel;
    Label3: TLabel;
    pnlLinha: TPanel;
    edtCodigo: TDBEdit;
    Label4: TLabel;
    edtDescricao: TDBEdit;
    Label5: TLabel;
    edtValorUnitario: TDBEdit;
    Label6: TLabel;
    edtTaxaImposto: TDBEdit;
    dsDados: TDataSource;
    cdsDados: TFDMemTable;
    cdsDadosID: TIntegerField;
    cdsDadosDESCRICAO: TStringField;
    cdsDadosVALOR_UNITARIO: TFloatField;
    cdsDadosTAXA_IMPOSTO: TFloatField;
    procedure edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
  private
    FCombustivel: TCombustivel;
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
  frmCadastroCombustivel: TfrmCadastroCombustivel;

implementation

uses
  uCombustivelRepository, Abast.Utils.Strings;

{$R *.dfm}

{ TfrmCadastroCombustivel }

procedure TfrmCadastroCombustivel.Apagar;
begin
  inherited;

end;

procedure TfrmCadastroCombustivel.Carregar;
var
  LCombustivel: TCombustivel;
begin
  LCombustivel := TCombustivelRepository.GetInstance.BuscarPorId( Id );

  if Assigned(LCombustivel) then
  begin
    TCombustivelRepository.GetInstance.CopiarInstancia( LCombustivel, FCombustivel );
  end
  else
  begin
    TCombustivelRepository.GetInstance.LimparInstancia( FCombustivel );
  end;

  TCombustivelRepository.GetInstance.ObjetoParaQuery( FCombustivel, cdsDados );

  Id := FCombustivel.Id;

  if Assigned(LCombustivel) then
    FreeAndNil( LCombustivel );
end;

procedure TfrmCadastroCombustivel.edtValorUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := TAbastUtilsStrings.ValidarValorDecimaml( Key, (Sender as TDBEdit).Text );
end;

procedure TfrmCadastroCombustivel.HabilitarDesabilitarCampos;
begin
  edtCodigo.Enabled := False;
end;

procedure TfrmCadastroCombustivel.InicializarObjeto;
begin
  FCombustivel := TCombustivel.Create;
  cdsDados.CreateDataSet;
end;

function TfrmCadastroCombustivel.Salvar: Boolean;
begin
  Result := TCombustivelRepository.GetInstance.Salvar( FCombustivel );
end;

function TfrmCadastroCombustivel.Validar: Boolean;
begin
  cdsDados.Post;
  TCombustivelRepository.GetInstance.QueryParaObjeto( cdsDados, FCombustivel );
  Result := TCombustivelRepository.GetInstance.Validar( FCombustivel );
end;

end.
