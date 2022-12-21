CREATE DATABASE BDVENDAS
USE BDVENDAS

CREATE TABLE CLIENTE(
	CodCliente INT PRIMARY KEY,
  	Nome VARCHAR(60) NOT NULL,
  	Cpf CHAR(11) NOT NULL,
  	Email VARCHAR(100) NOT NULL
)

CREATE TABLE VENDA(
	CodVenda INT PRIMARY KEY,
  	DataVenda DATE NOT NULL,
  	FormaPagto VARCHAR(20) NOT NULL,
  	FKCliente INT FOREIGN KEY REFERENCES CLIENTE(codcliente)
)

CREATE TABLE CATEGORIA(
	CodCategoria INT PRIMARY KEY,
  	NomeCategoria VARCHAR(20) NOT NULL
)

CREATE TABLE PRODUTO(
 	CodProduto INT PRIMARY KEY,
  	NomeProduto VARCHAR(30) NOT NULL,
  	DataValidade DATE NOT NULL,
  	Preco MONEY NOT NULL,
  	QuantidadeEstoque INT NOT NULL,
  	UnidadeMedida VARCHAR(20) NOT NULL,
  	FKCategoria INT FOREIGN KEY REFERENCES CATEGORIA(codcategoria)
)

CREATE TABLE VENDA(
	CodVenda INT PRIMARY KEY,
  	DataVenda DATE NOT NULL,
  	FormaPagto VARCHAR(20) NOT NULL,
  	FKCliente INT FOREIGN KEY REFERENCES CLIENTE(codcliente)
)

CREATE TABLE ITENS(
	CodItem INT PRIMARY KEY,
  	FKProduto INT FOREIGN KEY REFERENCES PRODUTO(codproduto),
  	FKVenda INT FOREIGN KEY REFERENCES VENDA(codvenda),
  	Quantidade INT NOT NULL,
  	Preco MONEY NOT NULL
)