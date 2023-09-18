object frmDMConexao: TfrmDMConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 164
  Width = 448
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'MonitorBy=Custom'
      'PageSize=16384'
      'Password=masterkey'
      'Pooled=False'
      'Server=127.0.0.1'
      'Port=3050'
      
        'Database=C:\Users\rei00\Documents\Embarcadero\Studio\Projects\Pr' +
        'ojetoAbastecimentos\BANCO.FDB'
      'User_Name=sysdba')
    LoginPrompt = False
    Left = 168
    Top = 64
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrNone
    Left = 64
    Top = 64
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 320
    Top = 56
  end
  object FDMoniCustomClientLink1: TFDMoniCustomClientLink
    OnOutput = FDMoniCustomClientLink1Output
    Tracing = True
    Synchronize = True
    Left = 256
    Top = 96
  end
end
