unit uMedico;

interface
  uses
    Vcl.ExtCtrls;

    Type TMedico = class

      private
         idMedico : integer;
         nomeMedico : String;
         telefone : String;
         email : String;
         especialidade : String;
         crm : String;
         idConsultorio : integer;

      public

        procedure setIdmedico(idMedico : integer);
        function  getIdMedico : integer;

        procedure setNome(nomeMedico : String);
        function  getNome : String;

        procedure setTelefone(telefone : String);
        function  getTelefone : String;

        procedure setEmail(email : String);
        function  getEmail : String;

        procedure setEspecialidade(especialidade : String);
        function  getEspecialidade : String;

        procedure setCrm(crm : String);
        function  getCrm : String;

        procedure setIdConsultorio(idConsultorio : integer);
        function  getIdConsultorio : integer;
    end;


implementation

{ TMedico }

function TMedico.getCrm: String;
begin
  result := self.crm;
end;

function TMedico.getEmail: String;
begin
  result := self.email;
end;

function TMedico.getEspecialidade: String;
begin
  result := self.especialidade;
end;

function TMedico.getIdConsultorio: integer;
begin
  result := self.idConsultorio;
end;

function TMedico.getIdMedico: integer;
begin
  result := self.idMedico;
end;

function TMedico.getNome: String;
begin
  result := self.nomeMedico;
end;

function TMedico.getTelefone: String;
begin
  result := self.telefone;
end;

procedure TMedico.setCrm(crm: String);
begin
  self.crm := crm;
end;

procedure TMedico.setEmail(email: String);
begin
  self.email := email;
end;

procedure TMedico.setEspecialidade(especialidade: String);
begin
  self.especialidade := especialidade;
end;

procedure TMedico.setIdConsultorio(idConsultorio: integer);
begin
  self.idConsultorio := idConsultorio;
end;

procedure TMedico.setIdmedico(idMedico: integer);
begin
  self.idMedico := idMedico;
end;

procedure TMedico.setNome(nomeMedico: String);
begin
  self.nomeMedico := nomeMedico;
end;

procedure TMedico.setTelefone(telefone: String);
begin
  self.telefone := telefone;
end;

end.
