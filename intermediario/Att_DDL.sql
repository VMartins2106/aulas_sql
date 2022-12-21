create DATABASE BDVETERINARIA

use BDVETERINARIA

CREATE TABLE CLIENTE(
  	CodCliente int IDENTITY CONSTRAINT PKCLIENTE PRIMARY KEY,
  	Nome VARCHAR(50) index  NomeCliente not null,
  	CPF CHAR(11) not null unique,
  	Telefone char(11) not null,
  	Celular char(11) not null,
  	Email varchar(60) not null
  )
  
CREATE TABLE ANIMAL(
    CodAnimal int IDENTITY CONSTRAINT PKANIMAL PRIMARY KEY,
    CodCliente int CONSTRAINT FKCLIENTE FOREIGN KEY REFERENCES CLIENTE(CodCliente),
    Nome Varchar(20) not null INDEX NomeAnimal,
    DataNasc DATE not null,
    Raca varchar (20) not null,
    Obs varchar(100)    
)

CREATE table SERVICO(
	CodServico int IDENTITY CONSTRAINT PKSERVICO PRIMARY KEY,
  	NomeServico varchar(30) not null,
  	Valor money not null
)

CREATE TABLE AGENDAMENTO(
	CodAgenda int IDENTITY CONSTRAINT PKAGENDA PRIMARY KEY,
  	CodCliente int CONSTRAINT FKCliente2 FOREIGN KEY REFERENCES CLIENTE(CodCliente),
  	DataServico DATE not null,
  	HoraInicio TIME not null,
  	HoraTermino TIME not null,
  	Obs VARCHAR(100)
)

CREATE TABLE USUARIO(
	CodUsuario int IDENTITY CONSTRAINT PKUSUARIO PRIMARY KEY,
  	NomeUsuario VARCHAR(50) not null unique,
  	Senha CHAR(15) not null,
  	NivelAcesso int not null
)

ALTER TABLE CLIENTE
 	ADD Rua VARCHAR(30) not null, Numero CHAR(11) not null, Cidade VARCHAR(30) not null, Bairro VARCHAR(30) not null, Cep CHAR(8) not null, Estado VARCHAR(15) not null

ALTER TABLE ANIMAL
	ADD NomeEspecie VARCHAR(20) not null, Sexo VARCHAR(9) not null

ALTER TABLE AGENDAMENTO
	ADD CodSerico int CONSTRAINT FKSERIVCO FOREIGN KEY REFERENCES SERVICO(CodServico)

ALTER TABLE ANIMAL
	ALTER COLUMN Obs TEXT not null

ALTER TABLE AGENDAMENTO
	ALTER COLUMN Obs TEXT not null

ALTER TABLE USUARIO
	DROP COLUMN NivelAcesso

EXEC sp_rename CLIENTE, CLIENTES

EXEC sp_rename SERVICO, SERVICOS

sp_rename 'AGENDAMENTO.DataServico', 'DTSERVICO', 'COLUMN';

sp_rename 'ANIMAL.DataNasc', 'NASCIMENTO', 'COLUMN';

ALTER DATABASE BDVETERINARIA MODIFY NAME = BD_MYPETS;