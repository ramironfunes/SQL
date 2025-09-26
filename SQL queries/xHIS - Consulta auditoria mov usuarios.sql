SELECT * FROM lopd_auditoria WHERE modulo LIKE '%MEAP%' ORDER BY fecha DESC.



SELECT * FROM lopd_auditoria 
WHERE modulo = 'confcita' 
and fecha = '20220421'
and syslogin = 'rserrano' 
and fichero = '20939093' --nhc del paciente
ORDER BY hora DESC