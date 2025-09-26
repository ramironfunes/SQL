CREATE OR ALTER FUNCTION [dbo].[FN_BLOQUEQX_GET_ANESTESISTA] (@PK_CIRUGIA int)
RETURNS VARCHAR(255)
AS
BEGIN
DECLARE @RET VARCHAR(255)

IF (@PK_CIRUGIA IS NULL)

SET @RET = NULL

ELSE

IF NOT EXISTS (

select fpersona.apellido1 + ' ' + fpersona.nombre from qrf_xciru_prog qrf_xciru_prog
LEFT JOIN ci_xrec_act ci_xrec_act on ci_xrec_act.qrf_cirprog_pk = qrf_xciru_prog.qrf_cirprog_pk
left join fpersona on ci_xrec_act.ci_rec_cod = fpersona.codigo_personal
left join funcion_equipo on ci_xrec_act.ci_fnc_pk = funcion_equipo.fnc_pk
WHERE fnc_pk = 12 and qrf_xciru_prog.qrf_cirprog_pk = @PK_CIRUGIA)

SET @RET = ''

ELSE

(select @RET = fpersona.apellido1 + ' ' + fpersona.nombre from qrf_xciru_prog qrf_xciru_prog
LEFT JOIN ci_xrec_act ci_xrec_act on ci_xrec_act.qrf_cirprog_pk = qrf_xciru_prog.qrf_cirprog_pk
left join fpersona on ci_xrec_act.ci_rec_cod = fpersona.codigo_personal
left join funcion_equipo on ci_xrec_act.ci_fnc_pk = funcion_equipo.fnc_pk
WHERE fnc_pk = 12 and qrf_xciru_prog.qrf_cirprog_pk = @PK_CIRUGIA)

RETURN @RET

END