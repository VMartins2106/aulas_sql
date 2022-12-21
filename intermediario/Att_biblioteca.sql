CREATE DATABASE BDBIBLIOTECA

USE BDBIBLIOTECA

CREATE TABLE EMPRESTIMO(
	CODEMPRESTIMO INT CONSTRAINT PKEMPRESTIMO PRIMARY KEY,
	RA			  INT CONSTRAINT FKRA FOREIGN KEY REFERENCES ALUNO(RA),
	CODLIVRO	  INT CONSTRAINT FKCODLIVRO FOREIGN KEY REFERENCES LIVRO(CODLIVRO),
	CODFUN		  INT CONSTRAINT FKCODFUN FOREIGN KEY REFERENCES FUNCIONARIO(CODFUN),
	DATASAIDA     INT NOT NULL 
)

CREATE TABLE LIVRO(
	CODLIVRO	INT CONSTRAINT PKCODLIVRO PRIMARY KEY,
	TITULO		VARCHAR(100) NOT NULL,
	AUTOR		VARCHAR(100) NOT NULL, 
	GENERO		VARCHAR(50) NOT NULL,
	EDITORA		VARCHAR(50) NOT NULL,
	QTD			INT NOT NULL
)

CREATE TABLE ALUNO(
	RA			INT CONSTRAINT PKRA PRIMARY KEY,
	NOME		VARCHAR(100) NOT NULL,
	CODCURSO	INT CONSTRAINT FKCODCURSO FOREIGN KEY REFERENCES CURSO(CODCURSO),
	TELEFONE	CHAR(11) NOT NULL,
	CELULAR		CHAR(11) NOT NULL
)

CREATE TABLE FUNCIONARIO(
	CODFUN		INT CONSTRAINT PKCODFUN PRIMARY KEY,
	NOME		VARCHAR(100) NOT NULL,
	TELEFONE	CHAR(11) NOT NULL,
	CELULAR		CHAR(11) NOT NULL,
)

CREATE TABLE CURSO(
	CODCURSO		INT CONSTRAINT PKCODCURSO PRIMARY KEY,
	NOMECURSO		VARCHAR(100) NOT NULL,
	PERIODO			VARCHAR(5) NOT NULL,	
	MODULO			INT NOT NULL
)

CREATE TABLE USUARIO(
	CODUSU			INT CONSTRAINT PKCODUSU PRIMARY KEY,
	NOMEUSUARIO		VARCHAR(100) NOT NULL,
	SENHA			CHAR(10) NOT NULL
)

