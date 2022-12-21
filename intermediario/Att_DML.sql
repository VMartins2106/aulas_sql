CREATE DATABASE BDACADEMIA
USE BDACADEMIA

CREATE TABLE PLANO(
CodPlano INT IDENTITY CONSTRAINT PKCODPLANO PRIMARY KEY,
NomePlano VARCHAR(40) NOT NULL,
ValorPlano MONEY NOT NULL,
)

CREATE TABLE ALUNO(
CodAluno INT IDENTITY CONSTRAINT PKCODALUNO PRIMARY KEY,
Nome VARCHAR(50) NOT NULL,
CPF CHAR(11) NOT NULL,
RG CHAR(9) NOT NULL,
Email VARCHAR(100) NOT NULL,
DataNasc DATE NOT NULL
)

CREATE TABLE MATRICULA(
CodMatricula INT IDENTITY CONSTRAINT PKCODMATRICULA PRIMARY KEY,
CodPlano INT CONSTRAINT FKPlano FOREIGN KEY REFERENCES PLANO (CodPlano),
CodAluno INT CONSTRAINT FKAluno FOREIGN KEY REFERENCES ALUNO (CodAluno),
DataMatricula DATE NOT NULL,
DataVencimento DATE NOT NULL,
)

CREATE TABLE USUARIO(
CodUsuario INT IDENTITY CONSTRAINT PKCodUsuario PRIMARY KEY,
NomeUsuario VARCHAR(50) NOT NULL,
Senha VARCHAR(20) NOT NULL,
TipoUsuario VARCHAR(20) NOT NULL
)

INSERT INTO USUARIO(NomeUsuario, Senha, TipoUsuario)
VALUES('Nathália de Almeida','nathalia20092005','Administrador')

INSERT INTO USUARIO(NomeUsuario, Senha, TipoUsuario)
VALUES('Victor De Almeida Martins', 'victor21062004', 'Usuário')

INSERT INTO PLANO(NomePlano, ValorPlano)
VALUES('Mensal', 110)

INSERT INTO PLANO(NomePlano, ValorPlano)
VALUES('Trimestral', 200)

INSERT INTO PLANO(NomePlano, ValorPlano)
VALUES('Semestral', 350)

INSERT INTO PLANO(NomePlano, ValorPlano)
VALUES('Anual', 650)

INSERT INTO ALUNO(Nome, CPF, RG, Email, DataNasc)
VALUES('Victor De Almeida Martins', '12345678910', '123456780', 'victor@gmail.com', '2004-06-21')

INSERT INTO ALUNO(Nome, CPF, RG, Email, DataNasc)
VALUES('Nathalia De Almeida Martins', '12345678911', '123456781', 'nathalia@gmail.com', '2005-09-20')

INSERT INTO ALUNO(Nome, CPF, RG, Email, DataNasc)
VALUES('Pedro Alves Botoni', '12345678912', '123456782', 'botoni@gmail.com', '2005-04-27')

INSERT INTO ALUNO(Nome, CPF, RG, Email, DataNasc)
VALUES('David Helder Santana De Vasconcellos', '12345678913', '123456783', 'david@gmail.com', '2004-10-21')

INSERT INTO ALUNO(Nome, CPF, RG, Email, DataNasc)
VALUES('Bianca Martins', '12345678914', '123456784', 'bianc@gmail.com', '2000-06-18')

INSERT INTO MATRICULA(DataMatricula,DataVencimento)
VALUES('2019-09-14','2019-10-14')

INSERT INTO MATRICULA(DataMatricula,DataVencimento)
VALUES('2019-09-14','2019-12-14')

INSERT INTO MATRICULA(DataMatricula,DataVencimento)
VALUES('2019-09-14','2020-3-14')

SELECT * FROM ALUNO

UPDATE ALUNO SET Nome = 'Dwayne Johnson',
CPF = '12345678909',
RG = '442341234',
Email = 'therock@gmail.com',
DataNasc = '1972-05-02'
WHERE CodAluno = 3

DELETE FROM USUARIO WHERE CodUsuario = 2

UPDATE PLANO SET ValorPlano = 950

UPDATE PLANO SET ValorPlano = 110 * 1.1
WHERE NomePlano = 'Mensal'

UPDATE PLANO SET ValorPlano = 200 * 1.1
WHERE NomePlano = 'Trimestral'

UPDATE PLANO SET ValorPlano = 350 * 1.1
WHERE NomePlano = 'Semestral'

UPDATE PLANO SET ValorPlano = 650 * 1.1
WHERE NomePlano = 'Anual'

SELECT * FROM PLANO WHERE ValorPlano>100

SELECT * FROM MATRICULA WHERE DataMatricula < '2022-04-25'

SELECT * FROM ALUNO WHERE Nome = 'Dwayne Johnson'