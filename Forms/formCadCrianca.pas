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
    LabeledEdit1: TLabeledEdit;
    Panel8: TPanel;
    sbFoto: TSpeedButton;
    procedure sbFotoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbResp1Change(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCrianca: TfrmCadCrianca;

implementation
uses
   uController, uResponsavel;

{$R *.dfm}

procedure TfrmCadCrianca.cbResp1Change(Sender: TObject);
begin
   self.cbResp2.Enabled := true;
   Controller.pPopulaComboBox(self.cbResp2);

end;

procedure TfrmCadCrianca.FormActivate(Sender: TObject);
begin
   self.sbExcluir.Enabled := false;
   self.cbResp2.Enabled := false;
   Controller.pPopulaComboBox(self.cbResp1);
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
