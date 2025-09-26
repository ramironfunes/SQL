--HONORARIOS MEDICOS FPERSONA_HONORARIOS

select *
from fpersona_honorarios
inner join dbo.fpersona ON dbo.fpersona.codigo_personal = dbo.fpersona_honorarios.codigo_personal
inner join dbo.prest_item ON dbo.prest_item.prest_item_pk = dbo.fpersona_honorarios.prest_item_pk
where dbo.fpersona.activo_sn = 0 and fphon_fhasta is null and
fpersona.codigo_personal in (2144,
673)




select distinct codigo_personal from fpersona_honorarios







nombre_corto

select * from fpersona where apellido1 like '%vadell%'




select codigo_personal, apellido1, nombre, nombre_corto, activo_sn from fpersona where nombre_corto in (x'Toma Marisol Vanesa',
x'Tawil Jose',
x'Sztejfman Matias NO USAR',
x'Spierer Rosana Carina',
x'Sasson Liliana Matilde',
x'Rodriguez Pablo Fernando',
x'Rebay Mercedes Johanna',
x'Ramos Estela Azucena',
x'Porley Carlos Sebastian',
x'Piantanida Juan Jose',
x'Perez Olivier Mauricio German',
x'Ozollo Landa Maria Carolina',
x'Negro Marcelo Daniel',
x'Manzotti Leandro Nicolas',
x'Mancuso Marcela Silvia',
x'Krause Martin',
x'Guaycochea Santiago Samuel',
x'Garretto Nelida Susana',
x'Garcia Roca Agustin',
x'Galan Mora Paula',
x'Falzone Alvaro Hernan',
x'Dubner Yael',
x'Desantadina Maria Virginia',
x'D Alessandro Marcelo Victor',
x'Cappellari Andrea Paola',
x'Busquet Natiello Laura Roxana',
x'Braslavsky Debora',
x'Angellotti Maria Florencia') order by apellido1


'DAlia Patricia', --3778


'Bello Gustavo Fabian',



select codigo_personal, apellido1, nombre, cod_perso as DNI, nombre_corto,prof_con_agen_sn,activo_sn 
from fpersona where codigo_personal in ('1440','6487')



Begin tran
update fpersona set activo_sn = 1 where codigo_personal in ('313',
'3863',
'2624',
'898',
'3171',
'3472',
'5050',
'5051',
'3793',
'350',
'673',
'2584',
'1284',
'791',
'2144',
'2582',
'2156',
'2575',
'3862',
'4024',
'1565',
'2161',
'3167',
'2641',
'723',
'2068',
'5052',
'1278',
'3778',
'1440')
Commit tran