unit formCadResp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ExtDlgs,
  Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmCadResp = class(TForm)
    Panel2: TPanel;
    edtNome: TLabeledEdit;
    Panel1: TPanel;
    Label1: TLabel;
    edtCPF: TMaskEdit;
    edtEmail: TLabeledEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtResidencial: TMaskEdit;
    edtCelular: TMaskEdit;
    mmObservacao: TMemo;
    Label4: TLabel;
    edtRendaMensal: TMaskEdit;
    Label5: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    imgCadResp: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    edtCEP: TLabeledEdit;
    edtEstado: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    edtDataNasc: TMaskEdit;
    Label6: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadResp: TfrmCadResp;

implementation
uses
   formEditResp, uController;

{$R *.dfm}



procedure TfrmCadResp.SpeedButton1Click(Sender: TObject);
begin
   if (OpenPictureDialog1.Execute) then
      begin
         imgCadResp.Picture.LoadFromFile(OpenPictureDialog1.FileName);
         imgCadResp.Picture.SaveToFile('C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\Foto.Jpeg');
      end;
end;

procedure TfrmCadResp.SpeedButton2Click(Sender: TObject);
begin
   frmEditaResp := TfrmEditaResp.Create(nil);
   frmEditaResp.ShowModal;
end;

procedure TfrmCadResp.SpeedButton4Click(Sender: TObject);
var
   controller : TController;
begin
  controller := TController.Create;
  controller.pCadResponsavel;

end;

end.
