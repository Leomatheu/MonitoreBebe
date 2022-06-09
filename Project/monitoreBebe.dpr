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
  uCrianca in '..\Units\uCrianca.pas',
  formCadCrianca in '..\Forms\formCadCrianca.pas' {frmCadCrianca},
  formAlimentacao in '..\Forms\formAlimentacao.pas' {frmAlimentacao},
  uAlimentacao in '..\Units\uAlimentacao.pas',
  uConsultorio in '..\Units\uConsultorio.pas',
  uMedico in '..\Units\uMedico.pas',
  formConsultorio in '..\Forms\formConsultorio.pas' {frmConsultorio},
  formCadMedico in '..\Forms\formCadMedico.pas' {frmCadMedico},
  formConsulta in '..\Forms\formConsulta.pas' {frmConsulta},
  uConsulta in '..\Units\uConsulta.pas';

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  DataModule1 := TDataModule1.Create(nil);
  Controller := TController.Create;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
