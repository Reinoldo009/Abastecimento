unit FBaseCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Abast.Types, Vcl.ExtCtrls, uModelFormCrud;

type
  TfrmBaseCadastro = class(TForm)
    pnlTitulo: TPanel;
    Panel3: TPanel;
    pnlIncluir: TPanel;
    pnlSalvar: TPanel;
    pnlFechar: TPanel;
    pnlDados: TPanel;
    procedure pnlIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlEditarClick(Sender: TObject);
    procedure pnlFecharClick(Sender: TObject);
    procedure pnlSalvarClick(Sender: TObject);
    procedure pnlMouseEnter(Sender: TObject);
    procedure pnlIMouseLeave(Sender: TObject);
  private
    FId: Integer;
    FAbastFormState: TAbastFormState;
    procedure SetAbastFormState(const Value: TAbastFormState);
    function GetHoverColor(APanel: TPanel): TColor;
    function GetNormalColor(APanel: TPanel): TColor;
  protected
    function Validar: Boolean; virtual;  abstract;
    function Salvar: Boolean; virtual; abstract;
    procedure Apagar; virtual; abstract;
    procedure Carregar; virtual; abstract;
    procedure HabilitarDesabilitarCampos; virtual; abstract;
  public
    property Id: Integer read FId write FId;
    property AbastFormState: TAbastFormState read FAbastFormState write SetAbastFormState;
    procedure InicializarObjeto; virtual; abstract;
    procedure CarregarFormulario;
  end;

var
  frmBaseCadastro: TfrmBaseCadastro;

implementation

uses
  win32titlestyler;


{$R *.dfm}

procedure TfrmBaseCadastro.CarregarFormulario;
begin
  AbastFormState := fsAView;

  Carregar;

  if FId = 0 then
    AbastFormState := fsAInsert
  else
    AbastFormState := fsAEdit;
end;

procedure TfrmBaseCadastro.FormShow(Sender: TObject);
begin
  HandleNeeded;
  ApplyFormDarkTitle(Self, True, True);
end;

procedure TfrmBaseCadastro.pnlEditarClick(Sender: TObject);
begin
  Carregar;

  if FId = 0 then
    AbastFormState := fsAInsert
  else
    AbastFormState := fsAEdit;
end;

procedure TfrmBaseCadastro.pnlFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBaseCadastro.pnlIncluirClick(Sender: TObject);
begin
  FId := 0;
  Carregar;

  AbastFormState := fsAInsert;
end;

procedure TfrmBaseCadastro.pnlMouseEnter(Sender: TObject);
var
  LPanel: TPanel;
begin
  if not (Sender is TPanel) then
    Exit;

  LPanel := (Sender as TPanel);
  LPanel.Color := GetHoverColor( LPanel );
end;

procedure TfrmBaseCadastro.pnlIMouseLeave(Sender: TObject);
var
  LPanel: TPanel;
begin
  if not (Sender is TPanel) then
    Exit;

  LPanel := (Sender as TPanel);
  LPanel.Color := GetNormalColor( LPanel );
end;

procedure TfrmBaseCadastro.pnlSalvarClick(Sender: TObject);
begin
  if AbastFormState in [fsAInsert, fsAEdit] then
    if Validar then
    begin
      if Salvar then
        Close;
    end;
end;

function TfrmBaseCadastro.GetHoverColor(APanel: TPanel): TColor;
begin
  if APanel = pnlIncluir then
    Result := $0067D347

  else if APanel = pnlSalvar then
    Result := $00E3CB75

  else if APanel = pnlFechar then
    Result := $00FFAC46

  else
    Result := clWhite;
end;


function TfrmBaseCadastro.GetNormalColor(APanel: TPanel): TColor;
begin

  if APanel = pnlIncluir then
    Result := $0045A728

  else if APanel = pnlSalvar then
    Result := $00C5A227

  else if APanel = pnlFechar then
    Result := clHighlight

  else
    Result := clWhite;
end;

procedure TfrmBaseCadastro.SetAbastFormState(const Value: TAbastFormState);
begin
  FAbastFormState := Value;

  pnlSalvar.Enabled := AbastFormState in [fsAInsert, fsAEdit];
  pnlSalvar.Enabled := True;

  HabilitarDesabilitarCampos;
end;

end.
