BEGIN TRAN
UPDATE dbo.fact_diferida
SET factdif_fecha_fin = '20220414'
	, factdif_hora_fin = '14:25'
	, factdif_estado = 'FIN_CORRECTO'
WHERE factdif_pk = 86771
COMMIT TRAN