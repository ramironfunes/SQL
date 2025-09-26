--Consulto los episodios que tienen misma fecha de apertura y cierre, pero hora de cierre anterior a hora de apertura episodio

select episodios.codigo_cliente,
clientes.apellido1,
clientes.apellido2,
clientes.nombre,
hc.nhc,
episodios.* 
from episodios
inner join clientes on clientes.codigo_cliente = episodios.codigo_cliente
inner join hc on hc.codigo_cliente = clientes.codigo_cliente
where epis_apertura_fech = epis_cierre_fecha 
and epis_apertura_hora > epis_cierre_hora
and epis_apertura_fech >= '20220101'
order by epis_apertura_fech, clientes.apellido1


--EJ del UPD para solucionar el error
BEGIN TRAN
update episodios set epis_cierre_hora = (dateadd(mi,10,epis_apertura_hora)) where epis_pk = 102241047
COMMIT TRAN



select epis_apertura_hora, (dateadd(mi,10,epis_apertura_hora)) from episodios where epis_pk = 102241047



select * 
from MiTabla with(nolock)
where FechaHora >= dateadd(mi, -5, getdate())