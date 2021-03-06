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
    edtImc: TLabeledEdit;
    edtCodigo: TLabeledEdit;
    mmObservacoes: TMemo;
    edtCircCabeca: TLabel;
    Panel4: TPanel;
    imgCadCri: TImage;
    edtPeso: TLabeledEdit;
    edCircCabeca: TLabeledEdit;
    edtAltura: TLabeledEdit;
    edtCircBarriga: TLabeledEdit;
    procedure FormActivate(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbConsultarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure edtPesoExit(Sender: TObject);
    procedure edCircCabecaExit(Sender: TObject);
    procedure edtAlturaExit(Sender: TObject);
    procedure edtCircBarrigaExit(Sender: TObject);
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

procedure TfrmCrescimento.edCircCabecaExit(Sender: TObject);
begin
  self.edCircCabeca.Text := FormatFloat('#00.00 CM', StrToFloat(self.edCircCabeca.Text));
end;

procedure TfrmCrescimento.edtAlturaExit(Sender: TObject);
begin
  self.edtAltura.Text := FormatFloat('0.00 M', StrToFloat(self.edtAltura.Text));
end;

procedure TfrmCrescimento.edtCircBarrigaExit(Sender: TObject);
begin
  self.edtCircBarriga.Text := FormatFloat('#00.0 CM', StrToFloat(self.edtCircBarriga.Text));
end;

procedure TfrmCrescimento.edtPesoExit(Sender: TObject);
begin
  self.edtPeso.Text := FormatFloat('#00.00 KG', StrToFloat(self.edtPeso.Text));
end;

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
  frmEditResp.DBGrid1.Color := $00FFCCE6;
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
