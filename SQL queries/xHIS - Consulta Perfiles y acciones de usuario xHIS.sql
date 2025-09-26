select * from sys_perfil



select * from sys_perfil_usu



select * from sys_perfil_apli


select * from gpc_perfil_serv



select * from USU_USUARIO

--------------------------------------------

select * from far_acciones



select * from far_usu_uc


select * from perfil_farma




select * from sys_apli order by modulo,objeto
select * from sys_perfil_apli


select * from sys_apli where descripcion like '%norm%'

--modulo = unid_enf            


select sp.sys_perfil_desc, sa.modulo, sa.cod_apli,sa.descripcion, sa.objeto from sys_apli sa
left join sys_perfil_apli spa on sa.cod_apli = spa.Cod_Apli
left join sys_perfil sp on spa.sys_perfil_pk = sp.sys_perfil_pk
--where modulo = 'unid_enf'
where descripcion like '%perfil%'
--AND sys_perfil_desc = 'Enfermera/o'
order by 4

-- 8329 Plantilla


select * from sys_apli order by 2 where descripcion like '%norma%'


--cod_apli = 8306 normaliza_auto      






select * from far_descriptores order by 2

select * from descriptores where descriptor like '%indicacion%' order by 2

select * from descriptores where codigo_descriptor = '10351'




update descriptores set mascara = '0' where codigo_descriptor = '10351'