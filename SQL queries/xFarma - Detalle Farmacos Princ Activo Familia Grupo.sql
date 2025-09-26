-- Query Farmacia Gabriel Cantello Principios Activos + Familia + Subfamilia + Grupo + Subgrupo + Generico + Comercial

select catp_grupo.catp_grucodigo as 'Codigo Grupo', 
catp_grupo.catp_grunombre as 'Grupo', 
catp_subgrupo.catp_subgru_cod as 'Cod Subgrupo', 
catp_subgrupo.catp_subgru_nom as 'Subgrupo', 
catp_familia.catp_fam_cod as 'Cod Familia', 
catp_familia.catp_fam_nom as 'Familia', 
catp_subfamilia.catp_subfam_cod as 'Cod Subfamilia', 
catp_subfamilia.catp_subfam_nom as 'Subfamilia',
far_prinact.far_prinactcod as 'Cod Principio Activo',
far_prinact.far_prinactnom as 'Principio Activo',
alm_articulos_mc.cod_art_mc_pr, 
catp_articulos.catp_articulos_pk AS Cod_Solicitud, 
catp_articulos.catp_arti_cod AS Cod_generico, 
catp_articulos.catp_arti_nom as Nombre_generico,
far_formasfar.formasfar_nom as 'Forma farmaceutica',
far_viasadm.vias_deno as 'Vía Administacion',
alm_articulos_mc.cod_bar_mc_pr as Cod_Marca, 
alm_articulos_mc.art_mc_nom as Nombre_marca,
alm_articulos_mc.art_relcon_med as 'Minima Dispensación',
case
when ana_unid.desc_long is null then ' '
ELSE ana_unid.desc_long
END as 'Unidad Minima Disp',
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
dbo.FN_FAR_GET_COD_ATC (alm_articulos_mc.far_gruterpk) as COD_ATC_MC,
dbo.FN_FAR_GET_COD_ATC (catp_articulos.catp_gruterpk) as COD_ATC_GEN
        
from alm_articulos_mc 
inner join catp_articulos ON catp_articulos.catp_articulos_pk = alm_articulos_mc.catp_articulos_pk
left join far_gruter ON far_gruter.far_gruterpk = alm_articulos_mc.far_gruterpk
left join alm_presentaciones ON alm_presentaciones.alm_presen_pk = catp_articulos.alm_presen_pk
left join ana_unid ON ana_unid.ana_unid_pk = alm_articulos_mc.ana_unid_pk
left join far_prinact_far ON far_prinact_far.cod_art_mc_pk = alm_articulos_mc.cod_art_mc_pk
left join far_prinact ON far_prinact.far_prinactpk = far_prinact_far.prinactfar_pk
left join catp_subfamilia on catp_subfamilia.catp_subfam_pk = catp_articulos.catp_subfam_pk
left join catp_familia on catp_familia.catp_fam_pk = catp_subfamilia.catp_fam_pk
left join catp_subgrupo on catp_subgrupo.catp_subgru_pk = catp_familia.catp_subgru_pk
left join catp_grupo on catp_grupo.catp_grupo_pk = catp_subgrupo.catp_grupo_pk
left join far_formasfar on far_formasfar.formasfar_pk = catp_articulos.formasfar_pk
left join far_viasadm on far_viasadm.vias_pk = catp_articulos.vias_pk