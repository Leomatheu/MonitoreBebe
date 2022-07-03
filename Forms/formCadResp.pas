unit formCadResp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ExtDlgs,
  Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.Mask, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, SYSTEM.JSON, IPPeerClient;

type
  TfrmCadResp = class(TForm)
    Panel2: TPanel;
    edtNome: TLabeledEdit;
    Panel1: TPanel;
    Label1: TLabel;
    edtCPF: TMaskEdit;
    edtEmail: TLabeledEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtResidencial: TMaskEdit;
    edtCelular: TMaskEdit;
    mmObservacao: TMemo;
    Label4: TLabel;
    edtRendaMensal: TMaskEdit;
    Label5: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    imgCadResp: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    edtCEP: TLabeledEdit;
    edtEstado: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    sbConsultar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbSalvar: TSpeedButton;
    edtDataNasc: TMaskEdit;
    Label6: TLabel;
    edtCodigo: TLabeledEdit;
    Panel9: TPanel;
    Image1: TImage;
    sbBusca: TSpeedButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbConsultarClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbBuscaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadResp: TfrmCadResp;

implementation

uses
  uController, formEditResp;

{$R *.dfm}

procedure TfrmCadResp.FormActivate(Sender: TObject);
begin
  self.sbExcluir.Enabled := false;
end;

procedure TfrmCadResp.SpeedButton1Click(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;

  if (OpenPictureDialog1.Execute) then
  begin
    imgCadResp.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    imgCadResp.Picture.SaveToFile(controller.fRetornaDirFoto);
  end;
end;

procedure TfrmCadResp.sbBuscaClick(Sender: TObject);
var
  json : TJSONObject;
begin
  RESTClient1.BaseURL := 'https://viacep.com.br/ws/';
  RESTRequest1.Method := rmGET;
  RESTRequest1.Resource := '{CEP}/json';
  RESTRequest1.Params.AddUrlSegment('cep', self.edtCEP.text);
  RESTRequest1.Execute;

  json := TJSONObject.ParseJSONValue(RESTRequest1.Response.JSONText) as TJSONObject;

  self.edtCEP.Text := json.GetValue<string>('cep');
  self.edtCidade.Text := json.GetValue<string>('localidade');
  self.edtEstado.Text := json.GetValue<string>('uf');
  self.edtBairro.Text := json.GetValue<string>('bairro');
  self.edtEndereco.Text := json.GetValue<string>('logradouro');
end;

procedure TfrmCadResp.sbConsultarClick(Sender: TObject);
var
  controller: TController;
begin
  frmEditResp := TfrmEditResp.Create(nil);
  controller := TController.Create;
  controller.pPopulaDBGrid('select * from monitorebebe.TCADRESP;');

  frmEditResp.Panel1.Color := $00D2FFD9;
  frmEditResp.DBGrid1.Color := $00D2FFD9;
  frmEditResp.Caption := 'EDIÇÃO DE RESPONSÁVEIS';
  frmEditResp.edtBusca.EditLabel.Caption := 'Busque pelo responsável';
  frmEditResp.Tag := 1;
  frmEditResp.ShowModal;

  if (self.edtNome.Text <> '') then
     self.sbExcluir.Enabled := true;
end;

procedure TfrmCadResp.sbExcluirClick(Sender: TObject);
var
  controller: TController;
begin
  controller := TController.Create;
  controller.pExcluiResponsavel;
end;

procedure TfrmCadResp.sbSalvarClick(Sender: TObject);
var
  controller: TController;
begin
  controller := TController.Create;
  controller.pCadResponsavel;
end;

end.
