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
    lbItem: TLabel;
    edQuantidade: TLabeledEdit;
    edDataCompra: TMaskEdit;
    Label2: TLabel;
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
    Panel4: TPanel;
    sbAdicionarLista: TSpeedButton;
    Label1: TLabel;
    cbCrianca: TComboBox;
    edtResponsavelCompra: TLabeledEdit;
    cbItem: TComboBox;
    edValorTotal: TLabeledEdit;
    Panel8: TPanel;
    sbCadItem: TSpeedButton;
    edCodigo: TLabeledEdit;
    procedure FormActivate(Sender: TObject);
    procedure sbAdicionarListaClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbCadItemClick(Sender: TObject);
    procedure sbConsultarClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUtensilios: TfrmUtensilios;

implementation
uses
  uController, uItens, formCadItem, formEditResp;

{$R *.dfm}

procedure TfrmUtensilios.FormActivate(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pPopulaComboBox(self.cbItem, 5);
  controller.pPopulaComboBox(self.cbCrianca, 2);
  self.sbExcluir.Enabled := false;
end;

procedure TfrmUtensilios.sbSalvarClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pCadUtensilios;
end;

procedure TfrmUtensilios.sbAdicionarListaClick(Sender: TObject);
var
  controller : TController;
  total : Double;
begin
  controller := TController.Create;

  {incrementa a lista de compra}
  if (self.edQuantidade.Text < '1') then
     controller.pMessage('QUANTIDADE MENOR N?O PODE SER ZERO', $009F9FFF, 'A quantidade n?o pode ser menor que 1 !!',ExtractFilePath(Application.Exename) + 'Images\negado.bmp')
  else
     self.mmListaComprada.Lines.Add(IntToStr(TItens(self.cbItem.Items.Objects[self.cbItem.ItemIndex]).getIdItem) +'. '+ TItens(self.cbItem.Items.Objects[self.cbItem.ItemIndex]).getDescItem+'  '+
     self.edQuantidade.Text+' '+TItens(self.cbItem.Items.Objects[self.cbItem.ItemIndex]).getUnidadeMedida+'  '+FormatFloat('RS #,##0.00', StrToFloat(self.edQuantidade.Text) * TItens(self.cbItem.Items.Objects[self.cbItem.ItemIndex]).getValorUnitario));


  {Soma o valor total da compra}
  total := StrToFloat(controller.fTiraPonto(Copy(self.edValorTotal.Text, 4, Length(self.edValorTotal.Text)))) +  StrToFloat(self.edQuantidade.Text) * TItens(self.cbItem.Items.Objects[self.cbItem.ItemIndex]).getValorUnitario;
  self.edValorTotal.Text := FormatFloat('R$ #,##0.00', total);

  {volta os campos ao estado inicial}
  self.cbItem.Text := 'Selecione...';
  self.edQuantidade.Text := '1';
end;

procedure TfrmUtensilios.sbCadItemClick(Sender: TObject);
begin
  frmCadItem := TfrmCadItem.Create(nil);
  frmCadItem.ShowModal;
end;

procedure TfrmUtensilios.sbConsultarClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pLimpaTelaUtensilios;

  frmEditResp := TfrmEditResp.Create(nil);
  controller := TController.Create;
  controller.pPopulaDBGrid('select * from TCOMPRAS');

  frmEditResp.Panel1.Color := $00C1D6FF;
  frmEditResp.DBGrid1.Color := $00C1D6FF;
  frmEditResp.Caption := 'CONSULTA DE COMPRAS ';
  frmEditResp.edtBusca.EditLabel.Caption := 'Busque pela data';
  frmEditResp.Tag := 9;
  frmEditResp.ShowModal;

  if (self.edDataCompra.Text <> '') then
    self.sbExcluir.Enabled := true;
end;

procedure TfrmUtensilios.sbExcluirClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pExcluiCompras;
end;

end.
