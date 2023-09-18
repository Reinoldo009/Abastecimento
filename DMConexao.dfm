object frmDMConexao: TfrmDMConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 164
  Width = 448
  object FDConnection1: TFDConnection
    Params.Strings = (
      'MonitorBy=Custom'
      'PageSize=16384'
      'Pooled=False'
      'Server=127.0.0.1'
      'Port=3050'
      'Protocol=TCPIP'
      'DropDatabase=No'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
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
    Left = 256
    Top = 96
  end
end
