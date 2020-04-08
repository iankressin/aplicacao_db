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
	constraint pk_receita primary key (cod_medico, cod_clinica, cod_especialidade, cod_local, cod_paciente, cod_remedio)
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
