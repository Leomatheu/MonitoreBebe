unit uConsulta;

interface

    Type TConsulta = class

      Private
        idConsulta : integer;
        dataConsulta : String;
        hora : String;
        motivo : String;
        acompanhante : String;
        descExame : String;
        proximaConsulta : String;
        valor : Double;
        observacoes : String;
        idMedico : integer;
        idConsultorio : integer;
        idCrianca : integer;

      public
        procedure setIdConsulta(idConsulta : integer);
        function getIdConsulta : integer;

        procedure setDataConsulta(dataConsulta : String);
        function getDataConsulta : String;

        procedure setHora(hora : String);
        function getHora : String;

        procedure setMotivo(motivo : String);
        function getMotivo : String;

        procedure setAcompanhante(acompanhante : String);
        function getAcompanhante : String;

        procedure setDescExame(descExame : String);
        function getDescExame : String;

        procedure setProximaConsulta(proximaConsulta : String);
        function getProximaConsulta : String;

        procedure setValor(valor : Double);
        function getValor : Double;

        procedure setObservacoes(observacoes : String);
        function getObservacoes : String;

        procedure setIdMedico(idMedico : integer);
        function getIdMedico : integer;

        procedure setIdConsultorio(idConsultorio : integer);
        function getIdConsultorio : integer;

        procedure setIdCrianca(idCrianca : integer);
        function getIdCrianca : integer;


    end;

implementation

{ TConsulta }

function TConsulta.getAcompanhante: String;
begin
  result := acompanhante;
end;

function TConsulta.getDataConsulta: String;
begin
  result := dataConsulta;
end;

function TConsulta.getDescExame: String;
begin
  result := descExame;
end;

function TConsulta.getHora: String;
begin
  result := hora;
end;

function TConsulta.getIdConsulta: integer;
begin
  result := idConsulta;
end;

function TConsulta.getIdConsultorio: integer;
begin
  result := idConsultorio;
end;

function TConsulta.getIdCrianca: integer;
begin
  result := idCrianca;
end;

function TConsulta.getIdMedico: integer;
begin
  result := idMedico;
end;

function TConsulta.getMotivo: String;
begin
  result := motivo;
end;

function TConsulta.getObservacoes: String;
begin
  result := observacoes;
end;

function TConsulta.getProximaConsulta: String;
begin
  result := proximaConsulta;
end;

function TConsulta.getValor: Double;
begin
  result := valor;
end;

procedure TConsulta.setAcompanhante(acompanhante: String);
begin
  self.acompanhante :=  acompanhante;
end;

procedure TConsulta.setDataConsulta(dataConsulta: String);
begin
  self.dataConsulta := dataConsulta;
end;

procedure TConsulta.setDescExame(descExame: String);
begin
  self.descExame := descExame;
end;

procedure TConsulta.setHora(hora: String);
begin
  self.hora := hora;
end;

procedure TConsulta.setIdConsulta(idConsulta: integer);
begin
  self.idConsulta := idConsulta;
end;

procedure TConsulta.setIdConsultorio(idConsultorio: integer);
begin
  self.idConsultorio := idConsultorio;
end;

procedure TConsulta.setIdCrianca(idCrianca: integer);
begin
  self.idCrianca := idCrianca;
end;

procedure TConsulta.setIdMedico(idMedico: integer);
begin
  self.idMedico := idMedico;
end;

procedure TConsulta.setMotivo(motivo: String);
begin
  self.motivo := motivo;
end;

procedure TConsulta.setObservacoes(observacoes: String);
begin
  self.observacoes := observacoes;
end;

procedure TConsulta.setProximaConsulta(proximaConsulta: String);
begin
  self.proximaConsulta := proximaConsulta;
end;

procedure TConsulta.setValor(valor: double);
begin
  self.valor := valor;
end;

end.
