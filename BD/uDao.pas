unit uDao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.DataSet,
<<<<<<< Updated upstream
<<<<<<< Updated upstream
  FireDAC.Comp.Client, uResponsavel, Vcl.ExtCtrls,  uCrianca, uAlimentacao;
=======
  FireDAC.Comp.Client, uResponsavel, Vcl.ExtCtrls,  uCrianca, Vcl.Forms;
>>>>>>> Stashed changes
=======
  FireDAC.Comp.Client, uResponsavel, Vcl.ExtCtrls,  uCrianca, Vcl.Forms;
>>>>>>> Stashed changes

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
    function fInsertAlimentacao(prObjAlimentacao : TAlimentacao) : Boolean;
    function pAlteraResponsavel(prObjResponsavel : TResponsavel):Boolean;
    function fDeleteResponsavel(prId : integer):Boolean;
    function fSelectResponsavel: Tlist;


    function fRetornaQuery(prSQL : String) : TFDQuery;

    function fInsertCrianca(prObjCrianca : TCrianca):Boolean;
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

function TDataModule1.fInsertCrianca(prObjCrianca: TCrianca): Boolean;
var
   query : TFDQuery;
   foto : TStream;
   data : TDataModule1;
begin
  query := TFDQuery.Create(nil);
  data := TDataModule1.Create(nil);
  query.Connection := data.Conexao;

  query.SQL.Add('insert into TCADCRI values (0, :nome, :dataNasc, :cpf, :observacoes, :sexo, :hospNasc, :pesoNasc, :pai, :mae, :respUm, :respDois, :foto);');

  query.Params[0].AsString := prObjCrianca.getNomeCrianca;
  query.Params[1].AsString := prObjCrianca.getDataNascimento;
  query.Params[2].AsString := prObjCrianca.getCpfCrianca;
  query.Params[3].AsString := prObjCrianca.getObservacoes;
  query.Params[4].AsString := prObjCrianca.getSexo;
  query.Params[5].AsString := prObjCrianca.getHospNascimento;
  query.Params[6].AsString := prObjCrianca.getPesoNascimento;
  query.Params[7].AsString := prObjCrianca.getNomePai;
  query.Params[8].AsString := prObjCrianca.getNomeMae;
  query.Params[9].AsInteger := prObjCrianca.getResponsavel1;
  query.Params[10].AsInteger := prObjCrianca.getResponsavel2;

  foto := TFileStream.Create(ExtractFilePath(Application.Exename) + 'Foto.jpg', fmOpenRead);

  query.Params[11].LoadFromStream(foto, ftBlob);

  try
     query.ExecSQL;
     result := true;
  Except
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

function TDataModule1.fSelectResponsavel: Tlist;
var
  stream : TStream;
  foto : TImage;
  lista : TList;
  objResp : TResponsavel;
  query : TFDQuery;
begin
  query := TFDQuery.Create(Nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('Select * from TCADRESP;');

  try
     query.Open;
     query.First;
     lista := TList.Create;

     while not (Query.Eof) do
       begin
         objResp := TResponsavel.Create;

         objResp.setIdResponsavel(query.Fields[0].AsInteger);
         objResp.setNomeResponsavel(query.Fields[1].AsString);
         objResp.setCpfResponsavel(query.Fields[2].AsString);
         objResp.setEmailResponsavel(query.Fields[3].AsString);
         objResp.setDataNascimento(query.Fields[4].AsString);
         objResp.setTelefoneResidencia(query.Fields[5].AsString);
         objResp.setTelefoneCelular(query.Fields[6].AsString);
         objResp.setRendaMensal(query.Fields[7].AsFloat);
         objResp.setCepResponsavel(query.Fields[8].AsString);
         objResp.setEstadoResponsavel(query.Fields[9].AsString);
         objResp.setCidadeResponsavel(query.Fields[10].AsString);
         objResp.setBairroResponsavel(query.Fields[11].AsString);
         objResp.setEndereco(query.Fields[12].AsString);
         objResp.setObservacoes(query.Fields[13].AsString);
         stream := query.CreateBlobStream(query.Fields[14], bmRead);
         foto := Timage.Create(nil);
         //foto.Picture.LoadFromStream(stream);
         objResp.setFoto(foto);

         lista.Add(objResp);
         Query.Next;       
       end;

     result := lista;
  Except
     on e: Exception do 
       e.ToString;
  end;

  query.Close;
  query.Free;
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

  foto := TFileStream.Create(ExtractFilePath(Application.Exename) + 'Foto.jpg', fmOpenRead);

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

function TDataModule1.fInsertAlimentacao(prObjAlimentacao: TAlimentacao): Boolean;
var
    query : TFDQuery;
    data : TDataModule1;
begin
    query := TFDQuery.Create(nil);
    data := TDataModule1.Create(nil);
    query.Connection := data.Conexao;

    query.SQL.Add('insert into TCONALIM values (0, :data, :hora, :quantidade, :observacoes, :acompanhante, idCrianca;');

    query.Params[0].AsString :=  prObjAlimentacao.getData;
    query.Params[1].AsString := prObjAlimentacao.getHora;
    query.Params[2].AsString := prObjAlimentacao.getQuantidade;
    query.Params[3].AsString := prObjAlimentacao.getObservacoes;
    query.Params[4].AsString := prObjAlimentacao.getAcompanhante;
    query.Params[5].AsInteger := prObjAlimentacao.getIdCrianca;

    try
      query.ExecSQL;
      result := true;

    except on E: Exception do
      result := false;
    end;

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

  foto := TFileStream.Create(ExtractFilePath(Application.Exename) + 'Foto.jpg', fmOpenRead);

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
