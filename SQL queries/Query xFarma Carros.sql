select far_prep_car_pk                          'Carro',
       und.descuenf                             'Unidad de Enfermeria',
  case FPC.car_complem_sn
       when 1 then 'Complementario'
	          else 'Principal' end              'Tipo Carro',
  convert (varchar(10),FPC.far_dia_pre   ,103)  'Fecha Preparacion',
  convert (varchar(10),FPC.far_hora_pre  ,108)  'Hora Preparacion',
  convert (varchar(10),FPC.far_ddesde    ,103)  'Cobertura Fecha Desde',
  convert (varchar(10),FPC.far_hdesde    ,108)  'Cobertura Hora Desde',
  convert (varchar(10),FPC.far_dhasta    ,103)  'Cobertura Fecha Hasta',
  convert (varchar(10),FPC.far_hhasta    ,108)  'Cobertura Hora Hasta',
  case FPC.far_situa
       when 1 then 'Pendiente'
	   when 2 then 'Facturado'
	          else 'Parcialmente Facturado' end 'Estado',
  convert (varchar(10),FPC.far_fecha_fact,103)  'Fecha Salida/Facturacion',
  convert (varchar(10),FPC.far_hora_fact ,108)  'Hora Salida/Facturacion',
	   alm.almacen_deno                         'Almacen'

 from far_prep_carros FPC
inner join alm_almacenes alm      on FPC.almacen_pk       = alm.almacen_pk
inner join unidadesenfermeria und on FPC.far_und_pk       = cod_uenf_pk
inner join co_ubicaciones ubic    on ubic.ubicac_pk       = und.ubicac_pk
inner join area_fisica AF         on AF.areafis_pk        = ubic.areafis_pk

where (CONVERT(datetime,FPC.far_dia_pre, 103)       >= '19/09/2021'
      and  CONVERT(datetime,FPC.far_dia_pre, 103)  <= '20/09/2021')
  and far_dia_pre is not null
  and und.descuenf = 'Office de Enfermeria P06 Binom'
order by 'unidad de enfermeria',far_dia_pre, 'Hora Preparación' asc