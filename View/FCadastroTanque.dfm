inherited frmCadastroTanque: TfrmCadastroTanque
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitulo: TPanel
    Caption = 'Cadastro de Tanque'
  end
  inherited Panel3: TPanel
    inherited pnlIncluir: TPanel
      OnClick = nil
    end
  end
  inherited pnlDados: TPanel
    object Label1: TLabel
      Left = 72
      Top = 142
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
      Width = 65
      Height = 13
      Caption = 'Capacidade'
      FocusControl = edtCapacidade
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4473924
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 438
      Top = 99
      Width = 100
      Height = 13
      Caption = 'Limite de Bombas'
      FocusControl = edtLimiteBombas
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
    object edtCapacidade: TDBEdit
      Left = 72
      Top = 115
      Width = 134
      Height = 21
      DataField = 'CAPACIDADE'
      DataSource = dsDados
      TabOrder = 2
    end
    object edtLimiteBombas: TDBEdit
      Left = 438
      Top = 115
      Width = 134
      Height = 21
      DataField = 'LIMITE_BOMBAS'
      DataSource = dsDados
      TabOrder = 3
    end
    object cmbCombustivel: TDBLookupComboBox
      Left = 73
      Top = 158
      Width = 500
      Height = 21
      DataField = 'ID_COMBUSTIVEL'
      DataSource = dsDados
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListFieldIndex = 1
      ListSource = dsCombustivel
      TabOrder = 4
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
    Left = 513
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
    Left = 408
    Top = 264
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
    object cdsDadosCAPACIDADE: TFloatField
      FieldName = 'CAPACIDADE'
    end
    object cdsDadosLIMITE_BOMBAS: TIntegerField
      FieldName = 'LIMITE_BOMBAS'
    end
    object cdsDadosID_COMBUSTIVEL: TIntegerField
      FieldName = 'ID_COMBUSTIVEL'
    end
  end
  object dsDados: TDataSource
    DataSet = cdsDados
    Left = 336
    Top = 344
  end
end
