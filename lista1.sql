use catalogo;

# 1. Recupere os nomes dos Cds que começam com a letra “C”.
SELECT nome_cd FROM cd
WHERE nome_cd LIKE 'C%';

# 2. Para cada Cd recupere o nome, o valor, a data de lançamento e a gravadora. Ordene 
# o resultado de acordo com a gravadora e o valor.
SELECT nome_cd, preco_venda, data_lancamento, codigo_gravadora FROM cd
ORDER BY codigo_gravadora, preco_venda; 

# 3. Recupere a quantidade de Cds da gravadora 1.
SELECT codigo_gravadora, COUNT(*) as qntde_cd
FROM cd
WHERE codigo_gravadora = 1;

# 4. Recupere a quantidade de Cds de cada gravadora.
SELECT codigo_gravadora, COUNT(*) as qntde_cd
FROM cd
GROUP BY codigo_gravadora;

# 5. Recupere a quantidade de música de cada Cd.
SELECT cod_cd, COUNT(*) AS qntde_musicas
FROM item_cd
GROUP BY cod_cd;

# 6. Recupere a quantidade de autores
SELECT COUNT(*) AS numero_autores
FROM autor;

# 7. Recupere a quantidade de autores de cada música.
SELECT cod_musica, COUNT(*) as numero_autores
from musica_autor
GROUP BY cod_musica;

# 8. Para cada Cd recupere o seu nome e o nome da sua respectiva gravadora.
SELECT a.nome_cd, b.nome_gravadora
FROM cd a
JOIN gravadora b ON a.codigo_gravadora=b.codigo_gravadora;

# 9. Para cada música recupere o seu código e os nomes dos seus autores.
SELECT a.cod_musica, b.nome_autor
FROM musica_autor a
JOIN autor b ON a.cod_autor=b.codigo_autor;

# 10. Para cada Cd recupere o seu código e os nomes das suas músicas.
SELECT cod_cd, nome_musica
FROM item_cd 
JOIN musica ON cod_musica=codigo_musica;