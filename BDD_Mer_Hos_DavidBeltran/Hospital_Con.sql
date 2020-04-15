/*==============================================================*/
/* Ejercicio N1                                                 */
/*==============================================================*/
ALTER TABLE Paciente DROP COLUMN otros;
/*==============================================================*/
/* Ejercicio N2                                                 */
/*==============================================================*/
Update visita_medica
set diagnostico='Infeccion Estomacal'
where fecha_hora='2019-12-04';
/*==============================================================*/
/* Ejercicio N3                                                 */
/*==============================================================*/
select med_nombre, nombre_hospital
from medico natural join hospital
where cargo='Director'
/*==============================================================*/
/* Ejercicio N4                                                 */
/*==============================================================*/
Select med_nombre, nombre_hospital
from medico as me, hospital as ho
where me.id_hostpital=ho.id_hostpital;
/*==============================================================*/
/* Ejercicio N5                                                 */
/*==============================================================*/
Select Med_nombre, nombre_hospital, 
id_hostpital, id_pac, nombr_pac
From (medico natural join hospital)
natural join (visita_medica natural join paciente )

/*==============================================================*/
/* Ejercicio N6                                                 */
/*==============================================================*/
Select Med_nombre, serv_nombre, id_Hostpital
From (Servicio natural Join servicio_Hospital)
natural join (Medico natural join medico_trabaja )

/*==============================================================*/
/* Ejercicio N7                                                 */
/*==============================================================*/
Select Count(Fecha_Hora)
From visita_Medica
Group by id_Hostpital									 modelo_bus)
/*==============================================================*/
/* Ejercicio N8                                                 */
/*==============================================================*/
Select Count(id_serv_Hospital)
From servicio_hospital
Group by id_Hostpital;
/*==============================================================*/
/* Ejercicio N9                                                 */
/*==============================================================*/
Select Med_cod, id_serv_hospital,
med_nombre, serv_nombre
From
(medico_trabaja natural join
medico) natural join (servicio_hospital
					 natural join servicio);
