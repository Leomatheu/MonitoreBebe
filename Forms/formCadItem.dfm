object frmCadItem: TfrmCadItem
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'CADASTRO DE ITENS'
  ClientHeight = 305
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panel01: TPanel
    Left = 0
    Top = 0
    Width = 528
    Height = 305
    Align = alClient
    Caption = 'panel01'
    Color = 12703487
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    object edtCrianca: TLabel
      Left = 28
      Top = 137
      Width = 112
      Height = 15
      Caption = 'Valor Unit'#225'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
    end
    object TPanel
      Left = 16
      Top = 630
      Width = 159
      Height = 28
      Color = 317753
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object sbSalvar: TSpeedButton
        Left = 1
        Top = 1
        Width = 157
        Height = 26
        Align = alClient
        Caption = 'Salvar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 72
        ExplicitTop = 0
        ExplicitWidth = 86
      end
    end
    object TPanel
      Left = 16
      Top = 596
      Width = 159
      Height = 28
      Color = clRed
      ParentBackground = False
      TabOrder = 3
      object sbExcluir: TSpeedButton
        Left = 1
        Top = 1
        Width = 157
        Height = 26
        Align = alClient
        Caption = 'Excluir'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 72
        ExplicitTop = 2
        ExplicitWidth = 86
      end
    end
    object TPanel
      Left = 16
      Top = 562
      Width = 159
      Height = 28
      Color = 14869218
      ParentBackground = False
      TabOrder = 4
      object sbConsultar: TSpeedButton
        Left = 1
        Top = 1
        Width = 157
        Height = 26
        Align = alClient
        Caption = 'Consultar'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
        ExplicitTop = 2
      end
    end
    object edDescItem: TLabeledEdit
      Left = 28
      Top = 40
      Width = 457
      Height = 23
      EditLabel.Width = 112
      EditLabel.Height = 15
      EditLabel.Caption = 'Descri'#231#227'o Item'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Fixedsys'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edUnidadeMedida: TLabeledEdit
      Left = 324
      Top = 154
      Width = 161
      Height = 23
      EditLabel.Width = 136
      EditLabel.Height = 15
      EditLabel.Caption = 'Unidade de Medida'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Fixedsys'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edValorUnitario: TMaskEdit
      Left = 28
      Top = 154
      Width = 155
      Height = 23
      EditMask = 'R$ !999,99;1; '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 5
      Text = 'R$    ,  '
    end
    object TPanel
      Left = 168
      Top = 254
      Width = 159
      Height = 28
      Color = 317753
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 6
      object SpeedButton1: TSpeedButton
        Left = 1
        Top = 1
        Width = 157
        Height = 26
        Align = alClient
        Caption = 'Salvar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 9
      end
    end
  end
end
