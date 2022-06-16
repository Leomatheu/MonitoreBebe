unit uOcorrencia;

interface
  type TOcorrencia = class

    Private
      idOcorrencia : integer;
      responsavel : String;
      dataOcorrencia : String;
      horaOcorrencia : String;
      ocorrencia : String;
      tomouMedicao : String;
      descMedicacao : String;
      quantidade : String;
      horaMedicacao : String;
      idCrianca : integer;

    public
      procedure setIdOcorrencia(idOcorrencia : integer);
      function getIdOcorrencia : integer;

      procedure setResponsavel(responsavel : String);
      function getResponsavel : String;

      procedure setDataOcorrencia(dataOcorrencia : String);
      function getDataOcorrencia : String;

      procedure setHoraOcorrencia(horaOcorrencia : String);
      function getHoraOcorrencia : String;

      procedure setOcorrencia(ocorrencia : String);
      function getOcorrencia : String;

      procedure setTomouMedicacao(tomouMedicacao : String);
      function getTomouMedicacao : String;

      procedure setDescMedicacao(descMedicacao : String);
      function getDescMedicacao : String;

      procedure setQuantidade(quantidade : String);
      function getQuantidade : String;

      procedure setHoraMedicacao(horaMedicacao : String);
      function getHoraMedicacao : String;

      procedure setIdCrianca(idCrianca : integer);
      function getidCrianca :  integer;



  end;

implementation

{ TOcorrencia }


function TOcorrencia.getDataOcorrencia: String;
begin
  result := dataOcorrencia;
end;

function TOcorrencia.getDescMedicacao: String;
begin
  result := descMedicacao;
end;

function TOcorrencia.getHoraMedicacao: String;
begin
  result := horaMedicacao;
end;

function TOcorrencia.getHoraOcorrencia: String;
begin
  result := horaOcorrencia;
end;

function TOcorrencia.getidCrianca: integer;
begin
  result := idCrianca;
end;

function TOcorrencia.getIdOcorrencia: integer;
begin
  result := idOcorrencia;
end;

function TOcorrencia.getOcorrencia: String;
begin
  result := ocorrencia;
end;

function TOcorrencia.getQuantidade: String;
begin
  result := quantidade;
end;

function TOcorrencia.getResponsavel: String;
begin
  result := responsavel;
end;

function TOcorrencia.getTomouMedicacao: String;
begin
  result := self.tomouMedicao;
end;

procedure TOcorrencia.setDataOcorrencia(dataOcorrencia: String);
begin
  self.dataOcorrencia := dataOcorrencia;
end;

procedure TOcorrencia.setDescMedicacao(descMedicacao: String);
begin
  self.descMedicacao := descMedicacao;
end;

procedure TOcorrencia.setHoraMedicacao(horaMedicacao: String);
begin
  self.horaMedicacao := horaMedicacao;
end;

procedure TOcorrencia.setHoraOcorrencia(horaOcorrencia: String);
begin
  self.horaOcorrencia := horaOcorrencia;
end;

procedure TOcorrencia.setIdCrianca(idCrianca: integer);
begin
  self.idCrianca := idCrianca;
end;

procedure TOcorrencia.setIdOcorrencia(idOcorrencia: integer);
begin
  self.idOcorrencia := idOcorrencia;
end;

procedure TOcorrencia.setOcorrencia(ocorrencia: String);
begin
  self.ocorrencia := ocorrencia;
end;

procedure TOcorrencia.setQuantidade(quantidade: String);
begin
  self.quantidade := quantidade;
end;

procedure TOcorrencia.setResponsavel(responsavel: String);
begin
  self.responsavel := responsavel;
end;

procedure TOcorrencia.setTomouMedicacao(tomouMedicacao: String);
begin
  self.tomouMedicao := tomouMedicacao;
end;

end.
