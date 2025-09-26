USE [xHIS_QA]
GO
/****** Object: StoredProcedure [SF].[sp_ClasificacionDePrestaciones_Medicamentos_Descartables] Script Date: 7/2/2022 11:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [SF].[sp_ClasificacionDePrestaciones_Medicamentos_Descartables]
AS
BEGIN




-- UPDATE de asociacion de prestacion farmaco a agrupacion ATC
update farmacos
set grtp_pk = (select catp_arti_cod
from alm_articulos_mc a
Inner Join catp_articulos c On a.catp_articulos_pk = c.catp_articulos_pk
where a.cod_art_mc_pk = farmacos.far_cod_art_mc_pk
and a.catp_articulos_pk is not null
and a.catp_tipopro_pk = 1)
Where grtp_pk = '999'





-- UPDATE de asociacion de prestacion insumo a tipo de insumo
update farmacos set frm_tipo_pk =
(
Select ft.frm_tipo_pk
from catp_articulos c
inner join alm_articulos_mc a on c.catp_articulos_pk = a.catp_articulos_pk and a.catp_tipopro_pk = 2
Inner join catp_subfamilia cs on c.catp_subfam_pk = cs.catp_subfam_pk
--Inner join farmacos_tipo ft on Rtrim(SUBSTRING(frm_tipo_desc,0,4)) = cs.catp_subfam_cod
--JVADELL 07/02/2022 INICIO: para manejar 2 Subfamilias con el mismo código
Inner join farmacos_tipo ft on ft.frm_tipo_desc = ltrim(rtrim(cs.catp_subfam_cod)) + ' ' + ltrim(rtrim(cs.catp_subfam_nom))
--JVADELL 07/02/2022 FIN
where cod_art_mc_pk = farmacos.far_cod_art_mc_pk
)
where frm_tipo_pk = 6




END