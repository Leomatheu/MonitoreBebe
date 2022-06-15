unit uCrescimento;

interface
  Type TCrescimento = class

    Private
      idCrescimento : integer;
      dataCrescimento : String;
      peso : String;
      altura : String;
      imc : String;
      circCabeca : String;
      circBarriga : String;
      observacoes : String;
      idCrianca : integer;

    public
      procedure setIdCrescimento(idCrescimento : integer);
      function getIdCrescimento : integer;

      procedure setDataCrescimento(dataCrescimento : String);
      function getDataCrescimento : String;

      procedure setPeso(peso : String);
      function getPeso : String;

      procedure setAltura(altura : String);
      function getAltura : String;

      procedure setImc(imc : String);
      function getImc : String;

      procedure setCircCabeca(circCabeca : String);
      function getCircCabeca : String;

      procedure setCircBarriga(circBarriga : String);
      function getCircBarriga : String;

      procedure setObservacoes(observacoes : String);
      function getObservacoes : String;

      procedure setIdCrianca(idCrianca : integer);
      function getIdCrianca : integer;
  end;

implementation

{ TCrescimento }

function TCrescimento.getAltura: String;
begin
  result := altura;
end;

function TCrescimento.getCircBarriga: String;
begin
  result := circBarriga;
end;

function TCrescimento.getCircCabeca: String;
begin
  result := circCabeca;
end;

function TCrescimento.getDataCrescimento: String;
begin
  result := dataCrescimento;
end;

function TCrescimento.getIdCrescimento: integer;
begin
  result := idCrescimento;
end;

function TCrescimento.getIdCrianca: integer;
begin
  result := idCrianca;
end;

function TCrescimento.getImc: String;
begin
  result := imc;
end;

function TCrescimento.getObservacoes: String;
begin
  result := observacoes;
end;

function TCrescimento.getPeso: String;
begin
  result := peso;
end;

procedure TCrescimento.setAltura(altura: String);
begin
  self.altura := altura;
end;

procedure TCrescimento.setCircBarriga(circBarriga: String);
begin
  self.circBarriga := circBarriga;
end;

procedure TCrescimento.setCircCabeca(circCabeca: String);
begin
  self.circCabeca := circCabeca;
end;

procedure TCrescimento.setDataCrescimento(dataCrescimento: String);
begin

end;

procedure TCrescimento.setIdCrescimento(idCrescimento: integer);
begin
  self.idCrescimento := idCrescimento;
end;

procedure TCrescimento.setIdCrianca(idCrianca: integer);
begin
  self.idCrianca := idCrianca;
end;

procedure TCrescimento.setImc(imc: String);
begin
  self.imc := imc;
end;

procedure TCrescimento.setObservacoes(observacoes: String);
begin
  self.observacoes := observacoes;
end;

procedure TCrescimento.setPeso(peso: String);
begin
  self.peso := peso;
end;

end.
