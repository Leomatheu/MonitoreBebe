unit uConsultorio;

interface

  Type TConsultorio = class

    Private
      idConsultorio : integer;
      nomeConsultorio : String;
      telefone : String;
      email : String;
      cep : String;
      estado : String;
      cidade : String;
      bairro : String;
      endereco : String;


      public
        procedure setIdConsultorio(idConsultorio : integer);
        function getIdConsultorio : integer;

        procedure setNomeConsultorio(nomeConsultorio : String);
        function getNomeConsultorio : String;

        procedure setTelefone(telefone : String);
        function getTelefone : String;

        procedure setEmail(email : String);
        function getEmail : String;

        procedure setCep(cep : String);
        function getCep : String;

        procedure setEstado(estado : String);
        function getEstado : String;

        procedure setCidade(cidade : String);
        function getCidade : String;

        procedure setBairro(bairro : String);
        function getBairro : String;

        procedure setEndereco(endereco : String);
        function getEndereco : String;




  end;

implementation

{ TConsultorio }

function TConsultorio.getBairro: String;
begin
  result := bairro;
end;

function TConsultorio.getCep: String;
begin
  result := cep;
end;

function TConsultorio.getCidade: String;
begin
  result := cidade;
end;

function TConsultorio.getEmail: String;
begin
  result := email;
end;

function TConsultorio.getEndereco: String;
begin
  result := endereco;
end;

function TConsultorio.getEstado: String;
begin
  result := estado;
end;

function TConsultorio.getIdConsultorio: integer;
begin
  result := idConsultorio;
end;

function TConsultorio.getNomeConsultorio: String;
begin
  result := nomeConsultorio;
end;

function TConsultorio.getTelefone: String;
begin
  result := telefone;
end;

procedure TConsultorio.setBairro(bairro: String);
begin
  self.bairro := bairro;
end;

procedure TConsultorio.setCep(cep: String);
begin
    self.cep := cep;
end;

procedure TConsultorio.setCidade(cidade: String);
begin
    self.cidade := cidade;
end;

procedure TConsultorio.setEmail(email: String);
begin
  self.email := email;
end;

procedure TConsultorio.setEndereco(endereco: String);
begin
  self.endereco := endereco;
end;

procedure TConsultorio.setEstado(estado: String);
begin
  self.estado := estado;
end;

procedure TConsultorio.setIdConsultorio(idConsultorio: integer);
begin
  self.idConsultorio := idConsultorio;
end;

procedure TConsultorio.setNomeConsultorio(nomeConsultorio: String);
begin
  self.nomeConsultorio := nomeConsultorio;
end;

procedure TConsultorio.setTelefone(telefone: String);
begin
  self.telefone := telefone;
end;

end.
