program monitoreBebe;

uses
  Vcl.Forms,
  formMenu in '..\Units\formMenu.pas' {frmMenu},
  formCadResp in '..\Forms\formCadResp.pas' {frmCadResp},
  uResponsavel in '..\Units\uResponsavel.pas',
  uController in '..\Units\uController.pas',
  uDao in '..\BD\uDao.pas' {DataModule1: TDataModule},
  formMessage in '..\Forms\formMessage.pas' {frmMessage},
  formEditResp in '..\Forms\formEditResp.pas' {frmEditResp},
  uCariaca in '..\Units\uCariaca.pas',
  formCadCrianca in '..\Forms\formCadCrianca.pas' {frmCadCrianca};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  DataModule1 := TDataModule1.Create(nil);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmCadCrianca, frmCadCrianca);
  Application.Run;
end.
