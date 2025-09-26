declare @buscarNombre varchar(30);
declare @PrestItemPK int;
declare @CodPractEscClinico int;

		-- Nombre de prestacion (para buscar en tablas con resultados ambiguos) 
		-- set @buscarNombre = 'abdomen';

		--Pk de la tabla PrestItem:
		set @PrestItemPK = 2261;

		--PK de la tabla VIADUCT_MAP_EC_RIS
		set @CodPractEscClinico = 2232;

-- Tabla de mapeo entre Escritorio Clinico y Ris (Radiology)
select top 10 * from VIADUCT_MAP_EC_RIS
where COD_PRACTICA_ESC_CLIN = @CodPractEscClinico
	--where DESC_PRUEBA_EGES like '%'+ @buscarNombre +'%'

-- Tabla de mapeo entre xHis y Ris 
select top 10 * from VIADUCT_MAP_HIS_rIS
where COD_PRESTACION_XHIS = @PrestItemPK

-- Tabla donde estan las prestaciones existentes/disponibles 
select top 10 * from prest_item
where prest_item_pk = @PrestItemPK


-- Tabla de CATALOGO 
select top 10 * from gpc_catalogo
where prest_item_pk = @PrestItemPK
order by catalogo_pk desc
	--where catalogo_pk = 2309 --toracica
			
			-- Categoria relacionada al catalogo (cat_nivel_2_pk)
			select top 10 * from gpc_cat_nivel_2
			where cat_nivel_2_pk = (select top 1 cat_nivel_2_pk from gpc_catalogo where prest_item_pk = @PrestItemPK)
				

			-- Categoria local relacionada al catalogo (catalogo_pk), puede haber mas de una, elegir la correcta
			select top 100 * from gpc_cat_local 
			where catalogo_pk =  (select top 1 catalogo_pk from gpc_catalogo where prest_item_pk = @PrestItemPK --si hay mas de una cambiar @PrestItemPK por el valor correcto 
			order by catalogo_pk desc) --2309 
			

--En la tabla gpc_cat_serv se realizan los insert desde 1 a N servicios por CADA practica
--El codigo_servicio actualmente se inserta hasta el 207, checkear en el momento de pedir insert cuantos cat_serv existen en la tabla con esta consulta:
--select top 10 * from  gpc_cat_serv
--order by codigo_servicio desc

	