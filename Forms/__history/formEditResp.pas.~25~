unit formEditResp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmEditResp = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    edtBusca: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtBuscaChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    procedure pCarregaDBGrid(prSQL : String);
  end;

var
  frmEditResp: TfrmEditResp;

implementation


{$R *.dfm}

uses
  uDao, formCadResp;

{ TfrmEditResp }

procedure TfrmEditResp.DBGrid1CellClick(Column: TColumn);
begin
   self.Close;
   frmCadResp.edtNome.Text := Self.DBGrid1.Fields[1].Value;
   frmCadResp.edtCPF.Text := self.DBGrid1.Fields[2].Value;
   frmCadResp.edtEmail.Text := self.DBGrid1.Fields[3].Value;
   frmCadResp.edtResidencial.Text := self.DBGrid1.Fields[4].Value;
   frmCadResp.edtCelular.Text := self.DBGrid1.Fields[5].Value;
   frmCadResp.edtRendaMensal.Text := self.DBGrid1.Fields[6].Value;
end;

procedure TfrmEditResp.edtBuscaChange(Sender: TObject);
var
   data : TDataModule1;
begin
  data := TDataModule1.Create(nil);

  case self.Tag of
    1 :
    begin
     data.Source.DataSet := data.fRetornoBusca('select * from monitorebebe.TCADRESP where nomeResponsavel like "'+self.edtBusca.text+'%";');
    end;

  end;

  data.Free;
end;

procedure TfrmEditResp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not (frmCadResp.edtNome.Text = '') then
     begin
       frmCadResp.sbExcluir.Enabled := true;
       frmCadResp.edtCodigo.Visible := true;
     end;
end;

procedure TfrmEditResp.pCarregaDBGrid(prSQL: String);
var
   dao : TDataModule1;
begin
   dao := TDataModule1.Create(nil);
   dao.Source.DataSet := dao.fRetornaQuery(prSQL);
end;

end.
