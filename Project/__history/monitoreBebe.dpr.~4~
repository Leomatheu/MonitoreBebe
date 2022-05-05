program monitoreBebe;

uses
  Vcl.Forms,
  formMenu in '..\Units\formMenu.pas' {frmMenu},
  formCadResp in '..\Forms\formCadResp.pas' {frmCadResp},
  formEditResp in '..\Forms\formEditResp.pas' {frmEditaResp},
  uResponsavel in '..\Units\uResponsavel.pas',
  uController in '..\Units\uController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmCadResp, frmCadResp);
  Application.CreateForm(TfrmEditaResp, frmEditaResp);
  Application.Run;
end.
