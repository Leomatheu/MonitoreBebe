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
    LabeledEdit1: TLabeledEdit;
    edtEmail: TLabeledEdit;
    Label1: TLabel;
    edtTelefone: TMaskEdit;
    LabeledEdit2: TLabeledEdit;
    edtEspecialidade: TLabeledEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Panel4: TPanel;
    Image1: TImage;
    LabeledEdit3: TLabeledEdit;
    Panel7: TPanel;
    sbConsultar: TSpeedButton;
    Panel6: TPanel;
    sbExcluir: TSpeedButton;
    Panel5: TPanel;
    sbSalvar: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMedico: TfrmCadMedico;

implementation

{$R *.dfm}

end.
