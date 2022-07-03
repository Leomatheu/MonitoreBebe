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
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    Connected = True
    LoginPrompt = False
    Transaction = Transaction
    Left = 32
    Top = 56
  end
  object Query: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'Select descItem from TITENS;')
    Left = 296
    Top = 88
  end
  object DriverConexao: TFDPhysMySQLDriverLink
    Left = 208
    Top = 16
  end
  object Transaction: TFDTransaction
    Connection = Conexao
    Left = 96
    Top = 16
  end
  object Source: TDataSource
    AutoEdit = False
    DataSet = Query
    Left = 296
    Top = 16
  end
end
