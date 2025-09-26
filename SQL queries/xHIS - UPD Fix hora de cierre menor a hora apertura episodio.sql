BEGIN TRAN
update episodios set epis_cierre_hora = '1900-01-01 13:55:00.000' where epis_pk = 102241057
COMMIT TRAN