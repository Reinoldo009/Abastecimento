unit DMConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.UI,
  Data.DB, FireDAC.Moni.Base, FireDAC.Moni.Custom, IniFiles, Vcl.Forms;

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
var
  LIniFile: TIniFile;
begin
  {Verifica os parametros de conexão}
  try
    if not FileExists(ChangeFileExt(Application.ExeName, '.cfg')) then
    begin
      LIniFile := TIniFile.Create(ChangeFileExt(Application.ExeName, '.cfg'));

      LIniFile.WriteString('Config', 'Host', '127.0.0.1');
      LIniFile.WriteInteger('Config', 'Port', 3050);
      LIniFile.WriteString('Config', 'User', 'sysdba');
      LIniFile.WriteString('Config', 'Password', 'masterkey');
      LIniFile.WriteString('Config', 'database', ExtractFilePath(Application.ExeName) + 'banco.fdb');

      msgInfo('Devido a primeira inicialização do sistema é ' +
        'necessário configurar o arquivo de conxão com o banco de dados' +
        sLineBreak + ChangeFileExt(Application.ExeName, '.cfg'));

      Halt(0);
    end
    else
    begin
      LIniFile := TIniFile.Create(ChangeFileExt(Application.ExeName, '.cfg'));

      if not Assigned(LIniFile) then
        raise Exception.Create('Não foi possível ler as configurações de conexão com o sistema');

      FDConnection1.Params.DriverID := 'FB';
      FDConnection1.Params.Values['Protocol'] := 'ipTCPIP';
      FDConnection1.Params.Values['DropDatabase'] := 'False';
      FDConnection1.Params.Values['PageSize'] := '16384';
      FDConnection1.Params.Values['SqlDialect'] := '3';
      FDConnection1.Params.Values['Port']     := LIniFile.ReadInteger('Config', 'Port', 3050).ToString;
      FDConnection1.Params.Values['Server']   := LIniFile.ReadString('Config', 'Host', '127.0.0.1');

      FDConnection1.Params.UserName := LIniFile.ReadString('Config', 'User', 'sysdba');
      FDConnection1.Params.Password := LIniFile.ReadString('Config', 'Password', 'masterkey');
      FDConnection1.Params.Database := LIniFile.ReadString('Config', 'Database', '');
      FDConnection1.LoginPrompt := False;

      try
        FDConnection1.Open;
        vConexaoSistema := FDConnection1;
        vTransacaoSistema := FDTransaction1;
      except
        on e: Exception do
        begin
          msgAlert(e.Message);
          halt;
        end;
      end;
    end;
  finally
    FreeAndNil(LIniFile);
  end;
end;

procedure TfrmDMConexao.FDMoniCustomClientLink1Output(
  ASender: TFDMoniClientLinkBase; const AClassName, AObjName, AMessage: string);
begin
  TAbastCutomLog.Log( AClassName + '- ' + AObjName + '- ' + AMessage );
end;

end.
