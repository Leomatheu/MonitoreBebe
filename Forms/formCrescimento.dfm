object frmCrescimento: TfrmCrescimento
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'CONTROLE DE CRESCIMENTO'
  ClientHeight = 675
  ClientWidth = 653
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
    Left = 450
    Top = 0
    Width = 203
    Height = 675
    Align = alRight
    Caption = 'Panel1'
    Color = 16764134
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = 448
    object Panel7: TPanel
      Left = 23
      Top = 535
      Width = 157
      Height = 28
      Color = 14869218
      ParentBackground = False
      TabOrder = 0
      object sbConsultar: TSpeedButton
        Left = 1
        Top = 1
        Width = 155
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
        ExplicitLeft = 16
        ExplicitTop = 3
        ExplicitWidth = 118
      end
    end
    object Panel6: TPanel
      Left = 22
      Top = 569
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
        ExplicitLeft = 40
        ExplicitTop = 0
        ExplicitWidth = 86
      end
    end
    object Panel5: TPanel
      Left = 22
      Top = 601
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
        ExplicitTop = 2
      end
    end
    object Panel4: TPanel
      Left = 36
      Top = 21
      Width = 137
      Height = 163
      Caption = 'Panel4'
      TabOrder = 3
      object imgCadCri: TImage
        Left = 1
        Top = 1
        Width = 135
        Height = 161
        Align = alClient
        Picture.Data = {
          07544269746D6170F6120000424DF61200000000000036000000280000002800
          0000280000000100180000000000C01200007412000074120000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFB2A594B2A594FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8BDAFC8BD
          AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8BDAFC8BDAFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFC5BCAEBBB7AA9DCADA9DCADA9DCADA9DCADA9DCADA
          9DCADA9DCADA9DCADA9DCADA9DCADA9DCADA9DCADA9DCADA9DCADA9DCADA9DCA
          DA9DCADA9DCADA9DCADA9DCADA9DCADA9DCADA9DCADA9DCADA9DCADA9DCADA9D
          CADA9DCADA9DCADA9DCADA9DCADAA3CDDCC6E0E9FEFEFEFFFFFFFFFFFFFFFFFF
          FFFFFFC0BAADBDBCB0A3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EE
          FFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3
          EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFF
          A3EEFFA3EEFFA1EBFD8BD9ED80C0D5F8FBFCFFFFFFFFFFFFFFFFFFC3BEB5AAB0
          ABAAD0DFAAD0DFAAD0DFAAD0DFAAD0DFAAD0DFAAD0DFAAD0DFAAD0DFAAD0DFAA
          D0DFAAD0DFAAD0DFAAD0DFAAD0DFAAD0DFAAD0DFAAD0DFAAD0DFAAD0DFAAD0DF
          AAD0DFAAD0DFAAD0DFAAD0DFAAD0DFAAD0DFAAD0DFAAD0DFAAD0DFAAD0DFA1CE
          DD77C1D999E5F7A0CCDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAEBF185D3E87A
          C3D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FAFB7BCAE076C2DAFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFAFCFD9ECADB96E2F581C1D7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4DEDAC3
          B7ABBDAD9FB0A497A49D92A7A094A7A094A7A094A7A094A7A094A7A094A7A094
          A7A094A7A094A7A094A7A094A7A094A7A094978D8079C7DF79C7DF79C7DF79C9
          E094E1F47DCBE2D5E8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFED2C9C0B7A798C2AF9ED2BEAED4C1B0D4C1B0
          D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1
          B0D4C1B0D4C1B0D4C1B0A69E9072C2DA72C2DA72C2DA73C1DA7EC1D7D0E6EDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          EFECE9B7A799C8B5A3D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1
          B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4
          C1B0B7A595FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1DBD5B7A594D3BFAFD4C1
          B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4
          C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0B7A595FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFDED7D1BBA898D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4
          C1B0C1BCB29FB6B790B5BE90B5BEA0B6B8C2BCB2D4C1B0D4C1B0D4C1B0D4C1B0
          D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0B7A595FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1
          EFEBB8A696D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0A1B7B97EB7C885CBDF96E2F5
          A0EBFCA0EBFC96E2F584CBDD7CB6C8A3B7B8D4C1B0D4C1B0D4C1B0D4C1B0D4C1
          B0D4C1B0D4C1B0D4C1B0B7A595FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEB6A697D3BFAFD4C1B0
          D4C1B0D4C1B0CCBFB17DB3C38FD8EBA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EE
          FFA3EEFFA3EEFF8ED8EB7EB4C3CBBEB0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4
          C1B0B7A595FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFD7CEC6C5B1A0D4C1B0D4C1B0D4C1B0CCBFB178B5
          C79DE9FBA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3
          EEFF9DE9FB78B5C7CCBFB0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0B7A595FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFB7A597D4C1B0D4C1B0D4C1B0D4C1B07DB3C39DE9FBA3EEFFA3EEFFA3
          EEFF98E5F787D4EA85D3E890DDF1A2EDFEA3EEFFA3EEFFA3EEFFA3EEFF9CE8FA
          7FB4C3D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0B7A595FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E3DFC0AD9DD4
          C1B0D4C1B0D4C1B0A1B7B98FD8EDA3EEFFA3EEFFA3EEFFA3EEFF499BBA489BBA
          489BBA489BBA56A8C493E0F3A3EEFFA3EEFFA3EEFFA3EEFF8DD6E9A5B8B8D4C1
          B0D4C1B0D4C1B0D4C1B0B6A494FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3B6ABD2BEAED4C1B0D4C1B0D4C1B0
          7DB8C8A3EEFFA3EEFFA3EEFFA3EEFFA3EEFF79C9E09AE5F89EE9FB80CEE54A9D
          BB55A7C4A2EEFFA3EEFFA3EEFFA3EEFFA3EEFF7DB7C8D4C1B0D4C1B0D4C1B0D4
          C1B0A89691FCFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFBCAC9FD4C1B0D4C1B0D4C1B0C2BCB183CADDA3EEFFA3EE
          FFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFF6BBBD4489BBA97E3F6A3
          EEFFA3EEFFA3EEFFA3EEFF83C9DEC2BCB1D4C1B0D4C1B0D4C1B0A997948484DE
          FCFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFB9A898D4C1B0D4C1B0D4C1B09FB6B994E1F4A3EEFFA3EEFFA3EEFFA3EEFFA3
          EEFFA3EEFFA3EEFFA3EEFFA3EEFF6BBAD5489BBA94E0F3A3EEFFA3EEFFA3EEFF
          A3EEFF93DFF3A3B7B8D4C1B0D4C1B0D4C1B0A997948686F18484DEFCFCFEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7A595D4C1B0D4
          C1B0D4C1B08FB5BD9EEAFCA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA0ECFDA0EBFD
          9DE8FA7FCDE34A9DBB52A3C1A1ECFDA3EEFFA3EEFFA3EEFFA3EEFF9FEAFB8FB5
          BDD4C1B0D4C1B0D4C1B0A796958F8FF78686F18484DEFCFCFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8A696D4C1B0D4C1B0D4C1B08DB5BE
          A0EBFDA3EEFFA3EEFFA3EEFFA3EEFFA3EEFF79C8DF489BBA489BBA489BBA50A3
          C08DD9EEA3EEFFA3EEFFA3EEFFA3EEFFA3EEFF9EE9FB91B5BDD4C1B0D4C1B0D4
          C1B0A594988F8FF78F8FF78686F09898E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFBAA99BD4C1B0D4C1B0D4C1B0A2B7B894E1F4A3EEFFA3EE
          FFA3EEFFA3EEFFA3EEFF79C8DF489BBA7BC9E18CD9EE9FEAFBA3EEFFA3EEFFA3
          EEFFA3EEFFA3EEFFA3EEFF94E1F4A1B6B8D4C1B0D4C1B0D4C1B0A2929B8F8FF7
          8F8FF78E8EF78484E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFBBAB9DD4C1B0D4C1B0D4C1B0C0BCB184CBDFA3EEFFA3EEFFA3EEFFA3EEFFA3
          EEFF79C8DF489BBA94E1F4A3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFF
          A3EEFF83CADDC2BCB1D4C1B0D4C1B0D4C1B09D8EA18F8FF78E8EF77777E0D8D8
          F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3B6ABD2BEAED4
          C1B0D4C1B0D4C1B07DB8C9A3EEFFA3EEFFA3EEFFA3EEFFA3EEFF79C8DF489BBA
          85D3E990DDF190DDF192DFF2A3EEFFA3EEFFA3EEFFA3EEFFA3EEFF7CB6C8D4C1
          B0D4C1B0D4C1B0CEBAAA968AB18E8EF77777E0D6D6F4FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E0DAC1AF9DD4C1B0D4C1B0D4C1B0
          A3B7B88ED8EBA3EEFFA3EEFFA3EEFFA3EEFF79C8DF489BBA489BBA489BBA489B
          BA4FA1BFA3EEFFA3EEFFA3EEFFA3EEFF8FD8EDA1B7B8D4C1B0D4C1B0D4C1B0B1
          9E978F8CE57979E1D4D4F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEB6A596D4C1B0D4C1B0D4C1B0D4C1B07CB4C49EE9
          FBA3EEFFA3EEFFA3EEFF92DFF27FCDE37FCDE37FCDE37FCDE381CFE5A3EEFFA3
          EEFFA3EEFF9DE9FB7DB3C3D4C1B0D4C1B0D4C1B0D4C1B09E8E997979E1D4D4F3
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFD4CBC3C7B3A3D4C1B0D4C1B0D4C1B0CCBFB178B5C89FEAFBA3EEFFA3
          EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFFA3EEFF9DE9FB77B5C8
          CBBEB0D4C1B0D4C1B0D4C1B0BAA79C837CBFD4D4F3FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEB5
          A495D4C0AFD4C1B0D4C1B0D4C1B0C9BFB17CB4C38FDAEDA3EEFFA3EEFFA3EEFF
          A3EEFFA3EEFFA3EEFFA3EEFFA3EEFF91D9EC7DB4C4CBBEB0D4C1B0D4C1B0D4C1
          B0D1BEAD978695D4D4F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEBE8B8A596D4C1B0
          D4C1B0D4C1B0D4C1B0D3C1B0A1B7B87CB6C884CBDF96E2F5A0EBFDA0EBFD97E3
          F684CCDF7CB7C9A1B6B8D3C1B0D4C1B0D4C1B0D4C1B0D4C1B0A2918FCDCBE5FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED7D0BCA998D4C1B0D4C1B0D4C1
          B0D4C1B0D4C1B0D4C1B0C1BCB29EB6B98EB5BD8EB5BD9EB6B8BFBBB2D4C1B0D4
          C1B0D4C1B0D4C1B0D4C1B0D4C0AFA99692C5C0D3FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFDED7D0B8A596D4C0AFD4C1B0D4C1B0D4C1B0D4
          C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0
          D2BEAEA2918FC7C3D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFECE9E6B5A495C7B4A2D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0
          D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0D4C1B0C5B2A1B7A79AF1EEEDFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFEFEFED3CAC1B6A496C1AE9DD1BFADD4C1B0D4C1B0D4C1B0D4C1B0D4C1
          B0D4C1B0D1BEACC0AD9DB7A799D7CFC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFEFEFEE5E0DBC2B4A8BCAC9FBAA99BB7A595B8A697BAA99ABDAD9FC4B8ADE7
          E2DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
        ExplicitLeft = 9
        ExplicitTop = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 450
    Height = 675
    Align = alClient
    Caption = 'Panel2'
    Color = 16764134
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    ExplicitLeft = -6
    object Label3: TLabel
      Left = 32
      Top = 33
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
      Left = 32
      Top = 109
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
    object Label4: TLabel
      Left = 32
      Top = 187
      Width = 32
      Height = 15
      Caption = 'Peso'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 311
      Top = 187
      Width = 48
      Height = 15
      Caption = 'Altura'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 32
      Top = 354
      Width = 168
      Height = 15
      Caption = 'Circunfer'#234'ncia Cabe'#231'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 32
      Top = 437
      Width = 176
      Height = 15
      Caption = 'Circunfer'#234'ncia Barriga'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 32
      Top = 513
      Width = 88
      Height = 15
      Caption = 'Observa'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
    end
    object cbCrianca: TComboBox
      Left = 32
      Top = 50
      Width = 377
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'Selecione...'
    end
    object edtData: TMaskEdit
      Left = 32
      Top = 126
      Width = 101
      Height = 23
      EditMask = '!99/99/0000;1; '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Fixedsys'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
    end
    object edtPeso: TMaskEdit
      Left = 32
      Top = 205
      Width = 101
      Height = 23
      EditMask = '!0,000 kg;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 2
      Text = ' ,    kg'
    end
    object edtAltura: TMaskEdit
      Left = 310
      Top = 205
      Width = 99
      Height = 23
      EditMask = '!0,000 m;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 3
      Text = ' ,    m'
    end
    object edtImc: TLabeledEdit
      Left = 32
      Top = 285
      Width = 101
      Height = 23
      EditLabel.Width = 24
      EditLabel.Height = 15
      EditLabel.Caption = 'IMC'
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
      TabOrder = 4
    end
    object edtCodigo: TLabeledEdit
      Left = 310
      Top = 126
      Width = 99
      Height = 23
      EditLabel.Width = 48
      EditLabel.Height = 15
      EditLabel.Caption = 'C'#243'digo'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'Fixedsys'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object edtCircCabeca: TMaskEdit
      Left = 32
      Top = 370
      Width = 99
      Height = 23
      EditMask = '!0,000 m;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 6
      Text = ' ,    m'
    end
    object edtCircBarriga: TMaskEdit
      Left = 32
      Top = 458
      Width = 99
      Height = 23
      EditMask = '!0,000 m;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Fixedsys'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 7
      Text = ' ,    m'
    end
    object mmObservacoes: TMemo
      Left = 32
      Top = 534
      Width = 377
      Height = 94
      TabOrder = 8
    end
  end
end