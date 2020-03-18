create table cliente(
	cpf_cliente varchar(11),
	nome_cliente varchar(20),
	rua_cliente varchar(30),
	cidade_cliente varchar(30),
	estado_civil varchar(20),
	rg_cliente varchar(7),
	idade_cliente integer,
	data_cadastro date,
	primary key (cpf_cliente)
)

create table agencia(
	codigo_agencia integer,
	nome_agencia varchar(15),
	cidade_agencia varchar(30),
	fundos numeric(10,2),
	constraint min_fundos check (fundos >= 20),
	primary key (codigo_agencia)
)

create table emprestimo (
	numero_emprestimo integer,
	codigo_agencia integer,
	total numeric (10,2),
	constraint min_total check (total > 0),
	constraint agencia_fk foreign key (codigo_agencia) references agencia(codigo_agencia),
	primary key (numero_emprestimo)
)

create table devedor (
	cpf_cliente varchar(11),
	numero_emprestimo integer,
	constraint cpf_fk foreign key (cpf_cliente) references cliente(cpf_cliente),
	constraint emprestimo_fk foreign key (numero_emprestimo) references emprestimo(numero_emprestimo),
	constraint pk primary key(cpf_cliente, numero_emprestimo)
)

create table conta (
	numero_conta integer,
	codigo_agencia integer,
	cpf_cliente varchar(11),
	saldo numeric(10,2),
	constraint agencia_fk foreign key (codigo_agencia) references agencia(codigo_agencia),
	constraint cpf_fk foreign key (cpf_cliente) references cliente(cpf_cliente), 
	constraint pk_conta primary key (numero_conta)
)

create table depositante (
	cpf_cliente varchar(11),
	numero_conta integer,
	constraint cpf_fk foreign key (cpf_cliente) references cliente(cpf_cliente),
	constraint conta_fk foreign key (numero_conta) references conta(numero_conta),
	constraint depositante_pk primary key (cpf_cliente, numero_conta)
)
