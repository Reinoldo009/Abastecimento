unit FCadastroBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FBaseCadastro, Vcl.ExtCtrls, uModelFormCrud,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uBomba;

type
  TfrmCadastroBomba = class(TfrmBaseCadastro, IModelFormCrud)
    pnlCodigo: TPanel;
    Label3: TLabel;
    pnlLinha: TPanel;
    edtCodigo: TDBEdit;
    dsTanques: TDataSource;
    dsDados: TDataSource;
    cdsTanques: TFDMemTable;
    cdsTanquesDESCRICAO: TStringField;
    cdsTanquesID: TLargeintField;
    cdsDados: TFDMemTable;
    cdsDadosID: TIntegerField;
    cdsDadosDESCRICAO: TStringField;
    Label4: TLabel;
    edtDescricao: TDBEdit;
    edtNumeroBomba: TDBEdit;
    Label5: TLabel;
    Label1: TLabel;
    cmbTanque: TDBLookupComboBox;
    cdsTanquesCAPACIDADE: TFloatField;
    cdsTanquesLIMITE_BOMBAS: TIntegerField;
    cdsTanquesID_COMBUSTIVEL: TLargeintField;
    cdsDadosNUMERO_BOMBA: TStringField;
    cdsDadosID_TANQUE: TLargeintField;
    procedure edtNumeroBombaKeyPress(Sender: TObject; var Key: Char);
  private
    FBomba: TBomba;
  protected
    function Validar: Boolean; override;
    function Salvar: Boolean; override;
    procedure Apagar; override;
    procedure HabilitarDesabilitarCampos; override;
    procedure Carregar; override;
  public
    procedure InicializarObjeto; override;
  end;

var
  frmCadastroBomba: TfrmCadastroBomba;

implementation

uses
  uBombaRepository, Abast.Utils.Strings, Abast.Utils;

{$R *.dfm}

{ TfrmBaseCadastro1 }

procedure TfrmCadastroBomba.Apagar;
begin

end;

procedure TfrmCadastroBomba.Carregar;
var
  LBomba: TBomba;
  LQuery: TFDQuery;
begin
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

  LBomba := TBombaRepository.GetInstance.BuscarPorId( Id );

  if Assigned(LBomba) then
  begin
    TBombaRepository.GetInstance.CopiarInstancia( LBomba, FBomba );
  end
  else
  begin
    TBombaRepository.GetInstance.LimparInstancia( FBomba );
  end;

  TBombaRepository.GetInstance.ObjetoParaQuery( FBomba, cdsDados );

  Id := FBomba.Id;

  if Assigned(LBomba) then
    FreeAndNil( LBomba );
end;

procedure TfrmCadastroBomba.edtNumeroBombaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  Key := TAbastUtilsStrings.ValidarApenasNumeros( Key );
end;

procedure TfrmCadastroBomba.HabilitarDesabilitarCampos;
begin
  edtCodigo.Enabled := False;
end;

procedure TfrmCadastroBomba.InicializarObjeto;
begin
  FBomba := TBomba.Create;
  cdsDados.CreateDataSet;
end;

function TfrmCadastroBomba.Salvar: Boolean;
begin
  Result := TBombaRepository.GetInstance.Salvar( FBomba );
end;

function TfrmCadastroBomba.Validar: Boolean;
begin
  TBombaRepository.GetInstance.QueryParaObjeto( cdsDados, FBomba );
  Result := TBombaRepository.GetInstance.Validar( FBomba );
end;

end.
