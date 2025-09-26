select
substring(cast(a.act_program_hora AS varchar (20)), charindex('1900', a.act_program_hora) +4, 8) as HORA_PROGRAMADA,
cli.apellido1 + ', ' + cli.nombre as PACIENTE,
cli.codigo1 as DNI,
gar.nombre_garante as FINANCIADOR,
clp.clipag_numpoliza as NRO_CRED,
qrf.nombre_corto as QUIROFANO,
prof.apellido1 + ', ' + prof.nombre as CIRUJANO,
substring(cast(a.act_program_fecha AS varchar (40)), 0, 12) as FECHA_PROGRAMADA,
a.act_descripcion as DESCRIPCION,
a.epis_pk as EPISODIO
from actividad a 

inner join ci_xactividad qr on qr.actividad_pk = a.actividad_pk
inner join ci_xinternacion qr_int on qr_int.ci_inter_pk = qr.ci_inter_pk
left join pagadores pag on pag.cod_pagador_pk = qr_int.cod_pagador_pk
left join garantes gar on gar.codigo_garante_pk = pag.codigo_garante_pk
inner join actividad_det act_det on act_det.actividad_pk = a.actividad_pk
left join qrf_xciru_prog ciru_prog on act_det.actividad_pk = ciru_prog.actividad_pk
inner join tipo_actividad tipo on tipo.tipo_actividad_pk = a.tipo_actividad_pk
inner join quirofano qrf on qrf.qrf_pk = ciru_prog.qrf_pk
left join clientes cli on cli.codigo_cliente = qr_int.codigo_cliente
inner join fpersona prof on prof.codigo_personal = qr_int.codigo_personal1
left join tipo_anestesia on dbo.tipo_anestesia.tipo_anestesia_pk = ciru_prog.tipo_anestesia_pk
left join cliente_pagadores clp on clp.codigo_cliente = cli.codigo_cliente

where clipag_activo_sn = '1'
and clp.clipag_numpoliza is not null and clp.clipag_numpoliza != ''
and a.act_program_fecha < dateadd(dd, 1, getdate()) and a.act_program_fecha > dateadd(dd, -1, getdate())
order by a.act_program_hora