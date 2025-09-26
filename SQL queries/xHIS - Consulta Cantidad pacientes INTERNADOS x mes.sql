select cast (ing.fecha_ingreso as date) Fecha_ingreso, 
       cast (ing.fecha_alta as date) as Fecha_alta, 
       datediff (dd,  cast (ing.fecha_ingreso as date), cast (ing.fecha_alta as date)) as dias_estada,
       ing.diagno1_ing, ing.diag_salida,
       mot.motivo_alta_desc,
       dbo.unidadesenfermeria.descuenf as Sector,
       cam.cod_cama as Cama,
       cli.apellido1 + ' ' + cli.nombre as Paciente,
       cli.email,
       cli.telefono1, 
       cli.telefono2,
       gar.nombre_garante as Financiador

 

from ingresos ing inner join motivos_alta_ing mot ON mot.motivo_alta_pk = ing.motivo_alta_pk
                  inner join camas cam on cam.cod_cama = ing.cod_cama
                  inner join clientes cli on cli.codigo_cliente = ing.codigo_cliente
                  inner join dbo.unidadesenfermeria ON dbo.unidadesenfermeria.cod_uenf_pk = cam.cod_uenf_pk
                  inner join pagadores pag on pag.cod_pagador_pk = ing.cod_pagador_pk
                  inner join garantes gar on gar.codigo_garante_pk = pag.codigo_garante_pk
                               
where cast (ing.fecha_ingreso as date) between '20210801' and '20210831' 