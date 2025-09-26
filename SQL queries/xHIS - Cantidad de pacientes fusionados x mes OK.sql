select count (*) as Cantidad,
CASE 
WHEN MONTH (hcf_fecha) = 8 then 'Agosto 2021'
WHEN MONTH (hcf_fecha) = 9 then 'Septiembre 2021'
WHEN MONTH (hcf_fecha) = 10 then 'Octubre 2021'
WHEN MONTH (hcf_fecha) = 11 then 'Noviembre 2021'
WHEN MONTH (hcf_fecha) = 12 then 'Diciembre 2021'
WHEN MONTH (hcf_fecha) = 1 then 'Enero 2022'
WHEN MONTH (hcf_fecha) = 2 then 'Febrero 2022'
WHEN MONTH (hcf_fecha) = 3 then 'Marzo 2022'
END AS MES
from hc_fusion
where hcf_fecha >= '20210801'
group by MONTH (hcf_fecha)
order by MONTH hcf_fecha)
