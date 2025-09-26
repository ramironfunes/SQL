select codigo1 AS NRO_DOC, cl.apellido1 as APELLIDO, cl.nombre as NOMBRE, 
hc.fecha_apertura_hc as FECHA_DUPLICADO, 
case 
            when (hc.fecha_apertura_hc between '20210201' and '20210228') then 'Febrero'
            when (hc.fecha_apertura_hc between '20210301' and '20210331') then 'Marzo' 
            when (hc.fecha_apertura_hc between '20210401' and '20210430') then 'Abril' 
            when (hc.fecha_apertura_hc between '20210501' and '20210531') then 'Mayo' 
            when (hc.fecha_apertura_hc between '20210601' and '20210630') then 'Junio' 
            when (hc.fecha_apertura_hc between '20210701' and '20210731') then 'Julio' 
            when (hc.fecha_apertura_hc between '20210801' and '20210831') then 'Agosto' 
            when (hc.fecha_apertura_hc between '20210901' and '20210930') then 'Septiembre'
			when (hc.fecha_apertura_hc between '20211001' and '20211031') then 'Octubre' 
end as MES_DUPLICIDAD
from clientes cl
inner join hc hc on cl.codigo_cliente = hc.codigo_cliente
where codigo1 IN (
select codigo1 from clientes cl
group by codigo1
having count(codigo1) > 1)
and cl.tipo_dni_pk = 1
and hc.fecha_apertura_hc between '01/02/2021' AND '04/10/2021'
group by cl.codigo1, cl.apellido1, cl.nombre, hc.fecha_apertura_hc
order by hc.fecha_apertura_hc asc,NRO_DOC


