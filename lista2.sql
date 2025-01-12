USE aluno_ImovelNet;

# 1. Exiba todos os compradores e suas respectivas ofertas (código e nome do comprador, código do
# imóvel e valor da oferta).
SELECT OFERTA.CDCOMPRADOR, COMPRADOR.NMCOMPRADOR, OFERTA.CDIMOVEL, OFERTA.VLOFERTA
FROM OFERTA 
JOIN COMPRADOR ON OFERTA.CDCOMPRADOR=COMPRADOR.CDCOMPRADOR;

# 2. Exiba todos os imóveis (código do imóvel, nome do bairro e valor), cujo código do vendedor seja 3.
SELECT IMOVEL.CDIMOVEL, BAIRRO.NMBAIRRO, IMOVEL.VLPRECO
FROM IMOVEL
JOIN BAIRRO ON (BAIRRO.CDBAIRRO = IMOVEL.CDBAIRRO AND BAIRRO.CDCIDADE = IMOVEL.CDCIDADE AND BAIRRO.SGESTADO = IMOVEL.SGESTADO)
WHERE IMOVEL.CDVENDEDOR = 3;

# 3. Exiba todos os imóveis que tenham ofertas cadastradas.
SELECT DISTINCT CDIMOVEL
FROM OFERTA;

# 4. Exiba todos os imóveis e ofertas mesmo que não haja ofertas cadastradas para o imóvel.
SELECT IMOVEL.CDIMOVEL, OFERTA.VLOFERTA
FROM IMOVEL
LEFT JOIN OFERTA ON IMOVEL.CDIMOVEL = OFERTA.CDIMOVEL;

# 5. Exiba todos os compradores e as respectivas ofertas realizadas por eles. Considere também os
# compradores que ainda não fizeram ofertas para os imóveis.
SELECT COMPRADOR.CDCOMPRADOR, OFERTA.CDIMOVEL, OFERTA.VLOFERTA
FROM COMPRADOR
LEFT JOIN OFERTA 
ON COMPRADOR.CDCOMPRADOR = OFERTA.CDCOMPRADOR;

# 6. Exiba todos os endereços dos imóveis e os endereços dos imóveis indicados.
SELECT A.CDIMOVEL, A.NMENDERECO, B.NMENDERECO
FROM IMOVEL A
JOIN IMOVEL B ON A.CDIMOVEL=B.CDIMOVEL;

# 7. Para cada imóvel, exiba o endereço, o bairro e o nível de preço.
SELECT NMENDERECO, NMBAIRRO, VLPRECO, NUMFAIXA
FROM IMOVEL NATURAL JOIN BAIRRO, FAIXA_IMOVEL
WHERE VLPRECO BETWEEN VLMINIMO AND VLMAXIMO;

# 8. Exiba o maior, o menor e o valor médio das ofertas.
SELECT MAX(VLOFERTA) AS MAIOR, MIN(VLOFERTA) AS MENOR, AVG(VLOFERTA) AS MEDIA
FROM OFERTA;

# 9. Exiba o total de imóveis por vendedor. Apresente em ordem total de imóveis.
SELECT CDVENDEDOR, COUNT(*) FROM IMOVEL
GROUP BY CDVENDEDOR
ORDER BY COUNT(*);

# 10. Verifique a diferença de preços entre o imóvel mais caro e o mais barato.
SELECT MAX(VLPRECO) - MIN(VLPRECO) AS DIFERENCA_VALOR
FROM IMOVEL;