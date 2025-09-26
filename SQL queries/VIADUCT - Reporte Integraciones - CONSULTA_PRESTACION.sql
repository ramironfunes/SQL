/*<<<<<<<<<<<<<<<<<<<<<< COMIENZO EXTRACCION DE DATOS >>>>>>>>>>>>>>>>>>>>>*/

with CTE_Transacciones as (
SELECT MESSAGE as MESSAGE_OSDE, CAST([TIMESTAMP] as DATE) as Fecha, *

FROM VIADUCT_LOG2_HIST

WHERE destination = 'TRADITUM' --OSPJN TRADITUM
	  --and CAST([TIMESTAMP] as DATE) between '20220708' and '20220711'
	  --and CAST([TIMESTAMP] as DATE) = '20220707'
	  and process = 'xHISCarriers'
      and MESSAGECLASS = 'CONSULTA_PRESTACIONES'
	  --AND REQUESTDEST like '%30546741253%'
	  --and STATEMSG = '1' --OK
	  --and STATEMSG = '-1' --ERROR
)



select --substring(MESSAGE_OSDE, P1.Pos + 1, P3.Pos - P2.Pos - 1) AS NroMensaje,
       CASE 
	   WHEN substring(MESSAGE_OSDE, P21.Pos + 1, P23.Pos - P22.Pos - 1) = 1 THEN 'URGENCIA'
	   WHEN substring(MESSAGE_OSDE, P21.Pos + 1, P23.Pos - P22.Pos - 1) = 2 THEN 'CCEE'
	   WHEN substring(MESSAGE_OSDE, P21.Pos + 1, P23.Pos - P22.Pos - 1) = 3 THEN 'INTERNACION'
	   END AS AMBITO,
	   case 
			when (CAST([TIMESTAMP] as DATE) between '20210201' and '20210228') then 'Febrero 2021'
			when (CAST([TIMESTAMP] as DATE) between '20210301' and '20210331') then 'Marzo 2021' 
			when (CAST([TIMESTAMP] as DATE) between '20210401' and '20210430') then 'Abril 2021' 
			when (CAST([TIMESTAMP] as DATE) between '20210501' and '20210531') then 'Mayo 2021' 
			when (CAST([TIMESTAMP] as DATE) between '20210601' and '20210630') then 'Junio 2021' 
			when (CAST([TIMESTAMP] as DATE) between '20210701' and '20210731') then 'Julio 2021' 
			when (CAST([TIMESTAMP] as DATE) between '20210801' and '20210831') then 'Agosto 2021' 
			when (CAST([TIMESTAMP] as DATE) between '20210901' and '20210930') then 'Septiembre 2021' 
			when (CAST([TIMESTAMP] as DATE) between '20211001' and '20211031') then 'Octubre 2021'
			when (CAST([TIMESTAMP] as DATE) between '20211101' and '20211130') then 'Noviembre 2021' 
			when (CAST([TIMESTAMP] as DATE) between '20211201' and '20211231') then 'Diciembre 2021'
			when (CAST([TIMESTAMP] as DATE) between '20220101' and '20220131') then 'Enero 2022'
			when (CAST([TIMESTAMP] as DATE) between '20220201' and '20220228') then 'Febrero 2022'
			when (CAST([TIMESTAMP] as DATE) between '20220301' and '20220331') then 'Marzo 2022' 
			when (CAST([TIMESTAMP] as DATE) between '20220401' and '20220430') then 'Abril 2022' 
			when (CAST([TIMESTAMP] as DATE) between '20220501' and '20220531') then 'Mayo 2022' 
			when (CAST([TIMESTAMP] as DATE) between '20220601' and '20220630') then 'Junio 2022'
			when (CAST([TIMESTAMP] as DATE) between '20220701' and '20220731') then 'Julio 2022'
	   end as MES,
	   case 
			when STATEMSG = '1' then 'OK'
			when STATEMSG = '-1' then 'ERROR'
	   end as ESTADO,
	   count (*)
       --substring(MESSAGE_OSDE, P28.Pos + 1, P28.Pos + 2) as token,
       --MESSAGE_OSDE,
	   --timestamp
        
from CTE_Transacciones
  cross apply (select (charindex('|', MESSAGE_OSDE))) as P1(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P1.Pos+1))) as P2(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P2.Pos+1))) as P3(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P3.Pos+1))) as P4(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P4.Pos+1))) as P5(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P5.Pos+1))) as P6(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P6.Pos+1))) as P7(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P7.Pos+1))) as P8(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P8.Pos+1))) as P9(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P9.Pos+1))) as P10(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P10.Pos+1))) as P11(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P11.Pos+1))) as P12(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P12.Pos+1))) as P13(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P13.Pos+1))) as P14(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P14.Pos+1))) as P15(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P15.Pos+1))) as P16(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P16.Pos+1))) as P17(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P17.Pos+1))) as P18(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P18.Pos+1))) as P19(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P19.Pos+1))) as P20(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P20.Pos+1))) as P21(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P21.Pos+1))) as P22(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P22.Pos+1))) as P23(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P23.Pos+1))) as P24(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P24.Pos+1))) as P25(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P25.Pos+1))) as P26(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P26.Pos+1))) as P27(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P27.Pos+1))) as P28(Pos)
  group by (CASE 
	   WHEN substring(MESSAGE_OSDE, P21.Pos + 1, P23.Pos - P22.Pos - 1) = 1 THEN 'URGENCIA'
	   WHEN substring(MESSAGE_OSDE, P21.Pos + 1, P23.Pos - P22.Pos - 1) = 2 THEN 'CCEE'
	   WHEN substring(MESSAGE_OSDE, P21.Pos + 1, P23.Pos - P22.Pos - 1) = 3 THEN 'INTERNACION'
	   END), (case 
			when (CAST([TIMESTAMP] as DATE) between '20210201' and '20210228') then 'Febrero 2021'
			when (CAST([TIMESTAMP] as DATE) between '20210301' and '20210331') then 'Marzo 2021' 
			when (CAST([TIMESTAMP] as DATE) between '20210401' and '20210430') then 'Abril 2021' 
			when (CAST([TIMESTAMP] as DATE) between '20210501' and '20210531') then 'Mayo 2021' 
			when (CAST([TIMESTAMP] as DATE) between '20210601' and '20210630') then 'Junio 2021' 
			when (CAST([TIMESTAMP] as DATE) between '20210701' and '20210731') then 'Julio 2021' 
			when (CAST([TIMESTAMP] as DATE) between '20210801' and '20210831') then 'Agosto 2021' 
			when (CAST([TIMESTAMP] as DATE) between '20210901' and '20210930') then 'Septiembre 2021' 
			when (CAST([TIMESTAMP] as DATE) between '20211001' and '20211031') then 'Octubre 2021'
			when (CAST([TIMESTAMP] as DATE) between '20211101' and '20211130') then 'Noviembre 2021' 
			when (CAST([TIMESTAMP] as DATE) between '20211201' and '20211231') then 'Diciembre 2021'
			when (CAST([TIMESTAMP] as DATE) between '20220101' and '20220131') then 'Enero 2022'
			when (CAST([TIMESTAMP] as DATE) between '20220201' and '20220228') then 'Febrero 2022'
			when (CAST([TIMESTAMP] as DATE) between '20220301' and '20220331') then 'Marzo 2022' 
			when (CAST([TIMESTAMP] as DATE) between '20220401' and '20220430') then 'Abril 2022' 
			when (CAST([TIMESTAMP] as DATE) between '20220501' and '20220531') then 'Mayo 2022' 
			when (CAST([TIMESTAMP] as DATE) between '20220601' and '20220630') then 'Junio 2022'
			when (CAST([TIMESTAMP] as DATE) between '20220701' and '20220731') then 'Julio 2022'
	   end),(case 
			when STATEMSG = '1' then 'OK'
			when STATEMSG = '-1' then 'ERROR'
	   end)

  order by MES asc,1 asc










/*<<<<<<<<<<<<<<<<<<<<<< COMIENZO ANALISIS Y VERIFICACION >>>>>>>>>>>>>>>>>>>>>*/


-- DETALLE MENSAJES

select top 1 * from VIADUCT_LOG2_HIST
where process = 'xHISCarriers'
and MESSAGECLASS = 'CONSULTA_PRESTACIONES'
and destination = 'TRADITUM'
--and CAST([TIMESTAMP] as DATE) = '20220707'
--and CAST([TIMESTAMP] as DATE) between '20220708' and '20220711'
order by timestamp desc



-- CANTIDAD MENSAJES

select count (*) from VIADUCT_LOG2
where process = 'xHISCarriers'
and MESSAGECLASS = 'CONSULTA_PRESTACIONES'
and (destination = 'ITC' OR destination is null)
--and CAST([TIMESTAMP] as DATE) = '20220707'
and CAST([TIMESTAMP] as DATE) between '20220708' and '20220711'
order by timestamp desc