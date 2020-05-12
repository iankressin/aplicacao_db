-- Questão 1
create table cliente (
	cpf integer primary key,
	nome varchar(60),
	nascimento date
)

create table modelo (
	codigo serial primary key,
	descricao varchar(40)
)

create table veiculo (
	placa varchar(8) primary key,
	modelo_codigo integer,
	cliente_cpf integer,
	cor varchar(20),
	constraint fk_modelo foreign key (modelo_codigo) references modelo(codigo),
	constraint fk_cpf foreign key (cliente_cpf) references cliente(cpf)
)

create table patio (
	numero serial primary key,
	endereco varchar(40),
	capacidade integer
)

create table estaciona (
	codigo serial primary key,
	patio_numero integer,
	veiculo_placa varchar(8),
	dataEntrada varchar(10),
	dataSaida varchar(10),
	horaEntrada varchar(10),
	horaSaida varchar(10)
)

-- Questão 2
insert into cliente (cpf, nome, nascimento) values(010101, 'Jose', '1995-12-24')
insert into cliente (cpf, nome, nascimento) values(010102, 'Maria', '1996-11-23')
insert into cliente (cpf, nome, nascimento) values(010103, 'Joao', '1997-10-25')
insert into cliente (cpf, nome, nascimento) values(010104, 'Marta', '1998-09-26')
insert into cliente (cpf, nome, nascimento) values(010105, 'Ricardo', '1999-08-27')

insert into modelo (descricao) values ('completo')
insert into modelo (descricao) values ('ar e direcao')
insert into modelo (descricao) values ('trava eletrica')
insert into modelo (descricao) values ('disel')
insert into modelo (descricao) values ('flex')

insert into veiculo (placa, modelo_codigo, cliente_cpf, cor) values ('mak-1516', 1, 010101, 'vermelho')
insert into veiculo (placa, modelo_codigo, cliente_cpf, cor) values ('abc-1222', 2, 010102, 'branco')
insert into veiculo (placa, modelo_codigo, cliente_cpf, cor) values ('cad-1213', 3, 010103, 'azul')
insert into veiculo (placa, modelo_codigo, cliente_cpf, cor) values ('pic-4000', 4, 010104, 'prata')
insert into veiculo (placa, modelo_codigo, cliente_cpf, cor) values ('knc-1231', 5, 010105, 'preto')

insert into patio (endereco, capacidade) values ('Rua Rio Branco, 23', 40)
insert into patio (endereco, capacidade) values ('Avenida Santo Amaro, 935', 44)
insert into patio (endereco, capacidade) values ('Rua Bosque, 1274', 200)
insert into patio (endereco, capacidade) values ('Avenida Correio Sul, 56', 140)
insert into patio (endereco, capacidade) values ('Rua Marcio Americo, 157', 50)

insert into estaciona (patio_numero, veiculo_placa, dataEntrada, dataSaida, horaEntrada, horaSaida)
values (1, 'mak-1517', '2020-01-10', '2020-01-10', '20:00', '21:30')
insert into estaciona (patio_numero, veiculo_placa, dataEntrada, dataSaida, horaEntrada, horaSaida)
values(2, 'abc-1222', '2020-04-11', '2020-04-12', '12:00', '14:30')
insert into estaciona (patio_numero, veiculo_placa, dataEntrada, dataSaida, horaEntrada, horaSaida)
values (3, 'cad-1213', '2020-03-04', '2020-03-04', '09:00', '21:30')
insert into estaciona (patio_numero, veiculo_placa, dataEntrada, dataSaida, horaEntrada, horaSaida)
values (4, 'pic-4000', '2020-05-12', '2020-05-12', '20:00', '21:30')
insert into estaciona (patio_numero, veiculo_placa, dataEntrada, dataSaida, horaEntrada, horaSaida)
values (5, 'knc-1231', '2020-01-10', '2020-01-10', '20:00', '21:30')
