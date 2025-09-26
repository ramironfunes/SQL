select 
CAST(a.fecha_registro as date) as Fecha, 
CAST(a.hora_registro as time) as Hora,  
i.nombre_corto as Enfermero,
c.nombre + ' ' + c.apellido1 as Paciente,
a.seccion as MEAP
from meap_det a
  inner join meap b on b.meap_pk = a.meap_pk
  inner join clientes c on c.codigo_cliente = b.codigo_cliente
  inner join fpersona i on i.codigo_personal = b.profesional_registro
  inner join hc j on j.codigo_cliente = c.codigo_cliente
WHERE 1=1
and i.codigo_categoria = 2 -- enfermeros
and datalength(a.seccion)>0
AND a.tipo_pk in (26, 5) --evoluciones + hojas de enfermeria
and CAST(a.fecha_registro as date) between '20210301' and '20210331'

