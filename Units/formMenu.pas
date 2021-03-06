unit formMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmMenu = class(TForm)
    Panel1: TPanel;
    pnBotoes: TPanel;
    Image2: TImage;
    Panel3: TPanel;
    sbCadResponsavel: TSpeedButton;
    Image1: TImage;
    Panel4: TPanel;
    sbCadCrianca: TSpeedButton;
    Image3: TImage;
    Panel2: TPanel;
    sbCadAlimentacao: TSpeedButton;
    Image4: TImage;
    Panel5: TPanel;
    sbControleVacina: TSpeedButton;
    Image5: TImage;
    Panel6: TPanel;
    sbCadConsultorio: TSpeedButton;
    Image6: TImage;
    Panel7: TPanel;
    sbCadMedico: TSpeedButton;
    Image7: TImage;
    Panel8: TPanel;
    Image8: TImage;
    sbControleConsultas: TSpeedButton;
    Panel9: TPanel;
    sbUtensilios: TSpeedButton;
    Image9: TImage;
    Panel10: TPanel;
    sbCadOcorrecias: TSpeedButton;
    Image10: TImage;
    Panel14: TPanel;
    sbControleCrescimento: TSpeedButton;
    Image12: TImage;
    Panel15: TPanel;
    sbRelatorios: TSpeedButton;
    Image13: TImage;
    procedure sbSairClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbCadResponsavelClick(Sender: TObject);
    procedure sbCadCriancaClick(Sender: TObject);
    procedure sbCadAlimentacaoClick(Sender: TObject);
    procedure sbCadConsultorioClick(Sender: TObject);
    procedure sbCadMedicoClick(Sender: TObject);
    procedure sbControleVacinaClick(Sender: TObject);
    procedure sbControleConsultasClick(Sender: TObject);
    procedure sbCadOcorreciasClick(Sender: TObject);
    procedure sbControleCrescimentoClick(Sender: TObject);
    procedure sbUtensiliosClick(Sender: TObject);
    procedure sbRelatoriosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation
uses
   formCadResp, formCadCrianca, formAlimentacao, formConsultorio, formCadMedico, formContVacina,
   formConsulta, formOcorrencia, formCrescimento, formUtensilios, formSelecaoRelatorio;

{$R *.dfm}



procedure TfrmMenu.sbCadAlimentacaoClick(Sender: TObject);
begin
  frmAlimentacao := TfrmAlimentacao.Create(nil);
  frmAlimentacao.ShowModal;
end;

procedure TfrmMenu.sbCadConsultorioClick(Sender: TObject);
begin
  frmConsultorio := TfrmConsultorio.Create(nil);
  frmConsultorio.ShowModal;
end;

procedure TfrmMenu.sbCadCriancaClick(Sender: TObject);
begin
  frmCadCrianca := TfrmCadCrianca.Create(nil);
  frmCadCrianca.ShowModal;
end;

procedure TfrmMenu.sbCadMedicoClick(Sender: TObject);
begin
  frmCadMedico := TfrmCadMedico.Create(nil);
  frmCadMedico.ShowModal;
end;

procedure TfrmMenu.sbCadOcorreciasClick(Sender: TObject);
begin
  frmOcorrencia := TfrmOcorrencia.Create(nil);
  frmOcorrencia.ShowModal;
end;

procedure TfrmMenu.sbCadResponsavelClick(Sender: TObject);
begin
   frmCadResp :=  TfrmCadResp.Create(nil);
   frmCadResp.ShowModal;
end;

procedure TfrmMenu.sbControleConsultasClick(Sender: TObject);
begin
  frmConsulta := TfrmConsulta.Create(nil);
  frmConsulta.ShowModal;
end;

procedure TfrmMenu.sbControleCrescimentoClick(Sender: TObject);
begin
  frmCrescimento := TFrmCrescimento.Create(nil);
  frmCrescimento.ShowModal;
end;

procedure TfrmMenu.sbControleVacinaClick(Sender: TObject);
begin
  frmContVacina := TfrmContVacina.Create(nil);
  frmContVacina.ShowModal;
end;

procedure TfrmMenu.sbRelatoriosClick(Sender: TObject);
begin
  frmSelecaoRel := TfrmSelecaoRel.Create(nil);
  frmSelecaoRel.ShowModal;
end;

procedure TfrmMenu.sbSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmMenu.sbUtensiliosClick(Sender: TObject);
begin
  frmUtensilios := TfrmUtensilios.Create(nil);
  frmUtensilios.ShowModal;
end;

procedure TfrmMenu.SpeedButton1Click(Sender: TObject);
begin
  self.Close;
end;

end.
