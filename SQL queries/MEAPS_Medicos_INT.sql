select 
d.nhc as NHC,
l.epis_pk as Episodio,
p.nombre_garante,
CAST(a.fecha_registro as date) as Fecha, 
CAST(a.hora_registro as time) as Hora,
CASE
WHEN l.tipo_episodio_pk = 1 THEN 'EMG'
WHEN l.tipo_episodio_pk = 3 THEN 'INT'
End as Ambito,
i.nombre_corto as Medico,
m.servicio as Servicio,
c.nombre + ' ' + c.apellido1 as Paciente,
a.seccion as MEAP
from meap_det a with (nolock)
  inner join meap b on b.meap_pk = a.meap_pk
  inner join clientes c on c.codigo_cliente = b.codigo_cliente
  inner join hc d on d.codigo_cliente = c.codigo_cliente
  inner join fpersona i on i.codigo_personal = b.profesional_registro
  inner join hc j on j.codigo_cliente = c.codigo_cliente
  inner join be_encuentro k on k.encuentro_pk = b.encuentro_pk
  inner join episodios l on l.epis_pk = k.epis_pk
  inner join servicios m on m.codigo_servicio = b.servicio_registro
  inner join ingresos n on n.cod_ingreso_pk = l.referencia_id
  inner join pagadores o on o.cod_pagador_pk = n.cod_pagador_pk
  inner join garantes p on o.codigo_garante_pk = p.codigo_garante_pk
WHERE 1=1
and i.codigo_categoria in (1,8,9,10,11,12,15,16) -- medicos
and datalength(a.seccion)>0
AND a.tipo_pk in (5) --evoluciones 
and CAST(a.fecha_registro as date) between '20210401' AND  '20210430'
AND l.tipo_episodio_pk  = 3 --( 1: emg, 2: ccee, 3: int)
