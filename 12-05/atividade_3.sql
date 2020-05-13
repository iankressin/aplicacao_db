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
	horaSaida varchar(10),
	constraint fk_veiculo_placa foreign key (veiculo_placa) veiculo (placa),
	constraint fk_patio_numero foreign key (patio_numero) veiculo (numero)
)


-- Questão 2

insert into cliente (cpf, nome, nascimento) values(010101, 'Jose',    '1995-12-24')
insert into cliente (cpf, nome, nascimento) values(010102, 'Maria',   '1996-11-23')
insert into cliente (cpf, nome, nascimento) values(010103, 'Joao',    '1997-10-25')
insert into cliente (cpf, nome, nascimento) values(010104, 'Marta',   '1998-09-26')
insert into cliente (cpf, nome, nascimento) values(010105, 'Ricardo', '1999-08-27')

insert into modelo (modelo,	descricao) values ('d3'      'pelicula')
insert into modelo (modelo,	descricao) values ('gol', 	 'completo')
insert into modelo (modelo,	descricao) values ('500',    '2 portas')
insert into modelo (modelo,	descricao) values ('palio',  '4 portas')
insert into modelo (modelo,	descricao) values ('lancer', 'adesivos')

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


-- Questão 3

-- A
select placa, cliente_cpf
from veiculo ve
inner join cliente cl
on ve.cliente_cpf = cl.cpf 

-- B
select cl.cpf cliente, cl.nome cliente, v.placa veiculo
from veiculo v
join cliente cl
on v.cliente_cpf = cl.cpf
where placa='mak-1517'

-- C
select v.placa veiculo, v.cor veiculo
from estaciona e
inner join veiculo v
on e.veiculo_placa = v.placa
where codigo=1

-- D
select pa.endereco patio, e.dataEntrada estaciona, e.dataSaida estaciona, e.veiculo_placa estaciona
from estaciona e
join patio pa
on e.patio_numero = pa.numero 
where veiculo_placa = 'abc-1222'
order by dataEntrada

-- E
select cl.nome cliente
from modelo mo
join veiculo v
on v.modelo_codigo = mo.codigo
join cliente cl
on v.cliente_cpf = cl.cpf
where modelo = 'palio'
order by cl.nome

-- F
select v.placa veiculo, e.horaEntrada estaciona, e.horaSaida estaciona
from veiculo v
join estaciona e
on v.placa = e.veiculo_placa
where cor = 'azul'

-- G
select *
from estaciona e
join veiculo v
on e.veiculo_placa = v.placa
where dataentrada like '2020%' and veiculo_placa = 'mak-1517'

-- H
select cl.nome cliente, cl.cpf
from estaciona e
join veiculo v
on v.placa = e.veiculo_placa
join cliente cl
on v.cliente_cpf = cl.cpf
where codigo = 3

-- I
select v.placa, cl.nome, mo.descricao, mo.modelo
from veiculo v
join cliente cl
on v.cliente_cpf = cl.cpf
join modelo mo
on v.modelo_codigo = mo.codigo
