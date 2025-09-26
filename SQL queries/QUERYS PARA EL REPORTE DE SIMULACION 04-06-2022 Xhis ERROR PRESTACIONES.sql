--QUERYS PARA EL REPORTE DE sumulacion 04/06/2022 Xhis ERROR PRESTACIONES

--CONF DE CITA

select distinct vale_asis_det.va_det_pk,
cagendas_prest.actividad_det_pk,
--cagendas_prest.prest_item_pk,
--vale_asis_det.actividad_det_pk,
--vale_asis_det.prest_item_pk,
--distinct vale_asis_det.va_det_pk,
--vale_asis_det.actividad_det_pk,
--cagendas_prest.actividad_det_pk as conf,
--vale_asis_det.actividad_det_pk as fac,
--cagendas_prest.prest_item_pk,
--cagendas_prest.prest_item_pk,
--vale_asis_det.prest_item_pk,
clientes.apellido1 as Apellido1,
CASE
WHEN clientes.apellido2 = '' OR clientes.apellido2 is null THEN ''
ELSE clientes.apellido2 END as Apellido2,
clientes.nombre as Nombre,
hc.nhc as NHC,
episodios.epis_pk as 'Encuentro',
garantes.nombre_garante as 'Garante Conf Cita',
co_planes.plan_desc as 'Plan Conf Cita',
CONVERT (VARCHAR, cagendas.fecha, 5) as 'Fecha Cita',
CONVERT (VARCHAR, cagendas.hora, 8) as 'Hora Cita',
CONVERT (VARCHAR, cagendas.t_llegada, 8) as 'H. Llegada Conf Cita',
fpersona.apellido1 +' '+fpersona.nombre as 'Usuario Carga Cita',
servicios.servicio as 'Servicio Conf Cita',
CASE
WHEN cagendas_prest.cagprest_nchipcard is null THEN ''
ELSE cagendas_prest.cagprest_nchipcard END AS 'Nro Transacción',
--prest_itemConf.prest_item_cod as 'Cod Prestacion Conf Cita',
--prest_itemConf.prest_item_desc as 'Prestacion Conf Cita',
--prest_item.prest_item_cod as 'Cod Prestacion Facturación',
--prest_item.prest_item_desc as 'Prestacion Facturacion',
vale_asis_det.va_det_cantidad as 'Cantidad',
[dbo].[FN_XHIS_GET_PREST_COD] (cagendas_prest.prest_item_pk) as 'Cod Prestacion Conf Cita',
[dbo].[FN_XHIS_GET_PREST] (cagendas_prest.prest_item_pk) as 'Prestacion Conf Cita',
[dbo].[FN_XHIS_GET_PREST_COD] (vale_asis_det.prest_item_pk) as 'Cod Prestacion Facturación',
[dbo].[FN_XHIS_GET_PREST] (vale_asis_det.prest_item_pk) as 'Prestacion Facturacion',
--servicios2.servicio as 'Servicio Facturacion',
garantesfac.nombre_garante as 'Garante Facturacion',
co_planesfac.plan_desc as 'Plan Facturacion',
Case
when vale_asis_det.va_det_estado=0 and vale_asis_det.va_det_fact_cob=0 and vale_asis_det.va_det_fact2_cob=0 then 'Anulado'
when vale_asis_det.va_det_estado=1 and vale_asis_det.va_det_fact_cob=0 and vale_asis_det.va_det_fact2_cob=0 then 'Pendiente'
when vale_asis_det.va_det_estado=3 and vale_asis_det.va_det_fact_cob=0 and vale_asis_det.va_det_fact2_cob=0 then 'No Facturable'
when vale_asis_det.va_det_estado=0 and vale_asis_det.va_det_fact_cob=1 or vale_asis_det.va_det_fact2_cob=1 and vale_asis_det.mot_anul_vale_pk=1 then 'Nota de Credito (Anulado)'
when vale_asis_det.va_det_estado=1 and vale_asis_det.va_det_fact_cob=0 and vale_asis_det.va_det_fact2_cob=1 then 'Facturado Financiador'
when vale_asis_det.va_det_estado=1 and vale_asis_det.va_det_fact_cob=1 and vale_asis_det.va_det_fact2_cob=0 then 'Facturado Privado'
end as Estado,
vale_asis_det.va_det_total_fin as 'Precio Financiador',
vale_asis_det.va_det_total_pac as 'Precio Privado',
CONVERT (VARCHAR, vale_asis_det.va_det_fapunte, 5) as 'Fecha Apunte Prefacturacion',
CONVERT (VARCHAR, vale_asis_det.va_det_hora_Apunte, 8) as 'Hora Apunte Prefacturación'

from vale_asis_det vale_asis_det
right join cagendas_prest cagendas_prest on vale_asis_det.actividad_det_pk = cagendas_prest.actividad_det_pk
inner join vale_asis_cab vale_asis_cab on vale_asis_cab.va_pk = vale_asis_det.va_pk
inner join cex ON vale_asis_det.va_det_referencia = cex.cex_pk
inner join cagendas on cagendas.n_solic = cex.con_cita_sn
inner join fpersona on fpersona.codigo_personal = cagendas.codigo_personal2
inner join co_planes on co_planes.plan_pk = cex.plan_pk
inner join garantes on garantes.codigo_garante_pk = co_planes.codigo_garante_pk
inner join co_planes co_planesfac on vale_asis_cab.plan_pk = co_planesfac.plan_pk
inner join garantes garantesfac on co_planesfac.codigo_garante_pk = garantesfac.codigo_garante_pk
inner join clientes ON clientes.codigo_cliente = cex.codigo_cliente
inner join hc ON hc.codigo_cliente = cex.codigo_cliente
inner join servicios on servicios.codigo_servicio = cagendas.codigo_servicio
INNER JOIN episodios ON episodios.referencia_id=cex.cex_pk --and episodios.tipo_episodio_pk = vale_asis_det.tipo_episodio_pk
inner join prest_item prest_item on prest_item.prest_item_pk=vale_asis_det.prest_item_pk
inner Join prest_item prest_itemConf on prest_itemConf.prest_item_pk = cagendas_prest.prest_item_pk
--WHERE (cagendas_prest.prest_item_pk = vale_asis_det.prest_item_pk)
--where cagendas_prest.actividad_det_pk in (11462397,11463041,11463195) --PRUEBA
where (vale_asis_det.actividad_pk IS NOT null)
AND cagendas.fecha = '20220604'
--and cagendas.t_llegada <= '1900-01-01 17:30:00.000'
--AND cagendas.fecha BETWEEN '20220329' AND '20220330'
--AND episodios.tipo_episodio_pk = 2
--AND vale_asis_det.prest_item_pk not in (select prest_item.prest_item_pk from prest_item prest_item where prest_item.prest_item_cod like 'TNF%')
AND vale_asis_det.va_det_estado != 3
--AND vale_asis_det.va_det_hora_Apunte < dateadd(MINUTE, +1, cagendas.t_llegada)
--AND servicios.codigo_servicio = '42' -- Filtro Lboratorio NO
--AND garantes.codigo_garante_pk = '20464' --OSDE
AND hc.activa_sn = '1'
--and hc.nhc = '20864427'
ORDER BY CONVERT (VARCHAR, cagendas.fecha, 5) DESC, clientes.apellido1, clientes.nombre




--FACTURACION

Select distinct
	det.va_det_pk,
	det.actividad_det_pk,
	cli.apellido1 as 'Apellido1',
	CASE
	WHEN cli.apellido2 = '' OR cli.apellido2 is null THEN ''
	ELSE cli.apellido2 END as 'Apellido2',
	cli.nombre as 'Nombre',
	nhc as 'NHC',
	epis_pk as 'Encuentro',
	gar.nombre_garante as 'Garante Facturacion',
	copa.plan_desc as 'Plan Facturacion',
	prest.prest_item_cod as 'Codigo Prestacion Facturacion',
	det.va_det_des_manual as 'Prestacion Facturacion',
	det.va_det_cantidad as 'Cantidad',
	Case 
		when det.va_det_estado=0 and det.va_det_fact_cob=0 and det.va_det_fact2_cob=0  then 'Anulado'
		when det.va_det_estado=1 and det.va_det_fact_cob=0 and det.va_det_fact2_cob=0  then 'Pendiente' 
		when det.va_det_estado=3 and det.va_det_fact_cob=0 and det.va_det_fact2_cob=0  then 'No Facturable'
		when det.va_det_estado=0 and det.va_det_fact_cob=1 or det.va_det_fact2_cob=1 and det.mot_anul_vale_pk=1  then 'Nota de Credito (Anulado)'
		when det.va_det_estado=1 and det.va_det_fact_cob=0 and det.va_det_fact2_cob=1  then 'Facturado Financiador'
		when det.va_det_estado=1 and det.va_det_fact_cob=1 and det.va_det_fact2_cob=0  then 'Facturado Privado'
	end as Estado,
	det.va_det_total_fin as 'Precio Financiador',
	det.va_det_total_pac as 'Precio Privado',
	CONVERT (VARCHAR, det.va_det_fapunte, 5) as 'Fecha Apunte Prefacturacion',
	CONVERT (VARCHAR, det.va_det_hora_Apunte, 8) as 'Hora Apunte Prefacturacion'
	/* Case
		when det.va_det_revisado is null or det.va_det_revisado='0'  then 'No' else 'Si'
	end as Revisado, */
	--rec.reca_fec_emis as 'Fecha Facturacion',
	--CONVERT(varchar(12),rec.reca_gpo_pto_rec,101) + '-' + CONVERT(varchar(12),rec.reca_gpo_nro_rec,101) as 'Numero Factura',
	--detp.va_det_des_manual as 'Incluido en',
	--detp.va_det_fapunte as 'Fecha Modulo',
	/*Case
		when det.actividad_pk is null then 'SI' else 'NO'
	end as 'Insercion Manual/Dispensacion Manual', */
	/* Case
		when det.actividad_pk is null then fper.nombre_corto end as 'Usuario Inserta',
	mot.mot_anul_vale_desc as 'Motivo Anulacion',
	Case
		when det.fecha_anul is not null then fpe.nombre_corto end as 'Usuario Anula', */
	--det.modulo_anul_vale as 'Modulo Anula',
	--det.fecha_anul as 'Fecha Anulacion',
	--fpenf.nombre_corto as 'Usuario NoFact',
	--nofa.vanof_fecha as 'Fecha NoFact',
	--nofa.vanof_hora as 'Hora NoFact'
	--,det.nro_equipo as 'Caja'
	--,det.va_det_padre
from vale_asis_cab cab
	Inner join vale_asis_det det on det.va_pk=cab.va_pk
	Left join  vale_asis_det detp on det.va_det_padre=detp.va_det_pk
	Inner join clientes cli on cli.codigo_cliente=cab.codigo_cliente
	Inner join prest_item prest on prest.prest_item_pk=det.prest_item_pk
	Left Join mot_anul_vale mot on mot.mot_anul_vale_pk=det.mot_anul_vale_pk
	Left join fpersona fpe on fpe.codigo_personal=det.cod_personal_anul
	Left join fpersona fper on det.cod_perso_registra=fper.codigo_personal
	Inner join hc on cli.codigo_cliente=hc.codigo_cliente
	Left Join vadet_motnofact nofa on nofa.va_det_pk=det.va_det_pk
	Left join fpersona fpenf on nofa.codigo_personal=fpenf.codigo_personal
	left join recibos_det red on red.va_det_pk = det.va_det_pk
	left join recibos_cab rec on rec.reca_pk=red.reca_pk
	inner join co_planes copa on cab.plan_pk=copa.plan_pk
	inner join garantes gar on copa.codigo_garante_pk=gar.codigo_garante_pk
	inner join episodios epis on epis.referencia_id=det.va_det_referencia and epis.tipo_episodio_pk=det.tipo_episodio_pk
	inner join prest_grupo grp on grp.prest_grupo_pk= prest.prest_grupo_pk
	inner join servicios serv on serv.codigo_servicio= cab.codigo_servicio
	inner join centros cen on cen.cod_centro = serv.cod_centro
	where det.va_det_fapunte = '20220604' 
	and det.tipo_episodio_pk = 2 --CCEE
  
  
     --and det.va_det_fapunte = '20210311'  
	order by cli.apellido1,cli.nombre


