inherited frmCadastroCombustivel: TfrmCadastroCombustivel
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitulo: TPanel
    Caption = 'Cadastro de Combut'#237'vel'
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
    object Label6: TLabel
      Left = 438
      Top = 99
      Width = 96
      Height = 13
      Caption = 'Taxa de Imposto'
      FocusControl = edtTaxaImposto
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
    object edtValorUnitario: TDBEdit
      Left = 72
      Top = 115
      Width = 134
      Height = 21
      DataField = 'VALOR_UNITARIO'
      DataSource = dsDados
      TabOrder = 2
      OnKeyPress = edtValorUnitarioKeyPress
    end
    object edtTaxaImposto: TDBEdit
      Left = 438
      Top = 115
      Width = 134
      Height = 21
      DataField = 'TAXA_IMPOSTO'
      DataSource = dsDados
      TabOrder = 3
      OnKeyPress = edtValorUnitarioKeyPress
    end
  end
  object dsDados: TDataSource
    DataSet = cdsDados
    Left = 336
    Top = 344
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
    object cdsDadosVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
    object cdsDadosTAXA_IMPOSTO: TFloatField
      FieldName = 'TAXA_IMPOSTO'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
    end
  end
end
