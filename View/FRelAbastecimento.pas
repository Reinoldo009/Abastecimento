unit FRelAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.DateUtils, RLReport;

type
  TfrmRelAbastecimento = class(TForm)
    pnlTitulo: TPanel;
    Panel3: TPanel;
    pnlImprimir: TPanel;
    pnlFechar: TPanel;
    pnlDados: TPanel;
    pnlCodigo: TPanel;
    Label3: TLabel;
    pnlLinha: TPanel;
    edtDataInicial: TDateTimePicker;
    Label1: TLabel;
    edtDataFinal: TDateTimePicker;
    dsTanques: TDataSource;
    cdsTanques: TFDMemTable;
    cdsTanquesDESCRICAO: TStringField;
    cdsTanquesID: TLargeintField;
    cdsTanquesCAPACIDADE: TFloatField;
    cdsTanquesLIMITE_BOMBAS: TIntegerField;
    cdsTanquesID_COMBUSTIVEL: TLargeintField;
    dsCombustivel: TDataSource;
    cdsCombustivel: TFDMemTable;
    cdsCombustivelDESCRICAO: TStringField;
    cdsCombustivelID: TLargeintField;
    cdsCombustivelTAXA_IMPOSTO: TFloatField;
    cdsCombustivelVALOR_UNITARIO: TFloatField;
    dsBombas: TDataSource;
    cdsBombas: TFDMemTable;
    StringField1: TStringField;
    StringField2: TStringField;
    LargeintField1: TLargeintField;
    cdsBombasID: TLargeintField;
    Panel1: TPanel;
    Panel2: TPanel;
    Label4: TLabel;
    cmbBomba: TDBLookupComboBox;
    Label2: TLabel;
    cmbTanque: TDBLookupComboBox;
    Label5: TLabel;
    cmbCombustivel: TDBLookupComboBox;
    chkAgruparPorData: TCheckBox;
    chkAgruparPorBomba: TCheckBox;
    chkAgruparPorTanque: TCheckBox;
    chkAgruparPorCombustivel: TCheckBox;
    RLReport1: TRLReport;
    rlbCabecalho: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    rlbEmpresa: TRLLabel;
    rlTitle: TRLBand;
    rlbTitle: TRLLabel;
    rlFiltro1: TRLLabel;
    rlFiltro2: TRLLabel;
    rlFiltro3: TRLLabel;
    rlGroupC: TRLGroup;
    rlGroupT: TRLGroup;
    rlGroupB: TRLGroup;
    rlGroupD: TRLGroup;
    rlDetail: TRLBand;
    rlGroupBCaption: TRLBand;
    rlGroupCCaption: TRLBand;
    rlGroupTCaption: TRLBand;
    rlGroupDCaption: TRLBand;
    RLDBText1: TRLDBText;
    cdsDados: TFDMemTable;
    dsDados: TDataSource;
    cdsDadosID: TLargeintField;
    cdsDadosDATA: TDateField;
    cdsDadosHORA: TTimeField;
    cdsDadosID_BOMBA: TLargeintField;
    cdsDadosQUANTIDADE: TFloatField;
    cdsDadosVALOR_UNITARIO: TFloatField;
    cdsDadosTAXA_IMPOSTO: TFloatField;
    cdsDadosVALOR_IMPOSTO: TFloatField;
    cdsDadosVALOR_TOTAL: TFloatField;
    cdsDadosID_TANQUE: TLargeintField;
    cdsDadosID_COMBUSTIVEL: TLargeintField;
    cdsDadosTANQUE: TStringField;
    cdsDadosBOMBA: TStringField;
    cdsDadosCOMBUSTIVEL: TStringField;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    rlColumnHeader: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLDBText10: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText13: TRLDBText;
    rlSumaryD: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLLabel13: TRLLabel;
    rlSumaryB: TRLBand;
    RLDBResult4: TRLDBResult;
    RLDBResult5: TRLDBResult;
    RLDBResult6: TRLDBResult;
    RLLabel14: TRLLabel;
    rlSumaryT: TRLBand;
    RLDBResult7: TRLDBResult;
    RLDBResult8: TRLDBResult;
    RLDBResult9: TRLDBResult;
    RLLabel15: TRLLabel;
    rlSumaryC: TRLBand;
    RLDBResult10: TRLDBResult;
    RLDBResult11: TRLDBResult;
    RLDBResult12: TRLDBResult;
    RLLabel16: TRLLabel;
    rlSumaryG: TRLBand;
    RLDBResult13: TRLDBResult;
    RLDBResult14: TRLDBResult;
    RLDBResult15: TRLDBResult;
    RLLabel17: TRLLabel;
    rlFiltro4: TRLLabel;
    procedure FormCreate(Sender: TObject);
    procedure pnlFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure pnlImprimirClick(Sender: TObject);
    procedure chkAgruparPorBombaClick(Sender: TObject);
    procedure rlGroupCCaptionAfterPrint(Sender: TObject);
    procedure rlGroupTCaptionAfterPrint(Sender: TObject);
    procedure rlGroupBCaptionAfterPrint(Sender: TObject);
    procedure rlGroupDCaptionAfterPrint(Sender: TObject);
    procedure RLLabel13BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel14BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel15BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLLabel16BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
  private
    vCombustivel, vTanque, vBomba, vDia: string;

    procedure ConfigurarCaptionFiltros;

    procedure CarregarDataSets;
    procedure InicializarFiltros;

    procedure CarregarDados;
    procedure ConfigurarAgrupamentos;
  public
  end;

var
  frmRelAbastecimento: TfrmRelAbastecimento;

implementation

uses
  Abast.Utils, win32titlestyler;

{$R *.dfm}

{ TfrmRelAbastecimento }

procedure TfrmRelAbastecimento.CarregarDados;
var
  LQuery: TFDQuery;
  LOrder: string;
begin
  LQuery := TAbastUtils.GetNewFireDACQuery;
  try
    LQuery.Close;
    LQuery.SQL.Clear;
    LQuery.SQL.Add('SELECT');
    LQuery.SQL.Add('    ABASTECIMENTO.*,');
    LQuery.SQL.Add('    TANQUE.DESCRICAO AS TANQUE,');
    LQuery.SQL.Add('    BOMBA.DESCRICAO AS BOMBA,');
    LQuery.SQL.Add('    COMBUSTIVEL.DESCRICAO AS COMBUSTIVEL');
    LQuery.SQL.Add('FROM ABASTECIMENTO');
    LQuery.SQL.Add('JOIN BOMBA ON BOMBA.ID = ABASTECIMENTO.ID_BOMBA');
    LQuery.SQL.Add('JOIN COMBUSTIVEL ON COMBUSTIVEL.ID = ABASTECIMENTO.ID_COMBUSTIVEL');
    LQuery.SQL.Add('JOIN TANQUE ON TANQUE.ID_COMBUSTIVEL = COMBUSTIVEL.ID');
    LQuery.SQL.Add('WHERE ABASTECIMENTO.DATA BETWEEN :DATAINI AND :DATAFIM');

    if cmbBomba.KeyValue <> Null  then
      LQuery.SQL.Add('  AND ABASTECIMENTO.ID_BOMBA = :ID_BOMBA');

    if cmbTanque.KeyValue <> Null  then
      LQuery.SQL.Add('  AND ABASTECIMENTO.ID_TANQUE = :ID_TANQUE');

    if cmbCombustivel.KeyValue <> Null  then
      LQuery.SQL.Add('  AND ABASTECIMENTO.ID_COMBUSTIVEL = :ID_COMBUSTIVEL');

    if chkAgruparPorCombustivel.Checked then
      LOrder := 'ABASTECIMENTO.ID_COMBUSTIVEL';

    if chkAgruparPorTanque.Checked then
    begin
      if LOrder.IsEmpty then
        LOrder := 'ABASTECIMENTO.ID_TANQUE'
      else
        LOrder := LOrder + ', ABASTECIMENTO.ID_TANQUE';
    end;

    if chkAgruparPorBomba.Checked then
    begin
      if LOrder.IsEmpty then
        LOrder := 'ABASTECIMENTO.ID_BOMBA'
      else
        LOrder := LOrder + ', ABASTECIMENTO.ID_BOMBA';
    end;

    if chkAgruparPorData.Checked then
    begin
      if LOrder.IsEmpty then
        LOrder := 'ABASTECIMENTO.DATA'
      else
        LOrder := LOrder + ', ABASTECIMENTO.DATA';
    end;

    if LOrder.IsEmpty then
      LOrder := 'ABASTECIMENTO.ID';

    LQuery.SQL.Add( 'ORDER BY ' + LOrder );
    LQuery.Prepare;

    LQuery.ParamByName('DATAINI').Value := edtDataInicial.Date;
    LQuery.ParamByName('DATAFIM').Value := edtDataFinal.Date;

    if cmbBomba.KeyValue <> Null  then
      LQuery.ParamByName('ID_BOMBA').Value := cmbBomba.KeyValue;

    if cmbTanque.KeyValue <> Null  then
      LQuery.ParamByName('ID_TANQUE').Value := cmbTanque.KeyValue;

    if cmbCombustivel.KeyValue <> Null  then
      LQuery.ParamByName('ID_COMBUSTIVEL').Value := cmbCombustivel.KeyValue;

    LQuery.Open;

    cdsDados.CloneCursor( LQuery );

    LQuery.Close;
  finally
    FreeAndNil(LQuery);
  end;
end;

procedure TfrmRelAbastecimento.CarregarDataSets;
var
  LQuery: TFDQuery;
begin
  if not cdsCombustivel.Active then
  begin
    LQuery := TAbastUtils.GetNewFireDACQuery;
    try
      LQuery.Open('SELECT * FROM COMBUSTIVEL');
      cdsCombustivel.CloneCursor(LQuery);
    finally
      FreeAndNil(LQuery);
    end;
  end;

  if not cdsBombas.Active then
  begin
    LQuery := TAbastUtils.GetNewFireDACQuery;
    try
      LQuery.Open('SELECT * FROM BOMBA');
      cdsBombas.CloneCursor(LQuery);
    finally
      FreeAndNil(LQuery);
    end;
  end;

  if not cdsTanques.Active then
  begin
    LQuery := TAbastUtils.GetNewFireDACQuery;
    try
      LQuery.Open('SELECT * FROM TANQUE');
      cdsTanques.CloneCursor(LQuery);
    finally
      FreeAndNil(LQuery);
    end;
  end;
end;

procedure TfrmRelAbastecimento.chkAgruparPorBombaClick(Sender: TObject);
begin
//  chkAgruparPorBomba.Enabled :=
//    not chkAgruparPorTanque.Checked and
//    not chkAgruparPorCombustivel.Checked;
//
//  chkAgruparPorTanque.Enabled :=
//    not chkAgruparPorBomba.Checked and
//    not chkAgruparPorCombustivel.Checked;
//
//  chkAgruparPorCombustivel.Enabled :=
//    not chkAgruparPorBomba.Checked and
//    not chkAgruparPorTanque.Checked;
end;

procedure TfrmRelAbastecimento.ConfigurarAgrupamentos;
var
  LGroupFields: string;
begin
  rlGroupD.Enabled := chkAgruparPorData.Checked;
  rlGroupB.Enabled := chkAgruparPorBomba.Checked;
  rlGroupT.Enabled := chkAgruparPorTanque.Checked;
  rlGroupC.Enabled := chkAgruparPorCombustivel.Checked;

  LGroupFields := '';

  if chkAgruparPorCombustivel.Checked then
  begin
    LGroupFields := 'ID_COMBUSTIVEL';

    rlGroupC.Enabled := True;
    rlGroupC.DataFields := LGroupFields;
  end;

  if chkAgruparPorTanque.Checked then
  begin
    if LGroupFields.IsEmpty then
      LGroupFields := 'ID_TANQUE'
    else
      LGroupFields := LGroupFields + ';ID_TANQUE';

    rlGroupT.Enabled := True;
    rlGroupT.DataFields := LGroupFields;
  end;

  if chkAgruparPorBomba.Checked then
  begin
    if LGroupFields.IsEmpty then
      LGroupFields := 'ID_BOMBA'
    else
      LGroupFields := LGroupFields + ';ID_BOMBA';

    rlGroupB.Enabled := True;
    rlGroupB.DataFields := LGroupFields;
  end;

  if chkAgruparPorData.Checked then
  begin
    if LGroupFields.IsEmpty then
      LGroupFields := 'DATA'
    else
      LGroupFields := LGroupFields + ';DATA';

    rlGroupD.Enabled := True;
    rlGroupD.DataFields := LGroupFields;
  end;

  rlSumaryB.Borders.DrawTop := not (rlGroupD.Enabled);
  rlSumaryT.Borders.DrawTop := not (rlGroupB.Enabled or rlGroupD.Enabled);
  rlSumaryC.Borders.DrawTop := not (rlGroupT.Enabled or rlGroupB.Enabled or rlGroupD.Enabled);
  rlSumaryG.Borders.DrawTop := not (rlGroupC.Enabled or rlGroupT.Enabled or rlGroupB.Enabled or rlGroupD.Enabled);
end;

procedure TfrmRelAbastecimento.ConfigurarCaptionFiltros;
begin
  rlFiltro1.Caption := 'Data de ' + DateToStr( edtDataInicial.Date ) + ' até ' + DateToStr( edtDataFinal.Date );

  if cmbBomba.KeyValue <> null then
    rlFiltro2.Caption := 'Bomba ' + cmbBomba.Text
  else
    rlFiltro2.Caption := 'Bomba: Todos';

  if cmbTanque.KeyValue <> null then
    rlFiltro3.Caption := 'Tanque: ' + cmbTanque.Text
  else
    rlFiltro3.Caption := 'Tanque: Todos';

  if cmbCombustivel.KeyValue <> null then
    rlFiltro4.Caption := 'Combustível: ' + cmbCombustivel.Text
  else
    rlFiltro4.Caption := 'Combustível: Todos';
end;

procedure TfrmRelAbastecimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmRelAbastecimento := nil;
end;

procedure TfrmRelAbastecimento.FormCreate(Sender: TObject);
begin
  CarregarDataSets;
  InicializarFiltros;
end;

procedure TfrmRelAbastecimento.FormShow(Sender: TObject);
begin
  HandleNeeded;
  ApplyFormDarkTitle(Self, True, True);
end;

procedure TfrmRelAbastecimento.InicializarFiltros;
begin
  edtDataInicial.Date := EncodeDate(YearOf(Date), MonthOf(Date), 1);
  edtDataFinal.Date := EncodeDate(YearOf(Date), MonthOf(Date), DaysInMonth(Date));
end;

procedure TfrmRelAbastecimento.pnlFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelAbastecimento.pnlImprimirClick(Sender: TObject);
begin
  ConfigurarCaptionFiltros;
  CarregarDados;
  ConfigurarAgrupamentos;
  RLReport1.Preview();
end;

procedure TfrmRelAbastecimento.rlGroupBCaptionAfterPrint(Sender: TObject);
begin
  vBomba := cdsDados.FieldByName('BOMBA').AsString;
end;

procedure TfrmRelAbastecimento.rlGroupCCaptionAfterPrint(Sender: TObject);
begin
  vCombustivel := cdsDados.FieldByName('COMBUSTIVEL').AsString;
end;

procedure TfrmRelAbastecimento.rlGroupDCaptionAfterPrint(Sender: TObject);
begin
  vDia := DateToStr(cdsDados.FieldByName('DATA').AsDateTime);
end;

procedure TfrmRelAbastecimento.rlGroupTCaptionAfterPrint(Sender: TObject);
begin
  vTanque := cdsDados.FieldByName('TANQUE').AsString;
end;

procedure TfrmRelAbastecimento.RLLabel13BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := 'Total do Dia: ' + vDia;
end;

procedure TfrmRelAbastecimento.RLLabel14BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := 'Total da Bomba: ' + vBomba;
end;

procedure TfrmRelAbastecimento.RLLabel15BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := 'Total do Tanque: ' + vTanque;
end;

procedure TfrmRelAbastecimento.RLLabel16BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  AText := 'Total do Combustível: ' + vCombustivel;
end;

end.


