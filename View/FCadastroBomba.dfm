inherited frmCadastroBomba: TfrmCadastroBomba
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitulo: TPanel
    Caption = 'Cadastro de Bomba'
  end
  inherited Panel3: TPanel
    inherited pnlIncluir: TPanel
      OnClick = nil
    end
  end
  inherited pnlDados: TPanel
    object Label4: TLabel
      Left = 72
      Top = 56
      Width = 55
      Height = 13
      Caption = 'Descri'#231'ao'
      FocusControl = edtDescricao
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4473924
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 72
      Top = 99
      Width = 103
      Height = 13
      Caption = 'N'#250'mero da Bomba'
      FocusControl = edtNumeroBomba
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4473924
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
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
    object pnlCodigo: TPanel
      Left = 0
      Top = 0
      Width = 842
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
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
        Left = 72
        Top = 20
        Width = 134
        Height = 21
        DataField = 'ID'
        DataSource = dsDados
        TabOrder = 1
      end
    end
    object edtDescricao: TDBEdit
      Left = 72
      Top = 72
      Width = 500
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = dsDados
      TabOrder = 1
    end
    object edtNumeroBomba: TDBEdit
      Left = 72
      Top = 115
      Width = 134
      Height = 21
      DataField = 'NUMERO_BOMBA'
      DataSource = dsDados
      TabOrder = 2
      OnKeyPress = edtNumeroBombaKeyPress
    end
    object cmbTanque: TDBLookupComboBox
      Left = 72
      Top = 158
      Width = 500
      Height = 21
      DataField = 'ID_TANQUE'
      DataSource = dsDados
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListFieldIndex = 1
      ListSource = dsTanques
      TabOrder = 3
    end
  end
  object dsTanques: TDataSource
    DataSet = cdsTanques
    Left = 408
    Top = 264
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
    Left = 513
    Top = 361
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
    Left = 721
    Top = 297
    object cdsDadosID: TIntegerField
      FieldName = 'ID'
    end
    object cdsDadosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 255
    end
    object cdsDadosNUMERO_BOMBA: TStringField
      FieldName = 'NUMERO_BOMBA'
      Size = 10
    end
    object cdsDadosID_TANQUE: TLargeintField
      FieldName = 'ID_TANQUE'
    end
  end
end
