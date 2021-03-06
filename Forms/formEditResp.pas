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

type
    TDBGridPadrao = class(TCustomGrid);

var
  frmEditResp: TfrmEditResp;

implementation


{$R *.dfm}

uses
  formCadResp, formCadCrianca, formAlimentacao, uDao, uController, formConsultorio, formCadMedico,
  formContVacina, formOcorrencia, formCrescimento, formUtensilios, formConsulta;

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
      frmCadResp.imgCadResp.Picture.LoadFromStream(foto);
      frmCadResp.Tag := 1;
  end;

   2:
    begin
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
      frmCadCrianca.cbResp1.Text := IntToStr(self.DBGrid1.Fields[10].Value) + ' - ' + DataModule1.fSelectDadoEspecifico('select nomeResponsavel from tcadresp where idResponsavel = :id;', self.DBGrid1.Fields[10].Value);
      frmCadCrianca.cbResp2.Text := IntToStr(self.DBGrid1.Fields[11].Value) + ' - ' + DataModule1.fSelectDadoEspecifico('select nomeResponsavel from tcadresp where idResponsavel = :id;', self.DBGrid1.Fields[11].Value);
      frmCadCrianca.edtCodigo.Text := self.DBGrid1.Fields[0].Value;
      foto := self.DBGrid1.DataSource.DataSet.CreateBlobStream(self.DBGrid1.Fields[12], bmRead);
      frmCadCrianca.imgCadCri.Picture.LoadFromStream(foto);
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
      controller.pCamposAlimEnabled(false);
    end;

    4:
    begin
      frmConsultorio.edtCodigo.Text := self.DBGrid1.Fields[0].Value;
      frmConsultorio.edtNomeConsultorio.Text := self.DBGrid1.Fields[1].Value;
      frmConsultorio.edtCEP.Text := self.DBGrid1.Fields[2].Value;
      frmConsultorio.edtEstado.Text := self.DBGrid1.Fields[3].Value;
      frmConsultorio.edtCidade.Text := self.DBGrid1.Fields[4].Value;
      frmConsultorio.edtBairro.Text := self.DBGrid1.Fields[5].Value;
      frmConsultorio.edtEndereco.Text := self.DBGrid1.Fields[6].Value;
      frmConsultorio.edtTelefone.Text := self.DBGrid1.Fields[7].Value;
      frmConsultorio.edtEmail.Text := self.DBGrid1.Fields[8].Value;

      frmConsultorio.sbSalvar.Enabled := false;
      frmConsultorio.sbExcluir.Enabled := true;

      controller.pCamposConsultorioEnabled(false);
    end;

    5:
    begin
      frmCadMedico.edtCodigo.Text := self.DBGrid1.Fields[0].Value;
      frmCadMedico.EditNome.Text := self.DBGrid1.Fields[1].Value;
      frmCadMedico.edtTelefone.Text := self.DBGrid1.Fields[2].Value;
      frmCadMedico.edtEmail.Text := self.DBGrid1.Fields[3].Value;
      frmCadMedico.edtEspecialidade.Text := self.DBGrid1.Fields[4].Value;
      frmCadMedico.edtCRM.Text := self.DBGrid1.fields[5].Value;
      frmCadMedico.cbConsultorio.Text := IntToStr(self.DBGrid1.Fields[6].Value)+' - '+DataModule1.fSelectDadoEspecifico('select TCADCON.nomeConsultorio from TCADCON where idConsultorio = :pr;', self.DBGrid1.Fields[6].Value);
      frmCadMedico.Tag := 1;
      frmCadMedico.sbExcluir.Enabled := true;
    end;

    6:
    begin
      frmContVacina.edtCodigo.Text := self.DBGrid1.Fields[0].Value;
      frmContVacina.edtData.Text := self.DBGrid1.Fields[1].Value;
      frmContVacina.edtHora.Text := self.DBGrid1.Fields[2].Value;
      frmContVacina.edtNomeVacina.Text := self.DBGrid1.Fields[3].Value;

      if (self.DBGrid1.Fields[4].Value = 'Posto de Sa?de') then
         frmContVacina.rbPostoSaude.Checked := true
      else
         if (self.DBGrid1.Fields[4].Value = 'Hospital') then
            frmContVacina.rbHospital.Checked := true
         else
           if (self.DBGrid1.Fields[4].Value = 'Consult?rio') then
              frmContVacina.rbConsultorio.Checked := true
           else
             frmContVacina.rbOutros.Checked := true;

      frmContVacina.edtComplemento.Text := self.DBGrid1.Fields[5].Value;
      frmContVacina.edtNomeProfissional.Text := self.DBGrid1.Fields[6].Value;
      frmContVacina.edtAcompanhante.Text := self.DBGrid1.Fields[7].Value;
      frmContVacina.edtProximaData.Text := self.DBGrid1.Fields[8].Value;
      frmContVacina.cbCrianca.Text := IntToStr(self.DBGrid1.Fields[9].Value)+' - '+DataModule1.fSelectDadoEspecifico('select tcadcri.nomeCrianca from tcadcri where idCrianca = :pr;', self.DBGrid1.Fields[9].Value);
      frmContVacina.sbExcluir.Enabled := true;
      frmContVacina.sbSalvar.Enabled := false;
      controller.pCamposVacinaEnabled(false);
    end;

    7:
    begin
      frmOcorrencia.edtCodigo.Text := self.DBGrid1.Fields[0].Value;
      frmOcorrencia.edtAcompanhante.Text := self.DBGrid1.Fields[1].Value;
      frmOcorrencia.edtData.Text := self.DBGrid1.Fields[2].Value;
      frmOcorrencia.edtHora.Text := self.DBGrid1.Fields[3].Value;
      frmOcorrencia.cbCrianca.Text := IntToStr(self.DBGrid1.Fields[9].Value)+' - '+DataModule1.fSelectDadoEspecifico('select tcadcri.nomeCrianca from tcadcri where idCrianca = :pr;', self.DBGrid1.Fields[9].Value);
      frmOcorrencia.mmOcorrencia.Lines.Text := self.DBGrid1.fields[4].Value;

      if (self.DBGrid1.Fields[5].Value = 'Sim') then
         begin
           frmOcorrencia.ckSim.Checked := true;
           frmOcorrencia.edtDescricao.Text := self.DBGrid1.Fields[6].Value;
           frmOcorrencia.edtQuantidade.Text := self.DBGrid1.Fields[7].Value;
           frmOcorrencia.edtHoraMedicacao.Text := self.DBGrid1.Fields[8].Value;
         end
      else
         frmOcorrencia.ckNao.Checked := true;

      frmOcorrencia.Tag := 1;
      frmOcorrencia.sbExcluir.Enabled := true;
    end;

    8:
    begin
      frmCrescimento.edtData.Text := self.DBGrid1.Fields[1].Value;
      frmCrescimento.edtPeso.Text := self.DBGrid1.Fields[2].Value;
      frmCrescimento.edtAltura.Text := self.DBGrid1.Fields[3].Value;
      frmCrescimento.edtImc.Text := self.DBGrid1.Fields[4].Value;
      frmCrescimento.edCircCabeca.Text := self.DBGrid1.Fields[5].Value;
      frmCrescimento.edtCircBarriga.Text := self.DBGrid1.Fields[6].Value;
      frmCrescimento.mmObservacoes.Lines.Text := self.DBGrid1.Fields[8].Value;
      frmCrescimento.edtCodigo.Text := self.DBGrid1.Fields[0].Value;
      frmCrescimento.cbCrianca.Text := IntToStr(self.DBGrid1.Fields[7].Value)+' - '+DataModule1.fSelectDadoEspecifico('select tcadcri.nomeCrianca from tcadcri where idCrianca = :pr;', self.DBGrid1.Fields[7].Value);
      controller.pCamposCrescimentoEnabled(false);
      frmCrescimento.sbSalvar.Enabled := false;
    end;

    9:
    begin
      frmUtensilios.edCodigo.Text := self.DBGrid1.Fields[0].Value;
      frmUtensilios.edDataCompra.text := self.DBGrid1.Fields[1].Value;
      frmUtensilios.edValorTotal.Text := FormatFloat('R$ #,###,##0.00', self.DBGrid1.Fields[2].Value);
      frmUtensilios.mmListaComprada.Lines.Text := self.DBGrid1.Fields[3].Value;
      frmUtensilios.edtResponsavelCompra.Text := self.DBGrid1.Fields[4].Value;
      frmUtensilios.cbCrianca.Text := IntToStr(self.DBGrid1.Fields[5].Value)+' - '+DataModule1.fSelectDadoEspecifico('select tcadcri.nomeCrianca from tcadcri where idCrianca = :pr;', self.DBGrid1.Fields[5].Value);
      frmUtensilios.sbSalvar.Enabled := false;
      controller.pCamposUtensiliosEnabled(false);
    end;

    10:
    begin
      frmConsulta.edtCodigo.Text := self.DBGrid1.Fields[0].Value;
      frmConsulta.edtData.Text := self.DBGrid1.Fields[1].Value;
      frmConsulta.edtHora.Text := self.DBGrid1.Fields[2].Value;
      frmConsulta.edtMotivo.Text := self.DBGrid1.Fields[3].Value;
      frmConsulta.edtAcompanhante.Text := self.DBGrid1.Fields[4].Value;
      frmConsulta.mmExames.Lines.Text := self.DBGrid1.Fields[5].Value;
      frmConsulta.edtProximaConsulta.Text := self.DBGrid1.Fields[6].Value;
      frmConsulta.edtValor.Text := FormatFloat('R$ #,###,#0.00', self.DBGrid1.fields[7].Value);
      frmConsulta.mmObservacoes.Lines.Text := self.DBGrid1.Fields[8].Value;
      frmConsulta.cbMedico.Text := IntToStr(self.DBGrid1.Fields[9].Value)+' - '+DataModule1.fSelectDadoEspecifico('select nomeMedico from TCADMED where idMedico = :pr;', self.DBGrid1.Fields[9].Value);
      frmConsulta.cbConsultorio.Text := IntToStr(Self.DBGrid1.Fields[10].Value)+' - '+DataModule1.fSelectDadoEspecifico('select nomeConsultorio from TCADCON where idConsultorio = :pr;', self.DBGrid1.Fields[10].Value);
      frmConsulta.cbCrianca.Text := IntToStr(self.DBGrid1.Fields[11].Value)+' - '+DataModule1.fSelectDadoEspecifico('select tcadcri.nomeCrianca from tcadcri where idCrianca = :pr;', self.DBGrid1.Fields[11].Value);
      controller.pCamposConsultaEnabled(false);
      frmConsulta.sbSalvar.Enabled := false;
      frmConsulta.sbExcluir.Enabled := true;
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

  if (self.Tag = 4) then
     controller.pPopulaDBGrid('select * from TCADCON where nomeConsultorio like "%'+Self.edtBusca.Text+'%";');

  if (self.tag = 5) then
     controller.pPopulaDBGrid('select * from TCADMED where nomeMedico like "%'+Self.edtBusca.Text+'%";');

  if (self.Tag = 6) then
     controller.pPopulaDBGrid('select * from TCONVACI where nomeVacina like "%'+self.edtBusca.Text+'%";');

  if (self.Tag = 7) then
     controller.pPopulaDBGrid('select * from TOCORRENCIA where dataOcorrencia like "%'+self.edtBusca.Text+'%";');

  if (self.Tag = 9) then
     controller.pPopulaDBGrid('select * from TCOMPRAS where dataCompra like "%'+self.edtBusca.Text+'%";');

  if (self.Tag = 10) then
     controller.pPopulaDBGrid('select * from TCONSULTA where dataConsulta like "%'+self.edtBusca.Text+'%";');

end;


end.
