select fpersona.apellido1 as 'Apellido', 
fpersona.nombre as 'Nombre', 
fpersona.codigo_personal, 
cla_usuarios.usu_login as 'Usuario xFarma',
sys_usu.syslogin as 'Usuario xHIS',
cla_usuarios.nivel_pk,
cla_niveles.nivel_deno as Nivel,
CASE
	WHEN cla_usuarios.usu_activo = 1 THEN 'SI' 
	ELSE 'NO' END AS 'Activo xFarma',
CASE
	WHEN fpersona.activo_sn = '1' THEN 'SI'
	ELSE 'NO' END AS 'Activo xHIS',
CAST (cla_usuarios.usu_ultacces_dia as DATE ) as 'Ultimo Acceso xFarma'
from cla_usuarios cla_usuarios
inner join sys_usu sys_usu on sys_usu.syslogin = cla_usuarios.usu_his
inner join fpersona fpersona on fpersona.codigo_personal = sys_usu.codigo_personal
inner join cla_niveles cla_niveles on cla_niveles.nivel_pk = cla_usuarios.nivel_pk
--inner join sys_usu sys_usu on sys_usu.codigo_personal = fpersona.codigo_personal
--where cla_usuarios.usu_activo = '1'
--and cla_usuarios.usu_ultacces_dia > getdate() -401
--and fpersona.activo_sn = 1
order by fpersona.apellido1
--order by cla_usuarios.usu_ultacces_dia -- Para verificar los ultimos accesos
