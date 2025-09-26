select nhc_id_destino,
hcf_fecha,
case 
            when (hcf_fecha between '20210201' and '20210228') then 'Febrero'
            when (hcf_fecha between '20210301' and '20210331') then 'Marzo' 
            when (hcf_fecha between '20210401' and '20210430') then 'Abril' 
            when (hcf_fecha between '20210501' and '20210531') then 'Mayo' 
            when (hcf_fecha between '20210601' and '20210630') then 'Junio' 
            when (hcf_fecha between '20210701' and '20210731') then 'Julio' 
            when (hcf_fecha between '20210801' and '20210831') then 'Agosto' 
            when (hcf_fecha between '20210901' and '20210930') then 'Septiembre'
			when (hcf_fecha between '20211001' and '20211031') then 'Octubre' 
end as MES_DUPLICIDAD
from hc_fusion 
group by nhc_id_destino, hcf_fecha 
order by hcf_fecha