/*
C�digo SF: 670931 - Prestaci�n: Anticuerpos anti transportador de zinc 8 (ZNT8): - C�digo Rapela: 1033
C�digo SF: 670932 - Prestaci�n:  Listeria monocytogenes IGG - C�digo Rapela: 1104
C�digo SF: 670933 - Prestaci�n:  Listeria monocytogenes IGM - C�digo Rapela: 1105
C�digo SF: 670934 - Prestaci�n:  Aquaporina - NMO - Aquaporina 4 AC IGG- C�digo Rapela: 3853
*/

declare @prestacion varchar (100)
set @prestacion = 'Listeria monocytogenes IGM'
select @prestacion as 'Prestaci�n'

declare @codMAPEO int
set @codMAPEO = 1105
--codigo de mapeo con labo Rapela/ imag Eges
select @codMAPEO as 'CodMapeo'

declare @presItemPK int
set @presItemPK = 54746
select @presItemPK as 'PrestItemPK'


declare @MaxCatalogo int
set @MaxCatalogo = (SELECT max(catalogo_pk)+1 FROM gpc_catalogo)
select @MaxCatalogo as 'MaxCatalogo' 


declare @CatNivel int
set @CatNivel = 57
--(Ej: 15 es para tomografias / 57 es para laboratorio)
--select cat_nivel_2_pk,gc2_nombre from gpc_cat_nivel_2
select @CatNivel as 'CatNivel'


declare @MaxCatLocal int
set @MaxCatLocal = (SELECT max(cat_local_pk)+1 FROM gpc_cat_local)
select @MaxCatLocal as 'MaxCatLocal'


declare @codigo_servicio int
set @codigo_servicio = 42
--161 es Imagenes-Tomografia / 42 es Laboratorio
select @codigo_servicio as 'codigo_servicio'


