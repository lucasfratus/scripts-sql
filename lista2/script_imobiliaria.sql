DROP SCHEMA aluno_ImovelNet;
CREATE SCHEMA aluno_ImovelNet;
USE aluno_ImovelNet;

CREATE TABLE ESTADO (
SGESTADO CHAR(2) NOT NULL,
NMESTADO VARCHAR(20),
PRIMARY KEY (SGESTADO));

CREATE TABLE CIDADE (
CDCIDADE INTEGER NOT NULL,
NMCIDADE VARCHAR(20),
SGESTADO CHAR(2) NOT NULL,
PRIMARY KEY (CDCIDADE, SGESTADO),
FOREIGN KEY (SGESTADO) REFERENCES ESTADO(SGESTADO));

CREATE TABLE BAIRRO (
CDBAIRRO INTEGER NOT NULL,
NMBAIRRO VARCHAR(20),
CDCIDADE INTEGER NOT NULL,
SGESTADO CHAR(2) NOT NULL,
PRIMARY KEY (CDBAIRRO, CDCIDADE, SGESTADO),
FOREIGN KEY (CDCIDADE, SGESTADO) REFERENCES CIDADE(CDCIDADE, SGESTADO));

CREATE TABLE COMPRADOR (
CDCOMPRADOR INTEGER NOT NULL,
NMCOMPRADOR VARCHAR(40),
NMENDERECO VARCHAR(40),
NRCPF DECIMAL(11),
NMCIDADE VARCHAR(20),
NMBAIRRO VARCHAR(20),
SGESTADO CHAR(2),
TELEFONE VARCHAR(20),
EMAIL VARCHAR(80),
PRIMARY KEY (CDCOMPRADOR));

CREATE TABLE VENDEDOR (
CDVENDEDOR INTEGER NOT NULL,
NMVENDEDOR VARCHAR(40),
NMENDERECO VARCHAR(40),
NRCPF DECIMAL(11),
NMCIDADE VARCHAR(20),
NMBAIRRO VARCHAR(20),
SGESTADO CHAR(2),
TELEFONE VARCHAR(20),
EMAIL VARCHAR(80),
PRIMARY KEY (CDVENDEDOR));

CREATE TABLE IMOVEL (
CDIMOVEL INTEGER NOT NULL,
CDVENDEDOR INTEGER,
CDBAIRRO INTEGER,
CDCIDADE INTEGER,
SGESTADO VARCHAR(2),
NMENDERECO VARCHAR(40),
NRAREAUTIL DECIMAL(10,2),
NRAREATOTAL DECIMAL(10,2),
DSIMOVEL VARCHAR(300),
VLPRECO DECIMAL(16,2),
NROFERTAS INTEGER,
STVENDIDO CHAR(1),
DTLANCTO DATE,
IMOVEL_INDICADO INTEGER,
PRIMARY KEY (CDIMOVEL),
FOREIGN KEY (IMOVEL_INDICADO) REFERENCES IMOVEL(CDIMOVEL),
FOREIGN KEY (CDVENDEDOR) REFERENCES VENDEDOR(CDVENDEDOR),
FOREIGN KEY (CDBAIRRO, CDCIDADE, SGESTADO) REFERENCES BAIRRO(CDBAIRRO, CDCIDADE, SGESTADO));

CREATE TABLE OFERTA (
CDCOMPRADOR INTEGER NOT NULL,
CDIMOVEL INTEGER NOT NULL,
VLOFERTA DECIMAL(16,2),
DTOFERTA DATE,
PRIMARY KEY (CDCOMPRADOR, CDIMOVEL),
FOREIGN KEY (CDCOMPRADOR) REFERENCES COMPRADOR(CDCOMPRADOR),
FOREIGN KEY (CDIMOVEL) REFERENCES IMOVEL(CDIMOVEL));

CREATE TABLE FAIXA_IMOVEL (
CDFAIXA INTEGER NOT NULL,
NUMFAIXA VARCHAR(30),
VLMINIMO DECIMAL(14,2),
VLMAXIMO DECIMAL(14,2),
PRIMARY KEY (CDFAIXA));
