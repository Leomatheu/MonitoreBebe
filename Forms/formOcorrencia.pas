unit formOcorrencia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TfrmOcorrencia = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel7: TPanel;
    sbConsultar: TSpeedButton;
    Panel6: TPanel;
    sbExcluir: TSpeedButton;
    Panel5: TPanel;
    sbSalvar: TSpeedButton;
    Image1: TImage;
    edtAcompanhante: TLabeledEdit;
    cbCrianca: TComboBox;
    Label3: TLabel;
    edtData: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtHora: TMaskEdit;
    Label6: TLabel;
    mmOcorrencia: TMemo;
    ckSim: TCheckBox;
    Label4: TLabel;
    ckNao: TCheckBox;
    edtQuantidade: TLabeledEdit;
    Label5: TLabel;
    edtHoraMedicacao: TMaskEdit;
    edtDescricao: TLabeledEdit;
    edtCodigo: TLabeledEdit;
    procedure FormActivate(Sender: TObject);
    procedure ckNaoClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbConsultarClick(Sender: TObject);
    procedure ckSimMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOcorrencia: TfrmOcorrencia;

implementation
uses
  uController, formEditResp;

{$R *.dfm}

procedure TfrmOcorrencia.ckNaoClick(Sender: TObject);
begin
  if (self.ckSim.Checked = true) then
     self.ckSim.Checked := false;

  self.edtDescricao.Enabled := false;
  self.edtHoraMedicacao.Enabled := false;
  self.edtQuantidade.Enabled := false;
  self.Label5.Enabled := false;
end;

procedure TfrmOcorrencia.ckSimMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (self.ckNao.Checked = true) then
     self.ckNao.Checked := false;

  self.edtDescricao.Enabled := true;
  self.edtHoraMedicacao.Enabled := true;
  self.edtQuantidade.Enabled := true;
  self.Label5.Enabled := true;
end;

procedure TfrmOcorrencia.FormActivate(Sender: TObject);
begin
  Controller.pPopulaComboBox(self.cbCrianca, 2);
  self.sbExcluir.Enabled := false;
end;

procedure TfrmOcorrencia.sbConsultarClick(Sender: TObject);
begin
  Controller.pLimpaTelaOcocrrecia;
  frmEditResp := TfrmEditResp.Create(nil);
  controller := TController.Create;
  controller.pPopulaDBGrid('select * from TOCORRENCIA');

  frmEditResp.Panel1.Color := $00D8D8EB;
  frmEditResp.DBGrid1.Color := $00D8D8EB;
  frmEditResp.Caption := 'CONSULTA DE OCORR?NCIAS ';
  frmEditResp.edtBusca.EditLabel.Caption := 'Busque pela data';
  frmEditResp.Tag := 7;
  frmEditResp.ShowModal;

  if (self.edtAcompanhante.Text <> '') then
    self.sbExcluir.Enabled := true;
end;

procedure TfrmOcorrencia.sbExcluirClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pExcluiOcorrencia;
end;

procedure TfrmOcorrencia.sbSalvarClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pCadOcorrencia;
end;

end.
