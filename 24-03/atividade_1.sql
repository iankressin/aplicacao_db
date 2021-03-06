-- Questão 1
create table cliente (
	idCliente serial primary key,
	nomeCliente varchar(50) not null,
	rg varchar(12) not null,
	cpf varchar(14) not null,
	telefone varchar(12)
)

create table venda (
	idVenda serial primary key,
	idCliente integer,
	dataVenda date,
	precoVenda numeric,
	constraint fk_cliente foreign key (idCliente) references cliente(idCliente),
	constraint min_venda check (precoVenda >= 2),
	constraint max_venda check (precoVenda <= 10)
)

create table artista (
	idArtista serial primary key,
	nomeArtista varchar(50) not null,
	telefone varchar(12),
	observacao text
)

create table obra (
	idObra serial primary key,
	idArtista integer,
	idVenda integer,
	titulo varchar(50) not null,
	descricao text,
	dataAquisicao date,
	precoCompra numeric(10,2),
	disponivelVenda boolean,
	constraint fk_artista foreign key (idArtista) references artista(idArtista),
	constraint fk_venda foreign key (idVenda) references venda(idVenda)
)

create table exposicao(
	idExposicao serial primary key,
	dataInicio date not null,
	dataFim date,
	nomeExposicao varchar(45)
)

create table obra_exposicao(
	idObra integer,
	idExposicao integer,
	constraint fk_obra foreign key (idObra) references obra(idObra),
	constraint fk_exposicao foreign key (idExposicao) references exposicao(idExposicao),
	constraint pk_obra_exposicao primary key (idObra, idExposicao)
)

-- Questão 2
drop table obra_exposicao
drop table exposicao
drop table obra
drop table artista
drop table venda
drop table cliente

-- Questão 3
create table endereco (
	idEndereco serial primary key,
	rua varchar(100),
	numero integer,
	bairro varchar(100),
	estado varchar(50),
	pais varchar(50),
	cep varchar(10)
)

-- Questão 4
alter table cliente add column idEndereco integer
alter table cliente add constraint fk_endereco foreign key (idEndereco) references endereco(idEndereco)

--Questão 5
alter table artista add column idEndereco integer
alter table artista add constraint fk_endereco foreign key (idEndereco) references endereco(idEndereco)

-- Questão 6
create table funcionario (
	idFuncionario serial primary key,
	nomeFuncionario varchar(50) not null,
	rg varchar(12),
	cpf varchar(11),
	idEndereco integer,
	constraint fk_endereco foreign key (idEndereco) references endereco(idEndereco)
)

-- Questção 7
alter table cliente alter column nomeCliente type varchar(100)
alter table artista alter column nomeArtista type varchar(100)
alter table funcionario alter column nomeFuncionario type varchar(100)
