--EXISTENCIAS ACTUALES ALM PRODUCCION

select alm_almacenes.almacen_deno as ALMACEN, alm_articulos_mc.cod_bar_mc_pr as CODIGO, alm_articulos_mc.art_mc_nom as ARTICULO, almaart_existen as Existencias from alm_arti_alma
inner join alm_almacenes on alm_almacenes.almacen_pk = alm_arti_alma.almacen_pk
inner join alm_articulos_mc on alm_articulos_mc.cod_art_mc_pk = alm_arti_alma.cod_art_mc_pk
order by ALMACEN, ARTICULO
