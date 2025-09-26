--QUERY Pedido Alejandro Lardo listado de prefactura en estado pendiente de CCEE del mes Abril 2022

Select distinct --top 100
det.va_det_pk,
nhc 'NHC',
tpo_dni.tipo_dni_desc as 'Tipo Doc',
cli.codigo1 as 'Nro Doc',
cli.apellido1 'Apellido1',
cli.apellido2 'Apellido2',
cli.nombre 'Nombre',
epis_pk 'Encuentro',
tipo_episodio.tipo_episodio_desc as 'Ambito',
prest.prest_item_cod 'Codigo Prestacion',
det.va_det_des_manual 'Prestacion',
gar.nombre_garante 'Financiador',
copa.plan_desc 'Plan',
CAST (det.va_det_total_fin AS money) 'Precio Financiador',
CAST (det.va_det_total_pac as money) 'Precio Privado',
CONVERT (VARCHAR, det.va_det_fapunte, 103) 'Fecha Prestacion',
det.va_det_hora_Apunte 'Hora Apunte',
det.va_det_cantidad 'Cantidad',
--rec.reca_gpo_pto_rec as PuntoDeVenta,
--rec.reca_gpo_nro_rec as NroFactura,
titem.tipo_item_desc,
titem.tipo_item_pk,


Case
when det.va_det_estado=0 and det.va_det_fact_cob=0 and det.va_det_fact2_cob=0 then 'Anulado'
when det.va_det_estado=1 and det.va_det_fact_cob=0 and det.va_det_fact2_cob=0 then 'Pendiente'
when det.va_det_estado=3 and det.va_det_fact_cob=0 and det.va_det_fact2_cob=0 then 'No Facturable'
when det.va_det_estado=0 and det.va_det_fact_cob=1 or det.va_det_fact2_cob=1 and det.mot_anul_vale_pk=1 then 'Nota de Credito (Anulado)'
when det.va_det_estado=1 and det.va_det_fact_cob=0 and det.va_det_fact2_cob=1 then 'Facturado Financiador'
when det.va_det_estado=1 and det.va_det_fact_cob=1 and det.va_det_fact2_cob=0 then 'Facturado Privado'
end as Estado,
Case
when det.va_det_revisado is null or det.va_det_revisado='0' then 'No' else 'Si'
end as Revisado,
--rec.reca_fec_emis as 'Fecha Facturacion',
--CONVERT(varchar(12),rec.reca_gpo_pto_rec,101) + '-' + CONVERT(varchar(12),rec.reca_gpo_nro_rec,101) as 'Numero Factura',
--detp.va_det_des_manual as 'Incluido en',
-- detp.va_det_fapunte as 'Fecha Modulo',
Case
when det.actividad_pk is null then 'SI' else 'NO'
end as 'Insercion Manual/Dispensacion Manual',
Case
when det.actividad_pk is null then fper.nombre_corto end 'Usuario Inserta',
mot.mot_anul_vale_desc as 'Motivo Anulacion'
--Case
-- when det.fecha_anul is not null then fpe.nombre_corto end 'Usuario Anula',
-- det.modulo_anul_vale 'Modulo Anula',
-- det.fecha_anul 'Fecha Anulacion',
-- fpenf.nombre_corto 'Usuario NoFact'
--nofa.vanof_fecha 'Fecha NoFact',
--nofa.vanof_hora 'Hora NoFact'
--,det.nro_equipo as 'Caja'
--,det.va_det_padre
from vale_asis_cab cab
Inner join vale_asis_det det on det.va_pk=cab.va_pk
Left join vale_asis_det detp on det.va_det_padre=detp.va_det_pk
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
inner join tipo_item titem ON titem.tipo_item_pk = prest.tipo_item_pk
inner join tpo_dni ON tpo_dni.tipo_dni_pk = cli.tipo_dni_pk
inner join tipo_episodio ON tipo_episodio.tipo_episodio_pk = det.tipo_episodio_pk

--- Filtros NHC y Cod. Prestacion ------

where det.va_det_estado=1 and det.va_det_fact_cob=0 and det.va_det_fact2_cob=0 --'Pendiente'


and det.tipo_episodio_pk in (1,2) ---CCEE & URG
and det.va_det_fapunte between '20220401' and '20220430'
--and gar.codigo_garante_pk != 1

and det.modulo_anul_vale is null
and (det.va_det_revisado is null or det.va_det_revisado='0')