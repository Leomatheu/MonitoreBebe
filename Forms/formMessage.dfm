object frmMessage: TfrmMessage
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmMessage'
  ClientHeight = 129
  ClientWidth = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object pnMessage: TPanel
    Left = 0
    Top = 0
    Width = 495
    Height = 129
    Align = alClient
    Caption = 'pnMessage'
    Color = 10461183
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object imgMessage: TImage
      Left = 32
      Top = 14
      Width = 73
      Height = 73
      Stretch = True
    end
    object lbMessage: TLabel
      Left = 128
      Top = 48
      Width = 72
      Height = 15
      Caption = 'lbMessage'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object btnMessage: TButton
      Left = 200
      Top = 94
      Width = 105
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnMessageClick
    end
  end
end
