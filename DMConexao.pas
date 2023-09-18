unit DMConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.UI,
  Data.DB, FireDAC.Moni.Base, FireDAC.Moni.Custom;

type
  TfrmDMConexao = class(TDataModule)
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDTransaction1: TFDTransaction;
    FDMoniCustomClientLink1: TFDMoniCustomClientLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure FDMoniCustomClientLink1Output(ASender: TFDMoniClientLinkBase;
      const AClassName, AObjName, AMessage: string);
  private
  public
  end;

  var
    vConexaoSistema: TFDConnection;
    vTransacaoSistema: TFDTransaction;

var
  frmDMConexao: TfrmDMConexao;

implementation

uses
  Abast.Msgs, Abast.CutomLog;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
procedure TfrmDMConexao.DataModuleCreate(Sender: TObject);
begin
  FDConnection1.Open;
  vConexaoSistema := FDConnection1;
  vTransacaoSistema := FDTransaction1;
end;

procedure TfrmDMConexao.FDMoniCustomClientLink1Output(
  ASender: TFDMoniClientLinkBase; const AClassName, AObjName, AMessage: string);
begin
  TAbastCutomLog.Log( AClassName + '- ' + AObjName + '- ' + AMessage );
end;

end.
