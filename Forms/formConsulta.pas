unit formConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.Buttons;

type
  TfrmConsulta = class(TForm)
    edtAcompanhante: TLabeledEdit;
    Label1: TLabel;
    edtData: TMaskEdit;
    Label2: TLabel;
    edtHora: TMaskEdit;
    Label3: TLabel;
    cbCrianca: TComboBox;
    edtMotivo: TLabeledEdit;
    Label4: TLabel;
    cbMedico: TComboBox;
    Label5: TLabel;
    cbConsultorio: TComboBox;
    Label6: TLabel;
    mmExames: TMemo;
    Label7: TLabel;
    edtValor: TMaskEdit;
    Label8: TLabel;
    edtProximaConsulta: TMaskEdit;
    Label9: TLabel;
    mmObservacoes: TMemo;
    tPanel1: TPanel;
    tPanel2: TPanel;
    Image1: TImage;
    Panel7: TPanel;
    sbConsultar: TSpeedButton;
    Panel6: TPanel;
    sbExcluir: TSpeedButton;
    Panel5: TPanel;
    sbSalvar: TSpeedButton;
    edtCodigo: TLabeledEdit;
    procedure FormActivate(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsulta: TfrmConsulta;

implementation
uses
  uController, formEditResp;

{$R *.dfm}

procedure TfrmConsulta.FormActivate(Sender: TObject);
begin
  Controller.pPopulaComboBox(self.cbCrianca, 2);
  Controller.pPopulaComboBox(self.cbConsultorio, 3);
  Controller.pPopulaComboBox(self.cbMedico, 4);
  self.sbExcluir.Enabled := false;
end;

procedure TfrmConsulta.sbConsultarClick(Sender: TObject);
begin
  frmEditResp := TfrmEditResp.Create(nil);
  controller := TController.Create;
  controller.pPopulaDBGrid('select * from TCONSULTA');

  frmEditResp.Panel1.Color := $00FFD7D7;
  frmEditResp.DBGrid1.Color := $00FFD7D7;
  frmEditResp.Caption := 'CONSULTAS';
  frmEditResp.Tag := 10;
  frmEditResp.ShowModal;

  if (self.edtAcompanhante.Text <> '') then
     self.sbExcluir.Enabled := true;
end;

procedure TfrmConsulta.sbExcluirClick(Sender: TObject);
begin
  Controller.pExcluiConsulta;
end;

procedure TfrmConsulta.sbSalvarClick(Sender: TObject);
begin
  Controller.pCadConsulta;
end;

end.
