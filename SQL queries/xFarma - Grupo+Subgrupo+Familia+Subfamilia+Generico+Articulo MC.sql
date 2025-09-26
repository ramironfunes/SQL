--FARMACIA (Grupo+Subgrupo+Familia+Subfamilia+Generico+Articulo MC)

select catp_grupo.catp_grucodigo, 
catp_grupo.catp_grunombre, 
catp_subgrupo.catp_subgru_cod, 
catp_subgrupo.catp_subgru_nom, 
catp_familia.catp_fam_cod, 
catp_familia.catp_fam_nom, 
catp_subfamilia.catp_subfam_cod, 
catp_subfamilia.catp_subfam_nom, 
catp_articulos.catp_arti_cod, 
catp_articulos.catp_arti_nom,
alm_articulos_mc.cod_bar_mc_pr, 
alm_articulos_mc.art_mc_nom
from catp_subfamilia catp_subfamilia
inner join catp_familia catp_familia on catp_familia.catp_fam_pk = catp_subfamilia.catp_fam_pk
inner join catp_subgrupo catp_subgrupo on catp_subgrupo.catp_subgru_pk = catp_familia.catp_subgru_pk
inner join catp_grupo catp_grupo on catp_grupo.catp_grupo_pk = catp_subgrupo.catp_grupo_pk
inner join catp_articulos on catp_articulos.catp_subfam_pk = catp_subfamilia.catp_subfam_pk
inner join alm_articulos_mc on alm_articulos_mc.catp_articulos_pk = catp_articulos.catp_articulos_pk
where alm_articulos_mc.art_activo = '1'
order by catp_grupo.catp_grunombre, catp_subgrupo.catp_subgru_cod, catp_familia.catp_fam_cod, 
catp_subfamilia.catp_subfam_cod, catp_articulos.catp_arti_nom