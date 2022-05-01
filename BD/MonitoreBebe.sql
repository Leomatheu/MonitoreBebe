drop database if exists MonitoreBebe;
create database if not exists MonitoreBebe;
use MonitoreBebe;

create table TCADRESP(
idResponsavel int not null auto_increment primary key,
nomeResponsavel varchar(50),
cpfResponsavel varchar(15),
dataNascimento varchar(10),
telefoneResidencia varchar(12) null,
telefoneCelular varchar(12) null,
rendaMensal float null,
observacoes varchar(200),
enderecoResponsavel varchar(150)
);

ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
