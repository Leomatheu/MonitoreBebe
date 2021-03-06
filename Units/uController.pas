unit uController;

interface

uses
  uResponsavel, uDao, formCadResp, System.Classes, System.SysUtils, formMessage,
  uCrianca, formCadCrianca, Vcl.StdCtrls, Vcl.Forms, formAlimentacao, uAlimentacao,
  uConsultorio, formConsultorio, formCadMedico, uMedico, uVacina, formContVacina, formConsulta,
  uConsulta, uOcorrencia, formOcorrencia, uCrescimento, formCrescimento, uUtensilios, formUtensilios,
  uItens, formCadItem;

type
  TController = class

  public
    {procedures de cadastro}
    procedure pCadVacina;
    procedure pCadOcorrencia;
    procedure pCadResponsavel;
    procedure pCadCrianca;
    procedure pCadAlimentacao;
    procedure pCadConsultorio;
    procedure pCadMedico;
    procedure pCadConsulta;
    procedure pCadContCrescimento;
    procedure pCadUtensilios;
    procedure pCadItem;

    {procedure de exclus?o}
    procedure pExcluiResponsavel;
    procedure pExcluiOcorrencia;
    procedure pExcluiCrianca;
    procedure pExcluiAlimentacao;
    procedure pExcluiMedico;
    procedure pExcluiConsultorio;
    procedure pExcluiConsulta;
    procedure pExcluiVacina;
    procedure pExcluiCrescimento;
    procedure pExcluiCompras;

    {fun??es para tirar '.' de valores float e para retornar diret?rio onde se salva foto de cadastros}
    function fTiraPonto(prText: String): String;
    function fRetornaDirFoto: String;

    {procedure de mensagem geral, popula DBGrid e combobox, limpa telas e torna campo enabled}
    procedure pMessage(prCaption: String; prColor: integer; prLabel: String; prFoto: String);
    procedure pPopulaDBGrid(prSQL: String);
    procedure pPopulaComboBox(prComboBox: TComboBox; prTela : integer);
    procedure plimpaTelaCri;
    procedure pLimpaTelaResp;
    procedure pLimpaTelaAlim;
    procedure pLimpaTelaCon;
    procedure pLimpaTelaMed;
    procedure pLimpaTelaVac;
    procedure pLimpaTelaOcocrrecia;
    procedure pLimpaTelaConsulta;
    procedure pLimpaTelaCrescimento;
    procedure pLimpaTelaUtensilios;
    procedure pLimpaTelaItem;
    procedure pCamposAlimEnabled(prEnabled : boolean);
    procedure pCamposUtensiliosEnabled(prEnabled : boolean);
    procedure pCamposConsultorioEnabled(prEnabled : Boolean);
    procedure pCamposVacinaEnabled(prEnabled : Boolean);
    procedure pCamposConsultaEnabled(prEnabled : Boolean);
    procedure pCamposCrescimentoEnabled(prEnabled : Boolean);
  end;

var
  Controller: TController;

implementation

{ TController }

function TController.fRetornaDirFoto: String;
var
  aux: String;
  h,m,s,ms: word;
begin
  aux := ExtractFilePath(Application.Exename) + 'Foto.jpg';

 if (FileExists(aux)) then
   DeleteFile(aux);

  result := aux;
end;

function TController.fTiraPonto(prText: String): String;
var
  i: integer;
begin
  for i := 0 to Length(prText) do
  begin
    if prText[i] = '.' then
    begin
      delete(prText, i, 1);
    end
  end;

  result := prText;
end;

{procedures de cadastro/inser??o de registros}
procedure TController.pCadAlimentacao;
var
    objAlimentacao: TAlimentacao;
begin
    objAlimentacao := TAlimentacao.Create;

    objAlimentacao.setData(frmAlimentacao.edtData.Text);
    objAlimentacao.setHora(frmAlimentacao.edtHora.Text);

    if (frmAlimentacao.rbPouquissimo.Checked) then
      objAlimentacao.setQuantidade(frmAlimentacao.rbPouquissimo.Caption)
    else
        if (frmAlimentacao.rbPouco.Checked) then
          objAlimentacao.setQuantidade(frmAlimentacao.rbPouco.Caption)
        else
          if frmAlimentacao.rbNormal.Checked then
            objAlimentacao.setQuantidade(frmAlimentacao.rbNormal.Caption)
          else
            objAlimentacao.setQuantidade(frmAlimentacao.rbBastante.Caption);

    objAlimentacao.setObservacoes(frmAlimentacao.mmObservacoes.Lines.text);
    objAlimentacao.setAcompanhante(frmAlimentacao.edtAcompanhante.Text);
    objAlimentacao.setIdCrianca(TCrianca(frmAlimentacao.cbCrianca.Items.Objects[frmAlimentacao.cbCrianca.ItemIndex]).getIdCrianca);

    if (DataModule1.fInsertAlimentacao(objAlimentacao)) then
       begin
        self.pMessage('INSER??O DE ALIMENTA??O REALIZADA', $00FFDFFF, 'Inser??o de alimenta??o realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
        self.pLimpaTelaAlim;
       end
    else
       begin
        self.pMessage('FALHA NA INSER??O DE ALIMENTA??O', $009F9FFF, 'Falha na inser??o de alimenta??o verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
        self.pLimpaTelaAlim;
       end;
end;

procedure TController.pCadConsulta;
var
  objConsulta : TConsulta;
begin
  objConsulta := TConsulta.Create;

  objConsulta.setAcompanhante(frmConsulta.edtAcompanhante.Text);
  objConsulta.setDataConsulta(frmConsulta.edtData.Text);
  objConsulta.setHora(frmConsulta.edtHora.Text);
  objConsulta.setMotivo(frmConsulta.edtMotivo.Text);
  objConsulta.setDescExame(frmConsulta.mmExames.Text);
  objConsulta.setProximaConsulta(frmConsulta.edtProximaConsulta.Text);
  objConsulta.setValor(StrToFloat(Copy(self.fTiraPonto(frmConsulta.edtValor.Text), 3, length(frmConsulta.edtValor.Text))));
  objConsulta.setObservacoes(frmConsulta.mmObservacoes.Text);
  objConsulta.setIdCrianca(TCrianca(frmConsulta.cbCrianca.Items.Objects[frmConsulta.cbCrianca.ItemIndex]).getIdCrianca);
  objConsulta.setIdMedico(TMedico(frmConsulta.cbMedico.Items.Objects[frmConsulta.cbMedico.ItemIndex]).getIdMedico);
  obJConsulta.setIdConsultorio(TConsultorio(frmConsulta.cbConsultorio.Items.Objects[frmConsulta.cbConsultorio.ItemIndex]).getIdConsultorio);

  if (DataModule1.fInsertConsulta(objConsulta)) then
    begin
      self.pMessage('INSER??O DE CONSULTA REALIZADA', $00FFD7D7, 'Inser??o de consulta realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
      self.pLimpaTelaConsulta;
    end
  else
    begin
      self.pMessage('FALHA NA INSER??O DE CONSULTA', $009F9FFF, 'Falha na inser??o de consulta verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
      self.pLimpaTelaConsulta;
    end;

end;

procedure TController.pCadConsultorio;
var
  objConsultorio : TConsultorio;
begin
  objConsultorio := TConsultorio.Create;

  objConsultorio.setNomeConsultorio(frmConsultorio.edtNomeConsultorio.Text);
  objConsultorio.setTelefone(frmConsultorio.edtTelefone.Text);
  objConsultorio.setEmail(frmConsultorio.edtEmail.Text);
  objConsultorio.setCep(frmConsultorio.edtCEP.Text);
  objConsultorio.setEstado(frmConsultorio.edtEstado.Text);
  objConsultorio.setCidade(frmConsultorio.edtCidade.Text);
  objConsultorio.setBairro(frmConsultorio.edtBairro.Text);
  obJConsultorio.setEndereco(frmConsultorio.edtEndereco.Text);

   if not (frmConsultorio.Tag = 1) then
     begin
       if (DataModule1.fInsertConsultorio(objConsultorio)) then
         begin
           self.pMessage('INSER??O DO CONSULT?RIO REALIZADA', $00C4C4FF, 'Inser??o de consult?rio realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
           self.pLimpaTelaCon;
         end
       else
         begin
           self.pMessage('FALHA NA INSER??O DO CONSULT?RIO', $009F9FFF, 'Falha na inser??o do consult?rio verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
           self.pLimpaTelaCon;
         end;
     end

end;

procedure TController.pCadContCrescimento;
var
  objCrescimento : TCrescimento;
begin
  objCrescimento := TCrescimento.Create;

  objCrescimento.setIdCrianca(TCrianca(frmCrescimento.cbCrianca.Items.Objects[frmCrescimento.cbCrianca.ItemIndex]).getIdCrianca);
  objCrescimento.setDataCrescimento(frmCrescimento.edtData.Text);
  objCrescimento.setPeso(frmCrescimento.edtPeso.Text);
  objCrescimento.setAltura(frmCrescimento.edtAltura.Text);
  objCrescimento.setImc(frmCrescimento.edtImc.Text);
  objCrescimento.setCircCabeca(frmCrescimento.edCircCabeca.Text);
  objCrescimento.setCircBarriga(frmCrescimento.edtCircBarriga.Text);
  objCrescimento.setObservacoes(frmCrescimento.mmObservacoes.Lines.Text);

  if (DataModule1.fInsertCrescimento(objCrescimento)) then
     begin
      self.pMessage('INSER??O DE DADOS DE CRESCIMENTO REALIZADA', $00FFCCE6, 'Inser??o realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
      self.pLimpaTelaCrescimento;
     end
  else
     begin
      self.pMessage('FALHA NA INSER??O DOS DADOS DE CRESCIMENTO', $009F9FFF, 'Falha na inser??o, verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
      self.pLimpaTelaCrescimento;
     end;
end;

procedure TController.pCadCrianca;
var
  Dao: TDataModule1;
  objCrianca: TCrianca;
begin
  frmCadCrianca.imgCadCri.Picture.SaveToFile(controller.fRetornaDirFoto);

  Dao := TDataModule1.Create(nil);
  objCrianca := TCrianca.Create;

  objCrianca.setNomeCrianca(frmCadCrianca.edtNome.Text);
  objCrianca.setCpfCrianca(frmCadCrianca.edtCPF.Text);
  objCrianca.setDataNascimento(frmCadCrianca.edtDataNasc.Text);

  if (frmCadCrianca.ckMasculino.Checked) then
    objCrianca.setSexo('Masculino')
  else
    objCrianca.setSexo('Feminino');

  objCrianca.setHospNascimento(frmCadCrianca.edtHospNasc.Text);
  objCrianca.setPesoNascimento(frmCadCrianca.edtPeso.Text);
  objCrianca.setNomePai(frmCadCrianca.edtNomePai.Text);
  objCrianca.setNomeMae(frmCadCrianca.edtNomeMae.Text);
  objCrianca.setResponsavel1(TResponsavel(frmCadCrianca.cbResp1.Items.Objects[frmCadCrianca.cbResp1.ItemIndex]).getIdResponsavel);
  objCrianca.setResponsavel2(TResponsavel(frmCadCrianca.cbResp2.Items.Objects[frmCadCrianca.cbResp2.ItemIndex]).getIdResponsavel);
  objCrianca.setObservacoes(frmCadCrianca.mmObservacoes.Lines.Text);
  objCrianca.setFoto(frmCadCrianca.imgCadCri);

  if not (frmCadCrianca.Tag = 1) then
     begin
       if (Dao.fInsertCrianca(objCrianca)) then
         begin
           self.pMessage('INSER??O DA CRIAN?A REALIZADA', $00FEF9CB, 'Inser??o de crian?a realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
           self.plimpaTelaCri;
         end
       else
         begin
           self.pMessage('FALHA NA INSER??O DA CRIAN?A', $009F9FFF, 'Falha na inser??o da crian?a verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
           self.plimpaTelaCri;
         end;
     end
  else
     begin
       objCrianca.setIdCrianca(StrToInt(frmCadCrianca.edtCodigo.Text));
       if (Dao.fAlteraCrianca(objCrianca)) then
         begin
           self.pMessage('ALTERA??O DA CRIAN?A REALIZADA', $00FEF9CB, 'altera??o da crian?a realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');

           if (FileExists(ExtractFilePath(Application.Exename) + 'Foto.jpg')) then
              DeleteFile(ExtractFilePath(Application.Exename) + 'Foto.jpg');

           self.plimpaTelaCri;
         end
       else
         begin
           self.pMessage('FALHA NA ALTERA??O DA CRIAN?A', $009F9FFF, 'Falha na altera??o da crian?a verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
           self.plimpaTelaCri;
         end;
     end;

end;

procedure TController.pCadItem;
var
  objItem : TItens;
begin
  objItem := TItens.Create;

  objItem.setDescItem(frmCadItem.edDescItem.Text);
  objItem.setUnidadeMedida(frmCadItem.edUnidadeMedida.Text);
  objItem.setValorUnitario(StrToFloat(Copy(self.fTiraPonto(frmCadItem.edValorUnitario.Text), 4, length(frmCadItem.edValorUnitario.Text))));

  if DataModule1.fInsertItem(objItem) then
     begin
       self.pMessage('INSER??O DE ITEM REALIZADA', $00C1D6FF, 'Inser??o de item realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
       self.pLimpaTelaItem;
     end
  else
     begin
       self.pMessage('FALHA NA INSER??O DE ITEM', $009F9FFF, 'Falha na inser??o de item verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
       self.pLimpaTelaItem;
     end;
end;

procedure TController.pCadMedico;
var
  objMedico : TMedico;
begin
  objMedico := TMedico.Create;

  objMedico.setNome(frmCadMedico.EditNome.Text);
  objMedico.setTelefone(frmCadMedico.edtTelefone.Text);
  objMedico.setEmail(frmCadMedico.edtEmail.Text);
  objMedico.setEspecialidade(frmCadMedico.edtEspecialidade.Text);
  objMedico.setCrm(frmCadMedico.edtCRM.Text);
  objMedico.setIdConsultorio(TConsultorio(frmCadMedico.cbConsultorio.Items.Objects[frmCadMedico.cbConsultorio.ItemIndex]).getIdConsultorio);

  if not (frmCadMedico.Tag = 1) then
     begin
       if (DataModule1.fInsertMedico(objMedico)) then
         begin
            self.pMessage('INSER??O DE M?DICO REALIZADA', $00FF9D9D, 'Inser??o de m?dico realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
            self.pLimpaTelaMed;
         end
       else
         begin
           self.pMessage('FALHA NA INSER??O DE M?DICO', $009F9FFF, 'Falha na inser??o de m?dico verifique os dados !!',ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
           self.pLimpaTelaMed;
         end;
     end
  else
     begin
       objMedico.setIdmedico(StrToInt(frmCadMedico.edtCodigo.Text));
       if (DataModule1.fAlteraMedico(objMedico)) then
         begin
            self.pMessage('ALTERA??O DE M?DICO REALIZADA', $00FF9D9D, 'Altera??o de m?dico realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
            self.pLimpaTelaMed;
         end
       else
         begin
           self.pMessage('FALHA NA ALTERA??O DE M?DICO', $009F9FFF, 'Falha na altera??o de m?dico verifique os dados !!',ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
           self.pLimpaTelaMed;
         end;
     end;
end;

procedure TController.pCadOcorrencia;
var
  objOcorrencia : TOcorrencia;
begin
  objOcorrencia := TOcorrencia.Create;

  objOcorrencia.setResponsavel(frmOcorrencia.edtAcompanhante.Text);
  objOcorrencia.setDataOcorrencia(frmOcorrencia.edtData.Text);
  objOcorrencia.setHoraOcorrencia(frmOcorrencia.edtHora.Text);
  objOcorrencia.setOcorrencia(frmOcorrencia.mmOcorrencia.Lines.Text);

  if (frmOcorrencia.ckSim.Checked = true) then
     objOcorrencia.setTomouMedicacao(frmOcorrencia.ckSim.Caption)
  else
     objOcorrencia.setTomouMedicacao(frmOcorrencia.ckNao.Caption);

  objOcorrencia.setDescMedicacao(frmOcorrencia.edtDescricao.Text);
  objOcorrencia.setHoraMedicacao(frmOcorrencia.edtHoraMedicacao.Text);
  objOcorrencia.setQuantidade(frmOcorrencia.edtQuantidade.Text);
  objOcorrencia.setIdCrianca(TCrianca(frmOcorrencia.cbCrianca.Items.Objects[frmOcorrencia.cbCrianca.ItemIndex]).getIdCrianca);

  if not (frmOcorrencia.Tag = 1) then
      begin
        if (DataModule1.fInsertOcorrecia(objOcorrencia)) then
           begin
            self.pMessage('INSER??O DE OCORR?NCIA REALIZADA', $00D8D8EB, 'Inser??o de ocorr?ncia realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
            self.pLimpaTelaOcocrrecia;
           end
        else
           begin
             self.pMessage('FALHA NA INSER??O DE OCORR?NCIA', $009F9FFF, 'Falha na inser??o de ocorr?ncia verifique os dados !!',ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
             self.pLimpaTelaOcocrrecia;
           end;
      end
  else
     begin
       objOcorrencia.setIdOcorrencia(StrToInt(frmOcorrencia.edtCodigo.Text));
       if DataModule1.fAlteraOcorrencia(objOcorrencia) then
         begin
          self.pMessage('ALTERA??O DE OCORR?NCIA REALIZADA', $00D8D8EB, 'Altera??o de ocorr?ncia realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
          self.pLimpaTelaOcocrrecia;
         end
       else
         begin
           self.pMessage('FALHA NA ALTERA??O DE OCORR?NCIA', $009F9FFF, 'Falha na altera??o de ocorr?ncia verifique os dados !!',ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
           self.pLimpaTelaOcocrrecia;
         end;

     end;
end;

procedure TController.pCadResponsavel;
var
  Dao: TDataModule1;
  objResp: TResponsavel;
  wValor: String;
begin

  Dao := TDataModule1.Create(nil);
  objResp := TResponsavel.Create;

  objResp.setNomeResponsavel(frmCadResp.edtNome.Text);
  objResp.setCpfResponsavel(frmCadResp.edtCPF.Text);
  objResp.setEmailResponsavel(frmCadResp.edtEmail.Text);
  objResp.setDataNascimento(frmCadResp.edtDataNasc.Text);
  objResp.setTelefoneResidencia(frmCadResp.edtResidencial.Text);
  objResp.setTelefoneCelular(frmCadResp.edtCelular.Text);
  wValor := Copy(self.fTiraPonto(frmCadResp.edtRendaMensal.Text), 3, Length(frmCadResp.edtRendaMensal.Text));
  objResp.setRendaMensal(StrToFloat(wValor));
  objResp.setObservacoes(frmCadResp.mmObservacao.Lines.Text);
  objResp.setCepResponsavel(frmCadResp.edtCEP.Text);
  objResp.setEstadoResponsavel(frmCadResp.edtEstado.Text);
  objResp.setCidadeResponsavel(frmCadResp.edtCidade.Text);
  objResp.setBairroResponsavel(frmCadResp.edtBairro.Text);
  objResp.setEndereco(frmCadResp.edtEndereco.Text);
  objResp.setFoto(frmCadResp.imgCadResp);

  if not(frmCadResp.Tag = 1) then
  begin
    if (Dao.pInsertResponsavel(objResp)) then
    begin
      self.pMessage('INSER??O DE RESPONS?VEL REALIZADA', $00D2FFD9, 'Inser??o de respons?vel realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
      self.pLimpaTelaResp;
    end
    else
    begin
      self.pMessage('FALHA NA INSER??O DE RESPONS?VEL', $009F9FFF, 'Falha na inser??o de respons?vel verifique os dados !!',ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
      self.pLimpaTelaResp;
    end;

  end
  else
  begin
    objResp.setIdResponsavel(StrToInt(frmCadResp.edtCodigo.Text));

    if (Dao.pAlteraResponsavel(objResp)) then
    begin
      self.pMessage('ALTERA??O DE RESPONS?VEL REALIZADA', $00D2FFD9, 'Altera??o de respons?vel realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
      self.pLimpaTelaResp;
    end
    else
    begin
      self.pMessage('FALHA NA ALTERA??O DE RESPONS?VEL', $009F9FFF, 'Falha na altera??o de respons?vel, verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
      self.pLimpaTelaResp;
    end;

  end;
end;

procedure TController.pCadUtensilios;
var
  objUtensilios :  TUtensilios;
begin
  objUtensilios := TUtensilios.Create;

  objUtensilios.setDataCompra(frmUtensilios.edDataCompra.Text);
  objUtensilios.setValorTotal(StrToFloat(Copy(self.fTiraPonto(frmUtensilios.edValorTotal.Text),4, Length(frmUtensilios.edValorTotal.Text))));
  objUtensilios.setListaCompras(frmUtensilios.mmListaComprada.Lines.Text);
  objUtensilios.setResponsavel(frmUtensilios.edtResponsavelCompra.Text);
  objUtensilios.setIdCrianca(TCrianca(frmUtensilios.cbCrianca.Items.Objects[frmUtensilios.cbCrianca.ItemIndex]).getIdCrianca);

  if (DataModule1.fInsertUtensilios(objUtensilios)) then
     begin
       self.pMessage('INSER??O DE COMPRA REALIZADA', $00C1D6FF, 'Inser??o de compra realizada !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
       self.pLimpaTelaUtensilios;
     end
  else
     begin
       self.pMessage('FALHA NA INSER??O DE COMPRA', $009F9FFF, 'Falha na inser??o de compra verifique os dados !!',ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
       self.pLimpaTelaUtensilios;
     end;
end;

procedure TController.pCadVacina;
var
  objVacina : TVacina;
begin
  objVacina := TVacina.Create;

  objVacina.setDataVacina(frmContVacina.edtData.Text);
  objVacina.setHoraVacina(frmContVacina.edtHora.Text);
  objVacina.setNomeVacina(frmContVacina.edtNomeVacina.Text);

  if (frmContVacina.rbPostoSaude.Checked = true) then
     objVacina.setLocalVacina(frmContVacina.rbPostoSaude.Caption)
  else
     if (frmContVacina.rbHospital.Checked = true) then
        objVacina.setLocalVacina(frmContVacina.rbHospital.Caption)
     else
       if (frmContVacina.rbConsultorio.Checked = true) then
          objVacina.setLocalVacina(frmContVacina.rbConsultorio.Caption)
       else
          objVacina.setLocalVacina(frmContVacina.rbOutros.Caption);

  objVacina.setDescLocal(frmContVacina.edtComplemento.Text);
  objVacina.setNomeProfissional(frmContVacina.edtNomeProfissional.Text);
  objVacina.setResponsavel(frmContVacina.edtAcompanhante.Text);
  objVacina.setProximaAplicacao(frmContVacina.edtProximaData.Text);
  objVacina.setIdCrianca(TCrianca(frmContVacina.cbCrianca.Items.Objects[frmContVacina.cbCrianca.ItemIndex]).getIdCrianca);

  if (DataModule1.fInsertVacina(objVacina)) then
     begin
      self.pMessage('INCLUS?O DE VACINA REALIZADA', $0080FFFF, 'Inclus?o de vacina realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
      self.pLimpaTelaVac;
     end
  else
     begin
       self.pMessage('FALHA NA INCLUS?O DE VACINA', $009F9FFF, 'Falha na inclus?o de vacina, verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
       self.pLimpaTelaVac;
     end;
end;

{procedures para tornar os campo enabled em casos que n?o h? edi??o de registro}
procedure TController.pCamposAlimEnabled(prEnabled : boolean);
begin
  frmAlimentacao.edtAcompanhante.Enabled := prEnabled;
  frmAlimentacao.edtData.Enabled := prEnabled;
  frmAlimentacao.edtHora.Enabled := prEnabled;
  frmAlimentacao.rbPouquissimo.Enabled := prEnabled;
  frmAlimentacao.rbPouco.Enabled := prEnabled;
  frmAlimentacao.rbNormal.Enabled := prEnabled;
  frmAlimentacao.rbBastante.Enabled := prEnabled;
  frmAlimentacao.cbCrianca.Enabled := prEnabled;
  frmAlimentacao.mmObservacoes.Enabled := prEnabled;
end;

procedure TController.pCamposConsultaEnabled(prEnabled: Boolean);
begin
  frmConsulta.edtAcompanhante.Enabled := prEnabled;
  frmConsulta.edtData.Enabled := prEnabled;
  frmConsulta.edtHora.Enabled := prEnabled;
  frmConsulta.edtMotivo.Enabled := prEnabled;
  frmConsulta.edtValor.Enabled := prEnabled;
  frmConsulta.edtProximaConsulta.Enabled := prEnabled;
  frmConsulta.mmExames.Enabled := prEnabled;
  frmConsulta.mmObservacoes.Enabled := prEnabled;
  frmConsulta.cbCrianca.Enabled := prEnabled;
  frmConsulta.cbMedico.Enabled := prEnabled;
  frmConsulta.cbConsultorio.Enabled := prEnabled;
end;

procedure TController.pCamposConsultorioEnabled(prEnabled: Boolean);
begin
  frmConsultorio.edtNomeConsultorio.Enabled := prEnabled;
  frmConsultorio.edtCEP.Enabled := prEnabled;
  frmConsultorio.edtEstado.Enabled := prEnabled;
  frmConsultorio.edtCidade.Enabled := prEnabled;
  frmConsultorio.edtBairro.Enabled := prEnabled;
  frmConsultorio.edtEndereco.Enabled := prEnabled;
  frmConsultorio.edtEmail.Enabled := prEnabled;
  frmConsultorio.edtTelefone.Enabled := prEnabled;
end;

procedure TController.pCamposCrescimentoEnabled(prEnabled: Boolean);
begin
  frmCrescimento.edtData.Enabled := prEnabled;
  frmCrescimento.edtImc.Enabled := prEnabled;
  frmCrescimento.edtPeso.Enabled := prEnabled;
  frmCrescimento.edCircCabeca.Enabled := prEnabled;
  frmCrescimento.edtAltura.Enabled := prEnabled;
  frmCrescimento.edtCircBarriga.Enabled := prEnabled;
  frmCrescimento.mmObservacoes.Enabled := prEnabled;
  frmCrescimento.cbCrianca.Enabled := prEnabled;
end;

procedure TController.pCamposUtensiliosEnabled(prEnabled: boolean);
begin
  frmUtensilios.edQuantidade.Enabled := prEnabled;
  frmUtensilios.edDataCompra.Enabled := prEnabled;
  frmUtensilios.edtResponsavelCompra.Enabled := prEnabled;
  frmUtensilios.edValorTotal.Enabled := prEnabled;
  frmUtensilios.mmListaComprada.Enabled := prEnabled;
  frmUtensilios.cbItem.Enabled := prEnabled;
  frmUtensilios.cbCrianca.Enabled := prEnabled;
  frmUtensilios.sbCadItem.Enabled := prEnabled;
  frmUtensilios.sbAdicionarLista.Enabled := prEnabled;
end;

procedure TController.pCamposVacinaEnabled(prEnabled: Boolean);
begin
  frmContVacina.edtData.Enabled := prEnabled;
  frmContVacina.edtHora.Enabled := prEnabled;
  frmContVacina.edtNomeVacina.Enabled := prEnabled;
  frmContVacina.edtComplemento.Enabled := prEnabled;
  frmContVacina.edtNomeProfissional.Enabled := prEnabled;
  frmContVacina.edtProximaData.Enabled := prEnabled;
  frmContVacina.edtAcompanhante.Enabled := prEnabled;
  frmContVacina.cbCrianca.Enabled := prEnabled;
  frmContVacina.rbPostoSaude.Enabled := prEnabled;
  frmContVacina.rbConsultorio.Enabled := prEnabled;
  frmContVacina.rbOutros.Enabled := prEnabled;
  frmContVacina.rbHospital.Enabled := prEnabled;
end;

{procedures de exlus?o de registros}
procedure TController.pExcluiAlimentacao;
begin
  if (DataModule1.fDelete('Delete from TCONALIM where idControle = :prId;', StrToInt(frmAlimentacao.edtCodigo.Text))) then
     begin
       self.pMessage('ALIMENTA??O EXCLU?DA', $00FFDFFF, 'Exclus?o de alimenta??o realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
       self.pCamposAlimEnabled(true);
       self.pLimpaTelaAlim;
     end
  else
    begin
       self.pMessage('FALHA NA EXCLUS?O DA ALIMENTA??O', $009F9FFF, 'Falha na exclus?o da alimenta??o, verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
       self.pLimpaTelaAlim;
    end;
end;

procedure TController.pExcluiCompras;
begin
  if (DataModule1.fDelete('Delete from TCOMPRAS where idCompra = :prId;', StrToInt(frmUtensilios.edCodigo.Text))) then
     begin
       self.pMessage('COMPRA EXCLU?DA', $00C1D6FF, 'Exclus?o de compra realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
       self.pLimpaTelaUtensilios;
       controller.pCamposUtensiliosEnabled(true);
       frmUtensilios.sbSalvar.Enabled := true;
     end
  else
     begin
       self.pMessage('FALHA NA EXCLUS?O DA COMPRA', $009F9FFF, 'Falha na exclus?o da compra, verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
       self.pLimpaTelaUtensilios;
     end;
end;

procedure TController.pExcluiConsulta;
begin
  if (DataModule1.fDelete('Delete from TCONSULTA where idConsulta = :prId;', StrToInt(frmConsulta.edtCodigo.Text))) then
  begin
    self.pMessage('CONSULTA EXCLU?DA', $00FFD7D7, 'Exclus?o de consulta realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
    self.pCamposConsultaEnabled(true);
    self.pLimpaTelaConsulta;
  end
  else
  begin
    self.pMessage('FALHA NA EXCLUS?O DE CONSULTA', $009F9FFF, 'Falha na exclus?o de consulta, verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
    self.pLimpaTelaConsulta;
  end;
end;

procedure TController.pExcluiConsultorio;
begin
  if (DataModule1.fDelete('Delete from TCADCON where idConsultorio = :prId;', StrToInt(frmConsultorio.edtCodigo.Text))) then
     begin
       self.pMessage('CONSULT?RIO EXCLU?DO', $00C4C4FF, 'Exclus?o de consult?rio realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
       self.pCamposConsultorioEnabled(true);
       self.pLimpaTelaCon;
       frmConsultorio.sbSalvar.Enabled := true;
     end
  else
     begin
       self.pMessage('FALHA NA EXCLUS?O DO CONSULT?RIO', $009F9FFF, 'Falha na exclus?o do consult?rio, verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
       self.pLimpaTelaCon
     end;
end;

procedure TController.pExcluiCrescimento;
begin
  if (DataModule1.fDelete('Delete from TCRESCIMENTO where idCrescimento = :prId;', StrToInt(frmCrescimento.edtCodigo.Text))) then
     begin
       self.pMessage('DADOS DE CRESCIMENTO EXCLU?DO', $00FFCCE6, 'Exclus?o de dados realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
       self.pCamposCrescimentoEnabled(true);
       self.pLimpaTelaCrescimento;
     end
  else
     begin
       self.pMessage('FALHA NA EXCLUS?O DOS DADOS', $009F9FFF, 'Falha na exclus?o dos dados, verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
       self.pLimpaTelaCrescimento;
     end;
end;

procedure TController.pExcluiCrianca;
begin
  if (DataModule1.fDelete('Delete from TCADCRI where idCrianca = :prId;', StrToInt(frmCadCrianca.edtCodigo.Text))) then
     begin
       self.pMessage('CRIAN?A EXCLU?DA', $00FFCCE6, 'Exclus?o de crian?a realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
       self.plimpaTelaCri;
     end
  else
     begin
       self.pMessage('FALHA NA EXCLUS?O DA CRIAN?A', $009F9FFF, 'Falha na exclus?o da crian?a, verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
       self.plimpaTelaCri;
     end;
end;

procedure TController.pExcluiMedico;
begin
  if (DataModule1.fDelete('Delete from TCADMED where idMedico = :idMedico;', StrToInt(frmCadMedico.edtCodigo.Text))) then
     begin
       self.pMessage('M?DICO EXCLU?DO', $00FF9D9D, 'Exclus?o de m?dico realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
       self.pLimpaTelaMed;
     end
  else
     begin
       self.pMessage('FALHA NA EXCLUS?O DE M?DICO', $009F9FFF, 'Falha na exclus?o de m?dico, verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
       self.pLimpaTelaMed;
     end;
end;

procedure TController.pExcluiOcorrencia;
begin
   if (DataModule1.fDelete('Delete from TOCORRENCIA where idOcorrencia = :prId;', StrToInt(frmOcorrencia.edtCodigo.Text)))  then
     begin
       self.pMessage('OCORR?NCIA EXCLU?DA', $00D8D8EB, 'Exclus?o de ocorr?ncia realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
       self.pLimpaTelaOcocrrecia;
     end
   else
     begin
       self.pMessage('FALHA NA EXCLUS?O DE OCORR?NCIA', $009F9FFF, 'Falha na exclus?o de ocorr?ncia, verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
       self.pLimpaTelaOcocrrecia;
     end;
end;

procedure TController.pExcluiResponsavel;
begin
  if (DataModule1.fDelete('Delete from TCADRESP where idResponsavel = :prId;', StrToInt(frmCadResp.edtCodigo.Text))) then
  begin
    self.pMessage('RESPONS?VEL EXCLU?DO', $00D2FFD9, 'Exclus?o de respons?vel realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
    self.pLimpaTelaResp;
  end
  else
  begin
    self.pMessage('FALHA NA EXCLUS?O DE RESPONS?VEL', $009F9FFF, 'Falha na exclus?o de respons?vel, verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
    self.pLimpaTelaResp;
  end;

end;

procedure TController.pExcluiVacina;
begin
  if (DataModule1.fDelete('Delete from TCONVACI where idVacina = :prId;', StrToInt(frmContVacina.edtCodigo.Text))) then
     begin
       self.pMessage('VACINA EXCLU?DA', $0080FFFF, 'Exclus?o de vacina realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
       self.pLimpaTelaVac;
       self.pCamposVacinaEnabled(true);
       frmContVacina.sbSalvar.Enabled := true;
     end
  else
     begin
       self.pMessage('FALHA NA EXCLUS?O DE VACINA', $009F9FFF, 'Falha na exclus?o de vacina, verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
       self.pLimpaTelaVac;
     end;
end;

{procedures para limpar os campos do formul?rio ap?s inser??o ou exclus?o}
procedure TController.pLimpaTelaAlim;
begin
   frmAlimentacao.edtAcompanhante.Clear;
   frmAlimentacao.edtData.Clear;
   frmAlimentacao.edtHora.Clear;
   frmAlimentacao.mmObservacoes.Lines.Clear;
   frmAlimentacao.cbCrianca.Text := 'Selecione...';
   frmAlimentacao.rbPouquissimo.Checked := false;
   frmAlimentacao.rbPouco.Checked := false;
   frmAlimentacao.rbNormal.Checked := false;
   frmAlimentacao.rbBastante.Checked := false;
   frmAlimentacao.edtAcompanhante.SetFocus;
   frmAlimentacao.edtCodigo.Clear;
end;

procedure TController.pLimpaTelaCon;
begin
   frmConsultorio.edtNomeConsultorio.Clear;
   frmConsultorio.edtTelefone.Clear;
   frmConsultorio.edtEmail.Clear;
   frmConsultorio.edtCodigo.Clear;
   frmConsultorio.edtCEP.Clear;
   frmConsultorio.edtEstado.Clear;
   frmConsultorio.edtCidade.Clear;
   frmConsultorio.edtBairro.Clear;
   frmConsultorio.edtEndereco.Clear;
   frmConsultorio.edtNomeConsultorio.SetFocus;
end;

procedure TController.pLimpaTelaConsulta;
begin
  frmConsulta.edtCodigo.Clear;
  frmConsulta.edtAcompanhante.Clear;
  frmConsulta.edtData.Clear;
  frmConsulta.edtHora.Clear;
  frmConsulta.edtMotivo.Clear;
  frmConsulta.edtValor.Clear;
  frmConsulta.mmExames.Clear;
  frmConsulta.mmObservacoes.Clear;
  frmConsulta.cbCrianca.Text := 'Selecione...';
  frmConsulta.cbMedico.Text := 'Selecione...';
  frmConsulta.cbConsultorio.Text := 'Selecione...';
  frmConsulta.edtProximaConsulta.Clear;
  frmConsulta.edtAcompanhante.SetFocus;
  frmConsulta.sbSalvar.Enabled := true;
  frmConsulta.sbExcluir.Enabled := false;
end;

procedure TController.pLimpaTelaCrescimento;
begin
  frmCrescimento.cbCrianca.Text := 'Selecione...';
  frmCrescimento.edtData.Clear;
  frmCrescimento.edtPeso.Clear;
  frmCrescimento.edtAltura.Clear;
  frmCrescimento.edtImc.Clear;
  frmCrescimento.edtCodigo.Clear;
  frmCrescimento.edCircCabeca.Clear;
  frmCrescimento.edtCircBarriga.Clear;
  frmCrescimento.mmObservacoes.Lines.Clear;
end;

procedure TController.plimpaTelaCri;
begin
  frmCadCrianca.edtNome.Clear;
  frmCadCrianca.edtCPF.Clear;
  frmCadCrianca.edtDataNasc.Clear;
  frmCadCrianca.ckMasculino.Checked := false;
  frmCadCrianca.ckFeminino.Checked := false;
  frmCadCrianca.edtHospNasc.Clear;
  frmCadCrianca.edtPeso.Clear;
  frmCadCrianca.edtNomePai.Clear;
  frmCadCrianca.edtNomeMae.Clear;
  frmCadCrianca.cbResp1.Text := 'Selecione...';
  frmCadCrianca.cbResp2.Text := 'Selecione...';
  frmCadCrianca.edtCodigo.Clear;
  frmCadCrianca.mmObservacoes.Lines.Clear;
  frmCadCrianca.imgCadCri.Picture.LoadFromFile(ExtractFilePath(Application.Exename) + 'Images\fotoPerfil.jpg');
end;

procedure TController.pLimpaTelaItem;
begin
   frmCadItem.edDescItem.Clear;
   frmCadItem.edUnidadeMedida.Clear;
   frmCadItem.edValorUnitario.Clear;
   frmCadItem.edDescItem.SetFocus;
end;

procedure TController.pLimpaTelaMed;
begin
  frmCadMedico.EditNome.Clear;
  frmCadMedico.edtEmail.Clear;
  frmCadMedico.edtTelefone.Clear;
  frmCadMedico.edtCRM.Clear;
  frmCadMedico.edtCodigo.Clear;
  frmCadMedico.cbConsultorio.Text := 'Selecione...';
  frmCadMedico.edtEspecialidade.Clear;
  frmCadMedico.sbExcluir.Enabled := false;
end;

procedure TController.pLimpaTelaOcocrrecia;
begin
  frmOcorrencia.edtAcompanhante.Clear;
  frmOcorrencia.edtData.Clear;
  frmOcorrencia.edtHora.Clear;
  frmOcorrencia.edtQuantidade.Clear;
  frmOcorrencia.edtHoraMedicacao.Clear;
  frmOcorrencia.mmOcorrencia.Lines.Clear;
  frmOcorrencia.edtDescricao.Clear;
  frmOcorrencia.cbCrianca.text := 'Selecione...';
  frmOcorrencia.ckSim.Checked := false;
  frmOcorrencia.ckNao.Checked := false;
  frmOcorrencia.edtCodigo.Clear;

  if (frmOcorrencia.edtDescricao.Enabled = false) then
     begin
       frmOcorrencia.edtDescricao.Enabled := true;
       frmOcorrencia.edtHoraMedicacao.Enabled := true;
       frmOcorrencia.edtQuantidade.Enabled := true;
       frmOcorrencia.Label5.Enabled := true;
     end;

  frmOcorrencia.edtAcompanhante.SetFocus;
end;

procedure TController.pLimpaTelaResp;
begin
  frmCadResp.edtNome.Clear;
  frmCadResp.edtCPF.Clear;
  frmCadResp.edtEmail.Clear;
  frmCadResp.edtResidencial.Clear;
  frmCadResp.edtCelular.Clear;
  frmCadResp.edtRendaMensal.Clear;
  frmCadResp.edtCEP.Clear;
  frmCadResp.edtEstado.Clear;
  frmCadResp.edtCidade.Clear;
  frmCadResp.edtBairro.Clear;
  frmCadResp.edtEndereco.Clear;
  frmCadResp.edtDataNasc.Clear;
  frmCadResp.edtCodigo.Clear;
  frmCadResp.edtCodigo.Visible := false;
  frmCadResp.mmObservacao.Lines.Clear;
  frmCadResp.imgCadResp.Picture.LoadFromFile
    (ExtractFilePath(Application.Exename) + 'Images\fotoPerfil.jpg');
  frmCadResp.sbExcluir.Enabled := false;
end;

procedure TController.pLimpaTelaUtensilios;
begin
  frmUtensilios.edCodigo.Clear;
  frmUtensilios.edtResponsavelCompra.Clear;
  frmUtensilios.edQuantidade.Text := '1';
  frmUtensilios.edDataCompra.Clear;
  frmUtensilios.edValorTotal.Text := 'R$ 0,00';
  frmUtensilios.mmListaComprada.Lines.Clear;
  frmUtensilios.cbItem.Text := 'Selecione...';
  frmUtensilios.cbCrianca.Text := 'Selecione...';
end;

procedure TController.pLimpaTelaVac;
begin
  frmContVacina.edtData.Clear;
  frmContVacina.edtHora.Clear;
  frmContVacina.edtNomeVacina.Clear;
  frmContVacina.edtComplemento.Clear;
  frmContVacina.edtNomeProfissional.Clear;
  frmContVacina.edtCodigo.Clear;
  frmContVacina.edtProximaData.Clear;
  frmContVacina.edtAcompanhante.Clear;
  frmContVacina.cbCrianca.Text := 'Selecione...';
  frmContVacina.rbPostoSaude.Checked := false;
  frmContVacina.rbConsultorio.Checked := false;
  frmContVacina.rbOutros.Checked := false;
  frmContVacina.rbHospital.Checked := false;
end;

{procedure criada para alimentar o formul?rio de mensagem geral usado no cadastro, edi??o e exclus?o de registros}
procedure TController.pMessage(prCaption: String; prColor: integer;
  prLabel: String; prFoto: String);
begin
  frmMessage := TfrmMessage.Create(frmCadResp);
  frmMessage.Visible := false;
  frmMessage.Caption := prCaption;
  frmMessage.pnMessage.Color := prColor;
  frmMessage.lbMessage.Caption := prLabel;
  frmMessage.imgMessage.Picture.LoadFromFile(prFoto);
  frmMessage.ShowModal;
end;

{procedure para popular combobox}
procedure TController.pPopulaComboBox(prComboBox: TComboBox; prTela : integer);
var
  lista: Tlist;
  i: integer;
begin
  lista := Tlist.Create;
  prComboBox.Clear;

  case prTela of
  1:
    begin
      lista := DataModule1.fSelectResponsavel;
      for i := 0 to lista.Count - 1 do
        begin
          prComboBox.AddItem(IntToStr(TResponsavel(lista.Items[i]).getIdResponsavel) +
            ' - ' + TResponsavel(lista.Items[i]).getNomeResponsavel, lista[i]);
        end;
    end;
  2:
    begin
      lista := DataModule1.fSelectCrianca;
      for i := 0 to lista.Count -1 do
        begin
          prComboBox.AddItem(IntToStr(TCrianca(lista.Items[i]).getIdCrianca) +
          ' - ' + TCrianca(lista.Items[i]).getNomeCrianca, lista[i]);
        end;
    end;
  3:
    begin
      lista := DataModule1.fSelectConsultorio;
      for i := 0 to lista.Count -1 do
        begin
          prComboBox.AddItem(IntToStr(TConsultorio(lista.Items[i]).getIdConsultorio) +
          ' - ' + TConsultorio(lista.Items[i]).getNomeConsultorio, lista[i]);
        end;
    end;

  4:
    begin
      lista := DataModule1.fSelectMedico;
      for i := 0 to lista.Count -1  do
          begin
            prComboBox.AddItem(IntToStr(TMedico(lista.Items[i]).getIdMedico) + ' - ' + TMedico(lista.Items[i]).getNome, lista[i]);
          end;
    end;

  5:
    begin
      lista := DataModule1.fSelectItens;
      for i := 0 to lista.Count -1  do
          begin
            prComboBox.AddItem(IntToStr(TItens(lista.Items[i]).getIdItem) + ' - ' + TItens(lista.Items[i]).getDescItem, lista[i]);
          end;
    end;

  end;

end;

{procedure para popular DBgrid}
procedure TController.pPopulaDBGrid(prSQL: String);
begin
  DataModule1.Source.DataSet := DataModule1.fRetornaQuery(prSQL);
end;

end.
