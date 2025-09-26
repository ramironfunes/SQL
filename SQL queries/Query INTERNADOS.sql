select cast (ing.fecha_ingreso as date) Fecha_ingreso,
	   case 
			when (ing.fecha_ingreso between '20210201' and '20210228') then 'Febrero'
			when (ing.fecha_ingreso between '20210301' and '20210331') then 'Marzo' 
			when (ing.fecha_ingreso between '20210401' and '20210430') then 'Abril' 
			when (ing.fecha_ingreso between '20210501' and '20210531') then 'Mayo' 
			when (ing.fecha_ingreso between '20210601' and '20210630') then 'Junio' 
			when (ing.fecha_ingreso between '20210701' and '20210731') then 'Julio' 
			when (ing.fecha_ingreso between '20210801' and '20210831') then 'Agosto' 
			when (ing.fecha_ingreso between '20210901' and '20210930') then 'Septiembre' 
		end as Mes,
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
                               
where cast (ing.fecha_ingreso as date) between '20210201' and getdate()
order by 1



