--Consulta prestaciones Bloque Qx

select tipo_actividad.tipo_act_desc as 'TIPO ACTIVIDAD', tipo_item.tipo_item_pk as 'Cod Tipo Item', tipo_item.tipo_item_desc as 'TIPO ITEM', prest_item.prest_item_cod as 'Cod Prestacion', prest_item.prest_item_desc as 'PRESTACION' from tipo_actividad tipo_actividad
inner join tipo_item tipo_item on tipo_item.tipo_actividad_pk =  tipo_actividad.tipo_actividad_pk
inner join prest_item prest_item on prest_item.tipo_item_pk = tipo_item.tipo_item_pk
where tipo_actividad.tipo_actividad_pk = 1 -- (PROCEDIMIENTO)
and prest_item_actsn = 1
order by tipo_item.tipo_item_desc, prest_item.prest_item_desc









