object frmRelatorio: TfrmRelatorio
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmRelatorio'
  ClientHeight = 622
  ClientWidth = 812
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 10
    Top = 8
    Width = 794
    Height = 1123
    DataSource = DataModule1.Source
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Fixedsys'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 186
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 16
        Top = 48
        Width = 81
        Height = 15
        Caption = 'Crian'#231'a:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Fixedsys'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText1: TRLDBText
        Left = 94
        Top = 48
        Width = 491
        Height = 15
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 16
        Top = 80
        Width = 45
        Height = 15
        Caption = 'M'#227'e:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Fixedsys'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText2: TRLDBText
        Left = 62
        Top = 80
        Width = 523
        Height = 15
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 16
        Top = 112
        Width = 45
        Height = 15
        Caption = 'Pai:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Fixedsys'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText3: TRLDBText
        Left = 62
        Top = 112
        Width = 523
        Height = 15
        Text = ''
      end
      object RLLabel4: TRLLabel
        Left = 16
        Top = 152
        Width = 153
        Height = 15
        Caption = 'Filtros de data:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Fixedsys'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 175
        Top = 152
        Width = 72
        Height = 15
      end
      object RLLabel6: TRLLabel
        Left = 304
        Top = 152
        Width = 72
        Height = 15
      end
      object RLLabel7: TRLLabel
        Left = 216
        Top = 16
        Width = 81
        Height = 15
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Fixedsys'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 224
      Width = 718
      Height = 193
      object RLLabel8: TRLLabel
        Left = 16
        Top = 38
        Width = 64
        Height = 15
        Caption = 'C'#243'digo:'
      end
      object RLLabel9: TRLLabel
        Left = 16
        Top = 77
        Width = 48
        Height = 15
        Caption = 'Data:'
      end
      object RLLabel10: TRLLabel
        Left = 16
        Top = 114
        Width = 104
        Height = 15
        Caption = 'Valor Total:'
      end
      object RLLabel11: TRLLabel
        Left = 16
        Top = 151
        Width = 200
        Height = 15
        Caption = 'Respons'#225'vel pela compra:'
      end
      object RLDBText8: TRLDBText
        Left = 86
        Top = 38
        Width = 72
        Height = 15
        DataField = 'descItem'
        DataSource = DataModule1.Source
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 70
        Top = 77
        Width = 80
        Height = 15
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 126
        Top = 114
        Width = 80
        Height = 15
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 222
        Top = 151
        Width = 80
        Height = 15
        Text = ''
      end
    end
  end
end
