unit formCrescimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Mask;

type
  TfrmCrescimento = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel7: TPanel;
    sbConsultar: TSpeedButton;
    Panel6: TPanel;
    sbExcluir: TSpeedButton;
    Panel5: TPanel;
    sbSalvar: TSpeedButton;
    cbCrianca: TComboBox;
    Label3: TLabel;
    Label1: TLabel;
    edtData: TMaskEdit;
    edtPeso: TMaskEdit;
    Label4: TLabel;
    Label2: TLabel;
    edtAltura: TMaskEdit;
    edtImc: TLabeledEdit;
    edtCodigo: TLabeledEdit;
    Label5: TLabel;
    edtCircCabeca: TMaskEdit;
    Label6: TLabel;
    edtCircBarriga: TMaskEdit;
    mmObservacoes: TMemo;
    Label7: TLabel;
    Panel4: TPanel;
    imgCadCri: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCrescimento: TfrmCrescimento;

implementation

{$R *.dfm}

end.
