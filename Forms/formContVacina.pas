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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContVacina: TfrmContVacina;

implementation

{$R *.dfm}

end.
