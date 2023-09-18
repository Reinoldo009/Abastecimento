unit FPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus,
  Vcl.ExtCtrls, acPNG, System.ImageList, Vcl.ImgList;

type
  TfrmPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    MainMenu1: TMainMenu;
    C1: TMenuItem;
    mniConfiguracoes: TMenuItem;
    S1: TMenuItem;
    Cadastros1: TMenuItem;
    Movimentaes1: TMenuItem;
    Relatrios1: TMenuItem;
    Sobre1: TMenuItem;
    Image1: TImage;
    imglMenu: TImageList;
    mniCombustiveis: TMenuItem;
    mniBombas: TMenuItem;
    mniTanques: TMenuItem;
    mniAbastecimentos: TMenuItem;
    mniRelatorioDeAbastecimentos: TMenuItem;
    mniSobre: TMenuItem;
    N1: TMenuItem;
    btnConfiguracoes: TToolButton;
    btnCombustiveis: TToolButton;
    btnTanques: TToolButton;
    btnBombas: TToolButton;
    btnAbastecimentos: TToolButton;
    btnRelatorioDeAbastecimentos: TToolButton;
    ToolButton8: TToolButton;
    ToolButton1: TToolButton;
    btnSobre: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure mniCombustiveisClick(Sender: TObject);
    procedure mniTanquesClick(Sender: TObject);
    procedure mniBombasClick(Sender: TObject);
    procedure mniAbastecimentosClick(Sender: TObject);
    procedure mniRelatorioDeAbastecimentosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Abast.Utils.Forms, win32titlestyler;

{$R *.dfm}

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  HandleNeeded;
  ApplyFormDarkTitle(Self, True, True);
end;

procedure TfrmPrincipal.mniAbastecimentosClick(Sender: TObject);
begin
  TAbastUtilsForms.ShowConsultaAbastecimento;
end;

procedure TfrmPrincipal.mniBombasClick(Sender: TObject);
begin
  TAbastUtilsForms.ShowConsultaBomba;
end;

procedure TfrmPrincipal.mniCombustiveisClick(Sender: TObject);
begin
  TAbastUtilsForms.ShowConsultaCombustivel;
end;

procedure TfrmPrincipal.mniRelatorioDeAbastecimentosClick(Sender: TObject);
begin
  TAbastUtilsForms.ShowRelatorioAbastecimento;
end;

procedure TfrmPrincipal.mniTanquesClick(Sender: TObject);
begin
  TAbastUtilsForms.ShowConsultaTanque;
end;

procedure TfrmPrincipal.S1Click(Sender: TObject);
begin
  Close;
end;

end.
