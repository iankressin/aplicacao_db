-- Questão 1
( 
  select v.nomevend 
	from vendedor v
	inner join pedido pe
	on pe.idvendedor = v.idvend
	where dtpedido = '2020-05-10'
)
union
(
	select v.nomevend
	from vendedor v
	inner join pedido pe
	on pe.idvendedor = v.idvend
	where dtpedido = '2020-05-18' and idloja = 4 
)

-- Questão 2
(
	select v.nomevend, v.idvend
	from vendedor v
	inner join pedido pe
	on pe.idvendedor = v.idvend
	where dtpedido = '2020-05-10'
)
union
(
	select v.nomevend, v.idvend
	from vendedor v
	inner join pedido pe
	on pe.idvendedor = v.idvend
	where dtpedido = '2020-05-18' and idloja = 4 
)
except
(
	select nomevend ,idvend from vendedor where idvend = 3
)

-- Questão 3
-- a
select count(*) from pedido

--b
select idloja, count(*) as "Pedido por loja"
from pedido
group by idloja

--c
select idvendedor, count(*) as "Pedido por vendedor"
from pedido
group by idvendedor

-- Questão 4
select l.nomeloja, count(pe.*)
from loja l
inner join pedido pe
on l.idloja = pe.idloja
group by l.nomeloja


-- Questão 5
select pr.nomeprod, count(pp.*)
from produto pr
inner join produto_pedido pp
on pr.idprod = pp.idprod
group by pr.nomeprod

-- Questão 6
select *
from pedido
where idvendedor in (1,2,3)

-- Questão 7
select v.nomevend
from vendedor v
where v.idvend not in (
	select idvendedor from pedido
)
