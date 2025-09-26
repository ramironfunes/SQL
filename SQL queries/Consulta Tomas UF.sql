SELECT hc.nhc, 
       clientes.apellido1 AS Apellido1, 
       clientes.apellido2 AS Apellido2, 
       clientes.nombre AS Nombre, 
      -- ingresos.cod_cama AS 'Cama Ingreso', --es la cama actual del paciente, entiendo que esa cama no va a ser necesaria.
       unidadesenfermeria.descuenf as Unidad_Enfermeria,
	   far_det_pac_car.cod_cama AS 'Cama Dispensacion',
	   cod_bar_mc_pr AS Codigo, 
       art_mc_nom AS Prestacion, 
       far_detmed_dia + far_detmed_hora AS 'Fecha Administracion', 
       far_det_pac_car.far_detpaccar_cant AS cantidad,
       garantes.nombre_garante AS 'Financiador', 
       co_planes.plan_desc AS 'Plan', 
       episodios.epis_apertura_fech AS "Fecha Ingreso", 
       episodios.epis_cierre_fecha AS "Fecha Alta",
       CASE WHEN ingesta.ingta_pk IS null THEN 'No Facturado' ELSE 'Facturado' END    AS 'Facturado',
       CASE far_det_pac_car.far_detmed_tipo WHEN 1 THEN 'Salida' ELSE 'Devolución' END    AS 'Salida/Devolución',
       fdpc_facturado , 
       far_det_pac_car.far_detpaccar_pk AS PK,
       ingesta.ingta_cantidad as Cantidad_ingesta,
       ingesta.ingta_prevf+ingesta.ingta_prevh as Fecha_Prevista_ingesta,
       ingesta.ingta_realif+ingesta.ingta_realih as Fecha_ingesta,
       case when ingesta.ingta_estado = 'A' then 'Anulado'
            when ingesta.ingta_estado = 'P' OR ingesta.ingta_estado IS NULL then 'Pendiente'
            when ingesta.ingta_estado = 'R' then 'Realizado'
            when ingesta.ingta_estado = 'C' then 'Cancelado' end as Estado_Ingesta,
       case when ingesta.ingta_urg_sn = 1 then 'Urgente' else 'Ordinaria' end as 'Ingesta Urgente/Ordinaria', pauta.pauta_den as Pauta
       
       

 

 

 

--A.- Anulado: Estado irreversible, las ingestas no se puede visualizar más. (NO HAY REGISTRO DE QUE SE USE)
--P.- Pendiente: Pendiente de realizar. (NO HAY REGISTRO DE QUE SE USE, se determina NULL como 'Pendiente')
--R.- Realizado : La ingesta ha sido realizada.
--C.- Cancelado: Se ha cancelado la realización de la ingesta.

 

 

 


FROM far_det_pac_car
     INNER JOIN episodios ON episodios.epis_pk = far_det_pac_car.episodio_act
     INNER JOIN ingresos ON ingresos.cod_ingreso_pk = episodios.referencia_id
     INNER JOIN co_planes ON co_planes.plan_pk = ingresos.plan_pk 
     INNER JOIN garantes ON garantes.codigo_garante_pk = co_planes.codigo_garante_pk
     INNER JOIN clientes ON clientes.codigo_cliente = episodios.codigo_cliente 
     INNER JOIN hc ON hc.codigo_cliente = clientes.codigo_cliente 
     INNER JOIN alm_articulos_mc ON alm_articulos_mc.cod_art_mc_pk = far_det_pac_car.cod_art_mc_pk
     inner join und_pautas pauta on pauta.pauta_pk = dbo.far_det_pac_car.pauta_pk
     
     LEFT OUTER JOIN ingesta ON ingesta.ingta_pk = far_det_pac_car.fdpc_ingta_pk

	 INNER JOIN camas on dbo.camas.cod_cama = dbo.ingresos.cod_cama
	 INNER JOIN dbo.unidadesenfermeria ON dbo.unidadesenfermeria.cod_uenf_pk = dbo.camas.cod_uenf_pk
     

 

 

 

WHERE (far_det_pac_car.fdpc_estado_hp IN (4,11) OR (far_det_pac_car.fdpc_estado_hp = 10 AND far_det_pac_car.fdpc_ingta_pk IS NOT NULL))
      AND episodios.tipo_episodio_pk = 3
      AND far_det_pac_car.far_detpaccar_cant > 0
      AND far_det_pac_car.pauta_pk <> 35486852  --tipo de pauta -> und_pautas
      --AND far_detmed_dia >= '01/09/2021'  --Fecha Desde
      --AND far_detmed_dia <= '21/09/2021'  --Fecha Hasta
	  AND far_detmed_dia + far_detmed_hora <= getdate()
	  AND episodios.epis_apertura_fech >= '27/01/2022'


	  --AND clientes.apellido1 in ('PRUEBA01','PRUEBA02')
	  --AND clientes.nombre = 'ALM'
	  
      --AND cod_bar_mc_pr = '16174X1'        --Código de articulo
      and hc.nhc = '121276965'            --NHC

 



 

ORDER BY episodios.epis_apertura_fech desc