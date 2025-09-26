SELECT top 1000 * FROM VIADUCT_LOG2
WHERE CAST([TIMESTAMP] as DATE) > '20220412'



and destination = 'ITC' AND REQUESTDEST like '%30578079994%'
and MESSAGECLASS = 'CONSULTA_PRESTACIONES'



and REQUESTDEST like '%<VersionCredencial>%</VersionCredencial>%'
--and message like '%LAB%'



--and RESPONSEDEST like '%CODIGO DE SEGURIDADERRONEO%'
--and ANSWERMSG like '%autorizada%'
--and ANSWERMSG like '%448335%'

order by TIMESTAMP desc