select ser.servicio as SERVICIO, count(*) from ingresos ing
inner join servicios ser on ing.codigo_servicio = ser.codigo_servicio
inner join clientes cl on ing.codigo_cliente = cl.codigo_cliente
inner join tpo_dni td on cl.tipo_dni_pk = td.tipo_dni_pk
where ing.fecha_ingreso BETWEEN '01/08/2021' AND '31/08/2021'
group by ser.servicio
order by ser.servicio