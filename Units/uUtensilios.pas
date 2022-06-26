unit uUtensilios;

interface
uses
    Vcl.ExtCtrls;

  Type TUtensilios = Class

    private
      idCompra : integer;
      dataCompra : String;
      valorTotal : double;
      listaCompras : String;
      responsavel : String;
      idCrianca : integer;

    public
      procedure setIdCompra(idCompra:integer);
      function getIdCompra:integer;

      procedure setDataCompra(DataCompra:String);
      function getDataCompra:String;

      procedure setValorTotal(ValorTotal:Double);
      function getValorTotal:Double;

      procedure setListaCompras(ListaCompras:String);
      function getListaCompras:String;

      procedure setResponsavel(Responsavel:String);
      function getResponsavel:String;

      procedure setIdCrianca(idCrianca:integer);
      function getIdCrianca:integer;


  End;

implementation

{ TUtensilios }

function TUtensilios.getDataCompra: String;
begin
  result := self.dataCompra;
end;

function TUtensilios.getIdCompra: integer;
begin
  result := self.idCompra;
end;

function TUtensilios.getIdCrianca: integer;
begin
  result := self.idCrianca;
end;

function TUtensilios.getListaCompras: String;
begin
  result := self.listaCompras;
end;

function TUtensilios.getResponsavel: String;
begin
  result := self.responsavel;
end;

function TUtensilios.getValorTotal: Double;
begin
  result := self.valorTotal;
end;

procedure TUtensilios.setDataCompra(DataCompra: String);
begin
  self.dataCompra := DataCompra;
end;

procedure TUtensilios.setIdCompra(idCompra: integer);
begin
  self.idCompra := idCompra;
end;

procedure TUtensilios.setIdCrianca(idCrianca: integer);
begin
  self.idCrianca := idCrianca;
end;

procedure TUtensilios.setListaCompras(ListaCompras: String);
begin
  self.listaCompras := ListaCompras;
end;

procedure TUtensilios.setResponsavel(Responsavel: String);
begin
  self.responsavel := Responsavel;
end;

procedure TUtensilios.setValorTotal(ValorTotal: Double);
begin
  self.valorTotal := ValorTotal;
end;

end.
