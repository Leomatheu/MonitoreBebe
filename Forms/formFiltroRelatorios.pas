unit formFiltroRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmFiltros = class(TForm)
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
    cbCrianca: TComboBox;
    Label3: TLabel;
    edtData: TMaskEdit;
    Label1: TLabel;
    edDataFim: TMaskEdit;
    Label2: TLabel;
    Panel9: TPanel;
    Panel10: TPanel;
    SpeedButton4: TSpeedButton;
    Panel11: TPanel;
    SpeedButton5: TSpeedButton;
    Panel12: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltros: TfrmFiltros;

implementation
uses
  uController, formRelatorio, uCrianca, uDao, formRelatorioConsultas;

{$R *.dfm}

procedure TfrmFiltros.FormActivate(Sender: TObject);
begin
  controller.pPopulaComboBox(self.cbCrianca, 2);
end;

procedure TfrmFiltros.SpeedButton7Click(Sender: TObject);
var
  total : double;
begin
   if (self.Tag = 1) then
     begin
       frmRelatorio.RLLabel7.Caption := 'RELATÓRIO DE COMPRAS';
       frmRelatorio.RLDBText1.Text := TCrianca(self.cbCrianca.Items.Objects[self.cbCrianca.ItemIndex]).getNomeCrianca;
       frmRelatorio.RLDBText2.Text := TCrianca(self.cbCrianca.Items.Objects[self.cbCrianca.ItemIndex]).getNomeMae;
       frmRelatorio.RLDBText3.Text := TCrianca(self.cbCrianca.Items.Objects[self.cbCrianca.ItemIndex]).getNomePai;
       frmRelatorio.RLLabel5.Caption := self.edtData.Text;
       frmRelatorio.RLLabel6.Caption := self.edDataFim.Text;

       DataModule1.Query.Close;
       DataModule1.Query.sql.Clear;
       DataModule1.Query.SQL.Add('select * from TCOMPRAS where dataCompra between :prData and :prData1;');
       DataModule1.Query.Params[0].AsString := self.edtData.Text;
       DataModule1.Query.Params[1].AsString := self.edDataFim.Text;
       DataModule1.Query.Open;

       frmRelatorio.RLReport1.Preview;
     end
   else
     begin
       frmRelatorioConsultas.RLLabel7.Caption := 'RELATÓRIO DE CONSULTAS';
       frmRelatorioConsultas.RLDBText1.Text := TCrianca(self.cbCrianca.Items.Objects[self.cbCrianca.ItemIndex]).getNomeCrianca;
       frmRelatorioConsultas.RLDBText2.Text := TCrianca(self.cbCrianca.Items.Objects[self.cbCrianca.ItemIndex]).getNomeMae;
       frmRelatorioConsultas.RLDBText3.Text := TCrianca(self.cbCrianca.Items.Objects[self.cbCrianca.ItemIndex]).getNomePai;
       frmRelatorioConsultas.RLLabel5.Caption := self.edtData.Text;
       frmRelatorioConsultas.RLLabel6.Caption := self.edDataFim.Text;


       DataModule1.Query.Close;
       DataModule1.Query.sql.Clear;
       DataModule1.Query.SQL.Add('select * from TCONSULTA where dataConsulta between :prData and :prData1;');
       DataModule1.Query.Params[0].AsString := self.edtData.Text;
       DataModule1.Query.Params[1].AsString := self.edDataFim.Text;
       DataModule1.Query.Open;

       frmRelatorioConsultas.RLReport1.preview;
     end;

end;

end.
