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
    procedure DBGrid1CellClick(Column: TColumn);
    procedure edtBuscaChange(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  frmEditResp: TfrmEditResp;

implementation


{$R *.dfm}

uses
  formCadResp, formCadCrianca, formAlimentacao, uDao, uController, formConsultorio;

{ TfrmEditResp }

procedure TfrmEditResp.DBGrid1CellClick(Column: TColumn);
var
  foto : TStream;
  controller : TController;
  Dao : TDataModule1;
begin
   controller := TController.Create;
   self.Close;

   case self.Tag of
    1:
    begin
      frmCadResp.edtNome.Text := self.DBGrid1.Fields[1].Value;
      frmCadResp.edtCPF.Text :=  self.DBGrid1.Fields[2].Value;
      frmCadResp.edtEmail.Text := self.DBGrid1.Fields[3].Value;
      frmCadResp.edtDataNasc.Text := self.DBGrid1.Fields[4].Value;
      frmCadResp.edtResidencial.Text := Self.DBGrid1.Fields[5].Value;
      frmCadResp.edtCelular.Text := Self.DBGrid1.Fields[6].Value;
      frmCadResp.edtRendaMensal.Text := FormatFloat('R$ #.###,00', Self.DBGrid1.Fields[7].Value);
      frmCadResp.mmObservacao.Lines.Text := self.DBGrid1.Fields[8].Value;
      frmCadResp.edtCEP.Text := self.DBGrid1.Fields[9].Value;
      frmCadResp.edtEstado.Text := self.DBGrid1.Fields[10].Value;
      frmCadResp.edtCidade.Text := self.DBGrid1.Fields[11].Value;
      frmCadResp.edtBairro.Text := self.DBGrid1.Fields[12].Value;
      frmCadResp.edtEndereco.Text := self.DBGrid1.Fields[13].Value;
      frmCadResp.edtCodigo.Text := self.DBGrid1.Fields[0].Value;
      foto := self.DBGrid1.DataSource.DataSet.CreateBlobStream(self.DBGrid1.Fields[14], bmRead);
      //frmCadResp.imgCadResp.Picture.LoadFromStream(foto);
      frmCadResp.Tag := 1;
    end;

    2:
    begin
      Dao := TDataModule1.Create(nil);
      frmCadCrianca.edtNome.Text := self.DBGrid1.Fields[1].Value;
      frmCadCrianca.edtDataNasc.Text := self.DBGrid1.Fields[2].Value;
      frmCadCrianca.edtCPF.Text := self.DBGrid1.Fields[3].Value;
      frmCadCrianca.mmObservacoes.Lines.Text := self.DBGrid1.Fields[4].Value;

      if (self.DBGrid1.Fields[5].Value = 'Masculino') then
         frmCadCrianca.ckMasculino.Checked := true
      else
        frmCadCrianca.ckFeminino.Checked := true;

      frmCadCrianca.edtHospNasc.Text := self.DBGrid1.Fields[6].Value;
      frmCadCrianca.edtPeso.Text := self.DBGrid1.Fields[7].Value;
      frmCadCrianca.edtNomePai.Text := self.DBGrid1.Fields[8].Value;
      frmCadCrianca.edtNomeMae.Text := self.DBGrid1.Fields[9].Value;
      frmCadCrianca.cbResp1.AddItem(IntToStr(self.DBGrid1.Fields[10].Value) + ' - ' + Dao.fSelectDadoEspecifico('select nomeResponsavel from tcadresp where idResponsavel = :id;', self.DBGrid1.Fields[10].Value), frmCadCrianca.cbResp1);
      frmCadCrianca.cbResp2.AddItem(IntToStr(self.DBGrid1.Fields[11].Value) + ' - ' + Dao.fSelectDadoEspecifico('select nomeResponsavel from tcadresp where idResponsavel = :id;', self.DBGrid1.Fields[11].Value), frmCadCrianca.cbResp2);
      frmCadCrianca.edtCodigo.Text := self.DBGrid1.Fields[0].Value;
      frmCadCrianca.Tag := 1;
    end;

    3:
    begin
      frmAlimentacao.edtAcompanhante.Text := self.DBGrid1.fields[2].Value;
      frmAlimentacao.edtData.Text := self.DBGrid1.fields[3].Value;
      frmAlimentacao.edtHora.Text := self.DBGrid1.Fields[4].Value;

      if (self.DBGrid1.Fields[5].Value = 'Bastante') then
          frmAlimentacao.rbBastante.Checked := true
      else
        if (self.DBGrid1.Fields[5].Value = 'Normal') then
            frmAlimentacao.rbNormal.Checked := true
        else
           if (self.DBGrid1.Fields[5].Value = 'Pouco') then
               frmAlimentacao.rbPouco.Checked := true
           else
              frmAlimentacao.rbPouquissimo.Checked := true;

      frmAlimentacao.cbCrianca.Text := IntToStr(self.DBGrid1.Fields[0].Value)+' - '+self.DBGrid1.fields[1].Value;
      frmAlimentacao.edtCodigo.Text := self.DBGrid1.Fields[7].Value;
      frmAlimentacao.mmObservacoes.lines.Text := self.DBGrid1.Fields[6].Value;
      frmAlimentacao.sbSalvar.Enabled := false;
      controller.pCamposAlimEnabled;
    end;

    4:
    begin
      frmConsultorio.edtCodigo.Text := self.DBGrid1.Fields[0].Value;
      frmConsultorio.edtNomeConsultorio.Text := self.DBGrid1.Fields[1].Value;
      frmConsultorio.edtTelefone.Text := self.DBGrid1.Fields[2].Value;
      frmConsultorio.edtEmail.Text := self.DBGrid1.Fields[3].Value;
      frmConsultorio.edtCEP.Text := self.DBGrid1.Fields[4].Value;
      frmConsultorio.edtEstado.Text := self.DBGrid1.Fields[5].Value;
      frmConsultorio.edtCidade.Text := self.DBGrid1.Fields[6].Value;
      frmConsultorio.edtBairro.Text := self.DBGrid1.Fields[7].Value;
      frmConsultorio.edtEndereco.Text := self.DBGrid1.Fields[8].Value;

      frmConsultorio.sbSalvar.Enabled := false;
    end;
   end;

end;

procedure TfrmEditResp.edtBuscaChange(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;

  if (self.tag = 1) then
     controller.pPopulaDBGrid('select * from TCADRESP where nomeResponsavel like "%'+Self.edtBusca.Text+'%";');

  if (self.tag = 2) then
     controller.pPopulaDBGrid('select * from TCADCRI where nomeCrianca like "%'+Self.edtBusca.Text+'%";');


end;

end.
