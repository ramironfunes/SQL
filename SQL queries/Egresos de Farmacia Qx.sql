--QUERY OK: GC7_MX

SELECT CAST(mov_almacen_cab.mov_fecha_con AS DATE) AS FECHA_MOV, 
CAST(FORMAT(mov_almacen_cab.mov_h_salida, 'hh:mm:ss') AS TIME) AS HORA,
alm_articulos_mc.cod_bar_mc_pr AS CODIGO_ART, alm_articulos_mc.art_mc_nom AS ARTICULO, 
CASE 
    WHEN mov_almacen_cab.mot_tipo_pk IN (11,12,13,16,17,18,22,24) THEN CONCAT('-', mov_almacen_lin.mov_cantidad)
ELSE mov_almacen_lin.mov_cantidad END AS CANTIDAD, '     ',
mov_tipo_mov.mot_tipo_deno AS MOTIVO, '     ',
CASE 
    WHEN mov_almacen_cab.mot_tipo_pk IN (3,6,7) THEN alm_und_consumos.uc_deno
    WHEN ( mov_almacen_cab.mot_tipo_pk = 26 AND mov_almacen_cab.mov_pk_salida IS NULL ) THEN 'AJUSTE INVENTARIO'
    WHEN mov_almacen_cab.mot_tipo_pk IN (21,23) THEN 'Centro ' + far_centros.cnt_nombre --PRESTAMOS A CENTROS
    WHEN mov_almacen_cab.mot_tipo_pk = 27 THEN clientes.nombre + ' ' + clientes.apellido1 --PRESTAMOS A PACIENTES
    WHEN mov_almacen_cab.mot_tipo_pk IN (11,12,13,16,17,18) THEN 'DEVOLUCION'
    WHEN mov_almacen_cab.mot_tipo_pk IN (22,24) THEN 'DEVOLUCION (PRESTAMO RECIBIDO)'
ELSE ( SELECT alm_almacenes.almacen_deno FROM alm_almacenes WHERE alm_almacenes.almacen_pk = mov_almacen_cab.mov_pk_salida ) END AS DESTINO,
(clientes.apellido1 + ' ' + clientes.nombre) AS PACIENTE,
hc.nhc,
garantes.nombre_garante AS FINANCIADOR,
fpersona.nombre + ' ' + fpersona.apellido1 AS CIRUJANO,
(select [dbo].[FN_BLOQUEQX_GET_ANESTESISTA] (qrf_xciru_prog.qrf_cirprog_pk)) as 'ANESTESISTA',
actividad.act_descripcion AS PROCEDIMIENTO,
cla_usuarios.nombre_usu AS AUTOR_MOVIMIENTO,
CASE
    WHEN clientes.codigo_cliente IS NULL THEN ' '
ELSE (  SELECT quirofano.qrf_desc FROM quirofano
        INNER JOIN qrf_xciru_prog ON qrf_xciru_prog.qrf_pk = quirofano.qrf_pk
        INNER JOIN actividad ON actividad.actividad_pk = qrf_xciru_prog.actividad_pk
        WHERE actividad.actividad_pk = ingesta.actividad_pk ) END AS QX
FROM mov_almacen_cab
INNER JOIN mov_tipo_mov ON mov_almacen_cab.mot_tipo_pk = mov_tipo_mov.mot_tipo_pk
INNER JOIN mov_almacen_lin ON mov_almacen_cab.mov_cab_pk = mov_almacen_lin.mov_cab_pk
INNER JOIN alm_articulos_mc ON alm_articulos_mc.cod_art_mc_pk = mov_almacen_lin.cod_art_mc_pk
INNER JOIN catp_articulos ON catp_articulos.catp_articulos_pk = alm_articulos_mc.catp_articulos_pk
LEFT JOIN alm_und_consumos ON alm_und_consumos.uc_pk = mov_almacen_cab.uc_pk
LEFT JOIN alm_almacenes ON alm_almacenes.almacen_pk = mov_almacen_cab.almacen_pk
LEFT JOIN far_centros ON mov_almacen_cab.mov_pk_salida = far_centros.cnt_pk
LEFT JOIN clientes ON mov_almacen_lin.paciente_pk = clientes.codigo_cliente
LEFT JOIN hc ON hc.codigo_cliente = clientes.codigo_cliente
LEFT JOIN ingresos ON ingresos.codigo_cliente = clientes.codigo_cliente
LEFT JOIN episodios ON episodios.referencia_id = ingresos.cod_ingreso_pk
LEFT JOIN far_det_pac_car ON far_det_pac_car.mov_alma_linpk = mov_almacen_lin.mov_alma_linpk
LEFT JOIN pagadores ON pagadores.cod_pagador_pk = ingresos.cod_pagador_pk
LEFT JOIN garantes ON garantes.codigo_garante_pk = pagadores.codigo_garante_pk
LEFT JOIN ingesta ON ingesta.ingta_pk = far_det_pac_car.fdpc_ingta_pk
LEFT JOIN fpersona ON ingesta.codigo_personal = fpersona.codigo_personal
LEFT JOIN actividad ON actividad.actividad_pk = ingesta.actividad_pk
LEFT JOIN qrf_xciru_prog ON qrf_xciru_prog.actividad_pk = actividad.actividad_pk
INNER JOIN cla_usuarios ON cla_usuarios.usuario_pk = mov_almacen_lin.movl_usu_pk
LEFT JOIN ci_xrec_act ci_xrec_act on ci_xrec_act.qrf_cirprog_pk = qrf_xciru_prog.qrf_cirprog_pk
LEFT JOIN funcion_equipo on ci_xrec_act.ci_fnc_pk = funcion_equipo.fnc_pk
WHERE mov_almacen_cab.mov_fecha_con IS NOT NULL
AND ( ( mov_almacen_cab.mov_pk_entrada = 7 AND mov_almacen_cab.mot_tipo_pk <> 13 ) OR ( mov_almacen_cab.mov_pk_salida = 7 AND mov_almacen_cab.mot_tipo_pk = 13 ) )
AND ( mov_almacen_cab.mov_anulado_sn IS NULL OR mov_almacen_cab.mov_anulado_sn = 0 )
AND mov_tipo_mov.mot_tipo_pk NOT IN (1,25)
AND ( hc.nhc IS NULL OR hc.activa_sn = 1 )
AND ( alm_almacenes.almacen_pk IS NULL OR alm_almacenes.alm_arm_elect = 0 )
GROUP BY mov_almacen_cab.mov_fecha_con, mov_almacen_cab.mov_h_salida, alm_articulos_mc.cod_bar_mc_pr, alm_articulos_mc.art_mc_nom, mov_almacen_cab.uc_pk, alm_und_consumos.uc_deno, 
mov_almacen_lin.mov_cantidad,
alm_almacenes.almacen_deno, mov_almacen_cab.mot_tipo_pk, mov_almacen_cab.mov_pk_salida,
 mov_tipo_mov.mot_tipo_deno, mov_tipo_mov.mot_tipo_pk, mov_almacen_cab.mov_pk_entrada,
mov_almacen_cab.almacen_pk, far_centros.cnt_nombre, clientes.nombre, clientes.apellido1,
hc.nhc, garantes.nombre_garante, fpersona.nombre, fpersona.apellido1, actividad.act_descripcion, cla_usuarios.nombre_usu,
clientes.codigo_cliente, actividad.actividad_fecha, actividad.actividad_pk, ingesta.actividad_pk, qrf_xciru_prog.qrf_cirprog_pk
ORDER BY mov_almacen_cab.mov_fecha_con, mov_almacen_cab.mov_h_salida ASC