object frmConsultorio: TfrmConsultorio
  Left = 0
  Top = 0
  Caption = 'CADASTRO DE CONSULT'#211'RIOS'
  ClientHeight = 464
  ClientWidth = 688
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
    Width = 497
    Height = 464
    Align = alLeft
    Color = 12895487
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 393
      Width = 112
      Height = 15
      Caption = 'Tel. Comercial'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
    end
    object edtNomeConsultorio: TLabeledEdit
      Left = 32
      Top = 48
      Width = 425
      Height = 22
      EditLabel.Width = 128
      EditLabel.Height = 15
      EditLabel.Caption = 'Nome Consult'#243'rio'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'Fixedsys'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtTelefone: TMaskEdit
      Left = 32
      Top = 415
      Width = 175
      Height = 22
      EditMask = '!\(99\)0000-0000;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 13
      ParentFont = False
      TabOrder = 1
      Text = '(  )    -    '
    end
    object edtEmail: TLabeledEdit
      Left = 32
      Top = 344
      Width = 425
      Height = 22
      EditLabel.Width = 48
      EditLabel.Height = 15
      EditLabel.Caption = 'E-mail'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Fixedsys'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtCodigo: TLabeledEdit
      Left = 336
      Top = 416
      Width = 121
      Height = 22
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object Panel3: TPanel
      Left = 32
      Top = 96
      Width = 425
      Height = 209
      TabOrder = 4
      object edtCEP: TLabeledEdit
        Left = 16
        Top = 32
        Width = 105
        Height = 22
        EditLabel.Width = 24
        EditLabel.Height = 15
        EditLabel.Caption = 'CEP'
        EditLabel.Font.Charset = ANSI_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Fixedsys'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edtEstado: TLabeledEdit
        Left = 232
        Top = 32
        Width = 161
        Height = 22
        EditLabel.Width = 48
        EditLabel.Height = 15
        EditLabel.Caption = 'Estado'
        EditLabel.Font.Charset = ANSI_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Fixedsys'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edtCidade: TLabeledEdit
        Left = 16
        Top = 94
        Width = 153
        Height = 22
        EditLabel.Width = 48
        EditLabel.Height = 15
        EditLabel.Caption = 'Cidade'
        EditLabel.Font.Charset = ANSI_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Fixedsys'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object edtBairro: TLabeledEdit
        Left = 232
        Top = 94
        Width = 161
        Height = 22
        EditLabel.Width = 48
        EditLabel.Height = 15
        EditLabel.Caption = 'Bairro'
        EditLabel.Font.Charset = ANSI_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Fixedsys'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object edtEndereco: TLabeledEdit
        Left = 16
        Top = 160
        Width = 377
        Height = 22
        EditLabel.Width = 64
        EditLabel.Height = 15
        EditLabel.Caption = 'Endere'#231'o'
        EditLabel.Font.Charset = ANSI_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -13
        EditLabel.Font.Name = 'Fixedsys'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
    end
  end
  object Panel2: TPanel
    Left = 496
    Top = 0
    Width = 192
    Height = 464
    Align = alRight
    Color = 12895487
    ParentBackground = False
    TabOrder = 1
    object Panel4: TPanel
      Left = 27
      Top = 22
      Width = 137
      Height = 147
      TabOrder = 0
      object Image1: TImage
        Left = 16
        Top = 24
        Width = 105
        Height = 105
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000400000
          00400806000000AA6971DE0000000970485973000012740000127401DE661F78
          000013024944415478DAED9A07745555BA80FFBD4FBB25378DC4000142151844
          1920D291412001790AD81591DE431240CACCAC79A3B25089B484988412A42932
          224DC000221D91264A8D20A184407ABBE5F4F7EF03FAD6ACA7A6BC8CB19DB592
          DC9CBBEFDEFFFFED7FFFED5C02BFF38BD4B600B57DFD01A0B605A8EDEB0F00B5
          2D406D5FB50AA0F0A616F8D1BF366D9665AF73D2AC6191BF2B00B72E96B4DAB0
          FEC31D9E92B226BC408113CCF3CFBEF84CB7067FAA57FC9B06602A263D7B3473
          44C6C719CB54C54B1A370C0145D720F78E0740E0B3FA0DFC4BF4433D1EB8F49B
          0480CA93CFB61E5E79ECD09197795383071F6C01911D5B81288A70F8F039387D
          361354AA1776E9D16D6C9FC1BD36FEE600BCF7CE96DDD9DF66F5E14D1F74E9DC
          129A370F039B0D40450B20C40EE72EDC84E3A7AE41B9D770D76FDC60C5C8D8A7
          637F13004A6E79C89AF4F5C73C45251D79AA92E87E5DF5F0FA2227082A288A0C
          84A340790E645980BC3C1E32761F06AF6A78FD025DEB62FE367ACCAF1AC0F5B3
          85FE1BD67D701034A599CB0FCCA8A84E692E7F0825A6B72BA1D09C120E0CC300
          D5D0F02848A06A5475BBC9D9BD7BCE34CFCFF76854E0D74D7F3336E65709E0F8
          9E330FEFD9B1EF7D8198410DC3032E3DD2ABFD64BB9F6A37C153CF344D07501A
          61B7B9F0104084DB53D21FBD4410C79B977595CF56DCCE0D870E9E1971ED7ABE
          9D0AE26791DD3AC4F578BCBBFEAB01B065D5EE6917CF9E1B0FAA5B7AA86D930D
          1D3A349B13DAAE9315E28ABE39504F37A92BE4FEEE99DF8DF7647F1DE6F39675
          A786D64A5394E09007FA4C2B3D77DAEFD4C92BD34F9CFAA62F15FC0EB5F9F39F
          5F8D7AA1BBE7170F604DD2C6D4EC6BD7A305B4E69E5DDB4C8F1CF4D8CECA7CCE
          977DD6E52ECDEF601385ABCE66DDAE7D77FFF496DDEDF61DFA7AB66AD0BCBA0D
          EBAF1916F7CCB15F2C8065AFAEDF5A5874FB41BB53CD898EEA34F0FE9E3D0B6A
          6AEE77FEF9F69CB242729F7F50F08E09AF8ED8FC8B0270ED542ED9FAC1F6233E
          4F6978583DBF533D7BB719DCB87367B3329FF5DEB94DEC61752B35F6FD79E92F
          6565E57697029D47A7CE8D79F71701E0E4EE33C17B3E3E789007DDD6A479D0E6
          2131C3A6FDD8D8AC2F2ED83ED9B17F7D69B1DA9252D1A6EBBA28F2020F9A6CEA
          20EB62A090D3AF7F97A75B758EBCFA63736C4F59D5ED62E69DE7659DBFF6D7C4
          A909B50A60E7AA1DD15F9D3A9B2072A2DEB275A37503C60CF949811267BFB345
          2D36FB39096F03CD009EF0A02A3EB0F114644E07B783331D21FC8E097F1D37F0
          A7E6D9B7765BCB13A732A7CB26B85AB76DF3F29091D1F2CF0E207DD1FBAF17DF
          CAE9454D45E9D53B7258BBFE8F6657F4990553928FF8CB6297C84641E0D0D1A1
          1B3A3858FCF719508C300EDD298132BB7676F6C2496D2B9AEBCB5D9F92FD9F9D
          58E9F59A910D1A36797EE8B467BFFAD90024CE59B6A5ACA0A869800D2E0C88EE
          FE6CD347BA56EA0C2F9A94722CD8273CDC355C04975E0A443700F087A70214F1
          2E3858AC430EE7BD383B7162EBCACAB2FC9F0BD717E4AB6D034243568DFFEF91
          F3FEA3002E9FCC726EDCB069B76968417543FCF70F9F396E7C95C0C5A47D11E8
          E122BBD4E52108BCA8BC080247C0446B70DB03606B561194B9F8F3331227B6A9
          CABCEB1356ACBB76B3A01788D21733136207FF47001CDB79F291BD199FBDC173
          A6BD458B86DB078D7FEEEF5505983421EDCB40993CD43DDC0E2EC303A6268088
          B580A1B9A14CB2C1DE5C2F1488F4CCB4A489EDAA3AF7B6D4F7D79CBB786D3027
          39AE76E8DC7E48EFC1DDBFA931005BD377BDF6CDF9CCC7156FB1D6A34787C5DD
          9FEBBFE6A7C65F3C7AC1B5EB9343095EB7AF99A96A0E89DA044E21947849A386
          0E31F4417F02FE440603B0165035B0A3132C30383851A643B6AE9B2091531A51
          B14432894674DE1EE8B815D5BFE7D0FB1F6E7DE7A7D63DFCE1E6B4C347BF1ECE
          F3815A44B366739E1C3BE08DFF378055F3DFDB74EBDAAD8E4E49287EB4CFC363
          DA4475F9BCA2CF24FF635992AF88BC2C698A8B575490A80422163E1235A09E9F
          088DED0424436681008861828317C14304B8E45321C7AB810F0B249FAA60994C
          C0100428A6BAE208E633A6BC36EEF18AD6FE2A63CFDCFD074E4FF378400C0B6F
          F0DEF0E9CFBF582D0079974BF875E91B3354AFA7434020E4F5EED57E78F347BA
          1EAE0CB44531C9194E59E8D7A36928D8BD1E7476266001843BAE011E21B0991A
          60F0C0325800504D109925500ECA29FE8B4AE31BF883CA530A1E9B0DF667E740
          99209F9C3D7F6AC78AD62EBAF87993C242DF0BFB3E3DF57A6E2E25FE01217B26
          CD19DAB74A00CE1CB81499B17D6FAAE115DB4B8201439E8AEC15D1A5DDFECA28
          CFAE25F169BB5DE5669F6EA136A883679DA28226A63A3A7378B82A31A9358E63
          F7310A3040580DE20D03219977DF478BD1F04F2EC238908FE1D1619E9CB1B062
          008517F78522EB0EB2D72F7CC3DA2F962B9A1D38BB717CC090BE8FB6EED4A8AC
          420007B67DF9FC91FD475FC312BD21D14589A36E65D4D8BFF8D769D3B6D2C9C6
          9B318B36D691F921BDEBFA411DDD6729CFEA7E035198262A6D502B0942ED0199
          A0CA1A56C780E190590A4B0F7804452D20F9783C0EE779A080574EC527C575A8
          CCFA859776B507B34E517ACAFE6F353D004030549578CF74ECDAE6F5FE4F3DBA
          F54701AC5FBA6DC9A5F3579E724AA2D6B777D4D2BDBB8EBEAAEA45B9C3C7F468
          705F9B766A6501244C4B5918580E717DEBF943A05A86566E584740001E7717CD
          1DCD805905138010A63E3A445306D41F7D02FB91807202E854C7C4C80FF6DC2C
          8432277C1EBB787297CAAC9F7FF1D3A6C4747957A4EDCFE6683089EADFF7C9ED
          BBB7BEA253F54644D3F0F75E1CFBCCE6FF036059D2EA35B7AFE77776D8ECB9C3
          860E7932B465D8ED79B1CB4B80A8C5A327F6691A7C7F8B4A3724DE8C491D5DC7
          CB2DEB57D70E7E4A29289429CB8168B2DF4C4BDC69541435C4734E4095902DA6
          C202AEC069783074C1B20099AA50204870905980A4EC9AB9784A54656528BF9A
          49D3966C2D51145E989D14672BC82CA6E9ABDE5BE195BD37C31BDDB767D49497
          F6FF1B80D54B3F48D67CBA3472CA0BA3BFBBF756DCD26C14AF7CC6A2492D2BBB
          B06501B1A983FC656953F73017D875DC5D4EB43C3AAFF950490D9D9E824AE259
          C7573A025178D9F20F9A41F09E04BC295ABE40114CCC0F24387C331FFF7A57CF
          5A38F5E5AAC8312F2EA184171CFAD48449C1DFDD5BB168ED139C40B2874F7AF1
          448561F0ADB8942B8428C68C85B12DAAB270CAEC659D9572BA40548C2EA2E5D0
          501DF4057E128586FE0E08C770E8C2F0676A04040C73A82A94A13439A60057F3
          8B419175A0A8B84757C1B00B8029D379FB7DC2EAF1FF18F7569536226E71AE61
          0AD2CCC513037EE8FD0A01BC119FFC0DFA621E0134A9CAC2EC4AFEFBD2365E8F
          DE44578DE6E8D63A89948410D56C519790884EC10110A8C968E61C164232703C
          0137668247F3CBA090E7342A1AD96EAF07E9887926356F0406398FF7EAD7E59D
          E69D1FA8D293A384D8E43C1D88306BF1C4C06A01400BB84441B3BDB22826A2AA
          007EE85A3079E1F12037E9D8BF413DB0794A31C9C108C04223BA85023C26070A
          DC90CBF9CAFF9614EFAA89F512E292F274939310807F3501A4665253B7BFB278
          52C39A1068F1D425C7FD8AA0E380066108A000303D647E1054C580726730EC61
          E5B0CBCC9F316F5C684DAC373F36A94005CE86009CD50310BBFC0AFA62090134
          A809811262165F0A566CF7F7ACEBC2FCC08BE65F0A9220A20F90A0880B80CF72
          CB215728CF9D9D1C1356330092F355E0FD662D1E67AB168037E2965EE1416647
          20BC26045A109798E9A7395BB40DF68360A2808303D064C58A066E31000EDECA
          8752C9737946E2E42A39DD1F051E9B9CAB031F8000A4EA01884FBEC281629FB1
          30BE7E4D0894F2D7B423DE22AE8B3F8709912A633A80D1C1C09088315FC1DAAF
          54140CC329EF9F317772EF1A011097744737198009D5B380B95393BF6500662E
          88AF571302657D7E3EE0939D47F7161795FF8952F6CD00F66C4C33051EDCB2EA
          F5D943FC8FF7FDAF5E8FB76ADF5AAB1100B1C97730A0FA23007BB500BC3175D9
          352CDBA4D90B27D5AD09817EEE2B2136E5B66E8A7566258E12AA05E0D5D8946C
          8933B9590B26FE4A01A4220021100154D3094E7BE73A317C0E4C41436A5B99AA
          5E6A5E3E5D34E75F088077CC4A1CE3572D0073E3136F6206E79A3E3F26A0A2B1
          BFB44BBFAD8A8BE6AEC8D588A1612AFC831B58218037E39664F13A174104A5CC
          3075AFA1139F40055DD7555E10394345BC2631309135D919E34CF4E758E8A14F
          577172C3434D2A0350432582CF04AAE0188343CF2FE8060640D0B0F09375AC81
          709CC2EA2083C54300077ED68E1142C2FB92C12A67AC19598B885ACD774CCD08
          EB9A18AC5D40AD76020EB09466B594C953AC24512C0E4F2F0468D4973363F194
          FAD50290109F9A25EA10A142217082F67D0787352F348D353158E382AD6D8241
          FE774ACE54EFBE3279ABBF8355B06C30459115139833359E0DD609D5F13D15EE
          2AC1203AFE4DAE7B859461ADC1FA23AC9344C1FC5E01C3FA817B770CD64304B6
          26B57A0A9C6E0795CA37A727C6FD60265B2180F953526FF050DE60C4F8EE6E83
          CB71822983C0921745078917AD2687459EDE03600ADF0360D39B58D65A0A706E
          DC652845A13251A96BB8F385084EA406F5A1D808C8AC83961121E8D00C550CD3
          9105C2B1DA6796F244B736192D0271927B7FE11E7CF87E03585ACD8A6C0600B4
          D0BDAB538EF5C6742B677AE2E4EA59C0FC292937789ADF60F8F8078017F371F7
          25AB8D25F21ED0B1AEA7A8206B5CE8E49E304443C178A0BA93DD40C5BDA82FB3
          06F5AED0BACD524A117C28240754F3C7FBAC175882FFC9C0EB22F242E5118061
          19BE7A776F0D27CE81A901578EE31104EE2CB0CE12BD0B87CD6F12F6DB7977F7
          89170184C1EA2517C06706154F4F9A18542D006FC5267EEB108B9A0C1DD50C78
          4E858C2DD72DF2FD073606CAFBF075306CDBBA1BD899881ED013785B295A8704
          9F6CB982191E81FE835A203805D35D07ECDCB10FBD8100518FF502CE5E048A2A
          C1CE4D57AD36D880C111208A581B282ED8B9FD000ACFC1634F4423D83C300C1B
          647C7C15E7F5C1E0A73043A65E907D81B02BE388655DFDA27A802495A01D49B0
          E9A3F3388F03A2A35AA16C4E5899F21516F3758AE3174EA81E80F9D3522F8376
          A3D9D829AD819DDED4456741C4B275DCC48740330B41514260EDDACD68141A0C
          1FFD34EE760E9ABD1FAC4D3D6F7574464C680B8A510436D204962DDD60C11B35
          EE39BCF72D020D86F49473568B6CF8D85660F0A5082D1CD2576CB47A87435F1A
          0482BD10EFF9436AE217200804D76D0B2ACE0766042C5FF61130AF386AD49338
          EF4DE0F940484B3B6D55969326F6B07A8FA94B4E80CC85F8B098AB5E26F8D694
          942C1E722226C4B7C58CD507CB979CB3BAB923C6E291903CB85818AC5AFDA1F5
          DEB0D14FA14079F8A920588B8A29BA0263A73C8066590A546E0C2B576E42E3D4
          E0A5914FA2F5E4A199BA70BE632838B5E633C00D86DE0056A67F0812C7C14BC3
          07A189B30741FEB06AE957A0AA3E183DA10D5A145A8ADC08DE5DB1D9B29E5123
          87E0BD6C50641121E306893618391AE5C5D391BE34131404306DFEF8EA01783B
          3EFDAA00B98D878D6B84A6E7864FB7DF021D1DE0A0A75B83A696E04E84C08E9D
          7B991B84A8FE3DC1E654C0EBE670DC75D0B1C8891ED410B37DACF6B4FAB0E363
          F658418301031FC1E35B845663C3A392899640A04F744370F871E07607C0CE9D
          87D02AEE8E23A408544DC463711903AC0E039F688ED14801C51B0A3B761CB22C
          6A201E3D49BC3B6EDBC757D0323578ECB12638DE0FD2522E814C428D998B2670
          D502306F72FA6D892F081B31B9313A20346FCD65797E9EF75AC188336DA0AB18
          D70566C80686461FBEC6D023A32364B112A1510CD69836582193392C83557F02
          46063CE7A007A3896B7886CB50010FC20A44A5053CEF58C50B26424267C6B1D0
          E787C7CD07360CC5AAA658E75D941C96E395F13E45A579410237421024D6702F
          C23543213D350B14B80F5E593096540980A9980EDC04F2F6CC776FF250143872
          420720FC1DEB5CB3EFF67ADD1E1446BCA7BC8082EAD6430F8172D6979F79E69D
          99E01A1A3D7A6D11CD5C45C5298BDB1C2B003182A0A294D8ADBCC234BD0805F7
          9D453B8C163C8E51B15CFE0EAC8CE66FB7DBAD262A168FD6374B354305CCF270
          2C7BBCC6A17C1CE8BC0A5ED90D0E2C2F4DBD2EA4251D634E1066CC1BC311F1FB
          98F9E300D213D71FBF9175A7919DB739342FEE0C1A17E67122C7CBB853320AC9
          E34E78913EB57684FD4FD8030C3C162C183100EC153357D6EE66FE82653AEC4B
          10268785297B97591091ACE7049852DEB5140CADAC6DAEB1563956C84C718341
          45EB60079DE3EE8E6596214976EBC18AC19E2FB2274BB83E6FDA4196BD4044DC
          35844D55CC050CD68A0FC2E08AD8250D61992AC194B47E78D8A5E1D307B7FA41
          00EFA67C78F8C6D5DB4D7459171CA2908FF12B0FF7B58468364C69B92C8398A7
          791E2E28AAF7362F72B2AA2B3654308CE7C570C33059E3D4854724805282D98D
          CE99EC3918B02849652B69C2DBD6135F9D63D519E6CD566A87E30806196ABDC6
          CB545535108751965FDDCB02D9E72CFB300C83222403C7A14CB8AA66E226713C
          AE4175EAB3E1FBFE9C6173E2E401065103744C3E7CA012B45C8A46686FD63CE2
          D4F3931F8FAC940FF8AD5F7F00A86D016AFBFA03406D0B50DBD71F006A5B80DA
          BE7EF700FE07F0E5B0B93FBD34CB0000000049454E44AE426082}
        Stretch = True
      end
    end
    object Panel5: TPanel
      Left = 16
      Top = 410
      Width = 159
      Height = 28
      Color = 317753
      ParentBackground = False
      TabOrder = 1
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
<<<<<<< HEAD
        ExplicitLeft = 64
        ExplicitTop = -1
        ExplicitWidth = 94
=======
        OnClick = sbSalvarClick
        ExplicitLeft = 32
        ExplicitWidth = 125
>>>>>>> Consultorio
      end
    end
    object Panel6: TPanel
      Left = 16
      Top = 376
      Width = 159
      Height = 28
      Color = clRed
      ParentBackground = False
      TabOrder = 2
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
        ExplicitLeft = 72
        ExplicitTop = 2
        ExplicitWidth = 86
      end
    end
    object Panel7: TPanel
      Left = 16
      Top = 342
      Width = 156
      Height = 28
      Color = 14869218
      ParentBackground = False
      TabOrder = 3
      object sbConsultar: TSpeedButton
        Left = 1
        Top = 1
        Width = 154
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
        ExplicitLeft = 64
        ExplicitTop = 6
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
  end
end
