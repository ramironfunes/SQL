SELECT top 250 qrf_xciru_prog.qrf_cirprog_pk,
actividad.epis_pk as Episodio, 
clientes.nombre as Nombre, 
clientes.apellido1 as Apellido,
CASE 
WHEN clientes.apellido2 = '' OR clientes.apellido2 is null THEN ''
ELSE clientes.apellido2
END AS Apellido2,
hc.nhc as NHC,
--(SELECT hc.nhc from hc hc where hc.codigo_cliente = clientes.codigo_cliente) as NHC,
CONVERT(VARCHAR, clientes.nac_fecha,5) AS 'Fecha Nac',
--clientes.codigo_cliente, 
CONVERT(VARCHAR, actividad.act_program_fecha,3) AS 'F. Program',
CONVERT(VARCHAR, actividad.act_program_hora,8) AS 'H. Progr',
(select top 1 case 
when ingresos.fecha_alta_adm is not null OR ingresos.ing_confirmado_sn = 0 then ''
else ingresos.cod_cama end as cama
from ingresos ingresos where ingresos.codigo_cliente =  episodios.codigo_cliente order by ingresos.cod_ingreso_pk desc) as 'CAMA ACTUAL',
--qrf_xciru_prog.qrf_ciru_estado,
CASE
WHEN qrf_xciru_prog.qrf_ciru_estado = 1 THEN 'INTERVENIDA'
WHEN qrf_xciru_prog.qrf_ciru_estado = 0 THEN 'EN CURSO'
WHEN qrf_xciru_prog.qrf_ciru_estado is null THEN 'RESERVADA'
ELSE ''
END as 'Estado Cirugía',
--actividad_a.act_anulada as Anulada,
--actividad_a.act_frdo,
--actividad_a.actividad_hora_rdo,
--actividad_a.tipo_actividad_pk,
--actividad_a.actividad_pk,
--episodios.tipo_episodio_pk,
--actividad_a.codigo_servicio,
--actividad_a.codigo_servicio1,
servicios.servicio,
--episodios.epis_pk,
--episodios.referencia_id,
--ci_xactividad.ci_act_observ,
--ci_xactividad.tipo_cirugia_pk,
--ci_xactividad.qrf_class_pk,
--ci_xactividad.ci_act_pk,
ci_xinternacion.ci_inter_obs,
--ci_xinternacion.cod_cama,
--ci_xinternacion.ci_inter_ambul_sn,
prest_item.prest_item_cod as 'Cod. Prestacion',
prest_item.prest_item_desc as 'Prestacion',
--ci_xactividad.qrf_pk,
--ci_xinternacion.cod_pagador_pk,
--ci_xinternacion.codigo_personal,
quirofano.qrf_desc as 'Sala',
--ci_xinternacion.ci_inter_pk,
CONVERT(VARCHAR, ci_xinternacion.ci_fecha_llegada,5) AS 'Fecha Llegada',
CONVERT(VARCHAR, ci_xinternacion.ci_hora_llegada,8) AS 'H. Llegada',
fpersona.nombre_corto as 'Cirujano',
--ci_xinternacion.plan_pk,
--ci_xinternacion.codigo_servicio,
--'' as cod_cama,
--ci_xinternacion.ci_cod,
--ci_xinternacion.ci_hospdia_sn,
CASE
WHEN qrf_xciru_prog.qrf_ciru_observ = '' OR qrf_xciru_prog.qrf_ciru_observ is NULL THEN ''
ELSE qrf_xciru_prog.qrf_ciru_observ END AS 'Observaciones',
--qrf_xciru_prog.qrf_ci_cod,
--ci_xinternacion.ci_inter_diagno1,
--ci_xinternacion.icd_cod,
--ci_xinternacion.ci_paciente_litera,
--fpersona.codigo_personal,
--qrf_xciru_prog.icd_cod2,
--clientes_clasif.color,
--clientes_clasif.descripcion_corta,
--'' AS nhc,
--ci_xinternacion.rec_postop_sn,
--ci_xinternacion.codigo_personal1,
--ci_xinternacion.codigo_servicio1,
--(select pagadores.cod_financ_pk from pagadores where pagadores.cod_pagador_pk = ci_xinternacion.cod_pagador_pk ) AS financiacion_cod_financ_pk,
(select financiacion.desc_financ from financiacion, pagadores where pagadores.cod_pagador_pk = ci_xinternacion.cod_pagador_pk and pagadores.cod_financ_pk = financiacion.cod_financ_pk) AS 'Tipo',
--(select pagadores.codigo_garante_pk from pagadores where pagadores.cod_pagador_pk = ci_xinternacion.cod_pagador_pk ) AS garantes_codigo_garante_pk,
(select garantes.nombre_garante from garantes, pagadores where pagadores.cod_pagador_pk = ci_xinternacion.cod_pagador_pk and pagadores.codigo_garante_pk = garantes.codigo_garante_pk) AS 'Compañia'
--qrf_xciru_prog.qrf_ciru_fent_bq,
--qrf_xciru_prog.qrf_ciru_hent_bq,
--ci_xactividad.tipo_anestesia_pk
--ci_xinternacion.icd_cod_proc_ppal,
--ci_xinternacion.icd_nom_proc_ppal
FROM clientes_clasif
RIGHT OUTER JOIN clientes ON clientes_clasif.clasif_pk = clientes.clasif_pk,
qrf_xciru_prog RIGHT OUTER JOIN actividad ON qrf_xciru_prog.actividad_pk = actividad.actividad_pk,
ci_xinternacion,
episodios,
actividad_det actividad_det_a,
ci_xactividad,
actividad_det actividad_det_b,
fpersona,
quirofano,
actividad actividad_b,
prest_item,
servicios,
hc
WHERE ( ci_xactividad.actividad_pk = actividad.actividad_pk )
and ( episodios.epis_pk = actividad.epis_pk )
and ( clientes.codigo_cliente = episodios.codigo_cliente )
and ( actividad_det_a.actividad_pk = actividad.actividad_pk )
and ( ci_xinternacion.ci_inter_pk = ci_xactividad.ci_inter_pk )
and ( actividad_det_a.actividad_det_pk = actividad_det_b.actdet_padre )
and ( ci_xactividad.qrf_pk = quirofano.qrf_pk )
and ( ci_xinternacion.codigo_personal1 = fpersona.codigo_personal )
and ( actividad_b.actividad_pk = actividad_det_b.actividad_pk )
and ( actividad_det_b.prest_item_pk = prest_item.prest_item_pk )
and (hc.codigo_cliente = clientes.codigo_cliente)
and ( ( actividad_det_a.actdet_padre is NULL )
and ( actividad.tipo_proced1 = '1' )
and ( actividad.tipo_actividad_pk+0 = 1 )
and (actividad_b.icd_principal = 1))
and (actividad_b.act_anulada is null or ( actividad_b.act_anulada = 0) )
--AND (actividad_a.act_program_fecha BETWEEN '31/03/2022' AND '31/03/2022')
--AND ( actividad_b.act_frdo is null ) AND ( actividad_a.act_anulada <> 2 )
AND ( actividad.act_anulada <> 1 ) and ci_xactividad.qrf_pk in (SELECT quirofano.qrf_pk FROM area_fisica, co_ubicaciones, quirofano WHERE co_ubicaciones.areafis_pk = area_fisica.areafis_pk and quirofano.ubicac_pk = co_ubicaciones.ubicac_pk and area_fisica.cod_centro = 1)
AND (actividad.codigo_servicio1 = servicios.codigo_servicio) --JV: 22/03/2022
--and qrf_xciru_prog.qrf_ciru_estado = 4
order by actividad.act_program_fecha desc, clientes.apellido1














/*
select * from qrf_xciru_prog




select * from information_schema.COLUMNS where COLUMN_NAME like '%cod_ingreso_pk%' order by 3,4




select * from epis_trazabilidad


SELECT * FROM epis_trazabilidad where referencia_id in (select episodios.referencia_id from episodios where epis_pk = '102253943') order by eptrz_pk desc



select * from episodios where epis_pk = '102242193'



select * from ci_xinternacion_hi



select * from hist_camas order by 1 desc



select * from ingresos




select top 1 ingresos.cod_cama 
from ingresos ingresos 
where ingresos.codigo_cliente =  episodios.codigo_cliente 
order by ingresos.cod_ingreso_pk desc




select clientes.apellido1, clientes.nombre, ingresos.* from ingresos ingresos
inner join clientes clientes on clientes.codigo_cliente = ingresos.codigo_cliente
where ingresos.codigo_cliente in 
('100263805',
'100264030',
'100264263',
'237751',
'226483',
'100265143',
'100265812',
'100245138',
'100265915',
'100266661',
'100266815',
'100266818',
'100215084',
'100252960',
'100266967',
'206152',
'100267081',
'100240041',
'100252027',
'110651',
'15237',
'100267142',
'100259429',
'165975',
'100259961',
'100267311',
'204097',
'100267794',
'100267833',
'184776',
'100267986',
'99811',
'100268036',
'100268082',
'100268262',
'100260070',
'193058',
'187856',
'53996',
'65173',
'80542',
'100268812') order by clientes.apellido1, ingresos.cod_ingreso_pk desc
*/