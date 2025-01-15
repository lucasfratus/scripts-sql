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

# 11. Para cada comprador, exiba o seu código e nome, sua média de valor de ofertas e o seu número de
# ofertas.
SELECT C.CDCOMPRADOR, C.NMCOMPRADOR, AVG(O.VLOFERTA) AS MEDIA_OFERTAS, COUNT(*) AS NUM_OFERTAS
FROM COMPRADOR C JOIN OFERTA O ON C.CDCOMPRADOR=O.CDCOMPRADOR
GROUP BY CDCOMPRADOR;

# 12. Exiba o total de ofertas realizadas nos anos de 2000, 2001 e 2002.
SELECT YEAR(DTOFERTA), COUNT(*) AS TOTAL_OFERTAS
FROM OFERTA
WHERE YEAR(DTOFERTA) IN (2000,2001,2002)
GROUP BY YEAR(DTOFERTA);

# 13. Exiba os imóveis do mesmo bairro do imóvel 2. Exclua o imóvel 2 de sua busca.
SELECT CDIMOVEL, NMENDERECO
FROM IMOVEL
WHERE CDBAIRRO=(SELECT CDBAIRRO
FROM IMOVEL WHERE CDIMOVEL=2) AND CDIMOVEL<>2;

# 14. Exiba os imóveis que custam mais que a média de preços dos imóveis.
SELECT CDIMOVEL, NMENDERECO
FROM IMOVEL
WHERE VLPRECO > (SELECT AVG(VLPRECO) FROM IMOVEL);

# 15. Exiba todos os imóveis com oferta superior à média do valor das ofertas.
SELECT CDIMOVEL, CDCOMPRADOR, VLOFERTA
FROM OFERTA
WHERE VLOFERTA > (SELECT AVG(VLOFERTA) FROM OFERTA);

# 16. Exiba todos os imóveis com preço superior à média de preço dos imóveis do mesmo bairro.
SELECT CDIMOVEL, NMENDERECO, VLPRECO
FROM IMOVEL I
WHERE VLPRECO > (SELECT AVG(VLPRECO) FROM IMOVEL WHERE CDBAIRRO=I.CDBAIRRO);

# 17. Exiba todos os códigos e nomes de compradores e códigos e nomes de vendedores (utilize UNION).
SELECT CDCOMPRADOR AS CODIGO, NMCOMPRADOR AS NOME
FROM COMPRADOR
UNION
SELECT CDVENDEDOR AS CODIGO, NMVENDEDOR AS NOME
FROM VENDEDOR;

# 18. Exiba todos os compradores que não tenham ofertas cadastradas.
SELECT CDCOMPRADOR
FROM COMPRADOR
WHERE CDCOMPRADOR NOT IN (SELECT CDCOMPRADOR
FROM OFERTA);

# 19. Exiba todos os vendedores que não tenham imóveis cadastrados(utilize MINUS).
SELECT CDVENDEDOR, NMVENDEDOR
FROM VENDEDOR
WHERE CDVENDEDOR NOT IN (SELECT CDVENDEDOR FROM IMOVEL);

# 20. Exiba todos os compradores que tenham ofertas cadastradas (utilize INTERSECT).
SELECT CDCOMPRADOR, NMCOMPRADOR
FROM COMPRADOR
WHERE CDCOMPRADOR IN (SELECT CDCOMPRADOR FROM OFERTA);

