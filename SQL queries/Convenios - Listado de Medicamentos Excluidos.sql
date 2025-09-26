---Pestaña Mantenimientos de Farmacos
select 
case 
when isnull(CONVERT(CHAR,co_conjunto.cod_centro),'') + isnull(CONVERT(CHAR,codigo_area),'') + isnull(CONVERT(CHAR,codigo_servicio),'') = '' 
then '[Sin Valor]'
else rtrim(isnull(CONVERT(CHAR,centros.nombre_centro),'TODOS')) +rtrim(' / ')+ rtrim(isnull(CONVERT(CHAR,codigo_area),'TODOS')) +rtrim(' / ')+ rtrim(isnull(CONVERT(CHAR,codigo_servicio),'TODOS'))
end as [Centro/ Area Asistencia / Servicio]
,
case 
when isnull(grp_acc_terap.gractp_desc,'') + isnull(grp_terap.grtp_desc,'') + isnull(farmacos.frm_desc,'') = '' 
then '[Sin Valor]'
else rtrim(isnull(CONVERT(CHAR,grp_acc_terap.gractp_desc),'TODOS')) +rtrim(' / ')+ rtrim(isnull(CONVERT(CHAR,grp_terap.grtp_pk + ' - ' +grp_terap.grtp_desc),'TODOS')) +rtrim(' / ')+ rtrim(isnull(CONVERT(CHAR,farmacos.frm_codbar + ' - ' +farmacos.frm_desc),'TODOS'))
end as [Gr.Ac.Terapeuticas/ Ac.Terapeuticas / Farmacos]
,
case 
when convert(varchar(100),(isnull(desc_financ,'TODOS') + isnull(garantes.nombre_garante,'') + isnull(co_planes.plan_desc,''))) = ''
then '[Sin Valor]'
else rtrim(isnull(CONVERT(CHAR,desc_financ),'[TODOS]')) +rtrim(' / ')+ rtrim(isnull(CONVERT(CHAR,garantes.nombre_garante),'[TODOS]')) +rtrim(' / ')+ rtrim(isnull(CONVERT(CHAR,co_planes.plan_desc),'[TODOS]'))
end as [Financiacion/ Compañia / Plan]
--,isnull(convert(varchar(100),(isnull(cod_centro,'') + isnull(codigo_area,'') + isnull(codigo_servicio,''))),'[Sin Valor]') as [Centro/ Area Asistencia / Servicio]
--,	co_conjunto.gractp_pk,	grp_acc_terap.gractp_desc, co_conjunto.grtp_pk, grp_terap.grtp_desc,	co_conjunto.frm_cod, farmacos.frm_desc  

--,financiacion.cod_financ_pk,	co_conjunto.codigo_garante_pk	,co_planes.plan_pk 
,isnull(zona_consumo.zonc_descs ,'[Sin Valor]') as [Zona de Consumo] 
,co_conj_tregla as [I/E]
,co_conj_fdes as [Fecha Desde]
,	co_conj_fhas  as [Fecha Hasta]
,co_conj_nivel

FROM co_conjunto 
left join grp_acc_terap on grp_acc_terap.gractp_pk = co_conjunto.gractp_pk
left join grp_terap on grp_terap.grtp_pk = co_conjunto.grtp_pk 
left join farmacos on farmacos.frm_cod = co_conjunto.frm_cod 
left join garantes on garantes.codigo_garante_pk = co_conjunto.codigo_garante_pk
left join financiacion on financiacion.cod_financ_pk = co_conjunto.cod_financ_pk
left join co_planes on co_planes.plan_pk = co_conjunto.plan_pk
left join zona_consumo on zona_consumo.zonc_pk = co_conjunto.zonc_pk
left join centros on centros.cod_centro = co_conjunto.cod_centro
WHERE (co_conjunto.prest_item_pk in (select prest_item_pk from prest_item where prest_item_cod = '999020')) 
--AND (co_conj_tipo = 2) 
AND (co_conj_nivel >= 0) 
AND (co_conj_tregla <> 'T') 
AND ( co_conjunto.co_conj_fdes <= '07/01/2022') 
AND (( co_conjunto.co_conj_fhas >= '07/01/2022') OR ( co_conjunto.co_conj_fhas is null) ) 

