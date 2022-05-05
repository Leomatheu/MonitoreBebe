unit uResponsavel;

interface
uses
   Vcl.ExtCtrls;

  Type TResponsavel = class

    private
      idResponsavel : integer;
      nomeResponsavel : String;
      cpfResponsavel : String;
      emailResponsavel : String;
      dataNascimento : String;
      telefoneResidencia : String;
      telefoneCelular : String;
      rendaMensal : double;
      observacoes : String;
      enderecoResponsavel : String;
      foto : TImage;

    public
        procedure setIdResponsavel(idResponsavel:integer);
        function getIdResponsavel:integer;

        procedure setNomeResponsavel(nomeResponsavel:String);
        function getNomeResponsavel:String;

        procedure setCpfResponsavel(cpfResponsavel:String);
        function getCpfResponsavel:String;

        procedure setEmailResponsavel(emailResponsavel:String);
        function getEmailResponsavel:String;

        procedure setDataNascimento(dataNascimento:String);
        function  getDataNascimento:String;

        procedure setTelefoneResidencia(telefoneResidencia:String);
        function  getTelefoneResidencia:String;

        procedure setTelefoneCelular(telefoneCelular:String);
        function getTelefoneCelular:String;

        procedure setRendaMensal(rendaMensal:double);
        function getRendaMensal:double;

        procedure setObservacoes(observacoes:String);
        function getObservacoes:String;

        procedure setEnderecoResponsavel(enderecoResponsavel:String);
        function getEnderecoResponsavel:String;

        procedure setFoto(foto:TImage);
        function getFoto:TImage;

  end;

implementation

{ TResponsavel }

function TResponsavel.getCpfResponsavel: String;
begin
  result := Self.cpfResponsavel;
end;

function TResponsavel.getDataNascimento;
begin
  result := Self.dataNascimento;
end;

function TResponsavel.getEmailResponsavel: String;
begin
  result := self.emailResponsavel;
end;

function TResponsavel.getEnderecoResponsavel: String;
begin
  result := self.enderecoResponsavel;
end;

function TResponsavel.getFoto: TImage;
begin
  result := self.foto;
end;

function TResponsavel.getIdResponsavel: integer;
begin
  result := self.idResponsavel;
end;

function TResponsavel.getNomeResponsavel: String;
begin
  result := Self.nomeResponsavel;
end;

function TResponsavel.getObservacoes: String;
begin
  result := Self.observacoes;
end;

function TResponsavel.getRendaMensal: double;
begin
  result := Self.rendaMensal;
end;

function TResponsavel.getTelefoneCelular: String;
begin
  result := Self.telefoneCelular;
end;

function TResponsavel.getTelefoneResidencia: String;
begin
  result := Self.telefoneResidencia;
end;

procedure TResponsavel.setCpfResponsavel(cpfResponsavel: String);
begin
  self.cpfResponsavel := cpfResponsavel;
end;


procedure TResponsavel.setDataNascimento(dataNascimento: String);
begin
  self.dataNascimento := dataNascimento;
end;

procedure TResponsavel.setEmailResponsavel(emailResponsavel: String);
begin
  self.emailResponsavel := emailResponsavel;
end;

procedure TResponsavel.setEnderecoResponsavel(enderecoResponsavel: String);
begin
  self.enderecoResponsavel := enderecoResponsavel;
end;

procedure TResponsavel.setFoto(foto: TImage);
begin
  self.foto := foto;
end;

procedure TResponsavel.setIdResponsavel(idResponsavel: integer);
begin
  self.idResponsavel := idResponsavel;
end;

procedure TResponsavel.setNomeResponsavel(nomeResponsavel: String);
begin
  self.nomeResponsavel := nomeResponsavel;
end;

procedure TResponsavel.setObservacoes(observacoes: String);
begin
  self.observacoes := observacoes;
end;

procedure TResponsavel.setRendaMensal(rendaMensal: double);
begin
  self.rendaMensal := rendaMensal;
end;

procedure TResponsavel.setTelefoneCelular(telefoneCelular: String);
begin
  self.telefoneCelular := telefoneCelular;
end;

procedure TResponsavel.setTelefoneResidencia(telefoneResidencia: String);
begin
  self.telefoneResidencia := telefoneResidencia;
end;

end.
