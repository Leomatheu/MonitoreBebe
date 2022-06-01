unit uController;

interface

uses
  uResponsavel, uDao, formCadResp, System.Classes, System.SysUtils, formMessage,
  uCrianca, formCadCrianca, Vcl.StdCtrls, Vcl.Forms, formAlimentacao, uAlimentacao;

type
  TController = class

  public
    procedure pCadResponsavel;
    procedure pExcluiResponsavel;
    procedure pCadCrianca;
    procedure pExcluiCrianca;
    procedure pCadAlimentacao;
    function fTiraPonto(prText: String): String;
    function fRetornaDirFoto: String;
    procedure pMessage(prCaption: String; prColor: integer; prLabel: String; prFoto: String);
    procedure pPopulaDBGrid(prSQL: String);
    procedure pPopulaComboBox(prComboBox: TComboBox; prTela : integer);
    procedure plimpaTelaCri;
    procedure pLimpaTelaResp;
    procedure pLimpaTelaAlim;



  end;

var
  Controller: TController;

implementation

{ TController }

function TController.fRetornaDirFoto: String;
var
  aux: String;
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
        self.pMessage('INSER��O DE ALIMENTA��O REALIZADA', $00FFDFFF, 'Inser��o de alimenta��o realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
        self.pLimpaTelaAlim;
       end
    else
       begin
        self.pMessage('FALHA NA INSER��O DE ALIMENTA��O', $009F9FFF, 'Falha na inser��o de alimenta��o verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
        self.pLimpaTelaAlim;
       end;
end;

{Processos utilizados pela crian�a}
procedure TController.pCadCrianca;
var
  Dao: TDataModule1;
  objCrianca: TCrianca;
begin
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
           self.pMessage('INSER��O DA CRIAN�A REALIZADA', $00FEF9CB, 'Inser��o de crian�a realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
           self.plimpaTelaCri;
         end
       else
         begin
           self.pMessage('FALHA NA INSER��O DA CRIAN�A', $009F9FFF, 'Falha na inser��o da crian�a verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
           self.plimpaTelaCri;
         end;
     end
  else
     begin
       objCrianca.setIdCrianca(StrToInt(frmCadCrianca.edtCodigo.Text));
       if (Dao.fAlteraCrianca(objCrianca)) then
         begin
           self.pMessage('ALTERA��O DA CRIAN�A REALIZADA', $00FEF9CB, 'altera��o da crian�a realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
           self.plimpaTelaCri;
         end
       else
         begin
           self.pMessage('FALHA NA ALTERA��O DA CRIAN�A', $009F9FFF, 'Falha na altera��o da crian�a verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
           self.plimpaTelaCri;
         end;
     end;

end;

{Processos utilizados pelo respons�vel}
procedure TController.pCadResponsavel;
var
  Dao: TDataModule1;
  objResp: TResponsavel;
  wEndCompleto: String;
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
  wValor := Copy(self.fTiraPonto(frmCadResp.edtRendaMensal.Text), 3,
    Length(frmCadResp.edtRendaMensal.Text));
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
      self.pMessage('INSER��O DE RESPONS�VEL REALIZADA', $00D2FFD9, 'Inser��o de respons�vel realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
      self.pLimpaTelaResp;
    end
    else
    begin
      self.pMessage('FALHA NA INSER��O DE RESPONS�VEL', $009F9FFF, 'Falha na inser��o de respons�vel verifique os dados !!',ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
      self.pLimpaTelaResp;
    end;

  end
  else
  begin
    objResp.setIdResponsavel(StrToInt(frmCadResp.edtCodigo.Text));

    if (Dao.pAlteraResponsavel(objResp)) then
    begin
      self.pMessage('ALTERA��O DE RESPONS�VEL REALIZADA', $00D2FFD9, 'Altera��o de respons�vel realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
      self.pLimpaTelaResp;
    end
    else
    begin
      self.pMessage('FALHA NA ALTERA��O DE RESPONS�VEL', $009F9FFF, 'Falha na altera��o de respons�vel, verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
      self.pLimpaTelaResp;
    end;

  end;
end;

procedure TController.pExcluiCrianca;
var
  Dao : TDataModule1;
begin
  Dao := TDataModule1.Create(nil);

  if (Dao.fDeleteCrianca(StrToInt(frmCadCrianca.edtCodigo.Text))) then
     begin
       self.pMessage('CRIAN�A EXCLU�DA', $00D2FFD9, 'Exclus�o de crian�a realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
       self.plimpaTelaCri;
     end
  else
     begin
       self.pMessage('FALHA NA EXCLUS�O DA CRIAN�A', $009F9FFF, 'Falha na exclus�o da crian�a, verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
       self.plimpaTelaCri;
     end;
end;

procedure TController.pExcluiResponsavel;
begin
  if (DataModule1.fDeleteResponsavel(StrToInt(frmCadResp.edtCodigo.Text))) then
  begin
    self.pMessage('RESPONS�VAL EXCLU�DO', $00D2FFD9, 'Exclus�o de respons�vel realizada com sucesso !!', ExtractFilePath(Application.Exename) + 'Images\salvo.bmp');
    self.pLimpaTelaResp;
  end
  else
  begin
    self.pMessage('FALHA NA EXCLUS�O DE RESPONS�VEL', $009F9FFF, 'Falha na exclus�o de respons�vel, verifique os dados !!', ExtractFilePath(Application.Exename) + 'Images\negado.bmp');
    self.pLimpaTelaResp;
  end;

end;

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
  end;

end;

procedure TController.pPopulaDBGrid(prSQL: String);
begin
  DataModule1.Source.DataSet := DataModule1.fRetornaQuery(prSQL);
end;

end.
