object frmRelAbastecimento: TfrmRelAbastecimento
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 521
  ClientWidth = 844
  Color = 4473924
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 844
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Relat'#243'rio de Abastecimentos'
    Color = 4473924
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 1
    Top = 32
    Width = 842
    Height = 32
    Margins.Left = 1
    Margins.Top = 0
    Margins.Right = 1
    Margins.Bottom = 0
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = -4
    object pnlImprimir: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 85
      Height = 26
      Cursor = crHandPoint
      Margins.Right = 0
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Imprimir'
      Color = 4564776
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = pnlImprimirClick
    end
    object pnlFechar: TPanel
      AlignWithMargins = True
      Left = 91
      Top = 3
      Width = 85
      Height = 26
      Cursor = crHandPoint
      Margins.Right = 0
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Fechar'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = pnlFecharClick
      ExplicitLeft = 179
    end
  end
  object pnlDados: TPanel
    AlignWithMargins = True
    Left = 1
    Top = 65
    Width = 842
    Height = 455
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    ExplicitLeft = 6
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
        Left = 73
        Top = 2
        Width = 64
        Height = 13
        Caption = 'Data Inicial'
        FocusControl = edtDataInicial
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4473924
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 445
        Top = 4
        Width = 56
        Height = 13
        Caption = 'Data Final'
        FocusControl = edtDataFinal
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
        TabOrder = 2
      end
      object edtDataInicial: TDateTimePicker
        Left = 73
        Top = 20
        Width = 128
        Height = 21
        Date = 45187.535465381950000000
        Time = 45187.535465381950000000
        TabOrder = 0
      end
      object edtDataFinal: TDateTimePicker
        Left = 445
        Top = 20
        Width = 128
        Height = 21
        Date = 45187.535465381950000000
        Time = 45187.535465381950000000
        TabOrder = 1
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 50
      Width = 842
      Height = 150
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label4: TLabel
        Left = 72
        Top = 8
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
      object Label2: TLabel
        Left = 72
        Top = 51
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
      object Label5: TLabel
        Left = 72
        Top = 94
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
      object Panel2: TPanel
        AlignWithMargins = True
        Left = 5
        Top = 149
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
        TabOrder = 3
        ExplicitTop = 49
      end
      object cmbBomba: TDBLookupComboBox
        Left = 73
        Top = 24
        Width = 500
        Height = 21
        DataField = 'ID_BOMBA'
        KeyField = 'ID'
        ListField = 'DESCRICAO'
        ListFieldIndex = 1
        ListSource = dsBombas
        NullValueKey = 46
        TabOrder = 0
      end
      object cmbTanque: TDBLookupComboBox
        Left = 73
        Top = 67
        Width = 500
        Height = 21
        DataField = 'ID_TANQUE'
        KeyField = 'ID'
        ListField = 'DESCRICAO'
        ListFieldIndex = 1
        ListSource = dsTanques
        NullValueKey = 46
        TabOrder = 1
      end
      object cmbCombustivel: TDBLookupComboBox
        Left = 73
        Top = 110
        Width = 500
        Height = 21
        DataField = 'ID_COMBUSTIVEL'
        KeyField = 'ID'
        ListField = 'DESCRICAO'
        ListFieldIndex = 1
        ListSource = dsCombustivel
        NullValueKey = 46
        TabOrder = 2
      end
    end
    object chkAgruparPorData: TCheckBox
      Left = 73
      Top = 211
      Width = 136
      Height = 17
      Caption = 'Agrupar Por Data'
      TabOrder = 2
    end
    object chkAgruparPorBomba: TCheckBox
      Left = 73
      Top = 292
      Width = 136
      Height = 17
      Caption = 'Agrupar Por Bomba'
      TabOrder = 5
      OnClick = chkAgruparPorBombaClick
    end
    object chkAgruparPorTanque: TCheckBox
      Left = 73
      Top = 265
      Width = 136
      Height = 17
      Caption = 'Agrupar Por Tanque'
      TabOrder = 4
      OnClick = chkAgruparPorBombaClick
    end
    object chkAgruparPorCombustivel: TCheckBox
      Left = 73
      Top = 238
      Width = 136
      Height = 17
      Caption = 'Agrupar Por Combut'#237'vel'
      TabOrder = 3
      OnClick = chkAgruparPorBombaClick
    end
  end
  object RLReport1: TRLReport
    Left = 50
    Top = 142
    Width = 794
    Height = 1123
    DataSource = dsDados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PreviewOptions.ShowModal = True
    PreviewOptions.Caption = 'Pr'#233'-Visualiza'#231#227'o'
    PreviewOptions.Defaults = pdIgnoreDefaults
    Visible = False
    object rlbCabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 17
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.Style = bsHorizontal
      object RLSystemInfo1: TRLSystemInfo
        Left = 0
        Top = 0
        Width = 33
        Height = 16
        Align = faLeft
        Layout = tlCenter
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 683
        Top = 0
        Width = 35
        Height = 16
        Align = faRight
        Alignment = taRightJustify
        Info = itHour
        Layout = tlCenter
        Text = ''
      end
      object rlbEmpresa: TRLLabel
        Left = 325
        Top = 0
        Width = 65
        Height = 16
        Align = faCenter
        Caption = 'Abast-Abc'
      end
    end
    object rlTitle: TRLBand
      Left = 38
      Top = 55
      Width = 718
      Height = 104
      AutoSize = True
      BandType = btTitle
      object rlbTitle: TRLLabel
        Left = 0
        Top = 0
        Width = 718
        Height = 32
        Align = faTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'RELAT'#211'RIO DE ABASTECIMENTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentFont = False
      end
      object rlFiltro1: TRLLabel
        Left = 0
        Top = 32
        Width = 718
        Height = 18
        Align = faTop
        Alignment = taCenter
        AutoSize = False
        Layout = tlCenter
      end
      object rlFiltro2: TRLLabel
        Left = 0
        Top = 50
        Width = 718
        Height = 18
        Align = faTop
        Alignment = taCenter
        AutoSize = False
        Layout = tlCenter
      end
      object rlFiltro3: TRLLabel
        Left = 0
        Top = 68
        Width = 718
        Height = 18
        Align = faTop
        Alignment = taCenter
        AutoSize = False
        Layout = tlCenter
      end
      object rlFiltro4: TRLLabel
        Left = 0
        Top = 86
        Width = 718
        Height = 18
        Align = faTop
        Alignment = taCenter
        AutoSize = False
        Layout = tlCenter
      end
    end
    object rlGroupC: TRLGroup
      Left = 38
      Top = 175
      Width = 718
      Height = 144
      object rlGroupT: TRLGroup
        Left = 0
        Top = 16
        Width = 718
        Height = 112
        object rlGroupB: TRLGroup
          Left = 0
          Top = 16
          Width = 718
          Height = 80
          object rlGroupD: TRLGroup
            Left = 0
            Top = 16
            Width = 718
            Height = 48
            object rlDetail: TRLBand
              Left = 0
              Top = 16
              Width = 718
              Height = 16
              GreenBarPrint = True
              object RLDBText1: TRLDBText
                Left = 8
                Top = 0
                Width = 20
                Height = 14
                Alignment = taRightJustify
                DataField = 'ID'
                DataSource = dsDados
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Text = ''
              end
              object RLDBText2: TRLDBText
                Left = 39
                Top = 0
                Width = 100
                Height = 14
                AutoSize = False
                DataField = 'BOMBA'
                DataSource = dsDados
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Text = ''
              end
              object RLDBText3: TRLDBText
                Left = 150
                Top = 0
                Width = 100
                Height = 14
                AutoSize = False
                DataField = 'TANQUE'
                DataSource = dsDados
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Text = ''
              end
              object RLDBText4: TRLDBText
                Left = 261
                Top = 0
                Width = 100
                Height = 14
                AutoSize = False
                DataField = 'COMBUSTIVEL'
                DataSource = dsDados
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Text = ''
              end
              object RLDBText5: TRLDBText
                Left = 372
                Top = 0
                Width = 60
                Height = 14
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'QUANTIDADE'
                DataSource = dsDados
                DisplayMask = '0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Text = ''
              end
              object RLDBText6: TRLDBText
                Left = 442
                Top = 0
                Width = 60
                Height = 14
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'VALOR_UNITARIO'
                DataSource = dsDados
                DisplayMask = 'R$ 0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Text = ''
              end
              object RLDBText7: TRLDBText
                Left = 513
                Top = 0
                Width = 60
                Height = 14
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'VALOR_TOTAL'
                DataSource = dsDados
                DisplayMask = 'R$ 0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Text = ''
              end
              object RLDBText8: TRLDBText
                Left = 584
                Top = 0
                Width = 60
                Height = 14
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'TAXA_IMPOSTO'
                DataSource = dsDados
                DisplayMask = '% 0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Text = ''
              end
              object RLDBText9: TRLDBText
                Left = 655
                Top = 0
                Width = 60
                Height = 14
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'VALOR_IMPOSTO'
                DataSource = dsDados
                DisplayMask = 'R$ 0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
                Text = ''
              end
            end
            object rlGroupDCaption: TRLBand
              Left = 0
              Top = 0
              Width = 718
              Height = 16
              BandType = btTitle
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = False
              Borders.DrawRight = False
              Borders.DrawBottom = True
              AfterPrint = rlGroupDCaptionAfterPrint
              object RLDBText10: TRLDBText
                Left = 5
                Top = 0
                Width = 55
                Height = 14
                DataField = 'DATA'
                DataSource = dsDados
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                Text = 'Dia: '
                Transparent = False
              end
            end
            object rlSumaryD: TRLBand
              Left = 0
              Top = 32
              Width = 718
              Height = 16
              BandType = btSummary
              Borders.Sides = sdCustom
              Borders.DrawLeft = False
              Borders.DrawTop = True
              Borders.DrawRight = False
              Borders.DrawBottom = True
              object RLDBResult1: TRLDBResult
                Left = 655
                Top = 0
                Width = 60
                Height = 14
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'VALOR_IMPOSTO'
                DataSource = dsDados
                DisplayMask = 'R$ 0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                Info = riSum
                ParentFont = False
                Text = ''
              end
              object RLDBResult2: TRLDBResult
                Left = 513
                Top = 0
                Width = 60
                Height = 14
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'VALOR_TOTAL'
                DataSource = dsDados
                DisplayMask = 'R$ 0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                Info = riSum
                ParentFont = False
                Text = ''
              end
              object RLDBResult3: TRLDBResult
                Left = 372
                Top = 0
                Width = 60
                Height = 14
                Alignment = taRightJustify
                AutoSize = False
                DataField = 'QUANTIDADE'
                DataSource = dsDados
                DisplayMask = '0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                Info = riSum
                ParentFont = False
                Text = ''
              end
              object RLLabel13: TRLLabel
                Left = 5
                Top = 0
                Width = 66
                Height = 14
                Caption = 'Total do Dia'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Arial'
                Font.Style = [fsBold]
                ParentFont = False
                BeforePrint = RLLabel13BeforePrint
              end
            end
          end
          object rlGroupBCaption: TRLBand
            Left = 0
            Top = 0
            Width = 718
            Height = 16
            BandType = btTitle
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = False
            Borders.DrawRight = False
            Borders.DrawBottom = True
            Color = 12640762
            ParentColor = False
            Transparent = False
            AfterPrint = rlGroupBCaptionAfterPrint
            object RLDBText11: TRLDBText
              Left = 5
              Top = 1
              Width = 87
              Height = 14
              DataField = 'BOMBA'
              DataSource = dsDados
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              Text = 'Bomba: '
              Transparent = False
            end
          end
          object rlSumaryB: TRLBand
            Left = 0
            Top = 64
            Width = 718
            Height = 16
            BandType = btSummary
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = True
            Borders.DrawRight = False
            Borders.DrawBottom = True
            object RLDBResult4: TRLDBResult
              Left = 655
              Top = 0
              Width = 60
              Height = 14
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'VALOR_IMPOSTO'
              DataSource = dsDados
              DisplayMask = 'R$ 0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Info = riSum
              ParentFont = False
              Text = ''
            end
            object RLDBResult5: TRLDBResult
              Left = 513
              Top = 0
              Width = 60
              Height = 14
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'VALOR_TOTAL'
              DataSource = dsDados
              DisplayMask = 'R$ 0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Info = riSum
              ParentFont = False
              Text = ''
            end
            object RLDBResult6: TRLDBResult
              Left = 372
              Top = 0
              Width = 60
              Height = 14
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'QUANTIDADE'
              DataSource = dsDados
              DisplayMask = '0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              Info = riSum
              ParentFont = False
              Text = ''
            end
            object RLLabel14: TRLLabel
              Left = 5
              Top = 0
              Width = 87
              Height = 14
              Caption = 'Total da Bomba'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
              BeforePrint = RLLabel14BeforePrint
            end
          end
        end
        object rlGroupTCaption: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 16
          BandType = btTitle
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          Color = 13693383
          ParentColor = False
          Transparent = False
          AfterPrint = rlGroupTCaptionAfterPrint
          object RLDBText12: TRLDBText
            Left = 5
            Top = 1
            Width = 93
            Height = 14
            DataField = 'TANQUE'
            DataSource = dsDados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Text = 'Tanque: '
            Transparent = False
          end
        end
        object rlSumaryT: TRLBand
          Left = 0
          Top = 96
          Width = 718
          Height = 16
          BandType = btSummary
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object RLDBResult7: TRLDBResult
            Left = 655
            Top = 0
            Width = 60
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VALOR_IMPOSTO'
            DataSource = dsDados
            DisplayMask = 'R$ 0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
            Text = ''
          end
          object RLDBResult8: TRLDBResult
            Left = 513
            Top = 0
            Width = 60
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'VALOR_TOTAL'
            DataSource = dsDados
            DisplayMask = 'R$ 0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
            Text = ''
          end
          object RLDBResult9: TRLDBResult
            Left = 372
            Top = 0
            Width = 60
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'QUANTIDADE'
            DataSource = dsDados
            DisplayMask = '0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Info = riSum
            ParentFont = False
            Text = ''
          end
          object RLLabel15: TRLLabel
            Left = 5
            Top = 0
            Width = 91
            Height = 14
            Caption = 'Total do Tanque'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            BeforePrint = RLLabel15BeforePrint
          end
        end
      end
      object rlGroupCCaption: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 16
        BandType = btTitle
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = 15985093
        ParentColor = False
        Transparent = False
        AfterPrint = rlGroupCCaptionAfterPrint
        object RLDBText13: TRLDBText
          Left = 5
          Top = 0
          Width = 157
          Height = 14
          DataField = 'COMBUSTIVEL'
          DataSource = dsDados
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = 'Combust'#237'vel: '
          Transparent = False
        end
      end
      object rlSumaryC: TRLBand
        Left = 0
        Top = 128
        Width = 718
        Height = 16
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLDBResult10: TRLDBResult
          Left = 655
          Top = 0
          Width = 60
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR_IMPOSTO'
          DataSource = dsDados
          DisplayMask = 'R$ 0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult11: TRLDBResult
          Left = 513
          Top = 0
          Width = 60
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR_TOTAL'
          DataSource = dsDados
          DisplayMask = 'R$ 0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLDBResult12: TRLDBResult
          Left = 372
          Top = 0
          Width = 60
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'QUANTIDADE'
          DataSource = dsDados
          DisplayMask = '0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
        end
        object RLLabel16: TRLLabel
          Left = 5
          Top = 0
          Width = 120
          Height = 14
          Caption = 'Total do Combust'#237'vel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BeforePrint = RLLabel16BeforePrint
        end
      end
    end
    object rlColumnHeader: TRLBand
      Left = 38
      Top = 159
      Width = 718
      Height = 16
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel4: TRLLabel
        Left = 19
        Top = 1
        Width = 9
        Height = 14
        Caption = '#'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 39
        Top = 1
        Width = 41
        Height = 14
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 150
        Top = 1
        Width = 44
        Height = 14
        Caption = 'Tanque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 261
        Top = 1
        Width = 73
        Height = 14
        Caption = 'Combust'#237'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 367
        Top = 1
        Width = 65
        Height = 14
        Alignment = taRightJustify
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 441
        Top = 1
        Width = 61
        Height = 14
        Alignment = taRightJustify
        Caption = 'R$ Unit'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 527
        Top = 1
        Width = 46
        Height = 14
        Alignment = taRightJustify
        Caption = 'R$ Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 583
        Top = 1
        Width = 61
        Height = 14
        Alignment = taRightJustify
        Caption = '% Imposto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 650
        Top = 1
        Width = 65
        Height = 14
        Alignment = taRightJustify
        Caption = 'R$ Imposto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rlSumaryG: TRLBand
      Left = 38
      Top = 319
      Width = 718
      Height = 16
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLDBResult13: TRLDBResult
        Left = 655
        Top = 0
        Width = 60
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR_IMPOSTO'
        DataSource = dsDados
        DisplayMask = 'R$ 0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult14: TRLDBResult
        Left = 513
        Top = 0
        Width = 60
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR_TOTAL'
        DataSource = dsDados
        DisplayMask = 'R$ 0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLDBResult15: TRLDBResult
        Left = 372
        Top = 0
        Width = 60
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'QUANTIDADE'
        DataSource = dsDados
        DisplayMask = '0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
      end
      object RLLabel17: TRLLabel
        Left = 5
        Top = 0
        Width = 79
        Height = 14
        Caption = 'Total do Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object dsTanques: TDataSource
    DataSet = cdsTanques
    Left = 488
    Top = 176
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
  object dsCombustivel: TDataSource
    DataSet = cdsCombustivel
    Left = 496
    Top = 320
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
  object cdsDados: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 258
    Top = 414
    object cdsDadosID: TLargeintField
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
    object cdsDadosQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object cdsDadosVALOR_UNITARIO: TFloatField
      FieldName = 'VALOR_UNITARIO'
    end
    object cdsDadosTAXA_IMPOSTO: TFloatField
      FieldName = 'TAXA_IMPOSTO'
    end
    object cdsDadosVALOR_IMPOSTO: TFloatField
      FieldName = 'VALOR_IMPOSTO'
    end
    object cdsDadosVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
    object cdsDadosID_TANQUE: TLargeintField
      FieldName = 'ID_TANQUE'
    end
    object cdsDadosID_COMBUSTIVEL: TLargeintField
      FieldName = 'ID_COMBUSTIVEL'
    end
    object cdsDadosTANQUE: TStringField
      FieldName = 'TANQUE'
      Size = 255
    end
    object cdsDadosBOMBA: TStringField
      FieldName = 'BOMBA'
      Size = 255
    end
    object cdsDadosCOMBUSTIVEL: TStringField
      FieldName = 'COMBUSTIVEL'
      Size = 255
    end
  end
  object dsDados: TDataSource
    DataSet = cdsDados
    Left = 408
    Top = 264
  end
end
