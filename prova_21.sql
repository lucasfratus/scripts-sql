# 2 a. Recupere os códigos dos pedidos com valor total maior que R$ 200,00 (0,5)
SELECT IdPedido
FROM Pedido
WHERE ValorTotal > 200.00;

# b. Recupere os nomes dos clientes que pediram o produto “Camiseta” (0,5).
SELECT Cliente.NomeCliente 
FROM Cliente NATURAL JOIN Pedido NATURAL JOIN Produto
WHERE Produto.NomeProduto = 'Camiseta';

# c. Recupere o código e a quantidade total pedida de cada produto, considerando todos os pedidos
SELECT IdProduto, SUM(Quantidade) AS qntde_Total
FROM Pedido
GROUP BY IdProduto;

# d. Recupere os nomes dos clientes e os códigos de seus respectivos pedidos (0,5).
SELECT Cliente.NomeCliente, Pedido.IdPedido
FROM Cliente
NATURAL JOIN Pedido
ORDER BY Cliente.NomeCliente;

# e. Para cada valor de peso da tabela Produto, recupere a quantidade de produtos que possuem o peso
# em questão (1,0).
SELECT Peso, SUM(IdProduto) as Quantidade_Prod
FROM Produto
GROUP BY Peso;

# f. Recupere o CPF de todos os clientes que pediram pelo menos um produto igual aos produtos
# pedidos pelo cliente de CPF 123456789. Não considerar o cliente 123456789 no resultado da
# consulta (1,0)
SELECT CPF FROM Pedido
WHERE CPF <> '123456789' and IdProduto 
IN (SELECT IdProduto FROM Pedido
WHERE CPF = '123456789');

# g. Recupere os nomes dos clientes e os códigos de seus respectivos pedidos. Todos os clientes
# devem participar do resultado da consulta (1,0).
SELECT Cliente.Nome, Pedido.IdPedido
FROM Cliente 
LEFT JOIN Pedido 
ON Cliente.CPF = Pedido.CPF;
