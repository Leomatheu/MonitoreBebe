object frmEditResp: TfrmEditResp
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'frmEditResp'
  ClientHeight = 447
  ClientWidth = 1015
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1015
    Height = 447
    Align = alClient
    Caption = 'Panel1'
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 72
      Width = 1013
      Height = 374
      Align = alBottom
      BorderStyle = bsNone
      DataSource = DataModule1.Source
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
    end
    object edtBusca: TLabeledEdit
      Left = 176
      Top = 24
      Width = 553
      Height = 23
      EditLabel.Width = 128
      EditLabel.Height = 15
      EditLabel.BiDiMode = bdRightToLeft
      EditLabel.Caption = 'Busque pelo nome'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Fixedsys'
      EditLabel.Font.Style = []
      EditLabel.ParentBiDiMode = False
      EditLabel.ParentFont = False
      EditLabel.Layout = tlBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 1
      OnChange = edtBuscaChange
    end
  end
end
