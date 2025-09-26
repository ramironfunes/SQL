select 
       cagendas.fecha_emision as 'Fecha Emision Turno',
       dbo.cagendas.fecha as 'Fecha Turno',
	   case 
			when (dbo.cagendas.fecha between '20210201' and '20210228') then 'Febrero 2021'
			when (dbo.cagendas.fecha between '20210301' and '20210331') then 'Marzo 2021' 
			when (dbo.cagendas.fecha between '20210401' and '20210430') then 'Abril 2021' 
			when (dbo.cagendas.fecha between '20210501' and '20210531') then 'Mayo 2021' 
			when (dbo.cagendas.fecha between '20210601' and '20210630') then 'Junio 2021' 
			when (dbo.cagendas.fecha between '20210701' and '20210731') then 'Julio 2021' 
			when (dbo.cagendas.fecha between '20210801' and '20210831') then 'Agosto 2021' 
			when (dbo.cagendas.fecha between '20210901' and '20210930') then 'Septiembre 2021' 
			when (dbo.cagendas.fecha between '20211001' and '20211031') then 'Octubre 2021'
			when (dbo.cagendas.fecha between '20211101' and '20211130') then 'Noviembre 2021' 
			when (dbo.cagendas.fecha between '20211201' and '20211231') then 'Diciembre 2021'
			when (dbo.cagendas.fecha between '20220101' and '20220131') then 'Enero 2022'
			when (dbo.cagendas.fecha between '20220201' and '20220228') then 'Febrero 2022'
			when (dbo.cagendas.fecha between '20220301' and '20220331') then 'Marzo 2022' 
			when (dbo.cagendas.fecha between '20220401' and '20220430') then 'Abril 2022' 
			when (dbo.cagendas.fecha between '20220501' and '20220531') then 'Mayo 2022' 
			when (dbo.cagendas.fecha between '20220601' and '20220630') then 'Junio 2022' 			
	   end as Mes_Turno,
       ser.servicio as Servicio, 
       prof.apellido1 + ', ' + prof.nombre as Profesional,
	   CASE
	   WHEN cli.apellido2 is null OR cli.apellido2 = '' THEN cli.apellido1 + ' ' + cli.nombre
	   ELSE cli.apellido1 + ' ' + cli.apellido2 + ' ' + cli.nombre
	   END AS Paciente,
	   td.tipo_dni_desc as 'Tipo Documento',
	   cli.codigo1 as 'Nro Documento',
       pres.prest_item_desc as Prestacion
       
      

 

from cagendas inner join fpersona usr on usr.codigo_personal = cagendas.codigo_personal2
              inner join clientes cli on cli.codigo_cliente = dbo.cagendas.codigo_cliente
			  inner join tpo_dni td on cli.tipo_dni_pk = td.tipo_dni_pk
              inner join servicios ser on ser.codigo_servicio = cagendas.codigo_servicio
              inner join fpersona prof on prof.codigo_personal = cagendas.codigo_personal
              inner join ttipovis tvis on tvis.cod_tvisit = cagendas.cod_tvisit
              
              inner join prest_item pres on pres.prest_item_pk = dbo.cagendas.prest_item_pk
              
              inner join tipo_item t_it on t_it.tipo_item_pk = pres.tipo_item_pk

 


where cast (dbo.cagendas.fecha as date) between '20210201' and getdate()
      and dbo.cagendas.cod_estado = 'VI'
      and tvis.cod_tvisit not in ('37', '38')
	  order by 2
     