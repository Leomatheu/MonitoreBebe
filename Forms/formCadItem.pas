unit formCadItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPanels, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadItem = class(TForm)
    sbSalvar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbConsultar: TSpeedButton;
    edDescItem: TLabeledEdit;
    edUnidadeMedida: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    panel01: TPanel;
    edValorUnitario: TLabeledEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure edValorUnitarioExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadItem: TfrmCadItem;

implementation
uses
  uController, formUtensilios;

{$R *.dfm}


procedure TfrmCadItem.edValorUnitarioExit(Sender: TObject);
begin
  self.edValorUnitario.Text :=  FormatFloat('R$ #,###,###,##0.00', StrToFloat(self.edValorUnitario.Text));
end;

procedure TfrmCadItem.FormActivate(Sender: TObject);
begin
  self.edDescItem.SetFocus;
end;

procedure TfrmCadItem.FormClose(Sender: TObject; var Action: TCloseAction);
var
  controller : TController;
begin
  controller := TController.Create; 
  frmUtensilios.cbItem.Clear;
  frmUtensilios.cbItem.Text := 'Selecione...';
  controller.pPopulaComboBox(frmUtensilios.cbItem, 5);  
end;

procedure TfrmCadItem.SpeedButton1Click(Sender: TObject);
var
  controller : TController;  
begin
  controller := TController.Create;
  controller.pCadItem;
end;

end.
