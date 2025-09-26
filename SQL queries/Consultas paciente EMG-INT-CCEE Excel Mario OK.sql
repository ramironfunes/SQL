select
urg.entrada_fecha + urg.entrada_hora as FechaIngreso,
urg.fecha_alta_medica as FechaAltaMedica,
urg.salida_fecha + urg.salida_hora as FechaAlta,
cli.apellido1 + ', ' + cli.nombre as 'Apellido y nombre',
td.tipo_dni_desc as 'Tipo_doc',
cli.codigo1 as DNI,
hc.nhc as 'HC',
ser.servicio as Servicio,
loc_pac_urg.localizacion,
cam.cod_cama as Cama_ocupada,
urg.triage_fecha + urg.triage_hora as FechaHoraTriage,
urg.atencion_fecha + urg.atencion_hora as FechaAtencion,
gar.nombre_garante as Financiador,
fper.apellido1 + ', ' + fper.nombre as 'Profesional',
epi.epis_pk as Encuentro

 

from urgencias urg inner join clientes cli on cli.codigo_cliente = urg.codigo_cliente
inner join tpo_dni td on cli.tipo_dni_pk = td.tipo_dni_pk
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

 

where urg.entrada_fecha between '20210821' and '20210831'
and epi.epis_pk not in (select epis_anul_pk

 

from episodios_anul)














-- ***************************************************




select 
       cagendas.fecha_emision as fechaEmision,
       dbo.cagendas.fecha as Fecha_turno,
       ser.servicio, 
       prof.apellido1 + ', ' + prof.nombre as Profesional,
       cli.apellido1 + ' ' + cli.nombre as Paciente,
	   td.tipo_dni_desc as 'Tipo_doc',
	   cli.codigo1 as DNI,
       pres.prest_item_desc as Prestacion
       
      

 

from cagendas inner join fpersona usr on usr.codigo_personal = cagendas.codigo_personal2
              inner join clientes cli on cli.codigo_cliente = dbo.cagendas.codigo_cliente
			  inner join tpo_dni td on cli.tipo_dni_pk = td.tipo_dni_pk
              inner join servicios ser on ser.codigo_servicio = cagendas.codigo_servicio
              inner join fpersona prof on prof.codigo_personal = cagendas.codigo_personal
              inner join ttipovis tvis on tvis.cod_tvisit = cagendas.cod_tvisit
              
              inner join prest_item pres on pres.prest_item_pk = dbo.cagendas.prest_item_pk
              
              inner join tipo_item t_it on t_it.tipo_item_pk = pres.tipo_item_pk

 


where cast (dbo.cagendas.fecha as date) between '20210823' and '20210831'
      and dbo.cagendas.cod_estado = 'VI'
      and tvis.cod_tvisit not in ('37', '38')
     




--****************************************************


select cast (ing.fecha_ingreso as date) Fecha_ingreso, 
       cast (ing.fecha_alta as date) as Fecha_alta, 
       datediff (dd,  cast (ing.fecha_ingreso as date), cast (ing.fecha_alta as date)) as dias_estadia,
       dbo.unidadesenfermeria.descuenf as Sector,
       cam.cod_cama as Cama,
       cli.apellido1 + ', ' + cli.nombre as Paciente,
	   td.tipo_dni_desc as 'Tipo_doc',
	   cli.codigo1 as 'Nro_doc',
       gar.nombre_garante as Financiador

 

from ingresos ing inner join motivos_alta_ing mot ON mot.motivo_alta_pk = ing.motivo_alta_pk
                  inner join camas cam on cam.cod_cama = ing.cod_cama
                  inner join clientes cli on cli.codigo_cliente = ing.codigo_cliente
				  inner join tpo_dni td on cli.tipo_dni_pk = td.tipo_dni_pk
                  inner join dbo.unidadesenfermeria ON dbo.unidadesenfermeria.cod_uenf_pk = cam.cod_uenf_pk
                  inner join pagadores pag on pag.cod_pagador_pk = ing.cod_pagador_pk
                  inner join garantes gar on gar.codigo_garante_pk = pag.codigo_garante_pk
                               
where cast (ing.fecha_ingreso as date) between '20210801' and '20210831' 


