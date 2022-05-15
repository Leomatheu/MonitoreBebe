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

select * from monitorebebe.TCADRESP;
select * from monitorebebe.TCADRESP where nomeResponsavel like "a%";

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
foreign key  (responsavel1) references TCADRESP(idResponsavel) on delete restrict,
foreign key (responsavel2) references TCADRESP(idResponsavel) on delete restrict
);

create table TCONALIM(
idControle int not null auto_increment primary key,
data varchar(10),
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
endereco varchar(70),
telefone varchar(15),
email varchar(15)
);

create table TCADMED(
idMedico int not null auto_increment primary key,
nomeMedico varchar(50),
idade int,
telefone varchar(15),
email varchar(50),
especialidade varchar(50),
crm varchar(10),
idConsultorio int,
foreign key (idConsultorio) references TCADCON(idConsultorio) on delete restrict
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
localCompra varchar(50),
descProduto varchar(50),
marca varchar(50),
quantidade int,
valorUnitario double,
responsavel varchar(50),
idCrianca int,
foreign key (idCrianca) references TCADCRI(idCrianca) on delete restrict
);

ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
