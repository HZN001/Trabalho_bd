CREATE DATABASE Imoveis;
GO

Use Imoveis;
GO

create table estado(
sgEstado char (2) not null primary key,
nmEstado varchar (50) not null
);
go

DROP TABLE estado
go


ALTER TABLE estado

ALTER COLUMN nmEstado VARCHAR(50) NOT NULL

go


create table faixaImovel(
cdfaixa integer not null primary key,
nmFaixa varchar (30) not null,
vlMinimo decimal (8,2) not null,
vlMaximo decimal (10,2) not null
);
go

DROP TABLE faixaImovel
go



create table cidade(
cdCidade integer not null primary key,
nmCidade varchar (30) not null,
sgEstado char (2) not null,
foreign key (sgEstado)
references estado(sgEstado)
);
go

DROP TABLE cidade
go

create table bairro(
cdBairro integer not null primary key,
nmBairro varchar (20) not null,
cdCidade integer not null,
sgEstado char (2) not null,
foreign key (cdCidade)
references cidade(cdCidade),
foreign key (sgEstado)
references estado(sgEstado)
);
go

DROP TABLE bairro
go

ALTER TABLE bairro

ALTER COLUMN nmBairro VARCHAR(50) NOT NULL

go


create table compradores (
cdcomprador integer not null primary key,
nmComprador varchar (50) not null,
nmEnderecoComprador varchar (100) not null,
nrCpfComprador varchar (11) unique not null,
cdCidade integer not null,
cdBairro integer not null,
sgEstado char (2) not null,
telefone NUMERIC(11) NOT NULL,
foreign key (cdCidade)
references cidade(cdCidade),
foreign key (cdBairro)
references bairro(cdBairro),
foreign key (sgEstado)
references estado(sgEstado)
);
go

DROP TABLE compradores
go

create table vendedor(
cdVendedor integer not null primary key,
nmVendedor varchar (50) not null,
nmEndereco varchar (100) not null,
nrCpf varchar (11) unique not null,
cdCidade integer not null,
cdBairro integer not null,
sgEstado char (2) not null,
telefone varchar (11) unique not null,
dataNasc datetime not null,
foreign key (cdCidade)
references cidade(cdCidade),
foreign key (cdBairro)
references bairro(cdBairro),
foreign key (sgEstado)
references estado(sgEstado)
);
go

DROP TABLE vendedor
go

ALTER TABLE vendedor

ALTER COLUMN telefone NUMERIC(11) NOT NULL

go


create table oferta (
cdOferta integer not null primary key,
cdImovel varchar (50) not null,
nmEndereco varchar (100) not null,
nrCpf varchar (11) unique not null,
cdCidade integer not null,
cdBairro integer not null,
sgEstado char (2) not null,
telefone varchar (11) unique not null,
dataNasc datetime not null,
foreign key (cdCidade)
references cidade(cdCidade),
foreign key (cdBairro)
references bairro(cdBairro),
foreign key (sgEstado)
references estado(sgEstado)
);
go


DROP TABLE oferta
go


create table imovel (
cdImovel integer not null primary key,
cdVendedor integer not null,
nmEndereco varchar (100) not null,
cdCidade integer not null,
cdBairro integer not null,
sgEstado char (2) not null,
nrAreaUtil varchar(11) not null,
nrAreaTotal varchar(11) not null,
vlPreco decimal (8,2 )not null,
cdOferta integer not null,
stVendido char (1) not null,
dataLancto datetime not null,
foreign key (cdVendedor)
references vendedor(cdVendedor),
foreign key (cdCidade)
references cidade(cdCidade),
foreign key (cdBairro)
references bairro(cdBairro),
foreign key (sgEstado)
references estado(sgEstado),
);
go

DROP TABLE imovel
go


ALTER TABLE imovel 
ALTER COLUMN nrAreaUtil NUMERIC(8,2) NOT NULL;
GO

ALTER TABLE imovel
ALTER COLUMN nrAreaTotal NUMERIC (8,2) NOT NULL
go

DROP TABLE imovel
go

create table ImovelOferta (
cdOferta integer not null,
cdImovel integer not null,
foreign key (cdOferta)
references oferta(cdOferta),
foreign key (cdImovel)
references imovel(cdImovel)
);
go

DROP TABLE ImovelOferta
go




