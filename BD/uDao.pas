unit uDao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uResponsavel, Vcl.ExtCtrls,  uCrianca, uAlimentacao,
  Vcl.Forms, uConsultorio, uMedico, uConsulta, formContVacina, uVacina,
  uOcorrencia, formOcorrencia, uCrescimento, formCrescimento, formUtensilios,
  uUtensilios, uItens, formCadItem;


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
    {Fun??es de inser??o de registros}
    function pInsertResponsavel(prObjResponsavel : TResponsavel):Boolean;
    function fInsertAlimentacao(prObjAlimentacao : TAlimentacao):Boolean;
    function fInsertMedico(prObjMedico : TMedico):Boolean;
    function fInsertConsulta(prObjConsulta : TConsulta):Boolean;
    function fInsertCrianca(prObjCrianca : TCrianca):Boolean;
    function fInsertConsultorio(prObjCon : TConsultorio):Boolean;
    function fInsertVacina(prObjVacina : TVacina):Boolean;
    function fInsertOcorrecia(prObjOcorrencia : TOcorrencia):Boolean;
    function fInsertCrescimento(prObjCrescimento : TCrescimento):Boolean;
    function fInsertUtensilios(prUtensilios : TUtensilios):Boolean;
    function fInsertItem(prItem : TItens):Boolean;

    {Fun??es de update de registros}
    function pAlteraResponsavel(prObjResponsavel : TResponsavel):Boolean;
    function fAlteraMedico(prObjMedico : TMedico):Boolean;
    function fAlteraCrianca(prObjCrianca : TCrianca):Boolean;
    function fAlteraOcorrencia(prObjOcorrencia : TOcorrencia):Boolean;

    {Fun??o de delete de registros}
    function fDelete(prSQL : String; prId : integer):Boolean;

    {Fun??es de sele??o de registros}
    function fSelectItens : TList;
    function fSelectMedico : TList;
    function fSelectResponsavel : Tlist;
    function fSelectCrianca : Tlist;
    function fSelectConsultorio : TList;
    function fSelectDadoEspecifico(prSQL : String; prParametro : integer): String;
    function fRetornaQuery(prSQL : String) : TFDQuery;
    function fRetornaSomaTotais(prSQL : String) : Double;

  end;

var
  DataModule1: TDataModule1;

implementation
uses
   uController;



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

{Fun??es de update de registros}
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

  query.Close;
  query.Free;

end;

function TDataModule1.fAlteraMedico(prObjMedico: TMedico): Boolean;
var
  query : TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('update TCADMED set nomeMedico = :nome, telefone = :telefone, email = :email, especialidade = :especialidade, crm = :crm, idConsultorio = :idConsultorio where idMedico= :idMedico;');

  query.Params[0].AsString := prObjMedico.getNome;
  query.Params[1].AsString := prObjMedico.getTelefone;
  query.Params[2].AsString := prObjMedico.getEmail;
  query.Params[3].AsString := prObjMedico.getEspecialidade;
  query.Params[4].AsString := prObjMedico.getCrm;
  query.Params[5].AsInteger := prObjMedico.getIdConsultorio;
  query.Params[6].AsInteger := prObjMedico.getIdMedico;

  try
     query.ExecSQL;
     result := true;
  except
    on e:Exception do
       result := false;
  end;

  query.close;
  query.Free;
end;

function TDataModule1.fAlteraOcorrencia(prObjOcorrencia: TOcorrencia): Boolean;
var
  query : TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('update TOCORRENCIA set responsavel=:resp, dataOcorrencia=:dtOco, horaOcorrencia=:hrOco, ocorrencia=:Oco, tomouMedicacao=:tMedi, descMedicacao=:desc, quantidade=:qtd, horaMedicacao=:hrMed, idCrianca=:idCri where idOcorrencia = :idOco;');
  query.Params[0].AsString := prObjOcorrencia.getResponsavel;
  query.Params[1].AsString := prObjOcorrencia.getDataOcorrencia;
  query.Params[2].AsString := prObjOcorrencia.getHoraOcorrencia;
  query.Params[3].AsString := prObjOcorrencia.getOcorrencia;
  query.Params[4].AsString := prObjOcorrencia.getTomouMedicacao;
  query.Params[5].AsString := prObjOcorrencia.getDescMedicacao;
  query.Params[6].AsString := prObjOcorrencia.getQuantidade;
  query.Params[7].AsString := prObjOcorrencia.getHoraMedicacao;
  query.Params[8].AsInteger := prObjOcorrencia.getidCrianca;
  query.Params[9].AsInteger := prObjOcorrencia.getIdOcorrencia;

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

{Fun??o de dele??o de registros}
function TDataModule1.fDelete(prSQL: String; prId: integer): Boolean;
var
  query : TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add(prSQL);
  query.Params[0].AsInteger := prId;

  try
    query.ExecSQL;
    result := true;
  except
     on e:Exception do
       result:= false;
  end;
end;

{Fun??es de sele??o de registros}
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

function TDataModule1.fRetornaSomaTotais(prSQL: String): Double;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add(prSQL);

  try
    query.Open;
    result := query.Fields[0].AsFloat;
  except
      on e: Exception do
       e.ToString;
  end;

  query.Close;
  query.Free;
end;

function TDataModule1.fSelectConsultorio: TList;
var
  query : TFDQuery;
  lista : Tlist;
  objConsultorio : TConsultorio;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.sql.Add('Select * from TCADCON;');

  try
    query.Open;
    query.First;
    lista := TList.Create;

    while not (query.Eof) do
       begin
        objConsultorio := TConsultorio.Create;

        objConsultorio.setIdConsultorio(query.Fields[0].AsInteger);
        objConsultorio.setNomeConsultorio(query.Fields[1].AsString);
        objConsultorio.setCep(query.Fields[2].AsString);
        objConsultorio.setEstado(query.Fields[3].AsString);
        objConsultorio.setCidade(query.Fields[4].AsString);
        objConsultorio.setBairro(query.Fields[5].asString);
        objConsultorio.setEndereco(query.Fields[6].AsString);
        objConsultorio.setTelefone(query.Fields[7].AsString);
        objConsultorio.setEmail(query.Fields[8].AsString);

        lista.Add(objConsultorio);
        query.Next;
       end;

    result := lista;

  except
     on e:Exception do
       e.ToString;
  end;

  query.Close;
  query.Free;

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

  if (prParametro <> 0) then
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

function TDataModule1.fSelectItens: TList;
var
  query :TFDQuery;
  lista : TList;
  item : TItens;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('Select * from TITENS;');

  try
    query.Open;
    query.First;
    lista := TList.Create;

    while not (query.Eof) do
       begin
         item := TItens.Create;

         item.setIdItem(query.Fields[0].asInteger);
         item.setDescItem(query.Fields[1].asString);
         item.setUnidadeMedida(query.Fields[2].AsString);
         item.setValorUnitario(query.Fields[3].AsFloat);

         lista.Add(item);
         query.Next;
       end;
    Result := lista;

  Except
     on e: EXception do
       e.ToString;
  end;

  query.Close;
  query.Free;

end;

function TDataModule1.fSelectMedico: TList;
var
  query : TFDQuery;
  lista : TList;
  objMedico : TMedico;

begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('Select * from TCADMED;');

  try
    query.Open;
    query.first;
    lista := TList.Create;

    while not (query.Eof) do
      begin
        objMedico := TMedico.Create;

        objMedico.setIdmedico(query.fields[0].AsInteger);
        objMedico.setNome(query.fields[1].AsString);
        objMedico.setTelefone(query.fields[2].AsString);
        objMedico.setEmail(query.fields[3].AsString);
        objMedico.setEspecialidade(query.fields[4].AsString);
        objMedico.setCrm(query.fields[5].AsString);
        objMedico.setIdConsultorio(query.fields[6].AsInteger);

        lista.Add(objMedico);
        query.Next;
      end;

      result := lista;

  except on E: Exception do
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

{Fun??es de inser??o de registros}
function TDataModule1.fInsertCrescimento(prObjCrescimento: TCrescimento): Boolean;
var
  query : TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('insert into TCRESCIMENTO values(0, :dataCrescimento, :peso, :altura, :imc, :circCabeca, :circBarriga, :idCrianca, :observacoes);');
  query.Params[0].AsString := prObjCrescimento.getDataCrescimento;
  query.Params[1].AsString := prObjCrescimento.getPeso;
  query.Params[2].AsString := prObjCrescimento.getAltura;
  query.Params[3].AsString := prObjCrescimento.getImc;
  query.Params[4].AsString := prObjCrescimento.getCircCabeca;
  query.Params[5].AsString := prObjCrescimento.getCircBarriga;
  query.Params[6].AsInteger := prObjCrescimento.getIdCrianca;
  query.Params[7].AsString := prObjCrescimento.getObservacoes;

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

  if (FileExists(ExtractFilePath(Application.Exename) + 'Foto.jpg')) then
     foto := TFileStream.Create(ExtractFilePath(Application.Exename) + 'Foto.jpg', fmOpenRead)
  else
     foto := TFileStream.Create(ExtractFilePath(Application.Exename) + 'fotoPerfil.jpg', fmOpenRead);

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
  foto.Free;
end;

function TDataModule1.fInsertItem(prItem: TItens): Boolean;
var
  query : TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('insert into titens values(0,:descItem,:unidadeMedia,:valorUnitario);');

  query.Params[0].AsString := prItem.getDescItem;
  query.Params[1].AsString := prItem.getUnidadeMedida;
  query.Params[2].AsFloat := prItem.getValorUnitario;

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

function TDataModule1.fInsertMedico(prObjMedico: TMedico): Boolean;
var
  query : TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('insert into TCADMED values (0, :nomeMedico, :telefone, :email, :especialidade, :crm, :idConsultorio);');

  query.Params[0].AsString := prObjMedico.getNome;
  query.Params[1].AsString := prObjMedico.getTelefone;
  query.Params[2].AsString := prObjMedico.getEmail;
  query.Params[3].AsString := prObjMedico.getEspecialidade;
  query.Params[4].AsString := prObjMedico.getCrm;
  query.Params[5].AsInteger := prObjMedico.getIdConsultorio;

  try
    query.ExecSQL;
    result := true;
  except
    on e:Exception do
      result := false;
  end;

  query.Close;
  query.Free;
end;

function TDataModule1.fInsertOcorrecia(prObjOcorrencia: TOcorrencia): Boolean;
var
  query : TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('insert into TOCORRENCIA values(0, :responsavel, :dataOcorrencia, :horaOcorrencia, :ocorrencia, :tomouMedicacao, :descMedicacao, :quantidade, :horaMedicacao, :idCrianca);');
  query.Params[0].AsString := prObjOcorrencia.getResponsavel;
  query.Params[1].AsString := prObjOcorrencia.getDataOcorrencia;
  query.Params[2].AsString := prObjOcorrencia.getHoraOcorrencia;
  query.Params[3].AsString := prObjOcorrencia.getOcorrencia;
  query.Params[4].AsString := prObjOcorrencia.getTomouMedicacao;
  query.Params[5].AsString := prObjOcorrencia.getDescMedicacao;
  query.Params[6].AsString := prObjOcorrencia.getQuantidade;
  query.Params[7].AsString := prObjOcorrencia.getHoraMedicacao;
  query.Params[8].AsInteger := prObjOcorrencia.getidCrianca;

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

function TDataModule1.fInsertUtensilios(prUtensilios: TUtensilios): Boolean;
var
  query : TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('insert into TCOMPRAS values (0,:dataCompra,:valorTotal,:listaCompras,:responsavel,:idCrianca);');
  query.Params[0].AsString := prUtensilios.getDataCompra;
  query.Params[1].AsFloat := prUtensilios.getValorTotal;
  query.Params[2].AsString := prUtensilios.getListaCompras;
  query.Params[3].AsString := prUtensilios.getResponsavel;
  query.Params[4].AsInteger := prUtensilios.getIdCrianca;

  try
    query.ExecSQL;
    result := true;
  Except
    on e: Exception do
       result := false;
  end;

  query.Free;
  query.Close;
end;

function TDataModule1.fInsertVacina(prObjVacina: TVacina): Boolean;
var
  query : TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('insert into TCONVACI values(0, :dataVacina, :horaVacina, :nomeVacina, :localVacina, :descLocal, :nomeProfissional, :responsavel, :proximaAplicacao, :idCrianca);');

  query.Params[0].AsString := prObjVacina.getDataVacina;
  query.Params[1].AsString := prObjVacina.getHoraVacina;
  query.Params[2].AsString := prObjVacina.getNomeVacina;
  query.Params[3].AsString := prObjVacina.getLocalVacina;
  query.Params[4].AsString := prObjVacina.getDescVacina;
  query.Params[5].AsString := prObjVacina.getNomeVacina;
  query.Params[6].AsString := prObjVacina.getResponsavel;
  query.Params[7].AsString := prObjVacina.getProximaAplicacao;
  query.Params[8].AsInteger := prObjVacina.getIdCrianca;

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

function TDataModule1.fInsertConsulta(prObjConsulta: TConsulta): Boolean;
var
  query : TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('insert into TCONSULTA values (0,:dataConsulta,:hora,:motivo,:acompanhante,:descExame,:proximaConsulta,:valor,:observacoes,:idMedico,:idConsultorio,:idCrianca);');

  query.Params[0].AsString := prObjConsulta.getDataConsulta;
  query.Params[1].AsString := prObjConsulta.getHora;
  query.Params[2].AsString := prObjConsulta.getMotivo;
  query.Params[3].AsString := prObjConsulta.getAcompanhante;
  query.Params[4].AsString := prObjConsulta.getDescExame;
  query.Params[5].AsString := prObjConsulta.getProximaConsulta;
  query.Params[6].AsFloat := prObjConsulta.getValor;
  query.Params[7].AsString := prObjConsulta.getObservacoes;
  query.Params[8].AsInteger := prObjConsulta.getIdMedico;
  query.Params[9].AsInteger := prObjConsulta.getIdConsultorio;
  query.Params[10].AsInteger := prObjConsulta.getIdCrianca;

  try
    query.ExecSQL;
    result := true;

  except on E: Exception do
    result := false;
  end;

  query.Close;
  query.Free;

end;

function TDataModule1.fInsertConsultorio(prObjCon: TConsultorio): Boolean;
var
  query : TFDQuery;
begin
  query := TFDQuery.Create(nil);
  query.Connection := DataModule1.Conexao;

  query.SQL.Add('insert into TCADCON values (0, :nomeConsultorio, :cep, :estado, :cidade, :bairro, :endereco, :telefone, :email);');

  query.Params[0].AsString := prObjCon.getNomeConsultorio;
  query.Params[1].AsString := prObjCon.getCep;
  query.Params[2].AsString := prObjCon.getEstado;
  query.Params[3].AsString := prObjCon.getCidade;
  query.Params[4].AsString := prObjCon.getBairro;
  query.Params[5].AsString := prObjCon.getEndereco;
  query.Params[6].AsString := prObjCon.getTelefone;
  query.Params[7].AsString := prObjCon.getEmail;

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
   controller : TController;
begin
  query := TFDQuery.Create(nil);
  data := TDataModule1.Create(nil);
  query.Connection := data.Conexao;
  controller := TController.create;

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

  if (FileExists(ExtractFilePath(Application.Exename) + 'Foto.jpg')) then
     foto := TFileStream.Create(ExtractFilePath(Application.Exename) + 'Foto.jpg', fmOpenRead)
  else
     foto := TFileStream.Create(ExtractFilePath(Application.Exename) + 'fotoPerfil.jpg', fmOpenRead);

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
    foto.Free;
end;


end.
