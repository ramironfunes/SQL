select alm_articulos_mc.cod_art_mc_pr, catp_articulos.catp_articulos_pk AS Cod_Solicitud, catp_articulos.catp_arti_cod AS Cod_generico, catp_articulos.catp_arti_nom
as Nombre_generico, alm_articulos_mc.cod_bar_mc_pr as Cod_Marca, alm_articulos_mc.art_mc_nom as Nombre_marca,
alm_presentaciones.alm_presen_nom,
CASE alm_articulos_mc.catp_tipopro_pk
WHEN '1'
THEN 'Medicamento'
WHEN '2'
THEN 'Material'
ELSE 'Unknown'
END AS Tipo_Articulo,
CASE dbo.alm_articulos_mc.art_activo
WHEN '1'
THEN 'Activo'
ELSE 'Inactivo'
END AS Estado,
--far_gruter.far_grutercod Cod_ATC
dbo.FN_FAR_GET_COD_GENERICO (alm_articulos_mc.far_gruterpk) as COD_ATC_MC,
dbo.FN_FAR_GET_COD_GENERICO (catp_articulos.catp_gruterpk) as COD_ATC_GEN



from alm_articulos_mc
inner join catp_articulos ON catp_articulos.catp_articulos_pk = alm_articulos_mc.catp_articulos_pk
left join far_gruter ON far_gruter.far_gruterpk = alm_articulos_mc.far_gruterpk
left join alm_presentaciones ON alm_presentaciones.alm_presen_pk = catp_articulos.alm_presen_pk
where catp_articulos.catp_gruterpk != alm_articulos_mc.far_gruterpk