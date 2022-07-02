unit formConsultorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Mask, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TfrmConsultorio = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtNomeConsultorio: TLabeledEdit;
    Label1: TLabel;
    edtTelefone: TMaskEdit;
    edtEmail: TLabeledEdit;
    edtCodigo: TLabeledEdit;
    Panel3: TPanel;
    edtCEP: TLabeledEdit;
    edtEstado: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    Panel4: TPanel;
    Image1: TImage;
    Panel5: TPanel;
    sbSalvar: TSpeedButton;
    Panel6: TPanel;
    sbExcluir: TSpeedButton;
    Panel7: TPanel;
    sbConsultar: TSpeedButton;
    procedure sbSalvarClick(Sender: TObject);
    procedure sbConsultarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultorio: TfrmConsultorio;

implementation
uses
  uController, formEditResp;

{$R *.dfm}


procedure TfrmConsultorio.FormActivate(Sender: TObject);
begin
  self.sbExcluir.Enabled := false;
end;

procedure TfrmConsultorio.sbConsultarClick(Sender: TObject);
begin
  frmEditResp := TfrmEditResp.Create(nil);
  controller := TController.Create;
  controller.pPopulaDBGrid('select * from TCADCON');

  frmEditResp.Panel1.Color := $00C4C4FF;
  frmEditResp.DBGrid1.Color := $00C4C4FF;
  frmEditResp.Caption := 'CONSULTA DE CONSULTÓRIOS ';
  frmEditResp.Tag := 4;
  frmEditResp.ShowModal;

  if (self.edtNomeConsultorio.Text <> '') then
     self.sbExcluir.Enabled := true;
end;

procedure TfrmConsultorio.sbExcluirClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pExcluiConsultorio;
end;

procedure TfrmConsultorio.sbSalvarClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pCadConsultorio;
end;

end.
