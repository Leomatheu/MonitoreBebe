object frmOcorrencia: TfrmOcorrencia
  Left = 0
  Top = 0
  ActiveControl = edtAcompanhante
  BorderStyle = bsDialog
  Caption = 'CADASTRO DE OCORR'#202'NCIA'
  ClientHeight = 661
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 441
    Height = 661
    Align = alLeft
    Color = 14211307
    ParentBackground = False
    TabOrder = 0
    object Label3: TLabel
      Left = 24
      Top = 101
      Width = 56
      Height = 15
      Caption = 'Crian'#231'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 24
      Top = 166
      Width = 32
      Height = 15
      Caption = 'Data'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 313
      Top = 166
      Width = 32
      Height = 15
      Caption = 'Hora'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 24
      Top = 243
      Width = 80
      Height = 15
      Caption = 'Ocorr'#234'ncia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 363
      Width = 120
      Height = 15
      Caption = 'Tomou Medica'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 519
      Width = 112
      Height = 15
      Caption = 'Hora Medica'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
    end
    object edtAcompanhante: TLabeledEdit
      Left = 24
      Top = 48
      Width = 385
      Height = 23
      EditLabel.Width = 96
      EditLabel.Height = 15
      EditLabel.Caption = 'Acompanhante'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Fixedsys'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cbCrianca: TComboBox
      Left = 24
      Top = 118
      Width = 385
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'Selecione...'
    end
    object edtData: TMaskEdit
      Left = 24
      Top = 182
      Width = 119
      Height = 23
      EditMask = '!99/99/0000;1; '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      Text = '  /  /    '
    end
    object edtHora: TMaskEdit
      Left = 313
      Top = 182
      Width = 96
      Height = 23
      EditMask = '!90:00;1; '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 3
      Text = '  :  '
    end
    object mmOcorrencia: TMemo
      Left = 24
      Top = 261
      Width = 385
      Height = 71
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      TabOrder = 4
    end
    object ckSim: TCheckBox
      Left = 24
      Top = 382
      Width = 97
      Height = 17
      Caption = 'Sim'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnMouseDown = ckSimMouseDown
    end
    object ckNao: TCheckBox
      Left = 168
      Top = 382
      Width = 97
      Height = 17
      Caption = 'N'#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = ckNaoClick
    end
    object edtQuantidade: TLabeledEdit
      Left = 216
      Top = 536
      Width = 193
      Height = 23
      EditLabel.Width = 152
      EditLabel.Height = 15
      EditLabel.Caption = 'Quantidade Medicada'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Fixedsys'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object edtHoraMedicacao: TMaskEdit
      Left = 24
      Top = 536
      Width = 112
      Height = 23
      EditMask = '!90:00;1; '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 8
      Text = '  :  '
    end
    object edtDescricao: TLabeledEdit
      Left = 22
      Top = 457
      Width = 387
      Height = 23
      EditLabel.Width = 168
      EditLabel.Height = 15
      EditLabel.Caption = 'Descri'#231#227'o Medicamento'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Fixedsys'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object edtCodigo: TLabeledEdit
      Left = 22
      Top = 611
      Width = 114
      Height = 23
      EditLabel.Width = 48
      EditLabel.Height = 15
      EditLabel.Caption = 'C'#243'digo'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Fixedsys'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
  end
  object Panel2: TPanel
    Left = 442
    Top = 0
    Width = 203
    Height = 661
    Align = alRight
    Color = 14211307
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 447
    object Image1: TImage
      Left = 32
      Top = 24
      Width = 137
      Height = 121
      Picture.Data = {
        07544269746D6170F6120000424DF61200000000000036000000280000002800
        0000280000000100180000000000C01200007412000074120000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFE7E7F8A0A0E36565D24F4FCC4343C74F4FCC6666D3A3A3E4E9
        E9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9FD9191DE4D
        4DCC6868DD7D7DEB8989F38F8FF78989F37C7CEB6767DC4D4DCA9393DFF9F9FD
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDFA6666D36262D88989F48F8FF78F8FF7
        8F8FF78F8FF78F8FF78F8FF78F8FF78989F36161D86767D2EDEDFAFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF8F8FD6565D36A6ADF8F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8F
        F78F8FF78F8FF78F8FF78F8FF76D6DE05B5BCFEDEDFAFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9191DF6363
        D98F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F
        8FF78F8FF78F8FF76E6EE15B5BCFEDEDFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7F84D4DCA8989F48F8FF78F8FF78F
        8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF7
        8F8FF76D6DE15B5BD0EDEDFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF9F9FE36767DC8F8FF78F8FF78F8FF78F8FF78F8FF78F8FF7
        8F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF76E6E
        E15B5BCFEDEDFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        6666D37D7DEB8F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8F
        F78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF76E6EE15B5BCFED
        EDFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E4ECB8989F48F8F
        F78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F
        8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF76E6EE25A5ACFECECF9FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF4545C88E8EF68F8FF78F8FF78F8FF78F
        8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF7
        8F8FF78F8FF78F8FF78F8FF78F8FF76E6EE15B5BCFEDEDFAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF4C4CCB8989F48F8FF78F8FF78F8FF78F8FF78F8FF78F8FF7
        8F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8F
        F78F8FF78F8FF78F8FF76E6EE25A5ACEE5E0E9FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        6464D27D7DEB8F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8F
        F78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F
        8FF78F8FF76968DC544EBDEDE7EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0E36767DC8F8F
        F78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F
        8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78989F35350CA
        8A6F9FC08B64F7F1EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7F84D4DCB8989F48F8FF78F8FF78F
        8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF7
        8F8FF78F8FF78F8FF78F8FF78F8FF78989F3524FCA977CACF0B78BD59C71C08B
        63F7F1EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9090DF6262D88F8FF78F8FF78F8FF78F8FF78F8FF7
        8F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8F
        F78F8FF78989F35350CA977CACF0B78BF0B78BF0B78BD59C71C08B63F7F1EDFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF8F8FD6565D36C6CE08F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8F
        F78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78989F35350CA97
        7CACF0B78BF0B78BF0B78BF0B78BF0B78BD59C71C08B63F7F1EDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDED
        FA5B5BCF6E6EE18F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F
        8FF78F8FF78F8FF78F8FF78F8FF78989F3524FCA977CACF0B78BF0B78BF0B78B
        F0B78BF0B78BF0B78BF0B78BD59C71C08B63F7F1EDFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEFA5D5DD06D
        6DE08F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF7
        8F8FF78989F35250C99278ADF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B7
        8BF0B78BF0B78BD69D71C08B63F7F1EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEFA5D5DD06D6DE08F8FF7
        8F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78F8FF78989F35250C99278
        ADF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0
        B78BD69D71C08B63F7F1EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEFA5D5DD06C6CE08F8FF78F8FF78F8F
        F78F8FF78F8FF78F8FF78F8FF78989F35250C99278ADF0B78BF0B78BF0B78BF0
        B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BD49C70
        C08B64F8F2EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFEEEEFA5D5DD06C6CE08F8FF78F8FF78F8FF78F8FF78F
        8FF78989F35250C99278ADF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78B
        F0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BD49B6FC59470FDFB
        FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFEEEEFA5D5DD06C6CE08F8FF78F8FF78F8FF78989F35250C99278AD
        F0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B7
        8BF0B78BF0B78BF0B78BF0B78BF0B78BF0B68ACA9267D7B59CFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        EEEEFA5D5DD06C6CE08F8FF78989F35250C99278ADF0B78BF0B78BF0B78BF0B7
        8BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0
        B78BF0B78BF0B78BF0B78BEAB185BB8158F7F0ECFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDFA5B5B
        CF6968DC524FCA977CACF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0
        B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78B
        F0B78BF0B78BCF966BDCBFABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E2EA564FBC866CA1F0
        B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78B
        F0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BE0A6
        7AC69671FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEAEDC08C65D49C70F0B78BF0B78B
        F0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B7
        8BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BEAB185BC845AFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF7F1EDBF8B64D59C70F0B78BF0B78BF0B78BF0B7
        8BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0
        B78BF0B78BF0B78BF0B78BF0B78BEFB58AB77C51FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF8F3EFC08C65D49C70F0B78BF0B78BF0B78BF0B78BF0B78BF0
        B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78B
        F0B78BF0B78BEAB185BB845AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF7F1EDBF8B64D59C70F0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78B
        F0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BE1A7
        7AC69671FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F1ED
        BF8B64D59C70F0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B7
        8BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BCF976CDCBFAAFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F2EEBF8B64D59C
        70F0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0
        B78BF0B78BF0B78BF0B78BEBB286BA8157F7F0EBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F2EEBF8B64D59C70F0B78BF0
        B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78B
        F0B68ACA9267D5B299FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F2EEBF8B64D49B6FF0B78BF0B78BF0B78B
        F0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BF0B78BD2996EC5936EFDFB
        F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF8F2EEC5936FCA9268EBB286F0B78BF0B78BF0B78BF0B7
        8BF0B78BF0B78BF0B78BEBB286CA9267C5936EF8F2EEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFDFBF9D5B299BA8157CF976CE1A87BEAB185EFB58AEAB185E1A87BCF
        976DBA8157D5B298FDFBF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF6EFEADCBEA9C5946FBB845AB67D50BB845AC5946FDBBEA9F6EFEAFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      Stretch = True
    end
    object Panel7: TPanel
      Left = 23
      Top = 539
      Width = 159
      Height = 28
      Color = 14869218
      ParentBackground = False
      TabOrder = 0
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
        Font.Height = -12
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
        OnClick = sbConsultarClick
        ExplicitTop = 3
      end
    end
    object Panel6: TPanel
      Left = 23
      Top = 574
      Width = 159
      Height = 28
      Color = clRed
      ParentBackground = False
      TabOrder = 1
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
        Font.Height = -12
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
        OnClick = sbExcluirClick
        ExplicitLeft = 40
        ExplicitTop = -1
        ExplicitWidth = 86
      end
    end
    object Panel5: TPanel
      Left = 23
      Top = 608
      Width = 159
      Height = 28
      Color = 317753
      ParentBackground = False
      TabOrder = 2
      object sbSalvar: TSpeedButton
        Left = 1
        Top = 1
        Width = 157
        Height = 26
        Align = alClient
        Caption = 'Salvar'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
        OnClick = sbSalvarClick
        ExplicitLeft = 26
        ExplicitTop = 8
        ExplicitWidth = 111
      end
    end
  end
end
