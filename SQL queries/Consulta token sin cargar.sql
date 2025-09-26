--ITC: OSDE HISTORICO
SELECT top 1000 * FROM VIADUCT_LOG2 with (nolock)
WHERE CAST([TIMESTAMP] as DATE) > '20220403'



and destination = 'ITC' AND REQUESTDEST like '%30578079994%'


--and message like '%20323302^LUTVAK%'


and REQUESTDEST like '%<VersionCredencial>0</VersionCredencial>%'



and RESPONSEDEST like '%CODIGO DE SEGURIDADERRONEO%'
--and ANSWERMSG like '%autorizada%'



--and ANSWERMSG like '%448335%'




order by TIMESTAMP desc