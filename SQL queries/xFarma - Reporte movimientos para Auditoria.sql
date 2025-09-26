SELECT mov_almacen_cab.mov_cab_pk,
CAST(mov_almacen_cab.mov_fecha_con AS DATE) AS FECHA_MOV, -- Agregado 21/02/2022: columna fecha
alm_articulos_mc.cod_bar_mc_pr AS CODIGO_ART, alm_articulos_mc.art_mc_nom AS ARTICULO,
/*CASE
WHEN mov_almacen_cab.mot_tipo_pk IN (11,12,13,16,17,18,22,24) THEN CONCAT('-', sum(mov_almacen_lin.mov_cantidad))
WHEN mov_almacen_cab.mov_pk_entrada IS NULL AND mov_almacen_cab.mov_pk_salida = 1 AND mov_almacen_cab.mot_tipo_pk = 26 THEN CONCAT('-', sum(mov_almacen_lin.mov_cantidad))
ELSE sum(mov_almacen_lin.mov_cantidad) END AS CANTIDAD, ' ', */
CASE
WHEN mov_almacen_cab.mot_tipo_pk IN (11,12,13,16,17,18,22,24) THEN CONCAT('-', (mov_almacen_lin.mov_cantidad))
WHEN mov_almacen_cab.mov_pk_entrada IS NULL AND mov_almacen_cab.mov_pk_salida = 1 AND mov_almacen_cab.mot_tipo_pk = 26 THEN CONCAT('-', (mov_almacen_lin.mov_cantidad))
ELSE (mov_almacen_lin.mov_cantidad) END AS CANTIDAD, ' ', 
mov_almacen_lin.mov_cantidad as Cantidad_2,
mov_tipo_mov.mot_tipo_deno AS MOTIVO, ' ',
CASE
WHEN mov_almacen_cab.mot_tipo_pk IN (11,12,13,16,17,18) THEN alm_und_consumos.uc_deno
WHEN mov_almacen_cab.mot_tipo_pk NOT IN (11,12,13,16,17,18) AND mov_almacen_cab.mov_pk_entrada IS NULL THEN (SELECT alm_almacenes.almacen_deno FROM alm_almacenes WHERE alm_almacenes.almacen_pk = mov_almacen_cab.mov_pk_salida)
ELSE (SELECT alm_almacenes.almacen_deno FROM alm_almacenes WHERE alm_almacenes.almacen_pk = mov_almacen_cab.mov_pk_entrada) END as 'ORIGEN',
--(SELECT alm_almacenes.almacen_deno FROM alm_almacenes WHERE alm_almacenes.almacen_pk = mov_almacen_cab.mov_pk_entrada) as ORIGEN_2,
CASE
WHEN mov_almacen_cab.mot_tipo_pk IN (3,6,7) THEN alm_und_consumos.uc_deno
WHEN mov_almacen_cab.mot_tipo_pk = 26 THEN 'AJUSTE INVENTARIO'
WHEN mov_almacen_cab.mot_tipo_pk IN (21,23) THEN far_centros.cnt_nombre --PRESTAMOS A CENTROS
WHEN mov_almacen_cab.mot_tipo_pk = 27 THEN clientes.nombre + ' ' + clientes.apellido1 --PRESTAMOS A PACIENTES
WHEN mov_almacen_cab.mot_tipo_pk IN (11,12,13,16,17,18) THEN 'DEVOLUCION'
WHEN mov_almacen_cab.mot_tipo_pk IN (22,24) THEN 'DEVOLUCION (PRESTAMO RECIBIDO)'
ELSE ( SELECT alm_almacenes.almacen_deno FROM alm_almacenes WHERE alm_almacenes.almacen_pk = mov_almacen_cab.mov_pk_salida ) END AS DESTINO,
cla_usuarios.usu_login as 'Usuario',
cla_usuarios.nombre_usu as 'Descripcion Usuario'
FROM mov_almacen_cab
INNER JOIN mov_tipo_mov ON mov_almacen_cab.mot_tipo_pk = mov_tipo_mov.mot_tipo_pk
INNER JOIN mov_almacen_lin ON mov_almacen_cab.mov_cab_pk = mov_almacen_lin.mov_cab_pk
INNER JOIN alm_articulos_mc ON alm_articulos_mc.cod_art_mc_pk = mov_almacen_lin.cod_art_mc_pk
INNER JOIN catp_articulos ON catp_articulos.catp_articulos_pk = alm_articulos_mc.catp_articulos_pk
LEFT JOIN alm_und_consumos ON alm_und_consumos.uc_pk = mov_almacen_cab.uc_pk
LEFT JOIN alm_almacenes ON alm_almacenes.almacen_pk = mov_almacen_cab.almacen_pk
LEFT JOIN far_centros ON mov_almacen_cab.mov_pk_salida = far_centros.cnt_pk
LEFT JOIN clientes ON mov_almacen_cab.mov_pk_salida = clientes.codigo_cliente
LEFT JOIN cla_usuarios ON cla_usuarios.usuario_pk = mov_almacen_cab.movc_usu_pk
WHERE mov_almacen_cab.mov_fecha_con IS NOT NULL
AND ( ( mov_almacen_cab.mov_pk_entrada = 1 AND mov_almacen_cab.mot_tipo_pk <> 13 ) OR (mov_almacen_cab.mov_pk_entrada IS NULL AND mov_almacen_cab.mov_pk_salida = 1 AND mov_almacen_cab.mot_tipo_pk = 26) OR ( mov_almacen_cab.mov_pk_salida = 1 AND mov_almacen_cab.mot_tipo_pk = 13 ) )
AND ( mov_almacen_cab.mov_anulado_sn IS NULL OR mov_almacen_cab.mov_anulado_sn = 0 )
AND mov_tipo_mov.mot_tipo_pk NOT IN (1,25)
AND mov_almacen_cab.mov_fecha_con <= GETDATE()
--AND mov_almacen_cab.mov_fecha_con = '20220614'
AND mov_almacen_cab.mov_fecha_con between '20220101' and '20220430'
--AND alm_articulos_mc.cod_bar_mc_pr = '54692X1'
--and mov_almacen_cab.mot_tipo_pk = 26
--and mov_almacen_cab.mov_cab_pk = '47613212'
/*GROUP BY mov_almacen_cab.mov_cab_pk,alm_articulos_mc.cod_bar_mc_pr, alm_articulos_mc.art_mc_nom, mov_almacen_cab.uc_pk, alm_und_consumos.uc_deno,
alm_almacenes.almacen_deno, mov_almacen_cab.mot_tipo_pk, mov_almacen_cab.mov_pk_salida,
mov_almacen_cab.mov_fecha_con, mov_tipo_mov.mot_tipo_deno, mov_tipo_mov.mot_tipo_pk, mov_almacen_cab.mov_pk_entrada,
mov_almacen_cab.almacen_pk, far_centros.cnt_nombre, clientes.nombre, clientes.apellido1,cla_usuarios.usu_login,cla_usuarios.nombre_usu */

order by 1,2