-- QUANTIDADE TOTAL DE VENDAS ?
SELECT COUNT(codigo_venda) FROM venda
-- RESPOSTA: 3000 linhas

-- QUAL FOI O VALOR TOTAL DE VENDAS ?
SELECT SUM(valor_unitario * quantidade) as total_vendas FROM venda
-- RESPOSTA: R$ 6.704.846,61

-- QUAL FOI O VALOR TOTAL DE LUCROS ?

SELECT SUM((valor_unitario * quantidade) - (preco_custo*quantidade)) as lucro_total 
	FROM venda
-- RESPOSTA: R$ 2.762.533,81

-- QUAL FOI A LOJA QUE MAIS OBTEVE LUCRO ?

SELECT TOP 1 l.nome_loja,
	SUM((valor_unitario * quantidade) - (preco_custo*quantidade)) as lucro_total
	FROM venda as v JOIN loja as l ON l.codigo_loja = v.codigo_loja
GROUP BY l.nome_loja
ORDER BY lucro_total DESC
-- RESPOSTA: Matriz	731.201,97

-- QUEM FOI O VENDEDOR COM O MELHOR DESEMPENHO (MAIOR VALOR DE VENDA)
SELECT TOP 1 vend.nome_vendedor,
	SUM(valor_unitario * quantidade) as total_venda
	FROM venda as v JOIN vendedor as vend ON vend.matricula_vendedor = v.matricula_vendedor
GROUP BY vend.nome_vendedor
ORDER BY total_venda DESC
-- RESPOSTA: José Maria, COM R$ 654.050,81

-- CRIE UM RELATÓRIO COM A QUANTIDADE DE VENDAS E VALOR TOTAL DE
-- VENDAS POR LOJA E POR VENDEDOR, ORDENADO POR SEUS RESPECTIVOS CAMPOS

--CREATE VIEW vw_relatorio AS
SELECT  c.nome_loja,
		b.nome_vendedor,
		COUNT(a.codigo_venda) as quantidade_de_vendas,
		SUM(a.valor_unitario * a.quantidade) as valor_total_vendas
	FROM venda as a
		JOIN vendedor as b ON a.matricula_vendedor = b.matricula_vendedor
		JOIN loja as c ON a.codigo_loja = c.codigo_loja
GROUP BY  c.nome_loja,
		  b.nome_vendedor
ORDER BY c.nome_loja,
		 b.nome_vendedor