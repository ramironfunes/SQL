select uf.cod_uenf_pk,
	   uf.descuenf AS UNIDAD_DE_ENFERMERIA,
       alm.almacen_pk,
	   alm.almacen_deno AS ALMACEN,
	   uc.uc_pk,uc.uc_deno AS UNIDAD_DE_CONSUMO,
	   CASE
			WHEN uf.carros_sn = 1 THEN 'SIN CARRO'
			WHEN uf.carros_sn = 0 THEN 'CON CARRO'
		END AS CARRO
  from alm_almacenes alm
left join unidadesenfermeria uf   on alm.almacen_pk = uf.almacen_pk
left join alm_und_consumos uc on uc.almacen_pk  = alm.almacen_pk
left join co_ubicaciones u    on u.ubicac_pk    = uf.ubicac_pk
left join area_fisica af      on af.areafis_pk  = u.areafis_pk
-- ALMACENES ACTIVOS --
where alm.alma_activo = 1
