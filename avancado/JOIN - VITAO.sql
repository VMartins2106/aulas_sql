CREATE DATABASE BDJOIN
GO
USE BDJOIN
GO

CREATE TABLE CATEGORIA (
	CODCATEGORIA INT NOT NULL PRIMARY KEY, 
	NOMECATEGORIA VARCHAR(30)
)
GO
CREATE TABLE FORNECEDOR (CODFORNECEDOR INT IDENTITY NOT NULL PRIMARY KEY,
NOMEFORNECEDOR VARCHAR(50)
)
GO
CREATE TABLE PRODUTO (
	CODPRODUTO INT IDENTITY NOT NULL PRIMARY KEY, 
	NOMEPRODUTO VARCHAR(30), 
	CODCATEGORIA INT FOREIGN KEY REFERENCES CATEGORIA (CODCATEGORIA), 
	CODFORNECEDOR INT FOREIGN KEY REFERENCES FORNECEDOR (CODFORNECEDOR), 
	QUANTIDADE INT, VALORUNITARIO DECIMAL(10,2))
GO

--Cadastros Tabela Categoria
INSERT INTO CATEGORIA VALUES (1,'DOCE')
INSERT INTO CATEGORIA VALUES (2,'SALGADO')
INSERT INTO CATEGORIA VALUES (3,'BEBIDA')
INSERT INTO CATEGORIA VALUES (4,'LIMPEZA')
INSERT INTO CATEGORIA VALUES (5,'CONGELADOS')
INSERT INTO CATEGORIA VALUES (6,'LEGUMES')
GO

--Cadastros Tabela Fornecedor
INSERT INTO FORNECEDOR VALUES ('FRUTIQUELLO')
INSERT INTO FORNECEDOR VALUES ('KIBOM')
INSERT INTO FORNECEDOR VALUES ('SITE ANDER')

--Cadastros Tabela Produto
INSERT INTO PRODUTO VALUES ('REFRIGERANTE COCA COLA',3,1,15,2.50)
INSERT INTO PRODUTO VALUES ('SABONETE PROTEX',4,2,50,1.99)
INSERT INTO PRODUTO VALUES ('CHOCOLATE SHOT LACTA',1,1,10,5.89)
INSERT INTO PRODUTO VALUES ('BOLACHA',1,2,3.50,3)
INSERT INTO PRODUTO VALUES ('FRIGIDEIRA TRAMONTINA',NULL,2,3,15.60)
INSERT INTO PRODUTO VALUES ('FACA TRAMONTINA',NULL,1,5,35.00)
INSERT INTO PRODUTO VALUES ('JOGO DE PRATOS',NULL,1,1,155.00)
GO

--Exemplo Jun��o de Tabelas sem JOIN

SELECT CodProduto, NomeProduto, NomeCategoria, Quantidade
FROM Produto, CATEGORIA
WHERE Produto.CodCategoria = Categoria.CodCategoria

--EXEMPLO INNER JOIN

/*1 - Exibir:
codproduto		-> PRODUTO
nomeproduto		-> PRODUTO
valorunitario	-> PRODUTO
nomecategoria	-> CATEGORIA*/

--C�digo:

SELECT P.CodProduto, P.NomeProduto, P.ValorUnitario, C.NomeCategoria, P.CodCategoria
FROM Produto AS P INNER JOIN Categoria AS C
ON C.CodCategoria = P.CodCategoria

/*2 - Exibir:
NomeProduto		-> PRODUTO
NomeFornecedor	-> FORNECEDOR
Relacionamento entre PRODUTO E FORNECEDOR: CodFornecedor*/

--C�digo:

SELECT P.NomeProduto, F.NomeFornecedor
FROM Produto AS P INNER JOIN Fornecedor AS F
ON P.CodFornecedor = F.CodFornecedor

/*--EXEMPLO LEFT JOIN
3 - Exibir:
codproduto		-> PRODUTO
nomeproduto		-> PRODUTO
nomecategoria	-> CATEGORIA*/

--C�digo:

SELECT P.CodProduto, P.NomeProduto, C.CodCategoria 
FROM Produto AS P LEFT JOIN Categoria AS C
ON C.CodCategoria = P.CodCategoria

/*--EXEMPLO RIGHT JOIN
4 - Exibir:
codproduto		-> PRODUTO
nomeproduto		-> PRODUTO
nomecategoria	-> CATEGORIA*/

--C�digo:

SELECT P.CodProduto, P.NomeProduto, C.CodCategoria 
FROM Produto AS P RIGHT JOIN Categoria AS C
ON C.CodCategoria = P.CodCategoria	

/*--EXEMPLO FULL JOIN
5 - Exibir:
codproduto		-> PRODUTO
nomeproduto		-> PRODUTO
nomecategoria	-> CATEGORIA*/
--C�digo:

SELECT P.CodProduto, P.NomeProduto, C.CodCategoria 
FROM Produto AS P FULL JOIN Categoria AS C
ON C.CodCategoria = P.CodCategoria

/*--LEFT EXCLUDING JOIN (EXCLUIR A JUN��O)
Exibir:
codproduto		-> PRODUTO
nomeproduto		-> PRODUTO
nomecategoria	-> CATEGORIA*/

--C�digo:

SELECT P.CodProduto, P.NomeProduto, C.CodCategoria 
FROM Produto AS P LEFT JOIN Categoria AS C
ON C.CodCategoria = P.CodCategoria
WHERE C.CodCategoria IS NULL

--RIGHT EXCLUDING JOIN (EXCLUIR A JUN��O)
--C�digo:

SELECT P.CodProduto, P.NomeProduto, C.CodCategoria 
FROM Produto AS P RIGHT JOIN Categoria AS C
ON C.CodCategoria = P.CodCategoria
WHERE C.CodCategoria IS NULL

--FULL EXCLUDING JOIN (EXCLUIR A JUN��O)
--C�digo:

SELECT P.CodProduto, P.NomeProduto, C.CodCategoria 
FROM Produto AS P LEFT JOIN Categoria AS C
ON C.CodCategoria = P.CodCategoria
WHERE C.CodCategoria IS NULL

/*--EXERC�CIOS
Inner JOIN
Exibir os seguintes campos:
NomeProduto
NomeCategoria
Quantidade

Obs: Apenas dos produtos que forem da categoria: Doce*/

SELECT P.NomeProduto, C.NomeCategoria,  P.Quantidade
FROM Produto AS P LEFT JOIN Categoria AS C
ON P.CodCategoria = C.CodCategoria
WHERE NomeCategoria = 'Doce'
---------------------------------------
/*Inner Join
Exibir os seguintes campos:
CodProduto
NomeProduto
NomeFornecedor

Obs: Apenas dos produtos que tiverem pre�o acima de 10.00*/

SELECT P.CodProduto, P.NomeProduto,  F.NomeFornecedor
FROM Produto AS P LEFT JOIN Fornecedor AS F
ON P.CodFornecedor = F.CodFornecedor
WHERE ValorUnitario > 10

----------------------------------------

/*Inner Join
Exibir os seguintes campos:
NomeProduto
NomeCategoria
NomeFornecedor*/

SELECT P.NomeProduto, C.NomeCategoria ,  F.NomeFornecedor
FROM Produto AS P JOIN Categoria AS C 
ON P.CodCategoria = C.CodCategoria
JOIN Fornecedor AS F
ON F.CodFornecedor = P.CodFornecedor

----------------------------------------------
/*Left Join
Exibir os seguintes campos: 
NomeProduto
NomeCategoria
Quantidade

OBS: Os produtos que tem ou n�o categorias vinculadas. 
Apenas produtos com quantidade acima de 5*/


SELECT P.NomeProduto, C.NomeCategoria ,  P.Quantidade
FROM Produto AS P LEFT JOIN Categoria AS C 
ON P.CodCategoria = C.CodCategoria
WHERE Quantidade > 5

----------------------------------------------

/*Right Join
Exibir os seguintes campos:
NomeProduto
NomeFornecedor
Quantidade
Preco

Obs: Os produtos que tem ou n�o fornecedores vinculados*/

SELECT P.NomeProduto, F.NomeFornecedor ,  P.Quantidade, P.ValorUnitario
FROM Fornecedor AS F RIGHT JOIN Produto AS P
ON P.CodFornecedor = F.CodFornecedor
