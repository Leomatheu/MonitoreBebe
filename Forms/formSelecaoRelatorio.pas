unit formSelecaoRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmSelecaoRel = class(TForm)
    Panel1: TPanel;
    Panel6: TPanel;
    sbSalvar: TSpeedButton;
    Panel7: TPanel;
    sbExcluir: TSpeedButton;
    Panel8: TPanel;
    sbConsultar: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    Panel4: TPanel;
    SpeedButton2: TSpeedButton;
    Panel5: TPanel;
    SpeedButton3: TSpeedButton;
    Panel9: TPanel;
    Panel10: TPanel;
    SpeedButton4: TSpeedButton;
    Panel11: TPanel;
    SpeedButton5: TSpeedButton;
    Panel12: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Panel13: TPanel;
    Panel14: TPanel;
    SpeedButton9: TSpeedButton;
    Panel15: TPanel;
    SpeedButton10: TSpeedButton;
    Panel16: TPanel;
    SpeedButton11: TSpeedButton;
    Image1: TImage;
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecaoRel: TfrmSelecaoRel;

implementation
uses
  formFiltroRelatorios;

{$R *.dfm}

procedure TfrmSelecaoRel.SpeedButton7Click(Sender: TObject);
begin
   frmFiltros.Caption := 'TOTAL DE COMPRAS POR CRIAN?A';
   frmFiltros.Panel1.Color := $009BCDFF;
   frmFiltros.Panel2.Color := $009BCDFF;
   frmFiltros.Tag := 1;
   frmFiltros.ShowModal;
end;

procedure TfrmSelecaoRel.SpeedButton8Click(Sender: TObject);
begin
   frmFiltros.Caption := 'TOTAL DE CONSULTAS POR CRIAN?A';
   frmFiltros.Panel1.Color := $00FF75BA;
   frmFiltros.Panel2.Color := $00FF75BA;
   frmFiltros.Tag := 0;
   frmFiltros.ShowModal;
end;

end.
