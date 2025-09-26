select cl.apellido1 as APELLIDO, cl.nombre as NOMBRE, td.tipo_dni_desc AS TIPO_DOC, cl.codigo1 AS NRO_DOC, cast(cl.nac_fecha AS date) as FECHA_NAC,
cast(hc.fecha_apertura_hc as DATE) as CREACION_DUPLICADO, fp.nombre + ' ' + fp.apellido1 as USUARIO_CREACION, cast(hcf.hcf_fecha AS date) as FECHA_FUSION from clientes cl
inner join tpo_dni td on cl.tipo_dni_pk = td.tipo_dni_pk
left join fpersona fp on cl.codigo_personal = fp.codigo_personal
inner join hc hc on cl.codigo_cliente = hc.codigo_cliente
inner join hc_fusion hcf on hc.nhc_id = hcf.nhc_id_fin_destino
where hcf.hcf_fecha between '01/08/2021' AND '30/08/2021'
order by APELLIDO