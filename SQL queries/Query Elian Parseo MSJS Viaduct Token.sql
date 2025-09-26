with CTE_Transacciones as (
SELECT MESSAGE as MESSAGE_OSDE, CAST([TIMESTAMP] as DATE) as Fecha, *

FROM VIADUCT_LOG2_HIST

WHERE CAST([TIMESTAMP] as DATE) between '20220303' and '20220413'
      and destination = 'ITC' 
      and MESSAGECLASS = 'CONSULTA_PRESTACIONES'
	  AND REQUESTDEST like '%30546741253%'
)



select *, Fecha,
       --substring(MESSAGE_OSDE, P1.Pos + 1, P3.Pos - P2.Pos - 1) AS NroMensaje,
       substring(MESSAGE_OSDE, P21.Pos + 1, P23.Pos - P22.Pos - 1) AS AMBITO1,
       substring(MESSAGE_OSDE, P28.Pos + 1, P28.Pos + 2) as token,
       MESSAGE_OSDE,
       P1.POS,
       P2.POS,
       P3.POS,
       P4.POS,
       P5.POS,
       P6.POS,
       P7.POS,
       P8.POS,
       P9.POS,
       P10.POS,
       P11.POS,
       P12.POS,
       P13.POS,
       P14.POS,
       P15.POS,
       P16.POS,
       P17.POS,
       P18.POS,
       P19.POS,
       P20.POS,
       P21.POS,
       P22.POS,
       P23.POS,
       P24.POS,
       P25.POS,
       P26.POS,
       P27.POS,
       P28.POS
        
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