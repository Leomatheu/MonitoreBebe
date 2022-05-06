unit uController;

interface

uses
   uResponsavel, uDao, formCadResp, System.Classes, System.SysUtils, formMessage;

  type TController = class

    public
        procedure pCadResponsavel;
        function fTiraPonto(prText : String):String;

  end;

implementation

{ TController }

function TController.fTiraPonto(prText: String): String;
var
   i : integer;
begin
  for i := 0 to Length(prText) do
    begin
       if prText[i]='.' then
          begin
               delete(prText,i,1);
          end
    end;

  Result := prText;
end;

procedure TController.pCadResponsavel;
var
   Dao : TDataModule1;
   objResp : TResponsavel;
   wEndCompleto : String;
   wValor : String;
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
  wEndCompleto := frmCadResp.edtCEP.Text+','+frmCadResp.edtEstado.Text+','+frmCadResp.edtCidade.Text+','+frmCadResp.edtBairro.Text+','+frmCadResp.edtEndereco.Text;
  objResp.setEnderecoResponsavel(wEndCompleto);
  objResp.setFoto(frmCadResp.imgCadResp);

  if (Dao.pInsertResponsavel(objResp)) then
     begin
       frmMessage := TfrmMessage.Create(frmCadResp);
       frmMessage.Visible := false;
       frmMessage.Caption := 'INSERÇÃO DE RESPONSÁVEL REALIZADA';
       frmMessage.pnMessage.Color := $00D2FFD9;
       frmMessage.lbMessage.Caption := 'Inserção de responsável realizada com sucesso !!';
       frmMessage.imgMessage.Picture.LoadFromFile('C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\MonitoreBebe\Images\salvo.bmp');
       frmMessage.ShowModal;
     end
  else
     begin
       frmMessage := TfrmMessage.Create(nil);
       frmMessage.Visible := false;
       frmMessage.Caption := 'FALHA NA INSERÇÃO DE RESPONSÁVEL';
       frmMessage.pnMessage.Color := $009F9FFF;
       frmMessage.lbMessage.Caption := 'Falha na inserção de responsável verifique os dados !!';
       frmMessage.imgMessage.Picture.LoadFromFile('C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\MonitoreBebe\Images\negado.bmp');
       frmMessage.ShowModal;
     end;
end;

end.
