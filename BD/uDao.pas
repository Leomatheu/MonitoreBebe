unit uDao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uResponsavel;

type
  TDataModule1 = class(TDataModule)
    Conexao: TFDConnection;
    Query: TFDQuery;
    DriverConexao: TFDPhysMySQLDriverLink;
    Transaction: TFDTransaction;
    Source: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    function pInsertResponsavel(prObjResponsavel : TResponsavel):Boolean;
    function pAlteraResponsavel(prObjResponsavel : TResponsavel):Boolean;
    function fDeleteResponsavel(prId : integer):Boolean;
    function fRetornaQuery(prSQL : String) : TFDQuery;
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

{ TDataModule1 }

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  Conexao.Connected := true;
end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
  Conexao.Connected := false;
end;

function TDataModule1.fDeleteResponsavel(prId: integer): Boolean;
begin
   DataModule1.Query.Create(nil);
   DataModule1.Conexao.Connected := true;
   DataModule1.Query.Connection := DataModule1.Conexao;

   DataModule1.Query.SQL.Add('Delete from TCADRESP where idResponsavel = :prId;');
   DataModule1.Query.Params[0].AsInteger := prId;

   try
       DataModule1.Query.ExecSQL;
       result := true;
   except
     on e: Exception do 
       result := false;
   end;
end;

function TDataModule1.fRetornaQuery(prSQL: String): TFDQuery;
var
   data : TDataModule1;
begin
   result := TFDQuery.Create(nil);
   data := TDataModule1.Create(nil);
   result.Connection := data.Conexao;
   result.SQL.Add(prSQL);
   result.Open;
end;

function TDataModule1.pAlteraResponsavel(prObjResponsavel: TResponsavel): Boolean;
var
   query : TFDQuery;
   foto : TStream;
   data : TDataModule1;
begin
  query := TFDQuery.Create(nil);
  data := TDataModule1.Create(nil);
  query.Connection := data.Conexao;

  query.SQL.Add('update TCADRESP set nomeResponsavel = :nome, cpfResponsavel = :cpf, emailResponsavel = :email, dataNascimento = :nasc, telefoneResidencia = :tel, telefoneCelular = :cel, rendaMensal = :rm, observacoes = :obs,'+
                'cepResponsavel = :cep, estadoResponsavel = :estado, cidadeResponsavel = :cidade, bairroResponsavel = :bairro, endResponsavel = :end, foto = :foto where idResponsavel = :codigo;');

  query.Params[0].AsString := prObjResponsavel.getNomeResponsavel;
  query.Params[1].AsString := prObjResponsavel.getCpfResponsavel;
  query.Params[2].AsString := prObjResponsavel.getEmailResponsavel;
  query.Params[3].AsString := prObjResponsavel.getDataNascimento;
  query.Params[4].AsString := prObjResponsavel.getTelefoneResidencia;
  query.Params[5].AsString := prObjResponsavel.getTelefoneCelular;
  query.Params[6].AsFloat := prObjResponsavel.getRendaMensal;
  query.Params[7].AsString := prObjResponsavel.getObservacoes;
  query.Params[8].AsString := prObjResponsavel.getCepResponsavel;
  query.Params[9].AsString := prObjResponsavel.getEstadoResponsavel;
  query.Params[10].AsString := prObjResponsavel.getCidadeResponsavel;
  query.Params[11].AsString := prObjResponsavel.getBairroResponsavel;
  query.Params[12].AsString := prObjResponsavel.getEndereco;

  foto := TFileStream.Create('C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\Foto.Jpeg', fmOpenRead);

  query.Params[13].LoadFromStream(foto, ftBlob);
  query.Params[14].AsInteger := prObjResponsavel.getIdResponsavel;


    try
     query.ExecSQL;
     result := true;
  Except
    on e:Exception do
      result := false;
  end;

    query.Close;
    query.Free;

end;

function TDataModule1.pInsertResponsavel(prObjResponsavel : TResponsavel):Boolean;
var
   query : TFDQuery;
   foto : TStream;
   data : TDataModule1;
begin
  query := TFDQuery.Create(nil);
  data := TDataModule1.Create(nil);
  query.Connection := data.Conexao;

  query.SQL.Add('insert into TCADRESP values (0, :nomeResponsavel, :cpfResponsavel, :emailResponsavel, :dataNascimento, :telefoneResidencia,'+' :telefoneCelular, :rendaMensal, :observacoes, :cepResponsavel, :estadoResponsavel, :cidadeResponsavel, :bairroResponsavel, :endResponsavel, :foto);');

  query.Params[0].AsString := prObjResponsavel.getNomeResponsavel;
  query.Params[1].AsString := prObjResponsavel.getCpfResponsavel;
  query.Params[2].AsString := prObjResponsavel.getEmailResponsavel;
  query.Params[3].AsString := prObjResponsavel.getDataNascimento;
  query.Params[4].AsString := prObjResponsavel.getTelefoneResidencia;
  query.Params[5].AsString := prObjResponsavel.getTelefoneCelular;
  query.Params[6].AsFloat := prObjResponsavel.getRendaMensal;
  query.Params[7].AsString := prObjResponsavel.getObservacoes;
  query.Params[8].AsString := prObjResponsavel.getCepResponsavel;
  query.Params[9].AsString := prObjResponsavel.getEstadoResponsavel;
  query.Params[10].AsString := prObjResponsavel.getCidadeResponsavel;
  query.Params[11].AsString := prObjResponsavel.getBairroResponsavel;
  query.Params[12].AsString := prObjResponsavel.getEndereco;

  foto := TFileStream.Create('C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\Foto.Jpeg', fmOpenRead);

  query.Params[13].LoadFromStream(foto, ftBlob);

  try
     query.ExecSQL;
     result := true;
  Except
    on e:Exception do
      result := false;
  end;

    query.Close;
    query.Free;
end;

end.
