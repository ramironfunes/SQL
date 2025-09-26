select
urg.entrada_fecha + urg.entrada_hora as FechaIngreso,
cli.codigo1 as DNI,
cli.apellido1 + ', ' + cli.nombre as 'Apellido y nombre',
ser.servicio as Servicio,
loc_pac_urg.localizacion,
urg.triage_fecha + urg.triage_hora as FechaHoraTriage,
urg.motivo_urg_libre as Descripcion,
urg.atencion_fecha + urg.atencion_hora as FechaAtencion,
urg.diagno1_urg as Diagnostico_urgencias,
urg.diag_salida as Diagnostico_salida,
gar.nombre_garante as Financiador,
fper.apellido1 + ', ' + fper.nombre as 'Profesional',
urg.fecha_alta_medica as FechaAltaMedica,
urg.salida_fecha + urg.salida_hora as FechaAlta,
epi.epis_pk as Encuentro,
hc.nhc,
cam.cod_cama as Cama_ocupada,
motivos_alta_ing.motivo_alta_desc as MotivoAlta

 

from urgencias urg inner join clientes cli on cli.codigo_cliente = urg.codigo_cliente
left join triage tri on tri.triage_pk = urg.triage_pk
left join camas cam on cam.cod_cama = urg.cod_cama
left join servicios ser on ser.codigo_servicio = urg.codigo_servicio4
left join loc_pac_urg on dbo.loc_pac_urg.localizacion_pk = urg.localizacion_pk
left join pagadores pag on pag.cod_pagador_pk = urg.cod_pagador_pk
left join garantes gar on gar.codigo_garante_pk = pag.codigo_garante_pk
left join fpersona fper on fper.codigo_personal = urg.codigo_personal
left join episodios epi on epi.referencia_id = urg.id_urgencia_pk
and epi.codigo_cliente = cli.codigo_cliente

 

left join hc on hc.codigo_cliente = cli.codigo_cliente
left join motivos_alta_ing on motivos_alta_ing.motivo_alta_pk = urg.motivo_alta_pk

 

where urg.entrada_fecha between '20210801' and '20210831'
and epi.epis_pk not in (select epis_anul_pk

 

from episodios_anul)