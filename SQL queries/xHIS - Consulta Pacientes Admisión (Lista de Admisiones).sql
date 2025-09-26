select CASE
WHEN volantes.vol_ref_doc is null THEN ''
ELSE volantes.vol_ref_doc END as 'Cod. Autorizacion', 
ingresos.cod_cama as Cama,
hc.nhc,
episodios.epis_pk as 'N° Encuentro',
'             ',
CASE
WHEN clientes.apellido2 = '' OR clientes.apellido2 is null THEN clientes.apellido1 +', ' + clientes.nombre
ELSE clientes.apellido1 + ' ' + clientes.apellido2 +', ' + clientes.nombre 
END as 'Paciente',
CONVERT (VARCHAR, clientes.nac_fecha, 5) as 'Fecha Nac',
tpo_dni.tipo_dni_desc as 'Tipo Doc',
clientes.codigo1 as 'Nro Doc',
CONVERT (VARCHAR, ingresos.fecha_ingreso, 5) as 'Fecha Ingreso',
CONVERT (VARCHAR, ingresos.hora_ingreso, 8) as 'Hora Ingreso',
--ingresos.reingreso_sn ,
clientes.codigo_cliente ,
ingresos.cod_pagador_pk,
--clientes.codigo2 ,
--clientes.codigo3 ,
--clientes.titular ,
--clientes.telefono1 ,
--clientes.exitus_fecha ,
--ingresos.diagno1_ing ,
--ingresos.icd_cod ,
--ingresos.ing_mottxt,
--ingresos.ing_confirmado_sn ,
--camas.cod_uenf_pk ,
--ingresos.fecha_alta ,
--ingresos.hora_alta ,
--ingresos.codigo_servicio ,
--ingresos.cod_pagador_pk ,
--camas.cod_cama ,
--ingresos.f_alta_prev ,
--ingresos.h_alta_prev ,
--fpersona.nombre_corto as 'Med.Resp.',
--clientes.codigo_sexo ,
--ingresos.codigo_personal4 ,
--ingresos.codigo_personal5 ,
--ingresos.freg_ing ,
--ingresos.hreg_ing ,
--ingresos.freg_alta ,
--ingresos.hreg_alta ,
--ingresos.ing_prest_aut ,
--ingresos.plan_pk ,
--tipo_habitacion.tipo_hab_desc ,
--ingresos.ing_tipo_pk ,
--ingresos.codigo_personal ,
--ingresos.td_dieta_pk ,
--camas.cod_habitacion_pk ,
--0 as cc_desplazado,
--'' as cc_edad,
--'' as nhc_activa,
--0 as cc_alergia,
--'' as cc_numero_poliza,
--'' as cc_diag_principal,
--ingresos.grupo_hosp_pk ,
--clientes.vip_sn ,
--ingresos.cod_ingreso_pk ,
--ubicacion.des_ubicacion ,
--clientes.nac_ld1 ,
--clientes.nac_ld2 ,
--clientes.nac_ld3 ,
--clientes.nac_ld4 ,
--clientes.nac_ld5 ,
--clientes.nac4_nacional_pk ,
--nacionalidades.nacional_desc ,
--'' as num_poliza,
--'' as cc_touroperador,
--clientes_clasif.descripcion_corta ,
--clientes_clasif.color ,
--pagadores.codigo_garante_pk ,
--pagadores.cod_financ_pk ,
--'' as hotel,
--0 as pivote_hotel,
--0 as cc_autoriza,
CASE
WHEN ingresos.fecha_alta_medica is null THEN ''
ELSE CONVERT (VARCHAR, ingresos.fecha_alta_medica, 5) END As 'Fecha Alta Medica',
CASE
WHEN ingresos.hora_alta_medica is null THEN ''
ELSE CONVERT (VARCHAR, ingresos.hora_alta_medica, 8) END as 'Hora Alta Medica',
garantes.nombre_garante as Financiador,
co_planes.plan_desc as 'Plan',
--0 as ectopico_sn,
--clientes.especial_sn ,
--clientes.confidencial_sn ,
--'' as cc_financiador,
--garantes.gar_cc_tarj_pac_sn ,
--clientes.cli_num_cc ,
--clientes.cli_num_tarj ,
--0 as mostrar_no_cc_no_tarjeta,
--0 as cc_uci,
--0.00 as cc_pdte_pago,
--clientes.exitus_sn ,
--ingresos.ing_fconf ,
--ingresos.codigo_servicio3 ,
--ingresos.interven_sn ,
--destino_alta_ing.dest_altingdesc ,
--medio_transporte.medio_transporte ,
--garantes.codigo_garante_pk ,
--0 as falta_autoriz,
--habitaciones.tipo_hab_pk ,
--0 as clasif_compu_color,
--'' as clasif_compu_texto,
--0 as compu_aviso_paciente,
--ingresos.ing_observ_dieta ,
--'' as cc_fecha_interv,
--0 as touroperador_pk,
--0 as hotel_pk,
--0 as cc_ingreso_confirmado,
--'' as ccc_numero_poliza,
--0 as cc_edad_long,
--0 AS cc_pdc_estado,
--co_planes.tipo_plan_pk ,
---1 as cc_estado_carton,
--0 as cc_avisos_pac
/*(SELECT garantes.nombre_garante
from garantes inner join co_planes on co_planes.codigo_garante_pk = garantes.codigo_garante_pk
where co_planes.plan_pk = ingresos.plan_pk) as 'Financiador',
(SELECT co_planes.plan_desc from co_planes where co_planes.plan_pk = ingresos.plan_pk) as 'Plan',*/
(SELECT CASE
--WHEN count(clipag_numpoliza) = 0  THEN (select clipag_numpoliza FROM cliente_pagadores where cliente_pagadores.codigo_cliente in (select codigo_cliente from episodios where epis_pk in (select codpd_encu from codific_parto_c where cdfpc_pk in (select cdfpc_pk from codific_parto_d where codigo_cliente = ingresos.codigo_cliente))) and cliente_pagadores.cod_pagador_pk = ingresos.cod_pagador_pk and clipag_activo_sn = 1)
--WHEN count(clipag_numpoliza) = 0 THEN (select clipag_numpoliza FROM cliente_pagadores where cliente_pagadores.codigo_cliente = ingresos.codigo_cliente and cliente_pagadores.cod_pagador_pk = ingresos.cod_pagador_pk)  THEN 'VAFFANCULO'
WHEN clipag_numpoliza is null THEN ''
ELSE clipag_numpoliza END FROM cliente_pagadores where cliente_pagadores.codigo_cliente = ingresos.codigo_cliente and cliente_pagadores.cod_pagador_pk = ingresos.cod_pagador_pk and clipag_activo_sn = 1) as 'Nro Credencial'
--cliente_pagadores.clipag_numpoliza
from ingresos
LEFT OUTER JOIN fpersona ON ingresos.codigo_personal = fpersona.codigo_personal
LEFT OUTER JOIN medio_transporte ON ingresos.med_medio_trte_pk = medio_transporte.medio_trte_pk
LEFT OUTER JOIN tipo_habitacion ON ingresos.tipo_hab_pk = tipo_habitacion.tipo_hab_pk
LEFT OUTER JOIN destino_alta_ing ON ingresos.dest_alting_pk = destino_alta_ing.dest_alting_pk
LEFT OUTER JOIN ubicacion ON ingresos.cod_ubicacion = ubicacion.cod_ubicacion
LEFT OUTER JOIN clientes ON clientes.codigo_cliente = ingresos.codigo_cliente
LEFT OUTER JOIN hc ON hc.codigo_cliente = clientes.codigo_cliente
LEFT OUTER JOIN tpo_dni ON tpo_dni.tipo_dni_pk = clientes.tipo_dni_pk
LEFT OUTER JOIN co_planes ON ingresos.plan_pk = co_planes.plan_pk
--LEFT OUTER JOIN cliente_pagadores ON cliente_pagadores.codigo_cliente = ingresos.codigo_cliente and cliente_pagadores.cod_pagador_pk = ingresos.cod_pagador_pk
LEFT OUTER JOIN clientes_clasif ON clientes.clasif_pk = clientes_clasif.clasif_pk, camas
LEFT OUTER JOIN habitaciones ON camas.cod_habitacion_pk = habitaciones.cod_habitacion_pk,
servicios ,
pagadores ,
garantes ,
episodios

LEFT OUTER JOIN volantes ON volantes.epis_pk = episodios.epis_pk
--LEFT OUTER JOIN co_cli_planes ON co_cli_planes.plan_pk = ingresos.plan_pk
--LEFT OUTER JOIN cliente_pagadores ON cliente_pagadores.clipag_pk = co_cli_planes.clipag_pk

WHERE ( camas.cod_cama = ingresos.cod_cama )
and ( ingresos.codigo_cliente = clientes.codigo_cliente )
and ( ingresos.codigo_servicio = servicios.codigo_servicio )
and ( pagadores.cod_pagador_pk = ingresos.cod_pagador_pk )
and ( pagadores.codigo_garante_pk = garantes.codigo_garante_pk )
and ( ingresos.cod_ingreso_pk = episodios.referencia_id )
and ( ( episodios.tipo_episodio_pk = 3 ) )
AND (ingresos.fecha_alta is NULL)
AND (servicios.cod_centro = 1)
AND hc.activa_sn = 1
ORDER BY clientes.apellido1





select * from cliente_pagadores order by 1 desc --clipag_numpoliza





select * from co_cli_planes


inner join co_cli_planes cli_plan on cli_pagador.clipag_pk = cli_plan.clipag_pk 





select * from ingresos

select top 100* from co_cli_planes

select top 100 * from cliente_pagadores


select * from cliente_pagadores where clipag_pk = '108428652'


select * from pagadores 



select * from co_planes



select * from garantes


SELECT cliente_pagadores.* 
FROM cliente_pagadores
INNER JOIN ingresos ON ingresos.codigo_cliente = cliente_pagadores.codigo_cliente
--INNER JOIN ingresos ON ingresos.codigo_cliente = cliente_pagador.codigo_cliente
where ingresos.codigo_cliente = '100275450'
and cliente_pagadores.cod_pagador_pk = '4'
--AND ingresos.plan_pk = '464'


select * from ingresos where ingresos.codigo_cliente = '100261485'


SELECT * 
FROM cliente_pagadores where 




SELECT cliente_pagadores.* 
FROM cliente_pagadores
--INNER JOIN ingresos ON ingresos.codigo_cliente = cliente_pagador.codigo_cliente
where cliente_pagadores.codigo_cliente = '100275450'
and cliente_pagadores.cod_pagador_pk = '4'
and clipag_activo_sn = 1



select * from ingresos


SELECT cliente_pagadores.* 
FROM cliente_pagadores



select * from clientes where codigo_cliente = '100275450'



select * from ingresos where codigo_cliente = '100275450'


select * from clientes where codigo1 = '29911447'




select codigo_cliente from episodios where epis_pk in (select codpd_encu from codific_parto_c where cdfpc_pk in (select cdfpc_pk from codific_parto_d where codigo_cliente = '100275450'))
--1182

