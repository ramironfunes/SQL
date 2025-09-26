--Cantidad fusiones realizadas (de pacientes) agrupados por Mes
select count (*) as 'Cantidad Fusiones',
CASE
WHEN MONTH(hcf_fecha) = 1 THEN 'Enero'
WHEN MONTH(hcf_fecha) = 2 THEN 'Febrero'
WHEN MONTH(hcf_fecha) = 3 THEN 'Marzo'
WHEN MONTH(hcf_fecha) = 4 THEN 'Abril'
WHEN MONTH(hcf_fecha) = 5 THEN 'Mayo'
WHEN MONTH(hcf_fecha) = 6 THEN 'Junio'
WHEN MONTH(hcf_fecha) = 7 THEN 'Julio'
WHEN MONTH(hcf_fecha) = 8 THEN 'Agosto'
WHEN MONTH(hcf_fecha) = 9 THEN 'Septiembre'
WHEN MONTH(hcf_fecha) = 10 THEN 'Octubre'
WHEN MONTH(hcf_fecha) = 11 THEN 'Noviembre'
WHEN MONTH(hcf_fecha) = 12 THEN 'Diciembre'
END as MES,
YEAR(hcf_fecha) as AÑO
/*case
when (hcf_fecha between '20210201' and '20210228') then 'Febrero 2021'
when (hcf_fecha between '20210301' and '20210331') then 'Marzo 2021'
when (hcf_fecha between '20210401' and '20210430') then 'Abril 2021'
when (hcf_fecha between '20210501' and '20210531') then 'Mayo 2021'
when (hcf_fecha between '20210601' and '20210630') then 'Junio 2021'
when (hcf_fecha between '20210701' and '20210731') then 'Julio 2021'
when (hcf_fecha between '20210801' and '20210831') then 'Agosto 2021'
when (hcf_fecha between '20210901' and '20210930') then 'Septiembre 2021'
when (hcf_fecha between '20211001' and '20211031') then 'Octubre 2021'--
when (hcf_fecha between '20211101' and '20211130') then 'Noviembre 2021'
when (hcf_fecha between '20211201' and '20211231') then 'Diciembre 2021'
when (hcf_fecha between '20220101' and '20220131') then 'Enero 2022'
when (hcf_fecha between '20220201' and '20220228') then 'Febrero 2022'
when (hcf_fecha between '20220301' and '20220331') then 'Marzo 2022'
when (hcf_fecha between '20220401' and '20220430') then 'Abril 2022'
end as MES */
from hc_fusion
group by YEAR(hcf_fecha), MONTH(hcf_fecha)
order by YEAR(hcf_fecha), MONTH(hcf_fecha)