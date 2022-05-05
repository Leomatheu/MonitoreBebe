program monitoreBebe;

uses
  Vcl.Forms,
  formMenu in '..\Units\formMenu.pas' {frmMenu},
  formCadResp in '..\Forms\formCadResp.pas' {frmCadResp},
  formEditResp in '..\Forms\formEditResp.pas' {frmEditaResp},
  uResponsavel in '..\Units\uResponsavel.pas',
  uController in '..\Units\uController.pas',
  uDao in '..\BD\uDao.pas' {DataModule1: TDataModule},
  formMessage in '..\Forms\formMessage.pas' {frmMessage};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
