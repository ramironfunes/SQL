--Tenes que ver el CONSULTA_PRESTACION si en el RESPONSEDEST del mensaje se rechazó o transaccionó. O ver el error que tira el response

--ITC: OSDE HISTORICO
SELECT top 1000 * FROM VIADUCT_LOG2 with (nolock)
WHERE CAST([TIMESTAMP] as DATE) > '20220417'



and destination = 'ITC'
--AND REQUESTDEST like '%30578079994%'



and MESSAGE like '%VILLARRUEL%'