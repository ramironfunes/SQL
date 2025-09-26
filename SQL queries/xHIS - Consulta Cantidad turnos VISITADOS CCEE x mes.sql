select 
       cagendas.fecha_emision as fechaEmision,
       dbo.cagendas.fecha as Fecha_turno,
       ser.servicio, 
       prof.apellido1 + ' ' + prof.nombre as Profesional,
       cli.apellido1 + ' ' + cli.nombre as Paciente, 
       pres.prest_item_desc as Prestacion,
       cli.email,
       cli.telefono1, cli.telefono2, t_it.tipo_item_desc
      

 

from cagendas inner join fpersona usr on usr.codigo_personal = cagendas.codigo_personal2
              inner join clientes cli on cli.codigo_cliente = dbo.cagendas.codigo_cliente
              inner join servicios ser on ser.codigo_servicio = cagendas.codigo_servicio
              inner join fpersona prof on prof.codigo_personal = cagendas.codigo_personal
              inner join ttipovis tvis on tvis.cod_tvisit = cagendas.cod_tvisit
              
              inner join prest_item pres on pres.prest_item_pk = dbo.cagendas.prest_item_pk
              
              inner join tipo_item t_it on t_it.tipo_item_pk = pres.tipo_item_pk

 


where cast (dbo.cagendas.fecha as date) between '20210801' and '20210831'
      and dbo.cagendas.cod_estado = 'VI'
      and tvis.cod_tvisit not in ('37', '38')