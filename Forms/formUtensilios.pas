unit formUtensilios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.Mask;

type
  TfrmUtensilios = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cbItem: TComboBoxEx;
    lbItem: TLabel;
    Label1: TLabel;
    cbCrianca: TComboBoxEx;
    edResponsavelCompra: TLabeledEdit;
    edQuantidade: TLabeledEdit;
    edDataCompra: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    edValorTotal: TMaskEdit;
    Panel7: TPanel;
    sbConsultar: TSpeedButton;
    mmListaComprada: TMemo;
    Label4: TLabel;
    Panel5: TPanel;
    Image1: TImage;
    Panel6: TPanel;
    sbExcluir: TSpeedButton;
    Panel3: TPanel;
    sbSalvar: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUtensilios: TfrmUtensilios;

implementation

{$R *.dfm}

end.
