select alm_tras_lin.alm_trascab_pk, alm_tras_lin.alm_traslin_pk, alm_tras_lin.trasl_cant_pen,
cast(alm_tras_cab.tras_fechamov as date) as FECHA, cast(alm_tras_cab.tras_hora_sum as time) as HORA,
alm_tras_cab.alm_trascab_pk as NRO_OP, '          ', 'T' as TIPO_OP,
alm_almacenes2.almacen_deno as ORIGEN, --JVADELL 19/04/2022
alm_almacenes.almacen_deno as DESTINO,
alm_articulos_mc.cod_bar_mc_pr as COD_ART, alm_articulos_mc.art_mc_nom as ARTICULO,
alm_tras_lin.trasl_cant_ori as CANTIDAD_SOLICITADA, alm_tras_lin.trasl_cant_ent as CANTIDAD_ENTREGADA,
alm_tras_lin.trasl_cant_pen as CANTIDAD_PENDIENTE, alm_arti_alma.almaart_existen as STOCK,
alm_tras_lin.*
from alm_tras_cab
inner join alm_tras_lin on alm_tras_lin.alm_trascab_pk = alm_tras_cab.alm_trascab_pk
inner join alm_articulos_mc on alm_articulos_mc.cod_art_mc_pk = alm_tras_lin.trasl_art_pk
inner join alm_arti_alma on alm_arti_alma.cod_art_mc_pk = alm_tras_lin.trasl_art_pk
inner join alm_almacenes on alm_almacenes.almacen_pk = alm_tras_cab.tras_almout_pk
inner join alm_almacenes alm_almacenes2 on alm_almacenes2.almacen_pk = alm_tras_cab.tras_almin_pk --JVADELL 19/04/2022
where alm_arti_alma.almacen_pk = 4
and alm_tras_lin.trasl_cant_pen > 0
--where alm_tras_lin.trasl_cant_pen > 0
--and alm_tras_lin.trasl_cant_pen > alm_arti_alma.almaart_existen
and  ( alm_articulos_mc.catp_tipopro_pk = 2 OR alm_articulos_mc.cod_bar_mc_pr IN ('FDN042', 'FDN011', 'FDN016', 'FDN004', 'FDN023', 'FDN022', 'FDN003', 'FDN002', 'FDN041', 'FDN009', 'FDN019', 'FDN005', 'FDN012', 'FDN021', 'FDN033', 'FDN034', 'FDN001', 'FDN018', 'FDN035') )
--and alm_tras_cab.alm_trascab_pk = '44852343'
order by 1,2


BEGIN TRAN
update alm_tras_lin set trasl_cant_pen = '0.000' where alm_traslin_pk in
('39333552',
'39333513',
'39333487',
'39333485',
'39333482',
'39333478',
'39333430')
COMMIT TRAN