select 
fp.apellido1,
fp.nombre,
fp.codigo_personal,
SU.syslogin as 'User',--
fps.codigo_servicio,
s.servicio
from sys_usu SU
inner join fpersona fp on fp.codigo_personal = SU.codigo_personal
inner join tcategor c on c.codigo_categoria = fp.codigo_categoria
inner join sys_perfil_usu pu on pu.SYSLOGIN = SU.syslogin
inner join sys_perfil p on p.sys_perfil_pk = pu.sys_perfil_pk
inner join fpersona_servicio fps on fps.codigo_personal = fp.codigo_personal
inner join servicios s on s.codigo_servicio = fps.codigo_servicio
--WHERE c.nom_categ = 'MÉDICO/A'
--AND fp.apellido1 like '%%'
order by apellido1, codigo_servicio