unit uCrianca;

interface
Uses
   Vcl.ExtCtrls;

  Type TCrianca = Class

    Private
       idCrianca : integer;
       nomeCrianca : String;
       dataNascimento : String;
       cpfCrianca : String;
       observacoes : String;
       sexo : String;
       hospNascimento : String;
       pesoNascimento : String;
       nomePai : String;
       nomeMae : String;
       responsavel1 : integer;
       responsavel2 : integer;
       foto : TImage;

    public
       procedure setIdCrianca(idCrianca : integer);
       function  getIdCrianca: integer;

       procedure setNomeCrianca(nomeCrianca : String);
       function  getNomeCrianca : string;

       procedure setDataNascimento(dataNascimento : String);
       function  getDataNascimento : String;

       procedure setCpfCrianca(cpfCrianca : String);
       function  getCpfCrianca : String;

       procedure setObservacoes(observacoes : String);
       function  getObservacoes : String;

       procedure setSexo(sexo : String);
       function  getSexo : String;

       procedure setHospNascimento(hospNascimento : String);
       function  getHospNascimento : String;

       procedure setPesoNascimento(pesoNascimento : String);
       function  getPesoNascimento : String;

       procedure setNomePai(nomePai : String);
       function  getNomePai : String;

       procedure setNomeMae(nomeMae : String);
       function  getNomeMae : String;

       procedure setResponsavel1(responsavel1 : integer);
       function  getResponsavel1 : integer;

       procedure setResponsavel2(responsavel2 : integer);
       function  getResponsavel2 : integer;

       procedure setFoto(Foto : TImage);
       function getFoto: TImage;




  End;

implementation

{ TCrianca }

function TCrianca.getCpfCrianca: String;
begin
  result := self.cpfCrianca;
end;

function TCrianca.getDataNascimento: String;
begin
  result := self.dataNascimento;
end;

function TCrianca.getFoto: TImage;
begin
  result := self.foto;
end;

function TCrianca.getHospNascimento: String;
begin
  result := self.hospNascimento;
end;

function TCrianca.getIdCrianca: integer;
begin
  result := self.idCrianca;
end;

function TCrianca.getNomeCrianca: string;
begin
  result := self.nomeCrianca;
end;

function TCrianca.getNomeMae: String;
begin
  result := self.nomeMae;
end;

function TCrianca.getNomePai: String;
begin
  result := self.nomePai;
end;

function TCrianca.getObservacoes: String;
begin
  result := self.observacoes;
end;

function TCrianca.getPesoNascimento: String;
begin
  result := self.pesoNascimento;
end;

function TCrianca.getResponsavel1: integer;
begin
  result := self.responsavel1;
end;

function TCrianca.getResponsavel2: integer;
begin
  result := responsavel2;
end;

function TCrianca.getSexo: String;
begin
  result := self.sexo;
end;

procedure TCrianca.setCpfCrianca(cpfCrianca: String);
begin
  self.cpfCrianca := cpfCrianca;
end;

procedure TCrianca.setDataNascimento(dataNascimento: String);
begin
  self.dataNascimento := dataNascimento;
end;

procedure TCrianca.setFoto(Foto: TImage);
begin
  self.foto := foto;
end;

procedure TCrianca.setHospNascimento(hospNascimento: String);
begin
  self.hospNascimento := hospNascimento;
end;

procedure TCrianca.setIdCrianca(idCrianca: integer);
begin
  self.idCrianca := idCrianca;
end;

procedure TCrianca.setNomeCrianca(nomeCrianca: String);
begin
  self.nomeCrianca := nomeCrianca;
end;

procedure TCrianca.setNomeMae(nomeMae: String);
begin
  self.nomeMae := nomeMae;
end;

procedure TCrianca.setNomePai(nomePai: String);
begin
  self.nomePai := nomePai;
end;

procedure TCrianca.setObservacoes(observacoes: String);
begin
  self.observacoes := observacoes;
end;

procedure TCrianca.setPesoNascimento(pesoNascimento: String);
begin
  self.pesoNascimento := pesoNascimento;
end;

procedure TCrianca.setResponsavel1(responsavel1: integer);
begin
  self.responsavel1 := responsavel1;
end;

procedure TCrianca.setResponsavel2(responsavel2: integer);
begin
  self.responsavel2 := responsavel2;
end;

procedure TCrianca.setSexo(sexo: String);
begin
  self.sexo := sexo;
end;

end.
