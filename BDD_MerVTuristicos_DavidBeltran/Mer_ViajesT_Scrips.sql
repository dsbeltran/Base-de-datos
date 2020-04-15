/* se cambia el tipo de datos de la matricula del autobus*/
	ALTER TABLE autobus
		ALTER COLUMN aut_matricula SET DATA TYPE varchar(30);
/**/
INSERT INTO public.autobus(

	aut_matricula, con_id, aut_modelo, aut_nplazas, aut_descripcion)
	VALUES ('M100B', 1000, 'chevrolet', 50, 'alguila dorada'),
	('M200B', 1001, 'mercedes', 50, 'corredor'),
	('M300B', 1002, 'mercedes', 50, 'corredor norte'),
	('M400B', 1003, 'volvo', 50, 'corredor sur'),
	('M500B', 1004, 'caterpilar', 50, 'Reino de quito');

/**/
INSERT INTO public.conductor(
	con_ci, con_id, con_nombre, con_telefono, con_dirreccion)
	VALUES (1718131999,0001,'David', 0979745377, 'pusuqui'),
	(1738132998,0002,'Stefano', 0959745271, 'pusuqui'),
	(1718133997,0003,'Isabel', 0972745370, 'pusuqui'),
	(1745134996,0004,'Marian', 0939742376, 'pusuqui'),
	(1728135995,0005,'Marcelo', 0969745273, 'pusuqui');
/**/
INSERT INTO public.ruta(
	rut_id, rut_recorido, rut_hora_ini, rut_hora_fin, rut_importe)
	VALUES (2001,'norte-sur','09:00:00', '13:00:00', 30,00),
	(2002,'norte-este','08:00:00', '15:00:00', 35,00),
	(2003,'sur-norte','10:00:00', '16:00:00', 32,00),
	(2004,'sur-este','05:00:00', '13:00:00', 20,00);
/**/
INSERT INTO public.viajero(
	via_id, via_ci, via_apellodo, via_nombre, via_telefono, via_totalh)
	VALUES (3000, 1787654383, 'Beltran', 'Luis', 	0984660566, 5),
	(3001, 1787654333, 'Benítez', 'Erik', 			0984340566, 15),
	(3002, 1787654283, 'Álvarez', 'Vicente', 		0943629576, 25),
	(3003, 1787654483, 'Castillo', 'Anthony', 		0983660566, 4),
	(3004, 1787652483, 'Castro', 'Christian', 		0937650576, 1),
	(3005, 1716214383, 'Contreras', 'Christopher', 	0983660566, 13),
	(3006, 1784332214, 'Díaz', 'Alex', 				0943660586, 30);
/**/
INSERT INTO public.servicios_diarios(
	serdia_id, serdia_nombre, serdia_descripcion)
	VALUES (4001, 'Baños', 'hombre mujer'),
	(4002, 'Restaurante', 'Comida tipica'),
	(4003, 'Restaurante', 'Comida rapida'),
	(4004, 'Restaurante', 'Mariscos'),
	(4005, 'Restaurante', 'Dulceria'),
	(4006, 'Restaurante', 'Heladeria');
/**/
INSERT INTO public.revision(
	rev_id, aut_matricula, rev_fecha, rev_diagnostico)
	VALUES (5000, 'M100B', '2010/12/01','aprobado'),
	(5001, 'M200B', '2011/01/01','aprobado'),
	(5002, 'M300B', '2012/06/01','reprobado'),
	(5003, 'M400B', '2013/07/01','aprobado'),
	(5004, 'M500B', '2014/03/01','aprobado'),
	(5005, 'M200B', '2015/02/01','aprobado'),
	(5006, 'M100B', '2016/04/01','aprobado'),
	(5007, 'M300B', '2017/07/01','aprobado'),
	(5008, 'M500B', '2018/10/01','aprobado');
/**/
INSERT INTO public.reparacion(
	rep_tiempo, rep_codreparacion, rev_id, rep_descripcion)
	VALUES ('00:30', 6001, 5001, 'motor'),
	('01:30', 6002, 5001, 'faros'),
	('20:00', 6003, 5002, 'carroceria'),
	('01:30', 6004, 5003, 'luces'),
	('05:30', 6005, 5004, 'pintura'),
	('10:30', 6006, 5005, 'caja de cambios'),
	('05:30', 6007, 5006, 'radiador'),
	('20:30', 6008, 5007, 'escape');
/**/
INSERT INTO public.billete(
	bil_id, rut_id, via_id, aut_matricula, bil_fecha, bil_hora)
	VALUES (70000, 2001,3000, 'M100B', '2019/11/12', '5:00'),
	(70001, 2002,3001, 'M200B', '2019/12/12', '6:00'),
	(70002, 2003,3002, 'M300B', '2019/08/13', '7:00'),
	(70003, 2004,3003, 'M200B', '2019/09/25', '7:00'),
	(70004, 2001,3004, 'M500B', '2019/10/22', '6:00'),
	(70005, 2002,3005, 'M300B', '2019/07/26', '5:00'),
	(70006, 2003,3006, 'M100B', '2019/08/10', '8:00'),
	(70007, 2004,3007, 'M300B', '2019/09/17', '10:00'),
	(70008, 2001,3001, 'M200B', '2019/10/16', '12:00'),
	(70009, 2002,3000, 'M400B', '2019/11/13', '13:00');
/**/	
INSERT INTO public.servicio_ruta(
	serrut_id, serdia_id, rut_id)
	VALUES (8000, 4001, 2001),
	(8001, 4002, 2002),
	(8002, 4003, 2003),
	(8003, 4004, 2004),
	(8004, 4005, 2001),
	(8005, 4006, 2002),
	(8006, 4001, 2003),
	(8007, 4002, 2004),
	(8009, 4003, 2001),
	(8010, 4004, 2002),
	(8011, 4005, 2003);
/**/
INSERT INTO public.lugar(
	lug_nombre, lug_hllegada, lug_actividad, lug_tparada, lug_id, rut_id)
	VALUES ('Mitad del mundo', '15:00', 'Comer', '01:30', 9001, 2001),
	('Puce', '10:00', 'Observar', '01:30', 9002, 2002),
	('Panesillo', '5:00', 'comer', '02:30', 9003, 2003),
	('Coliseo', '12:00', 'Comer', '03:30', 9004, 2004),
	('Condado', '13:00', 'Comer', '04:30', 9005, 2001),
	('Portal', '14:00', 'Comer', '03:30', 9006, 2002),
	('CCI', '16:00', 'Comer', '04:30', 9007, 2003);
/*Consulta 1*/
SELECT rut_recorido, con_nombre, bil_fecha
FROM ruta, (SELECT con_nombre, bil_fecha
				FROM conductor as C
				INNER JOIN billete as B ON(C.con_id = B.con_id)) as f
WHERE((C.con_nombre = 'Juan Pijal') and (B.via_fecha = '2019-11-01' or B.via_fecha = '2019-11-04'));

/*Consulta 2*/
SELECT c.rev_id, aut_matricula, rep_codreparacion
FROM  (SELECT rev_id, Aut.aut_matricula
		FROM revision, autobus as Aut
		WHERE(revision.aut_matricula ='M100B')) as c
INNER JOIN  reparacion as r on c.rev_id=r.rev_id;



