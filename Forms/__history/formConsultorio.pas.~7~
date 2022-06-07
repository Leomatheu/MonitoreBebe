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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultorio: TfrmConsultorio;

implementation
uses
  uController;

{$R *.dfm}


procedure TfrmConsultorio.sbSalvarClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pCadConsultorio;
end;

end.
