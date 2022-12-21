CREATE DATABASE BDVENDA
USE BDVENDA

CREATE TABLE CLIENTE(
	CodCliente INT IDENTITY CONSTRAINT PKCodCliente PRIMARY KEY,
  	Nome VARCHAR(60) NOT NULL,
  	Cpf CHAR(11) NOT NULL,
  	Email VARCHAR(100) NOT NULL
)

CREATE TABLE VENDA(
	CodVenda INT IDENTITY CONSTRAINT PKCodVenda PRIMARY KEY,
  	DataVenda DATE NOT NULL,
  	FormaPagto VARCHAR(20) NOT NULL,
  	FKCliente INT CONSTRAINT FKCodCliente FOREIGN KEY REFERENCES CLIENTE(codcliente)
)

CREATE TABLE CATEGORIA(
	CodCategoria INT IDENTITY CONSTRAINT PKCodCategoria PRIMARY KEY,
  	NomeCategoria VARCHAR(20) NOT NULL
)

CREATE TABLE PRODUTO(
 	CodProduto INT IDENTITY CONSTRAINT PKCodProduto PRIMARY KEY,
  	NomeProduto VARCHAR(30) NOT NULL,
  	DataValidade DATE NOT NULL,
  	Preco MONEY NOT NULL,
  	QuantidadeEstoque INT NOT NULL,
  	UnidadeMedida CHAR(2) NOT NULL,
  	CodCategoria INT CONSTRAINT FKCodCategoria FOREIGN KEY REFERENCES CATEGORIA(codcategoria)
)

CREATE TABLE ITENS(
	CodItem INT IDENTITY CONSTRAINT FKCodItem PRIMARY KEY,
  	FKProduto INT CONSTRAINT FKProduto FOREIGN KEY REFERENCES PRODUTO(codproduto),
  	FKVenda INT CONSTRAINT FKCodVenda FOREIGN KEY REFERENCES VENDA(codvenda),
  	Quantidade INT NOT NULL,
  	Preco MONEY NOT NULL
)

INSERT INTO CATEGORIA(NomeCategoria)
VALUES('Automóveis')
INSERT INTO CATEGORIA(NomeCategoria)
VALUES('Celulares')
INSERT INTO CATEGORIA(NomeCategoria)
VALUES('Necessidades')
INSERT INTO CATEGORIA(NomeCategoria)
VALUES('Alimentos')

INSERT INTO PRODUTO(NomeProduto, DataValidade, Preco, QuantidadeEstoque, UnidadeMedida, CodCategoria)
VALUES('Galaxy A30', '2030-07-22', '1250.60' , 4 ,'PC', '2')
INSERT INTO PRODUTO(NomeProduto, DataValidade, Preco, QuantidadeEstoque, UnidadeMedida, CodCategoria)
VALUES('Onix', '2023-01-01', '70250.60' , 1 ,'UN', '1')
INSERT INTO PRODUTO(NomeProduto, DataValidade, Preco, QuantidadeEstoque, UnidadeMedida, CodCategoria)
VALUES('Sacos de Arroz', '2022-08-15', '250.60' , 3 ,'KG', '4')
INSERT INTO PRODUTO(NomeProduto, DataValidade, Preco, QuantidadeEstoque, UnidadeMedida, CodCategoria)
VALUES('Galão de Aguá', '2021-05-20', '380.60' , 2 ,'LT', '4')
INSERT INTO PRODUTO(NomeProduto, DataValidade, Preco, QuantidadeEstoque, UnidadeMedida, CodCategoria)
VALUES('Papel higiênico', '2018-03-10', '180.60' , 6 ,'CX', '5')

INSERT INTO CLIENTE(Nome, Cpf, Email)
VALUES('Victor Martins', '47158473365', 'victor@gmail.com')
INSERT INTO CLIENTE(Nome, Cpf, Email)
VALUES('Nathália Donato', '47158473465', 'nat@gmail.com')
INSERT INTO CLIENTE(Nome, Cpf, Email)
VALUES('B HELDER', '57158473365', 'b@gmail.com')
INSERT INTO CLIENTE(Nome, Cpf, Email)
VALUES('Biel', '47158973365', 'biel@gmail.com')

INSERT INTO VENDA(DataVenda, FormaPagto, FKCliente)
VALUES('2022-03-20','Dinheiro', '1')
INSERT INTO VENDA(DataVenda, FormaPagto, FKCliente)
VALUES('2022-02-04','Débito', '3')

INSERT INTO ITENS(FKProduto, FKVenda, Quantidade, Preco)
VALUES('6', '5', '4', '722.40')
INSERT INTO ITENS(FKProduto, FKVenda, Quantidade, Preco)
VALUES('9', '6', '4', '812.40')
INSERT INTO ITENS(FKProduto, FKVenda, Quantidade,Preco)
VALUES('8', '6', '5', '1250.6')
INSERT INTO ITENS(FKProduto, FKVenda, Quantidade, Preco)
VALUES('10', '5', '4', '615.40')