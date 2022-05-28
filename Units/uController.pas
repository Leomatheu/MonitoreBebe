unit uController;

interface

uses
  uResponsavel, uDao, formCadResp, System.Classes, System.SysUtils, formMessage,
  uCrianca, formCadCrianca, Vcl.StdCtrls, Vcl.Forms, formAlimentacao, uAlimentacao;

type
  TController = class

  public
    procedure pCadResponsavel;
    procedure pCadCrianca;
    procedure pAlimentacao;
    function fTiraPonto(prText: String): String;
    function fRetornaDirFoto: String;
    procedure pMessage(prCaption: String; prColor: integer; prLabel: String; prFoto: String);
    procedure pExcluiResponsavel;
    procedure pLimpaTelaResp;
    procedure pPopulaDBGrid(prSQL: String);
    procedure pPopulaComboBox(prComboBox: TComboBox);
    procedure plimpaTelaCri;
    procedure pSetaItemIndex(combox : TComboBox; index : integer; obj : TObject);


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

<<<<<<< Updated upstream
procedure TController.pAlimentacao;
var
    Dao: TDataModule1;
    objAlimentacao: TAlimentacao;
begin
    Dao := DataModule1.Create(nil);
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

    objAlimentacao.setObservacoes(frmAlimentacao.mmObservacoes.text);
    objAlimentacao.setAcompanhante(frmAlimentacao.edtAcompanhante.Text);
    objAlimentacao.setIdCrianca(TCrianca(frmAlimentacao.cbCrianca.Items.Objects[frmAlimentacao.cbCrianca.ItemIndex]).getIdCrianca);

    Dao.fInsertAlimentacao(objAlimentacao);
end;

=======
{Processos utilizados pela criança}
>>>>>>> Stashed changes
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

  if (Dao.fInsertCrianca(objCrianca)) then
     begin
      self.pMessage('INSERÇÃO DE CRIANÇA REALIZADA', $00FEF9CB, 'Inserção de criança realizada com sucesso !!', 'C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\MonitoreBebe\Images\salvo.bmp');
      self.plimpaTelaCri;
     end
  else
    begin
      self.pMessage('FALHA NA INSERÇÃO DA CRIANÇA', $009F9FFF, 'Falha na inserção da criança verifique os dados !!',' C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\MonitoreBebe\Images\negado.bmp');
      self.plimpaTelaCri;
    end;

end;

{Processos utilizados pela pessoa}
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
      self.pMessage('INSERÇÃO DE RESPONSÁVEL REALIZADA', $00D2FFD9, 'Inserção de responsável realizada com sucesso !!', 'C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\MonitoreBebe\Images\salvo.bmp');
      self.pLimpaTelaResp;
    end
    else
    begin
      self.pMessage('FALHA NA INSERÇÃO DE RESPONSÁVEL', $009F9FFF, 'Falha na inserção de responsável verifique os dados !!',' C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\MonitoreBebe\Images\negado.bmp');
      self.pLimpaTelaResp;
    end;

  end
  else
  begin
    objResp.setIdResponsavel(StrToInt(frmCadResp.edtCodigo.Text));

    if (Dao.pAlteraResponsavel(objResp)) then
    begin
      self.pMessage('ALTERAÇÃO DE RESPONSÁVEL REALIZADA', $00D2FFD9, 'Alteração de responsável realizada com sucesso !!', 'C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\MonitoreBebe\Images\salvo.bmp');
      self.pLimpaTelaResp;
    end
    else
    begin
      self.pMessage('FALHA NA ALTERAÇÃO DE RESPONSÁVEL', $009F9FFF, 'Falha na alteração de responsável, verifique os dados !!', 'C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\MonitoreBebe\Images\negado.bmp');
      self.pLimpaTelaResp;
    end;

  end;
end;

procedure TController.pExcluiResponsavel;
begin
  if (DataModule1.fDeleteResponsavel(StrToInt(frmCadResp.edtCodigo.Text))) then
  begin
    self.pMessage('RESPONSÁVAL EXCLUÍDO', $00D2FFD9, 'Exclusão de responsável realizada com sucesso !!', 'C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\MonitoreBebe\Images\salvo.bmp');
    self.pLimpaTelaResp;
  end
  else
  begin
    self.pMessage('FALHA NA EXCLUSÃO DE RESPONSÁVEL', $009F9FFF, 'Falha na exclusão de responsável, verifique os dados !!', 'C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\MonitoreBebe\Images\negado.bmp');
    self.pLimpaTelaResp;
  end;

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
  frmCadCrianca.cbResp1.Text := '';
  frmCadCrianca.cbResp2.Text := '';
  frmCadCrianca.edtCodigo.Clear;
  frmCadCrianca.mmObservacoes.Lines.Clear;
  frmCadCrianca.imgCadCri.Picture.LoadFromFile('C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\MonitoreBebe\Images\fotoPerfil.jpg');
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
    ('C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\MonitoreBebe\Images\fotoPerfil.jpg');
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

procedure TController.pPopulaComboBox(prComboBox: TComboBox);
var
  lista: Tlist;
  i: integer;
begin
  lista := Tlist.Create;
  lista := DataModule1.fSelectResponsavel;

  for i := 0 to lista.Count - 1 do
  begin
    prComboBox.AddItem(IntToStr(TResponsavel(lista.Items[i]).getIdResponsavel) +
      ' - ' + TResponsavel(lista.Items[i]).getNomeResponsavel, lista[i]);
  end;
end;

procedure TController.pPopulaDBGrid(prSQL: String);
begin
  DataModule1.Source.DataSet := DataModule1.fRetornaQuery(prSQL);
end;

procedure TController.pSetaItemIndex(combox : TComboBox; index : integer; obj : TObject);
var
   i : integer;
begin
  for i := 0 to combox.GetCount do

end;

end.
