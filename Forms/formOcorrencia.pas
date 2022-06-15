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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOcorrencia: TfrmOcorrencia;

implementation
uses
  uController;

{$R *.dfm}

procedure TfrmOcorrencia.FormActivate(Sender: TObject);
begin
  Controller.pPopulaComboBox(self.cbCrianca, 2);
end;

end.
