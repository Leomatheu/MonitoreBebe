unit formCadMedico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Buttons;

type
  TfrmCadMedico = class(TForm)
    Panel1: TPanel;
    edtNome: TPanel;
    edtEmail: TLabeledEdit;
    Label1: TLabel;
    edtTelefone: TMaskEdit;
    edtCRM: TLabeledEdit;
    edtEspecialidade: TLabeledEdit;
    Label2: TLabel;
    cbConsultorio: TComboBox;
    Panel4: TPanel;
    Image1: TImage;
    edtCodigo: TLabeledEdit;
    Panel7: TPanel;
    sbConsultar: TSpeedButton;
    Panel6: TPanel;
    sbExcluir: TSpeedButton;
    Panel5: TPanel;
    sbSalvar: TSpeedButton;
    EditNome: TLabeledEdit;
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
  frmCadMedico: TfrmCadMedico;

implementation
   uses
     uController, formEditResp;

{$R *.dfm}

procedure TfrmCadMedico.FormActivate(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pPopulaComboBox(self.cbConsultorio, 3);
  self.sbExcluir.Enabled := false;
  self.EditNome.SetFocus;
end;

procedure TfrmCadMedico.sbConsultarClick(Sender: TObject);
begin
  frmEditResp := TfrmEditResp.Create(nil);
  controller := TController.Create;
  controller.pPopulaDBGrid('select * from TCADMED');

  frmEditResp.Panel1.Color := $00FF9D9D;
  frmEditResp.DBGrid1.Color := $00FF9D9D;
  frmEditResp.Caption := 'CONSULTA DE M?DICOS ';
  frmEditResp.Tag := 5;
  frmEditResp.ShowModal;

  if (self.EditNome.Text <> '') then
     self.sbExcluir.Enabled := true;
end;

procedure TfrmCadMedico.sbExcluirClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pExcluiMedico;
end;

procedure TfrmCadMedico.sbSalvarClick(Sender: TObject);
var
   controller : TController;
begin
  controller := TController.Create;
  controller.pCadMedico;
end;

end.
