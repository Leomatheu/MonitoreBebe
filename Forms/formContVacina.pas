unit formContVacina;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons;

type
  TfrmContVacina = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtData: TMaskEdit;
    Label2: TLabel;
    edtHora: TMaskEdit;
    edtNomeVacina: TLabeledEdit;
    rbPostoSaude: TRadioButton;
    rbConsultorio: TRadioButton;
    rbOutros: TRadioButton;
    rbHospital: TRadioButton;
    Label3: TLabel;
    edtComplemento: TEdit;
    edtNomeProfissional: TLabeledEdit;
    edtCodigo: TLabeledEdit;
    Label4: TLabel;
    edtProximaData: TMaskEdit;
    Panel4: TPanel;
    Image1: TImage;
    Panel5: TPanel;
    sbSalvar: TSpeedButton;
    Panel6: TPanel;
    sbExcluir: TSpeedButton;
    Panel7: TPanel;
    sbConsultar: TSpeedButton;
    edtAcompanhante: TLabeledEdit;
    Label5: TLabel;
    cbCrianca: TComboBox;
    procedure sbSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbConsultarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContVacina: TfrmContVacina;

implementation
uses
  uController, formEditResp;

{$R *.dfm}

procedure TfrmContVacina.FormActivate(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pPopulaComboBox(self.cbCrianca, 2);

  self.sbExcluir.Enabled := false;
end;

procedure TfrmContVacina.sbConsultarClick(Sender: TObject);
begin
  frmEditResp := TfrmEditResp.Create(nil);
  controller := TController.Create;
  controller.pPopulaDBGrid('select * from TCONVACI');

  frmEditResp.Panel1.Color := $0080FFFF;
  frmEditResp.DBGrid1.Color := $0080FFFF;
  frmEditResp.Caption := 'CONSULTA DE VACINAS ';
  frmEditResp.edtBusca.EditLabel.Caption := 'Busque pela vacina';  
  frmEditResp.Tag := 6;
  frmEditResp.ShowModal;

  if (self.edtData.Text <> '') then
    self.sbExcluir.Enabled := true;
end;

procedure TfrmContVacina.sbExcluirClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pExcluiVacina;
end;

procedure TfrmContVacina.sbSalvarClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pCadVacina;
end;

end.
