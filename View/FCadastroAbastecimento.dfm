inherited frmCadastroAbastecimento: TfrmCadastroAbastecimento
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitulo: TPanel
    Caption = 'Cadastro de Abastecimentos'
  end
  inherited Panel3: TPanel
    ExplicitLeft = -4
  end
  inherited pnlDados: TPanel
    ExplicitLeft = 6
    object Label1: TLabel
      Left = 72
      Top = 142
      Width = 42
      Height = 13
      Caption = 'Tanque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4473924
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 72
      Top = 185
      Width = 70
      Height = 13
      Caption = 'Combust'#237'vel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4473924
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 72
      Top = 99
      Width = 39
      Height = 13
      Caption = 'Bomba'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4473924
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 72
      Top = 56
      Width = 27
      Height = 13
      Caption = 'Data'
      FocusControl = edtData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4473924
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 439
      Top = 56
      Width = 27
      Height = 13
      Caption = 'Hora'
      FocusControl = edtHora
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4473924
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 72
      Top = 228
      Width = 65
      Height = 13
      Caption = 'Quantidade'
      FocusControl = edtQuantidade
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4473924
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 254
      Top = 228
      Width = 77
      Height = 13
      Caption = 'Valor Unit'#225'rio'
      FocusControl = edtValorUnitario
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4473924
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 439
      Top = 228
      Width = 61
      Height = 13
      Caption = 'Valor Total'
      FocusControl = edtValorTotal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4473924
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 72
      Top = 271
      Width = 79
      Height = 13
      Caption = 'Taxa Imposto'
      FocusControl = edtTaxaImposto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4473924
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 439
      Top = 274
      Width = 80
      Height = 13
      Caption = 'Valor Imposto'
      FocusControl = edtValorImposto
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4473924
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlCodigo: TPanel
      Left = 0
      Top = 0
      Width = 842
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitTop = 8
      object Label3: TLabel
        Left = 72
        Top = 4
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = edtCodigo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4473924
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnlLinha: TPanel
        AlignWithMargins = True
        Left = 5
        Top = 49
        Width = 832
        Height = 1
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alBottom
        BevelOuter = bvNone
        Color = 4473924
        ParentBackground = False
        TabOrder = 0
      end
      object edtCodigo: TDBEdit
        Left = 73
        Top = 20
        Width = 134
        Height = 21
        DataField = 'ID'
        DataSource = dsDados
        TabOrder = 1
      end
    end
    object cmbTanque: TDBLookupComboBox
      Left = 73
      Top = 158
      Width = 500
      Height = 21
      DataField = 'ID_TANQUE'
      DataSource = dsDados
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListFieldIndex = 1
      ListSource = dsTanques
      TabOrder = 1
    end
    object cmbCombustivel: TDBLookupComboBox
      Left = 73
      Top = 201
      Width = 500
      Height = 21
      DataField = 'ID_COMBUSTIVEL'
      DataSource = dsDados
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListFieldIndex = 1
      ListSource = dsCombustivel
      TabOrder = 2
    end
    object cmbBomba: TDBLookupComboBox
      Left = 73
      Top = 115
      Width = 500
      Height = 21
      DataField = 'ID_BOMBA'
      DataSource = dsDados
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListFieldIndex = 1
      ListSource = dsBombas
      TabOrder = 3
      OnClick = cmbBombaClick
    end
    object edtData: TDBEdit
      Left = 73
      Top = 72
      Width = 134
      Height = 21
      DataField = 'DATA'
      DataSource = dsDados
      TabOrder = 4
    end
    object edtHora: TDBEdit
      Left = 439
      Top = 72
      Width = 134
      Height = 21
      DataField = 'HORA'
      DataSource = dsDados
      TabOrder = 5
    end
    object edtQuantidade: TDBEdit
      Left = 72
      Top = 247
      Width = 134
      Height = 21
      DataField = 'QUANTIDADE'
      DataSource = dsDados
      TabOrder = 6
      OnChange = edtQuantidadeChange
      OnKeyDown = edtQuantidadeKeyDown
      OnKeyPress = edtQuantidadeKeyPress
    end
    object edtValorUnitario: TDBEdit
      Left = 255
      Top = 244
      Width = 134
      Height = 21
      DataField = 'VALOR_UNITARIO'
      DataSource = dsDados
      TabOrder = 7
    end
    object edtValorTotal: TDBEdit
      Left = 439
      Top = 244
      Width = 134
      Height = 21
      DataField = 'VALOR_TOTAL'
      DataSource = dsDados
      TabOrder = 8
    end
    object edtTaxaImposto: TDBEdit
      Left = 72
      Top = 290
      Width = 134
      Height = 21
      DataField = 'TAXA_IMPOSTO'
      DataSource = dsDados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4535772
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object edtValorImposto: TDBEdit
      Left = 439
      Top = 290
      Width = 134
      Height = 21
      DataField = 'VALOR_IMPOSTO'
      DataSource = dsDados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4535772
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
  end
  object dsTanques: TDataSource
    DataSet = cdsTanques
    Left = 488
    Top = 176
  end
  object dsDados: TDataSource
    DataSet = cdsDados
    Left = 336
    Top = 344
  end
  object cdsTanques: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 489
    Top = 233
    object cdsTanquesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
    object cdsTanquesID: TLargeintField
      FieldName = 'ID'
    end
    object cdsTanquesCAPACIDADE: TFloatField
      FieldName = 'CAPACIDADE'
    end
    object cdsTanquesLIMITE_BOMBAS: TIntegerField
      FieldName = 'LIMITE_BOMBAS'
    end
    object cdsTanquesID_COMBUSTIVEL: TLargeintField
      FieldName = 'ID_COMBUSTIVEL'
    end
  end
  object cdsDados: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 337
    Top = 401
    object cdsDadosID: TIntegerField
      FieldName = 'ID'
    end
    object cdsDadosDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsDadosHORA: TTimeField
      FieldName = 'HORA'
    end
    object cdsDadosID_BOMBA: TLargeintField
      FieldName = 'ID_BOMBA'
    end
    object cdsDadosID_TANQUE: TLargeintField
      FieldName = 'ID_TANQUE'
    end
    object cdsDadosQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object cdsDadosVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object cdsDadosVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object cdsDadosTAXA_IMPOSTO: TFloatField
      FieldName = 'TAXA_IMPOSTO'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object cdsDadosVALOR_IMPOSTO: TFloatField
      FieldName = 'VALOR_IMPOSTO'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object cdsDadosID_COMBUSTIVEL: TLargeintField
      FieldName = 'ID_COMBUSTIVEL'
    end
  end
  object cdsCombustivel: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 497
    Top = 361
    object cdsCombustivelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
    object cdsCombustivelID: TLargeintField
      FieldName = 'ID'
    end
    object cdsCombustivelTAXA_IMPOSTO: TFloatField
      FieldName = 'TAXA_IMPOSTO'
    end
    object cdsCombustivelVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
    end
  end
  object dsCombustivel: TDataSource
    DataSet = cdsCombustivel
    Left = 496
    Top = 320
  end
  object dsBombas: TDataSource
    DataSet = cdsBombas
    Left = 704
    Top = 248
  end
  object cdsBombas: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 705
    Top = 305
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
    object StringField2: TStringField
      FieldName = 'NUMERO_BOMBA'
      Size = 10
    end
    object LargeintField1: TLargeintField
      FieldName = 'ID_TANQUE'
    end
    object cdsBombasID: TLargeintField
      FieldName = 'ID'
    end
  end
end
