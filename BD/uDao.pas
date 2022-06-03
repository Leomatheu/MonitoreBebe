unit uDao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uResponsavel, Vcl.ExtCtrls,  uCrianca, uAlimentacao, Vcl.Forms;


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
    function fDeleteCrianca(prId : integer):Boolean;
    function fDeleteAlimentacao(prId : integer):Boolean;
    function fSelectResponsavel: Tlist;
    function fSelectCrianca: Tlist;
    function fSelectDadoEspecifico(prSQL : String; prParametro : integer): String;
    function fRetornaQuery(prSQL : String) : TFDQuery;
    function fInsertCrianca(prObjCrianca : TCrianca):Boolean;
    function fAlteraCrianca(prObjCrianca : TCrianca):Boolean;
  end;

var
  DataModule1: TDataModule1;

implementation



{$R *.dfm}

{ TDataModule1 }

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  Conexao.Connected := true;
  Self.DriverConexao.VendorLib := ExtractFilePath(Application.Exename) + 'libmysql.dll';
end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
  Conexao.Connected := false;
end;

function TDataModule1.fAlteraCrianca(prObjCrianca: TCrianca): Boolean;
var
   query : TFDQuery;
   foto : TStream;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('update tcadcri set nomeCrianca = :nome, dataNascimento = :data, cpfCrianca = :cpf,'+ 'observacoes = :obs, sexo = :sexo, hospNascimento = :hosp, pesoNascimento = :peso, nomePai = :pai, nomeMae = :mae, responsavel1 = :resp1, responsavel2 = :resp2, foto = :foto where idCrianca = :cod;');

  query.Params[0].AsString := prObjCrianca.getNomeCrianca;
  query.Params[1].AsString := prObjCrianca.getDataNascimento;
  query.Params[2].asString := prObjCrianca.getCpfCrianca;
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
  query.Params[12].AsInteger := prObjCrianca.getIdCrianca;

  try
     query.ExecSQL;
     result := true;
  except
    on e:Exception do
      result := false;
  end;

end;

function TDataModule1.fDeleteAlimentacao(prId: integer): Boolean;
var
  query : TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('Delete from TCONALIM where idControle = :prId;');
  query.Params[0].AsInteger := prId;

  try
    query.ExecSQL;
    result := true;
  except
     on e: Exception do
       result := false;
  end;

  query.Close;
  query.free;
end;

function TDataModule1.fDeleteCrianca(prId: integer): Boolean;
var
  query : TFDQuery;
begin
   query := TFDQuery.Create(nil);
   query.Connection := DataModule1.Conexao;

   query.SQL.Add('Delete from TCADCRI where idCrianca = :prId;');
   query.Params[0].AsInteger := prId;

   try
    query.ExecSQL;
    result := true;
   except
    on e: Exception do
      result := false;
   end;

   query.Close;
   query.Free;

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

   query.Close;
   query.Free;

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

  query.Close;
  query.Free;
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

function TDataModule1.fSelectCrianca: Tlist;
var
  query : TFDQuery;
  objCri : TCrianca;
  foto : TImage;
  stream : TStream;
  lista : Tlist;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('select * from TCADCRI;');

  try
    query.Open;
    query.First;
    lista := TList.Create;

    while not query.Eof do
       begin
        objCri := TCrianca.Create;

        objCri.setIdCrianca(query.Fields[0].AsInteger);
        objCri.setNomeCrianca(query.Fields[1].AsString);
        objCri.setDataNascimento(query.Fields[2].AsString);
        objCri.setCpfCrianca(query.Fields[3].AsString);
        objCri.setObservacoes(query.Fields[4].AsString);
        objCri.setSexo(query.Fields[5].AsString);
        objCri.setHospNascimento(query.Fields[6].AsString);
        objCri.setPesoNascimento(query.Fields[7].AsString);
        objCri.setNomePai(query.Fields[8].AsString);
        objCri.setNomeMae(query.Fields[9].AsString);
        objCri.setResponsavel1(query.Fields[10].AsInteger);
        objCri.setResponsavel2(query.Fields[11].AsInteger);
        stream := query.CreateBlobStream(query.Fields[12], bmRead);
        foto := Timage.Create(nil);
        foto.Picture.LoadFromStream(stream);
        objCri.setFoto(foto);

        lista.Add(objCri);
        query.Next;
       end;

       result := lista;
  except
      on e: Exception do
       e.ToString;
  end;

  query.Close;
  query.Free;

end;

function TDataModule1.fSelectDadoEspecifico(prSQL : String; prParametro : integer): String;
var
  query : TFDQuery;
  nome : String;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add(prSQL);
  query.Params[0].AsInteger := prParametro;

  try
    query.Open;
    result := query.Fields[0].AsString;
  except
      on e: Exception do
       e.ToString;
  end;

  query.Close;
  query.Free;
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
         foto.Picture.LoadFromStream(stream);
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

    query.SQL.Add('insert into TCONALIM values (0, :data, :hora, :quantidade, :observacoes, :acompanhante, :idCrianca);');

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
