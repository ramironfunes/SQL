-- VALE_ASIS_CAB y VALE_ASIS_DET son las tablas de facturación las necesito para comparar con CAGENDAS
select prest_item.prest_item_cod,prest_item.prest_item_desc,vale_asis_det.*
from vale_asis_cab vale_asis_cab
inner join vale_asis_det vale_asis_det on vale_asis_det.va_pk = vale_asis_cab.va_pk
left join prest_item prest_item on prest_item.prest_item_pk = vale_asis_det.prest_item_pk
where vale_asis_cab.codigo_cliente = '100229404'
and vale_asis_det.va_det_fapunte = '20220308'
order by 1


--CAGENDAS me muestra lo primero que cargaron en la Confirmación de Cita. ES 1 SOLA PRESTACION, LA PRIMERA
select prest_item.prest_item_cod,prest_item.prest_item_desc, cagendas.* 
from cagendas cagendas
--inner join cex cex on cex.con_cita_sn = cagendas.n_solic
inner join prest_item prest_item on prest_item.prest_item_pk = cagendas.prest_item_pk
where cagendas.codigo_cliente = '100229404'


/*Si o si necesito CEX para relacionar VALE_ASIS_DET con CAGENDAS */
/*
Dtos de la consulta
Si viene de citas (cgaendas) los datos vendrán copiadas de esta en caso contrario se puede introducir 'manualmente'.
La prestación es registrada a modo referencial por mabntener una 'copi' de los datos de
la cita. Así podrá valorarse el 'motivo' por el que el pacientye vino a consulta.
Otra cosa será las prestaciones que dentro de ella se realizan, así
como los precios establecidos para cada una de ellas,
que vendrán registrados en actividad-> actividad_det y sus precios ( elem_valorización)
Recoge tanto los denominados TVM como los VA. Es una cuestión de nomenclatura.
Se diferencian en.
Nota el Prest item equivale al motivo de la conuslta: Para que se le citó o porque vino.
*/
select prest_item.prest_item_cod,prest_item.prest_item_desc, cex.* 
from cex cex
inner join prest_item prest_item on prest_item.prest_item_pk = cex.prest_item_pk
where cex.codigo_cliente = '100229404'


/*CAGENDAS_PREST Cunado se da una cita a un paciente, se le pueden asociar una o más prestaciones. Si es solo una prestación se registra
esta prestación en cagendas, pero son más de una, de la segunda a la N se guarda en cagenda_prest.
VA SI O SI*/

select prest_item.prest_item_cod,prest_item.prest_item_desc,cagendas_prest.* from cagendas_prest cagendas_prest
inner join cagendas cagendas on cagendas.n_solic = cagendas_prest.cagprest_nsolic
inner join prest_item prest_item on prest_item.prest_item_pk = cagendas_prest.prest_item_pk
where cagendas.codigo_cliente = '100229404'
order by 2



select * from prest_item

select * from cagendas





vale_asis_det vale_asis_det
right join cagendas_prest cagendas_prest on vale_asis_det.actividad_det_pk = cagendas_prest.actividad_det_pk
inner join vale_asis_cab vale_asis_cab on vale_asis_cab.va_pk = vale_asis_det.va_pk
inner join cex ON vale_asis_det.va_det_referencia = cex.cex_pk
inner join cagendas on cagendas.n_solic = cex.con_cita_sn






select * from clientes where apellido1 = 'ABADI' and nombre = 'ESTHER'


select * from prest_item