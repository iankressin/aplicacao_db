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
