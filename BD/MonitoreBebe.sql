drop database if exists MonitoreBebe;
create database if not exists MonitoreBebe;
use MonitoreBebe;

create table TCADRESP(
idResponsavel int not null auto_increment primary key,
nomeResponsavel varchar(50),
cpfResponsavel varchar(15),
emailResponsavel varchar(50),
dataNascimento varchar(10),
telefoneResidencia varchar(20),
telefoneCelular varchar(20),
rendaMensal float null,
observacoes varchar(200),
cepResponsavel varchar(8),
estadoResponsavel varchar(15),
cidadeResponsavel varchar(20),
bairroResponsavel varchar(50),
endResponsavel varchar(50),
foto mediumblob
);

create table TCADCRI(
idCrianca int not null auto_increment primary key,
nomeCrianca varchar(50),
dataNascimento varchar(10),
cpfCrianca varchar(50),
observacoes varchar(200),
sexo varchar(10),
hospNascimento varchar(50),
pesoNascimento varchar(50),
nomePai varchar(50),
nomeMae varchar(50),
responsavel1 int,
responsavel2 int,
foto mediumblob,
foreign key  (responsavel1) references TCADRESP(idResponsavel) on delete restrict,
foreign key (responsavel2) references TCADRESP(idResponsavel) on delete restrict
);

create table TCONALIM(
idControle int not null auto_increment primary key,
dataRefeicao varchar(10),
hora varchar(8),
quantidade varchar(15),
observacoes varchar(200),
acompanhante varchar(50),
idCrianca int,
foreign key (idCrianca) references TCADCRI(idCrianca) on delete restrict
);

create table TCADCON(
idConsultorio int not null auto_increment primary key,
nomeConsultorio varchar(70),
cep varchar(15),
estado varchar(50),
cidade varchar(50),
bairro varchar(50),
endereco varchar(70),
telefone varchar(50),
email varchar(50)
);

create table TCADMED(
idMedico int not null auto_increment primary key,
nomeMedico varchar(50),
telefone varchar(15),
email varchar(50),
especialidade varchar(50),
crm varchar(10),
idConsultorio int,
foreign key (idConsultorio) references TCADCON(idConsultorio)
);

create table TCONSULTA(
idConsulta int not null auto_increment primary key,
dataConsulta varchar(10),
hora varchar(8),
motivo varchar(100),
acompanhante varchar(50),
exame varchar(5),
descExame varchar(100),
proximaConsulta varchar(10),
valor double,
observacoes varchar(200),
idMedico int,
idConsultorio int,
idCrianca int,
foreign key (idMedico) references TCADMED(idMedico) on delete restrict,
foreign key (idConsultorio) references TCADCON(idConsultorio) on delete restrict,
foreign key (idCrianca) references TCADCRI(idCrianca) on delete restrict
);

create table TCOMPRAS(
idCompra int not null auto_increment primary key,
dataCompra varchar(10),
quantidade int,
valorTotal double,
listaCompras varchar(800),
responsavel varchar(50),
idCrianca int,
foreign key (idCrianca) references TCADCRI(idCrianca)
);

create table TCONVACI(
idVacina int not null auto_increment primary key,
dataVacina varchar(10),
horaVacina varchar(5),
nomeVacina varchar(100),
localVacina varchar(100),
descLocal varchar(50),
nomeProfissional varchar(100),
responsavel varchar(100),
proximaAplicacao varchar(10),
idCrianca int,
foreign key (idCrianca) references TCADCRI(idCrianca)
);
       
create table TOCORRENCIA(
idOcorrencia int not null auto_increment primary key,
responsavel varchar(100),
dataOcorrencia varchar(10),
horaOcorrencia varchar(5),
ocorrencia varchar(100),
tomouMedicacao varchar(4),
descMedicacao varchar(100),
quantidade varchar(10),
horaMedicacao varchar(5),
idCrianca int,
foreign key (idCrianca) references TCADCRI(idCrianca)
);
      
create table TCRESCIMENTO(
idCrescimento int not null auto_increment primary key,
dataCrescimento varchar(10),
peso varchar(10),
altura varchar(10),
imc varchar(15),
circCabeca varchar(10),
circBarriga varchar(10),
idCrianca int,
observacoes varchar(200),
foreign key (idCrianca) references TCADCRI(idCrianca)
);

create table TITENS(
idItem int not null auto_increment primary key,
descItem varchar (100),
unidadeMedia varchar(20),
valorUnitario float
);

ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
