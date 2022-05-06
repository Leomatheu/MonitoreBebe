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
  private
    { Private declarations }
  public
    function pInsertResponsavel(prObjResponsavel : TResponsavel):Boolean;
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

{ TDataModule1 }

function TDataModule1.pInsertResponsavel(prObjResponsavel : TResponsavel):Boolean;
var
   query : TFDQuery;
   foto : TStream;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('insert into TCADRESP values (0, :nomeResponsavel, :cpfResponsavel, :emailResponsavel, :dataNascimento, :telefoneResidencia, :telefoneCelular, :rendaMensal, :observacoes, :enderecoResponsavel, :foto);');

  query.Params[0].AsString := prObjResponsavel.getNomeResponsavel;
  query.Params[1].AsString := prObjResponsavel.getCpfResponsavel;
  query.Params[2].AsString := prObjResponsavel.getEmailResponsavel;
  query.Params[3].AsString := prObjResponsavel.getDataNascimento;
  query.Params[4].AsString := prObjResponsavel.getTelefoneResidencia;
  query.Params[5].AsString := prObjResponsavel.getTelefoneCelular;
  query.Params[6].AsFloat := prObjResponsavel.getRendaMensal;
  query.Params[7].AsString := prObjResponsavel.getObservacoes;
  query.Params[8].AsString := prObjResponsavel.getEnderecoResponsavel;

  foto := TFileStream.Create('C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\MonitoreBebe\Project\Foto.Jpeg', fmOpenRead);

  query.Params[9].LoadFromStream(foto, ftBlob);

  try
     query.ExecSQL;
     query.Close;
     query.Free;
     result := true;
  Except
    on e:Exception do
      result := false;
  end;


end;

end.
