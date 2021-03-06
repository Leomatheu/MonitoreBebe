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
  uVacina in '..\Units\uVacina.pas',
  formContVacina in '..\Forms\formContVacina.pas' {frmContVacina},
  formConsulta in '..\Forms\formConsulta.pas' {frmConsulta},
  uConsulta in '..\Units\uConsulta.pas',
  formCrescimento in '..\Forms\formCrescimento.pas' {frmCrescimento},
  formOcorrencia in '..\Forms\formOcorrencia.pas' {frmOcorrencia},
  uCrescimento in '..\Units\uCrescimento.pas',
  uOcorrencia in '..\Units\uOcorrencia.pas',
  formCadItem in '..\Forms\formCadItem.pas' {frmCadItem},
  formUtensilios in '..\Forms\formUtensilios.pas' {frmUtensilios},
  uUtensilios in '..\Units\uUtensilios.pas',
  uItens in '..\Units\uItens.pas',
  formFiltroRelatorios in '..\Forms\formFiltroRelatorios.pas' {frmFiltros},
  formSelecaoRelatorio in '..\Forms\formSelecaoRelatorio.pas' {frmSelecaoRel},
  formRelatorio in '..\Forms\formRelatorio.pas' {frmRelatorio},
  formRelatorioConsultas in '..\Forms\formRelatorioConsultas.pas' {frmRelatorioConsultas};

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  DataModule1 := TDataModule1.Create(nil);
  Controller := TController.Create;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmFiltros, frmFiltros);
  Application.CreateForm(TfrmSelecaoRel, frmSelecaoRel);
  Application.CreateForm(TfrmRelatorio, frmRelatorio);
  Application.CreateForm(TfrmRelatorioConsultas, frmRelatorioConsultas);
  Application.Run;
end.
