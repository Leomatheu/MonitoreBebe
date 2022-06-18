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
    procedure FormActivate(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbConsultarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCrescimento: TfrmCrescimento;

implementation
uses
  uController, formEditResp;

{$R *.dfm}

procedure TfrmCrescimento.FormActivate(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pPopulaComboBox(self.cbCrianca, 2);

  self.sbExcluir.Enabled := false;
end;

procedure TfrmCrescimento.sbConsultarClick(Sender: TObject);
begin
  frmEditResp := TfrmEditResp.Create(nil);
  controller := TController.Create;
  controller.pPopulaDBGrid('select * from TCRESCIMENTO');

  frmEditResp.Panel1.Color := $00FFCCE6;
  frmEditResp.DBGrid1.Font.Color := clBlack;
  frmEditResp.Caption := 'CONSULTA DE ACOMPANHAMENTO DE CRESCIMENTO ';
  frmEditResp.edtBusca.Visible := false;
  frmEditResp.DBGrid1.Align :=  alClient;
  frmEditResp.Tag := 8;

  if (Odd(frmEditResp.DBGrid1.DataSource.DataSet.RecNo)) then
     frmEditResp.DBGrid1.Canvas.Brush.Color := $00FFCCE6
  else
     frmEditResp.DBGrid1.Canvas.Brush.Color := clWhite;

  frmEditResp.ShowModal;

  if (self.edtData.Text <> '') then
     begin
       self.sbExcluir.Enabled := true;
       self.sbSalvar.Enabled := false;
     end;

end;

procedure TfrmCrescimento.sbExcluirClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pExcluiCrescimento;
  self.sbSalvar.Enabled := true;
  self.cbCrianca.SetFocus;
end;

procedure TfrmCrescimento.sbSalvarClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pCadContCrescimento;
end;

end.
