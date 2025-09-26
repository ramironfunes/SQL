--PRESTACIONES DE LABORATORIO

declare @buscarNombre varchar(30);

		-- Buscar prestacion por nombre para obtener PK's
		set @buscarNombre = 'Listeria monocytogenes IGM';


select top 100000 * from VIADUCT_MAP_EC_LIS

where DESC_PRUEBA_GLYMBS like '%'+ @buscarNombre +'%'
		--order by COD_PRACTICA_ESC_CLIN desc
		--where COD_PRACTICA_ESC_CLIN = 2297


select top 100 * from VIADUCT_MAP_HIS_LIS
where DESC_PRUEBA_GLYMBS like '%'+ @buscarNombre +'%'
		--where COD_PRESTACION_XHIS = 2263

select top 100 * from prest_item
where prest_item_desc like '%'+ @buscarNombre +'%'
		--where prest_item_pk = 2263

select top 100 * from gpc_catalogo
where gca_nombre like '%'+ @buscarNombre +'%'
		--where catalogo_pk = 2309

select top 100 * from gpc_cat_local
where gcl_nombre like '%'+ @buscarNombre +'%'
		--where cat_local_pk = 2295



