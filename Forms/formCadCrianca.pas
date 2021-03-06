unit formCadCrianca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.Imaging.jpeg, Vcl.ExtDlgs, Vcl.Buttons;

type
  TfrmCadCrianca = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtNome: TLabeledEdit;
    Label1: TLabel;
    edtDataNasc: TMaskEdit;
    edtCPF: TMaskEdit;
    Label2: TLabel;
    edtHospNasc: TLabeledEdit;
    Panel3: TPanel;
    ckMasculino: TCheckBox;
    ckFeminino: TCheckBox;
    Label3: TLabel;
    edtNomePai: TLabeledEdit;
    edtNomeMae: TLabeledEdit;
    edtPeso: TMaskEdit;
    Label4: TLabel;
    cbResp2: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    mmObservacoes: TMemo;
    Label7: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel4: TPanel;
    imgCadCri: TImage;
    cbResp1: TComboBox;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    sbConsultar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbSalvar: TSpeedButton;
    edtCodigo: TLabeledEdit;
    Panel8: TPanel;
    sbFoto: TSpeedButton;
    procedure sbFotoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbConsultarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCrianca: TfrmCadCrianca;

implementation
uses
   uController, uResponsavel, formEditResp;

{$R *.dfm}

procedure TfrmCadCrianca.FormActivate(Sender: TObject);
begin
   self.sbExcluir.Enabled := false;
   self.edtNome.SetFocus;
   Controller.pPopulaComboBox(self.cbResp2, 1);
   Controller.pPopulaComboBox(self.cbResp1, 1);
end;

procedure TfrmCadCrianca.sbConsultarClick(Sender: TObject);
begin
  frmEditResp := TfrmEditResp.Create(nil);
  controller := TController.Create;
  controller.pPopulaDBGrid('select * from monitorebebe.TCADCRI;');

  frmEditResp.Panel1.Color := $00FEF9CB;
  frmEditResp.DBGrid1.Color := $00FEF9CB;
  frmEditResp.Caption := 'EDI??O DE CRIAN?AS';
  frmEditResp.edtBusca.EditLabel.Caption := 'Busque pela crian?a';
  frmEditResp.Tag := 2;
  frmEditResp.ShowModal;

  if (self.edtNome.Text <> '') then
     self.sbExcluir.Enabled := true;
end;

procedure TfrmCadCrianca.sbExcluirClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pExcluiCrianca;
end;

procedure TfrmCadCrianca.sbFotoClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;

  if (OpenPictureDialog1.Execute) then
     begin
       imgCadCri.Picture.LoadFromFile(OpenPictureDialog1.FileName);
       imgCadCri.Picture.SaveToFile(controller.fRetornaDirFoto);
     end;
end;

procedure TfrmCadCrianca.sbSalvarClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pCadCrianca;
end;

end.
