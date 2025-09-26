with CTE_Transacciones as (
SELECT MESSAGE as MESSAGE_OSDE,*
--FROM VIADUCT_LOG2 
FROM VIADUCT_LOG2_HIST
WHERE destination = 'RIS'  
      --and CAST([TIMESTAMP] as DATE) between '20220708' and '20220711'
      --and CAST([TIMESTAMP] as DATE) = '20220707'
      and process = 'EC_PeticionesRIS'
      and responsedest like '%La consulta devolvi? m?s de un valor%'
      and messageclass = 'SIU^S12'
      and statemsg = '-1'  --error
		)

select --substring(MESSAGE_OSDE, P1.Pos + 1, P3.Pos - P2.Pos - 1) AS NroMensaje,
	   substring(MESSAGE_OSDE, P27.Pos + 1, 7) as 'PATIENTID EGES',
	   substring(MESSAGE_OSDE, P28.Pos + 1, 9) as 'NHC',
	   substring(MESSAGE_OSDE, P28.Pos + 16, 9) as 'Nro Documento',
	   substring(MESSAGE_OSDE, P30.Pos + 1, 40) as 'Paciente'
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
  cross apply (select (charindex('|', MESSAGE_OSDE, P28.Pos+1))) as P29(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P29.Pos+1))) as P30(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P30.Pos+1))) as P31(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P31.Pos+1))) as P32(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P32.Pos+1))) as P33(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P33.Pos+1))) as P34(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P34.Pos+1))) as P35(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P35.Pos+1))) as P36(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P36.Pos+1))) as P37(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P37.Pos+1))) as P38(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P38.Pos+1))) as P39(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P39.Pos+1))) as P40(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P40.Pos+1))) as P41(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P41.Pos+1))) as P42(Pos)
  cross apply (select (charindex('|', MESSAGE_OSDE, P42.Pos+1))) as P43(Pos)
  
  order by 1