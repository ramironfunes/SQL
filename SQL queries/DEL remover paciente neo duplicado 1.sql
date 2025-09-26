select * from clientes where apellido1 like '%ZUPAN%' and nombre like '%ISAB%'


select * from codific_parto_d where codigo_cliente = '100263527'


BEGIN TRAN
DELETE FROM dbo.codific_parto_d WHERE cdfp_pk = '100006210'
COMMIT TRAN