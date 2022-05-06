object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 334
  Width = 398
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=MonitoreBebe'
      'User_Name=root'
      'Password=root'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    Transaction = Transaction
    Left = 48
    Top = 16
  end
  object Query: TFDQuery
    Transaction = Transaction
    SQL.Strings = (
      'Select * from TCADRESP;')
    Left = 152
    Top = 16
  end
  object DriverConexao: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\progvisual33\Documents\Pessoal\Exerc'#237'cios Aula\PZIMexer' +
      'cicio\DELPHI\MonitoreBebe\MonitoreBebe\Project\Win32\Debug\libmy' +
      'sql.dll'
    Left = 208
    Top = 16
  end
  object Transaction: TFDTransaction
    Connection = Conexao
    Left = 96
    Top = 16
  end
end
