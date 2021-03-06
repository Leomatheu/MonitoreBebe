unit formAlimentacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.Mask;

type
  TfrmAlimentacao = class(TForm)
    Label1: TLabel;
    edtAcompanhante: TEdit;
    Label2: TLabel;
    edtData: TMaskEdit;
    edtHora: TMaskEdit;
    Image1: TImage;
    rbPouquissimo: TRadioButton;
    Image2: TImage;
    rbPouco: TRadioButton;
    Image3: TImage;
    rbNormal: TRadioButton;
    Image4: TImage;
    rbBastante: TRadioButton;
    edtCrianca: TLabel;
    cbCrianca: TComboBox;
    mmObservacoes: TMemo;
    Panel1: TPanel;
    Image5: TImage;
    sbSalvar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbConsultar: TSpeedButton;
    edtCodigo: TEdit;
    Tpanel: TPanel;
    Tpanel01: TPanel;
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
  frmAlimentacao: TfrmAlimentacao;

implementation
uses
  uController, formEditResp;

{$R *.dfm}

procedure TfrmAlimentacao.FormActivate(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pPopulaComboBox(self.cbCrianca, 2);
  self.sbExcluir.Enabled := false;
end;

procedure TfrmAlimentacao.sbConsultarClick(Sender: TObject);
var
  controller : TController;
begin
  frmEditResp := TfrmEditResp.Create(nil);
  controller := TController.Create;
  controller.pPopulaDBGrid('select tconalim.idCrianca,tcadcri.nomeCrianca,tconalim.acompanhante,tconalim.dataRefeicao,tconalim.hora,tconalim.quantidade,tconalim.observacoes,'+
                            'tconalim.idControle from tconalim,tcadcri where tconalim.idCrianca=tcadcri.idCrianca order by tcadcri.nomeCrianca;');

  frmEditResp.DBGrid1.Color := $00FFDFFF;
  frmEditResp.Caption := 'CONSULTA DE ALIMENTA??ES ';
  frmEditResp.DBGrid1.Align := alClient;
  frmEditResp.edtBusca.Visible := false;
  frmEditResp.Tag := 3;
  frmEditResp.ShowModal;

  if (self.edtAcompanhante.Text <> '') then
     self.sbExcluir.Enabled := true;
end;

procedure TfrmAlimentacao.sbExcluirClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pExcluiAlimentacao;
end;

procedure TfrmAlimentacao.sbSalvarClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pCadAlimentacao;
end;

end.
