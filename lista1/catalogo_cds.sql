drop schema catalogo;
create schema catalogo;
use catalogo;

CREATE TABLE autor
(
 codigo_autor int primary key,  
 nome_autor varchar(30)
);

CREATE TABLE gravadora
(
 codigo_gravadora int primary key,  
 nome_gravadora varchar(30),  
 endereco varchar(30)  
);

CREATE TABLE musica
(
 codigo_musica int primary key,  
 nome_musica varchar(30),
 duracao int
);

CREATE TABLE cd
(
 codigo_cd int primary key,  
 nome_cd varchar(30),
 preco_venda decimal(4,2), 
 data_lancamento date,
 codigo_gravadora int,
 foreign key (codigo_gravadora) references gravadora(codigo_gravadora)
);

CREATE TABLE item_cd
(
 cod_cd int,  
 cod_musica int,
 primary key (cod_cd, cod_musica),
 foreign key (cod_cd) references cd(codigo_cd),
 foreign key (cod_musica) references musica(codigo_musica)
);

CREATE TABLE musica_autor
(
 cod_autor int,  
 cod_musica int,
 primary key (cod_autor, cod_musica),
 foreign key (cod_autor) references autor(codigo_autor),
 foreign key (cod_musica) references musica(codigo_musica)
);


#####################################

insert into autor values (1, 'Pablo');
insert into autor values (2, 'Maria');

insert into gravadora values (1, 'Sony', null);
insert into gravadora values (2, 'Universal', null);

insert into cd values (1, 'Carnaval', '55.00', '2000-10-01', 1);
insert into cd values (2, 'Maresia', '30.00', '1991-12-12', 2);
insert into cd values (3, 'Pop Rock', '45.00', '2010-03-09', 1);

insert into musica values (1, 'Marchinha', 120);
insert into musica values (2, 'Madalena', 127);
insert into musica values (3, 'Amanhã', 145);

insert into item_cd values (1,1);
insert into item_cd values (1,2);
insert into item_cd values (2,3);

insert into musica_autor values (1,1);
insert into musica_autor values (2,1);
insert into musica_autor values (1,2);

#####################################

select * from autor;
select * from cd;
select * from gravadora;
select * from musica;
select * from item_cd;
select * from musica_autor;
