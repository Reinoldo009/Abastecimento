unit FConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Abast.Types, System.Math,
  System.UITypes;

type
  TfrmConsulta = class(TForm)
    Panel3: TPanel;
    pnlIncluir: TPanel;
    pnlEditar: TPanel;
    pnlExcluir: TPanel;
    pnlFechar: TPanel;
    dbgConsulta: TDBGrid;
    dsConsulta: TDataSource;
    cdsConsulta: TFDMemTable;
    pnlTitulo: TPanel;
    tmrConfiguracaoGrid: TTimer;
    procedure btnFecharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dbgConsultaTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnlMouseEnter(Sender: TObject);
    procedure pnlMouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmrConfiguracaoGridTimer(Sender: TObject);
    procedure dbgConsultaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    FOnEditar: TAbastIntegerProc;
    FOnExcluir: TAbastIntegerFunc;
    FOnIncluir: TAbastIntegerProc;

    FSql: string;

    function GetHoverColor(APanel: TPanel): TColor;
    function GetNormalColor(APanel: TPanel): TColor;

    procedure OrdenarDados( AField: TField );
    function GetIndexName( AField: TField; AAsc: Boolean ): string;

    procedure GravarColunaIndice( AField: TField );

    procedure ConfigurarCorColunaIndice( AField: TField );

    function LerColunaIndice: string;

    procedure CarregarConfiguracaoColunasGrid;
    procedure SalvarConfiguracoesColunasGrid;
  public
    property OnEditar: TAbastIntegerProc read FOnEditar write FOnEditar;
    property OnIncluir: TAbastIntegerProc read FOnIncluir write FOnIncluir;
    property OnExcluir: TAbastIntegerFunc read FOnExcluir write FOnExcluir;

    procedure ConfigurarFormulario(ATabela, ATitulo: string);
    procedure CarregarDados( ASql: string );
  end;

implementation

uses
  Abast.Utils, win32titlestyler, Abast.Utils.Strings, Abast.Utils.Registro, Abast.Msgs;

{$R *.dfm}

procedure TfrmConsulta.btnEditarClick(Sender: TObject);
begin
  if Assigned(FOnEditar) then
  begin
    FOnEditar( cdsConsulta.FieldByName('ID').AsInteger );
    CarregarDados( FSql );
  end;
end;

procedure TfrmConsulta.btnExcluirClick(Sender: TObject);
begin
  if Assigned(FOnExcluir) then
  begin
    if cdsConsulta.FieldByName('ID').AsInteger <> 0 then
      if msgConfirm('Deseja realmente excluir o registro?') then
        if FOnExcluir( cdsConsulta.FieldByName('ID').AsInteger ) then
          CarregarDados( FSql );
  end;
end;

procedure TfrmConsulta.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmConsulta.btnIncluirClick(Sender: TObject);
begin
  if Assigned(FOnIncluir) then
  begin
    FOnIncluir( 0 );
    CarregarDados( FSql );
  end;
end;

procedure TfrmConsulta.CarregarDados(ASql: string);
var
  LQuery: TFDQuery;
  LRecNo: Integer;
  LField: TField;
begin
  LQuery := TAbastUtils.GetNewFireDACQuery;
  try
    if FSql.IsEmpty then
    begin
      FSql := ASql;
      LRecNo := 1;
    end
    else
      LRecNo := cdsConsulta.RecNo;

    LQuery.Open(FSql);

    if LQuery.FindField('ID') = nil then
      raise Exception.Create('Coluna ID não localizada verifique o método GetSqlConsulta do repositório');

    if cdsConsulta.Active then
    begin
      cdsConsulta.DisableControls;
      cdsConsulta.Close;
    end;

    cdsConsulta.CloneCursor( LQuery );

    if (LerColunaIndice <> '') and (cdsConsulta.IndexName = '') then
    begin
      for LField in cdsConsulta.Fields do
        if LField.FieldName.Equals(LerColunaIndice) then
        begin
          OrdenarDados( LField );
          Break
        end;
    end;

    if InRange( LRecNo, 1, cdsConsulta.RecordCount ) then
      cdsConsulta.RecNo := LRecNo
    else
      cdsConsulta.Last;

    if cdsConsulta.ControlsDisabled then
      cdsConsulta.EnableControls;

    CarregarConfiguracaoColunasGrid;
  finally
    FreeAndNil( LQuery );
  end;
end;

procedure TfrmConsulta.CarregarConfiguracaoColunasGrid;
var
  LIndex: Integer;
  LTamanho: Integer;
  LColumn: TColumn;
begin
  for LIndex := 0 to Pred(dbgConsulta.Columns.Count) do
  begin
    LColumn := dbgConsulta.Columns.Items[LIndex];
    LColumn.Visible := not LColumn.FieldName.ToUpper.Equals('ID');
    LTamanho := TRegistroUtils.LerRegistroInteiro( Self.Name + '_' + LColumn.FieldName );

    if LTamanho <> 0 then
      LColumn.Width := LTamanho;

    LColumn.Title.Alignment := taCenter;

    if cdsConsulta.FieldByName(LColumn.FieldName).DataType in [ftBCD, ftFloat, ftCurrency, ftExtended] then
      TNumericField(cdsConsulta.FieldByName(LColumn.FieldName)).DisplayFormat := '0.00';
  end;
end;

procedure TfrmConsulta.ConfigurarCorColunaIndice(AField: TField);
var
  LIndex: Integer;
  LColumn: TColumn;
begin
  for LIndex := 0 to Pred(dbgConsulta.Columns.Count) do
  begin
    LColumn := dbgConsulta.Columns.Items[LIndex];

    LColumn.Title.Font.Color := clBlack;
    LColumn.Title.Font.Style := [];
  end;

  for LIndex := 0 to Pred(dbgConsulta.Columns.Count) do
  begin
    LColumn := dbgConsulta.Columns.Items[LIndex];

    if LColumn.Field = AField then
    begin
      LColumn.Title.Font.Color := clHighlight;
      LColumn.Title.Font.Style := LColumn.Title.Font.Style + [fsBold];
      Break;
    end;
  end;
end;

procedure TfrmConsulta.ConfigurarFormulario(ATabela, ATitulo: string);
begin
  Self.Name := 'frmConsulta_' + ATabela;
  Self.Caption := ATitulo;
  pnlTitulo.Caption := ATitulo;
end;

procedure TfrmConsulta.dbgConsultaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  LRow: Integer;
begin
  LRow := dbgConsulta.DataSource.DataSet.RecNo;

  if not (gdSelected in State) then
  begin
    if Odd(LRow) then
      dbgConsulta.Canvas.Brush.Color := clWhite
    else
      dbgConsulta.Canvas.Brush.Color := $00FAEDE2;

    dbgConsulta.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;

procedure TfrmConsulta.dbgConsultaTitleClick(Column: TColumn);
begin
  dbgConsulta.OnTitleClick := nil;
  OrdenarDados( Column.Field );
  dbgConsulta.OnTitleClick := dbgConsultaTitleClick;
end;

procedure TfrmConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvarConfiguracoesColunasGrid;
  Action := caFree;
end;

procedure TfrmConsulta.FormShow(Sender: TObject);
begin
  HandleNeeded;
  ApplyFormDarkTitle(Self, True, True);
end;

function TfrmConsulta.GetHoverColor(APanel: TPanel): TColor;
begin
  if APanel = pnlIncluir then
    Result := $0067D347

  else if APanel = pnlEditar then
    Result := $0060B4F2

  else if APanel = pnlExcluir then
    Result := $007A6FE6

  else if APanel = pnlFechar then
    Result := $00FFAC46

  else
    Result := clWhite;
end;

function TfrmConsulta.GetIndexName(AField: TField; AAsc: Boolean): string;
begin
  if AAsc then
    Result := 'IDX_' + TAbastUtilsStrings.RemoverAcentos(AField.FieldName) + '_ASC'
  else
    Result := 'IDX_' + TAbastUtilsStrings.RemoverAcentos(AField.FieldName) + '_DESC';

  Result := Result.Replace(' ', '');
end;

function TfrmConsulta.GetNormalColor(APanel: TPanel): TColor;
begin
  if APanel = pnlIncluir then
    Result := $0045A728

  else if APanel = pnlEditar then
    Result := $00138FEC

  else if APanel = pnlExcluir then
    Result := $004535DC

  else if APanel = pnlFechar then
    Result := clHighlight

  else
    Result := clWhite;
end;

procedure TfrmConsulta.GravarColunaIndice(AField: TField);
begin
  TRegistroUtils.GravarRegistroTexto( Self.Name + '_INDICE', AField.FieldName );
end;

function TfrmConsulta.LerColunaIndice: string;
begin
  Result := TRegistroUtils.LerRegistroTexto( Self.Name + '_INDICE' );
end;

procedure TfrmConsulta.OrdenarDados( AField: TField );
var
  LIndexName: string;
  LFDIndex: TFDIndex;
  LAsc: Boolean;
begin
  LAsc := True;
  LIndexName := GetIndexName( AField, LAsc );

  if cdsConsulta.IndexName.Equals(LIndexName) then
  begin
    LAsc := False;
    LIndexName := GetIndexName( AField, LAsc );
  end;

  if cdsConsulta.Indexes.FindIndex( LIndexName ) = nil then
  begin
    LFDIndex := cdsConsulta.Indexes.Add;
    LFDIndex.Name := LIndexName;
    LFDIndex.Fields := AField.FieldName;

    if not LAsc then
      LFDIndex.DescFields := AField.FieldName;

    LFDIndex.Active := True;
  end;

  cdsConsulta.IndexName := LIndexName;

  GravarColunaIndice( AField );

  ConfigurarCorColunaIndice( AField );
end;

procedure TfrmConsulta.pnlMouseLeave(Sender: TObject);
var
  LPanel: TPanel;
begin
  if not (Sender is TPanel) then
    Exit;

  LPanel := (Sender as TPanel);
  LPanel.Color := GetNormalColor( LPanel );
end;

procedure TfrmConsulta.SalvarConfiguracoesColunasGrid;
var
  LIndex: Integer;
  LColumn: TColumn;
begin
  for LIndex := 0 to Pred(dbgConsulta.Columns.Count) do
  begin
    LColumn := dbgConsulta.Columns.Items[LIndex];

    if LColumn.Visible then
      TRegistroUtils.GravarRegistroInteiro( Self.Name + '_' + LColumn.FieldName, LColumn.Width );
  end;
end;

procedure TfrmConsulta.tmrConfiguracaoGridTimer(Sender: TObject);
begin
  if Self.Active and Self.Visible then
    SalvarConfiguracoesColunasGrid;
end;

procedure TfrmConsulta.pnlMouseEnter(Sender: TObject);
var
  LPanel: TPanel;
begin
  if not (Sender is TPanel) then
    Exit;

  LPanel := (Sender as TPanel);
  LPanel.Color := GetHoverColor( LPanel );
end;

end.
