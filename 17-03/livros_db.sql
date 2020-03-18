create table livro(
	cod_livro serial primary key,
	titulo varchar(50),
	editora varchar(30),
	ano numeric(4),
	local_edicacao varchar(45)
)

create table autor(
	cod_autor serial primary key,
	nome_autor varchar(50)
)

create table livro_autor(
	cod_livro integer,
	cod_autor integer,
	constraint fk_livro foreign key (cod_livro) references livro(cod_livro),
	constraint fk_autor foreign key (cod_autor) references autor(cod_autor),
	constraint pk_lirvro_autor primary key (cod_livro, cod_autor)
)

create table assunto(
	cod_assunto serial primary key,
	desc_assunto varchar(50)
)

create table livro_assunto(
	cod_livro integer,
	cod_assunto integer,
	constraint fk_livro foreign key (cod_livro) references livro(cod_livro),
	constraint fk_assunto foreign key (cod_assunto) references assunto(cod_assunto),
	constraint pk_livro_assunto primary key (cod_livro, cod_assunto)
)

create table exemplar(
	cod_exemplar serial primary key,
	cod_livro integer,
	data_aquisicao date,
	constraint fk_livro foreign key (cod_livro) references livro(cod_livro)
)

create table associado(
	cod_associado serial primary key,
	nome_associado varchar(50),
	endereco varchar(50),
	telefone varchar(15),
	email varchar(50),
	data_nasc date
)

create table cidade (
	cod_cidade serial primary key,
	nome_cidade varchar(50),
	uf varchar(45)
)

create table dependente(
	cod_dependente serial primary key,
	cod_cidade integer,
	cod_associado integer,
	nome_dependente varchar(50),
	data_nasc date,
	constraint fk_cidade foreign key (cod_cidade) references cidade(cod_cidade),
	constraint fk_associado foreign key (cod_associado) references associado(cod_associado)
)

create table exemplar_associado(
	cod_exemplar integer,
	cod_associado integer,
	data_emprestimo date,
	constraint fk_associado foreign key (cod_associado) references associado(cod_associado),
	constraint fk_exemplar foreign key (cod_exemplar) references exemplar(cod_exemplar),
	constraint pk_exemplar_associado primary key (cod_exemplar, cod_associado, data_emprestimo)
)

create table multa(
	cod_multa serial primary key,
	cod_exemplar integer,
	cod_associado integer,
	data_emprestimo date,
	valor numeric,
	data_pagamento date,
	constraint min_valor check (10 <= valor),
	constraint max_valor check (1000000 > valor),
	constraint fk_exemplar_associado foreign key (cod_exemplar, cod_associado, data_emprestimo) references exemplar_associado(cod_exemplar, cod_associado, data_emprestimo)
)
