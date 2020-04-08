-- Questão 1
create table en_clinica (
	cod_clinica serial primary key,
	nome_clinica varchar(50),
	dsc_endereco_clinica varchar(200)
)

create table en_especialidade (
	cod_especialidade serial primary key,
	nome_especialia varchar(50),
	dsc_especialidade varchar(200)
)

create table en_medico(
	cod_medico serial,
	cod_clinica integer,
	cod_especialidade integer,
	nome_medico varchar(50),
	dsc_endereco_medico varchar(200),
	salario_medico integer,
	constraint fk_clinica foreign key (cod_clinica) references en_clinica(cod_clinica),
	constraint fk_especialidade foreign key (cod_especialidade) references en_especialidade(cod_especialidade),
	constraint pk_medico primary key (cod_medico, cod_clinica)
)

create table en_paciente (
	cod_paciente serial primary key,
	nome_paciente varchar(50),
	sexo_paciente char,
	data_nascimento_paciente date,
	dsc_endereco_paciente varchar(200)
)

create table en_local (
	cod_local serial primary key,
	dsc_endereco_local varchar(200)
)

create table en_consulta (
	cod_medico integer,
	cod_clinica integer,
	cod_especialidade integer,
	cod_local integer,
	cod_paciente integer,
	data_consulta date,
	valor_consulta integer,
	constraint fk_medico foreign key(cod_medico, cod_clinica) references en_medico(cod_medico, cod_clinica),
	constraint fk_especialidade foreign key (cod_especialidade) references en_especialidade(cod_especialidade),
	constraint fk_local foreign key (cod_local) references en_local(cod_local),
	constraint fk_paciente foreign key (cod_paciente) references en_paciente(cod_paciente),
	constraint pk_consulta primary key (cod_medico, cod_clinica, cod_especialidade, cod_local, cod_paciente)
)

create table en_remedio (
	cod_remedio serial primary key,
	dsc_remedio varchar(200),
	nome_remedio varchar(50)
)

create table en_receita(
	cod_medico integer,
	cod_clinica integer,
	cod_especialidade integer,
	cod_local integer,
	cod_paciente integer,
	cod_remedio integer,
	constraint fk_medico foreign key(cod_medico, cod_clinica) references en_medico(cod_medico, cod_clinica),
	constraint fk_especialidade foreign key (cod_especialidade) references en_especialidade(cod_especialidade),
	constraint fk_local foreign key (cod_local) references en_local(cod_local),
	constraint fk_paciente foreign key (cod_paciente) references en_paciente(cod_paciente),
	constraint fk_remedio foreign key (cod_remedio) references en_remedio(cod_remedio),
	constraint pk_receita primary key (cod_clinica, cod_medico, cod_especialidade, cod_local, cod_paciente, cod_remedio)
)

create table en_convenio_utilizacao(
	cod_clinica integer,
	cod_especialidade integer,
	cod_local integer,
	constraint fk_clinica foreign key (cod_clinica) references en_clinica(cod_clinica),
	constraint fk_especialidade foreign key (cod_especialidade) references en_especialidade(cod_especialidade),
	constraint fk_local foreign key (cod_local) references en_local(cod_local),
	constraint pk_convenio_utilizacao primary key (cod_clinica, cod_especialidade, cod_local)
)


-- Questão 2
insert into en_clinica(nome_clinica, dsc_endereco_clinica) values
	('Clínica Biodinâmica', 'Av. Presidente Kennedy, 89 - São José'),
	('Clínica Dermavitae', 'Av. Rio Branco, 1947 - Florianópolis')

insert into en_especialidade(nome_especialia, dsc_especialidade) values
	('dermatologista', 'cuidados da pele'),
	('anestesista', 'aplicacao de anestesias'),
	('psiquiatra', 'cuidado da saude mentar'),
	('geriatra', 'cuidado com os idosos'),
	('pediatra', 'cuidado infantojuvenil')

insert into en_medico(cod_clinica, cod_especialidade, nome_medico, dsc_endereco_medico, salario_medico) values
	(1, 1, 'Joao Simoes', 'Rua Arvoredo, 20', 10000),
	(2, 2, 'Simone Pereira', 'Rua Lirios, 456', 20000),
	(1, 3, 'Jair Souza', 'Rua Palmeiras, 456', 30000),
	(2, 4, 'Roberto Zardo', 'Rua Dama da noite, 456', 40000),
	(1, 5, 'Pedro Silva', 'Rua Astromelias, 456', 50000),
	(2, 1, 'Maria Zinha', 'Rua Hibiscos, 456', 60000),
	(1, 2, 'José Ninguem', 'Rua Buganviles, 456', 70000),
	(2, 3, 'Arthur Kressin', 'Rua Girasois, 456', 80000),
	(1, 4, 'Gerusa Ramos', 'Rua Rosas, 456', 90000),
	(2, 5, 'João Arnaldo', 'Rua Ipês, 456', 100000)
	
insert into en_local(dsc_endereco_local) values ('Rua Bosque dos Eucaliptos, 28'),('Rua Correio Sul, 381')

insert into en_convenio_utilizacao (cod_clinica, cod_especialidade, cod_local) values
	(1,1,1),
	(1,1,2),
	(1,2,1),
	(2,1,1),
	(2,1,2),
	(2,2,1),
	(2,2,2)
	
insert into en_paciente (nome_paciente, sexo_paciente, data_nascimento_paciente, dsc_endereco_paciente) values
	('João', 'm', '1996-12-24', 'Rua dos Aracas, 203'),
	('Maria', 'f', '1995-12-23', 'Rua dos Aracas, 203'),
	('José', 'm', '1994-12-22', 'Rua dos Aracas, 203'),
	('Marcos', 'm', '1993-12-21', 'Rua dos Aracas, 203'),
	('Sabrina', 'f', '1992-12-10', 'Rua dos Aracas, 203'),
	('Andrea', 'f', '1991-12-09', 'Rua dos Aracas, 203'),
	('João', 'm', '1989-12-08', 'Rua dos Aracas, 203'),
	('Rafael', 'm', '1988-12-07', 'Rua dos Aracas, 203'),
	('Mariana', 'f', '1987-12-06', 'Rua dos Aracas, 203'),
	('Silvia', 'f', '1986-12-05', 'Rua dos Aracas, 203'),
	('Vera', 'f', '1985-12-04', 'Rua dos Aracas, 203'),
	('Victoria', 'f', '1984-12-03', 'Rua dos Aracas, 203'),
	('Eduardo', 'm', '1983-12-02', 'Rua dos Aracas, 203'),
	('Rodrigo', 'm', '1982-12-01', 'Rua dos Aracas, 203'),
	('Rogério', 'm', '1981-12-10', 'Rua dos Aracas, 203'),
	('Marcus', 'm', '1980-12-11', 'Rua dos Aracas, 203')

insert into en_consulta(cod_medico, cod_clinica, cod_especialidade, cod_local, cod_paciente, data_consulta, valor_consulta) values
	(1, 1, 1, 1, 1, '2020-02-01', 500),
	(2, 2, 2, 2, 2, '2020-03-01', 500),
	(3, 1, 3, 1, 3, '2020-04-01', 500),
	(4, 2, 4, 2, 4, '2020-05-01', 500),
	(5, 1, 5, 1, 5, '2020-06-01', 500),
	(6, 2, 1, 2, 6, '2020-07-01', 500),
	(7, 1, 2, 1, 7, '2020-08-01', 500),
	(8, 2, 3, 2, 8, '2020-09-01', 500),
	(9, 1, 4, 1, 9, '2020-10-01', 500),
	(10, 2, 5, 2, 10, '2020-11-01', 500),
	(1, 1, 1, 1, 11, '2020-12-01', 500),
	(2, 2, 2, 2, 12, '2020-01-01', 500),
	(3, 1, 3, 1, 13, '2020-02-01', 500),
	(4, 2, 4, 2, 14, '2020-03-01', 500),
	(5, 1, 5, 1, 15, '2020-04-01', 500),
	(6, 2, 1, 2, 1, '2020-05-01', 500),
	(7, 1, 2, 1, 2, '2020-06-01', 500),
	(8, 2, 3, 2, 3, '2020-07-01', 500),
	(9, 1, 4, 1, 4, '2020-08-01', 500),
	(10, 2, 5, 2, 5, '2020-09-01', 500),
	(1, 1, 1, 1, 6, '2020-10-01', 500),
	(2, 2, 1, 2, 7, '2020-11-01', 500),
	(3, 1, 1, 1, 8, '2020-02-01', 500),
	(4, 2, 1, 1, 9, '2020-02-01', 500),
	(5, 1, 1, 2, 10, '2020-02-01', 500),
	(6, 2, 1, 1, 11, '2020-02-01', 500),
	(7, 1, 1, 2, 12, '2020-02-01', 500),
	(8, 2, 1, 1, 13, '2020-02-01', 500),
	(9, 1, 1, 2, 14, '2020-02-01', 500),
	(10, 2, 1, 1, 15, '2020-02-01', 500),
	(1, 1, 1, 1, 13, '2020-02-01', 500)

insert into en_remedio(nome_remedio, dsc_remedio) values 
	('Cloroquina', 'Matador de Coronga Virus'),
	('Hidroxicloroquina', 'Mata muito coronga')

insert into en_receita(cod_medico, cod_clinica, cod_especialidade, cod_local, cod_paciente, cod_remedio) values
	(1,1,1,1,1,1),
	(2,2,2,2,2,2),
	(3,1,3,1,3,1),
	(4,2,4,2,4,2),
	(5,1,5,1,5,1),
	(6,2,1,2,6,2),
	(7,1,2,1,7,1),
	(8,2,3,2,8,2),
	(9,1,4,1,9,1),
	(10,2,5,2,10,2)
	

--Questão 3
-- Já havia criado os campos como serial


-- Questão 4
alter table en_medico drop constraint pk_medico cascade
alter table en_medico add constraint pk_medico primary key (cod_medico)

-- Questão 5
alter table en_convenio_utilizacao drop constraint pk_convenio_utilizacao cascade
alter table en_convenio_utilizacao add cod_conv serial primary key
