unit uAlimentacao;

interface
uses
    Vcl.ExtCtrls;

    Type TAlimentacao = Class

      Private
        idControle : integer;
        data : String;
        hora : String;
        quantidade : String;
        observacoes : String;
        acompanhante : String;
        idCrianca : integer;

      public
        procedure setIdControle(idControle : integer);
        function getIdControle : integer;

        procedure setData(data : String);
        function getData : String;

        procedure setHora(hora : String);
        function getHora : String;

        procedure setQuantidade(quantidade : String);
        function getQuantidade : String;

        procedure setObservacoes(observacoes : String);
        function getObservacoes : String;

        procedure setAcompanhante(acompanhante : String);
        function getAcompanhante : String;

        procedure setIdCrianca(idCrianca : Integer);
        function getIdCrianca : Integer;

    End;

implementation

{ TAlimentacao }

function TAlimentacao.getAcompanhante: String;
begin
  result := acompanhante;
end;

function TAlimentacao.getData: String;
begin
  result := data;
end;

function TAlimentacao.getHora: String;
begin
  result := hora;
end;

function TAlimentacao.getIdControle: integer;
begin
  result := idControle;
end;

function TAlimentacao.getIdCrianca: Integer;
begin
  result := idCrianca;
end;

function TAlimentacao.getObservacoes: String;
begin
  result := observacoes;
end;

function TAlimentacao.getQuantidade: String;
begin
  result := quantidade;
end;

procedure TAlimentacao.setAcompanhante(acompanhante: String);
begin
  self.acompanhante := acompanhante;
end;

procedure TAlimentacao.setData(data: String);
begin
  self.data := data;
end;

procedure TAlimentacao.setHora(hora: String);
begin
  self.hora := hora;
end;

procedure TAlimentacao.setIdControle(idControle: integer);
begin
  self.idControle := idControle;
end;

procedure TAlimentacao.setIdCrianca(idCrianca: Integer);
begin
  self.idCrianca := idCrianca;
end;

procedure TAlimentacao.setObservacoes(observacoes: String);
begin
  self.observacoes := observacoes;
end;

procedure TAlimentacao.setQuantidade(quantidade: String);
begin
  self.quantidade := quantidade;
end;

end.
