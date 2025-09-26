/*Médicos y enfermeros*/
select b.nombre_corto, d.nom_categ,  count (*) as Total
from MEAP a
inner join fpersona b on a.profesional_registro = b.codigo_personal
inner join be_encuentro c on c.encuentro_pk = a.encuentro_pk
inner join tcategor d on d.codigo_categoria = b.codigo_categoria
where 
c.encuentro_tipo_pk = 2 /*Filtra por encuentros de CCEE*/ 
and
b.nombre_corto NOT IN (
'Acosta Adys Dimarys',
'Cuadro Alvaro',
'FLORES JULIO',
'Kojro Nicolas',
'Navas Hernan',
'Rubio Adrian Alberto',
'Bonugli Ximena',
'Rodriguez Fernandez Daniel',
'Clana German Pablo',
'Korniejczuk Nestor'
)
and
CAST (a.fecha_registro as Date) = '05/11/2019' 
Group by b.nombre_corto, d.nom_categ



/*Recepcionistas*/
select b.nombre_corto, count (*) from infor_cagendas a
inner join fpersona b ON b.codigo_personal = a.codigo_personal
where
b.nombre_corto NOT IN (
'Acosta Adys Dimarys',
'Cuadro Alvaro',
'FLORES JULIO',
'Kojro Nicolas',
'Navas Hernan',
'Rubio Adrian Alberto',
'Bonugli Ximena',
'Mailhes Jorge Mariano',
'Ruiz Reina Fernando',
'Rodriguez Fernandez Daniel'
)
and CAST (a.fecha as DATE) = '05/11/2019'
Group by b.nombre_corto