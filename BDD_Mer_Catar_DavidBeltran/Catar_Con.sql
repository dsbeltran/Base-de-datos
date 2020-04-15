/*==============================================================*/
/* Ejercicio N1                                                 */
/*==============================================================*/
/*==============================================================*/
/* Ejercicio N2                                                 */
/*==============================================================*/
Select id_ruta, ruta_nombre, luga_actividad 
From ruta 
Natural Join lugar;
/*==============================================================*/
/* Ejercicio N3                                                 */
/*==============================================================*/
Select count(id_lugar), ruta_nombre 
From ruta
Group by id_ruta
/*==============================================================*/
/* Ejercicio N4                                                 */
/*==============================================================*/
Select autobus_id, id_revision, re_diagnostico 
From autobus
natural join revision 
/*==============================================================*/
/* Ejercicio N5                                                 */
/*==============================================================*/
Select Count(autobus_id) 
From autobus as au
natural join revision as rev
where rev.re_diagnostico='Perfecto estado';
/*==============================================================*/
/* Ejercicio N6                                                 */
/*==============================================================*/
Select Count(id_pasajero)>1 
from billete
group by (id_pasajero);
/*==============================================================*/
/* Ejercicio N7                                                 */
/*==============================================================*/
Select id_servicio_diaro, ser_dia, com_nombre, 
autobus_id, mod_fabricante, ruta_nombre, id_viaje
From viaje as v 
Natural JOIN servicio_diario natural join ruta 
Natural Join conductor natural Join (autobus natural join
									 modelo_bus)
/*==============================================================*/
/* Ejercicio N8                                                 */
/*==============================================================*/
Select Count (com_nombre)
From viaje as v 
natural JOIN conductor 
natural join servicio_diario
where 
ser_dia!='2019-12-05'