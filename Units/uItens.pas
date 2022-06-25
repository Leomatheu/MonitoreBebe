unit uItens;

interface
  Type TItens = class
    private
       idItem : integer;
       descItem : String;
       unidadeMedia : String;
       valorUnitario : Double;

    public
       procedure setIdItem(item : integer);
       function getIdItem:integer;

       procedure setDescItem(descItem : string);
       function getDescItem:String;

       procedure setUnidadeMedida(unidadeMedida : string);
       function getUnidadeMedida:String;

       procedure setValorUnitario(ValorUnitario : Double);
       function getValorUnitario:Double;
  end;

implementation

{ TItens }

function TItens.getDescItem: String;
begin
  result := self.descItem;
end;

function TItens.getIdItem: integer;
begin
  result := self.idItem;
end;

function TItens.getUnidadeMedida: String;
begin
  result := self.unidadeMedia;
end;

function TItens.getValorUnitario: Double;
begin
  result := self.valorUnitario;
end;

procedure TItens.setDescItem(descItem: string);
begin
  self.descItem := descItem;
end;

procedure TItens.setIdItem(item: integer);
begin
  self.idItem := item;
end;

procedure TItens.setUnidadeMedida(unidadeMedida: string);
begin
  self.unidadeMedia := unidadeMedida;
end;

procedure TItens.setValorUnitario(ValorUnitario: Double);
begin
  self.valorUnitario := ValorUnitario;
end;

end.
