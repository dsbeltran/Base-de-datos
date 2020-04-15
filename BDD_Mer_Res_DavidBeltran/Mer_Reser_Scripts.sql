/*Ingreso de datos FACULTAD*/

    INSERT INTO public.facultad(
	fac_cod, fac_nombre, fac_descrip)
	VALUES (1001, 'Ingenieria', 'Ingenieria en SI, TI y Civil'),
	(1002, 'Arquitectura y Diseño', 'Arquitectura, Diseño grafico y de productos'),
	(1003, 'Medicina', 'Medicina'),
	(1004, 'Jurisprudencia', 'Derecho'),
	(1005, 'Psicología', 'Psicología y Psicología Clinica');

/*Cambio de tipo de datos del atributo nombres en la tabla INVESTIGADOR*/

    ALTER TABLE investigador
    ALTER COLUMN inv_nombres SET DATA TYPE varchar(30);

/*Ingreso de datos INVESTIGADOR*/
	
    INSERT INTO public.investigador(
	inv_ci, inv_id, fac_cod, inv_nombres, inv_edad, inv_aexinvesti)
	VALUES (1718139991, 001,1001 ,'Dr. Lemay A. Valdés Amador' , 30, 3),
	(1719139799, 002,1001 ,'Dr. José A. Oliva Rodríguez' , 35, 5),
	(1728139291, 003,1001 ,'Dr. Orlando Díaz Mitjans', 40, 7),
	(1718339992, 004,1002 ,'Dra. Blanca R. Manzano Ovies', 43, 7),
	(1712139391, 005,1002 ,'Dra. María Luisa Hdez. Méndez', 32, 1),
	(1752139795, 006,1003 ,'Dra. Ileana Chio Naranjo', 55, 10),
	(1778132991, 007,1003 ,'Viviam de la Caridad Ramírez Díaz', 42, 6),
	(1748139391, 008,1004 ,'Dr. Nelson Rodríguez Hidalgo ', 37, 4),
	(1718139396, 009,1005 ,'Dr. Miguel Sarduy Nápoles', 39, 3),
	(1778132391, 010,1005 ,'Dra. Georgina Areces Delgado', 40, 7),
    (1798139991, 011,1005 ,'Dra. Georgina Areces Delgado ' , 35, 5),
	(1789139799, 012,1004 ,'Dr. Jorge Peláez Mendoza' , 55, 4),
	(1778139291, 013,1004 ,'Dr. Osvaldo Santana Bacallao', 54, 7),
	(1768339992, 014,1003 ,'Dr. Raimundo Capote Arce ', 60, 9),
	(1752139391, 015,1002 ,'Dra. Georgina Álvarez Medina', 53, 7),
	(1742139795, 016,1002 ,'Dr. Venancio Vera Fernández', 45, 5),
	(1738132991, 017,1001 ,'Dr. Luis Ernesto Formoso Martín', 47, 6),
	(1728139391, 018,1001 ,'Dr. Alfredo Nodarse Rodríguez', 57, 5),
	(1718139396, 019,1002 ,'Dra. Lourdes Carrillo Bermúdez', 49, 8),
	(1708132391, 020,1001 ,'Dra. Itsel Cárdenas Ramón ', 41, 9);

/*Ingreso de EQUIPO*/

    INSERT INTO public.equipo(
	equ_nserie, fac_cod, equ_nombre, equ_estado)
	VALUES (2000, 1001, 'PC', 'No Reservado'),
	(2002, 1001, 'Electrolitos', 'No Reservado'),
	(2003, 1001, 'Robots', 'No Reservado'),
	(2004, 1002, 'Impresora', 'No Reservado'),
	(2005, 1002, 'Ploters', 'No Reservado'),
	(2006, 1002, 'Multimedia', 'No Reservado'),
	(2007, 1003, 'Monitor cardiaco', 'No Reservado'),
	(2008, 1003, 'Dispensadores de medicamentos', 'No Reservado'),
	(2009, 1003, 'Balanza', 'No Reservado'),
	(2010, 1004, 'Proyector', 'No Reservado'),
	(2011, 1004, 'Apuntador', 'No Reservado'),
	(2012, 1004, 'Pizarra Inteligente', 'No Reservado'),
	(2013, 1005, 'Camara', 'No Reservado'),
	(2014, 1005, 'Laptop', 'No Reservado'),
	(2015, 1005, 'Laptop', 'No Reservado');

/*Se Modificara el estado de 5 equipos*/

    UPDATE public.equipo
	SET equ_estado='Reservado'
	WHERE equ_nserie=2003;
    UPDATE public.equipo
	SET equ_estado='Reservado'
	WHERE equ_nserie=2006;
    UPDATE public.equipo
	SET equ_estado='Reservado'
	WHERE equ_nserie=2009;
    UPDATE public.equipo
	SET equ_estado='Reservado'
	WHERE equ_nserie=2012;
    UPDATE public.equipo
	SET equ_estado='Reservado'
	WHERE equ_nserie=2015;

/*Ingreso de RESERVA*/

    INSERT INTO public.reserva(
	res_fini, res_ffin, res_id, inv_id, equ_nserie)
	VALUES ('17/11/2019', '19/11/2019', 3000, 001, 2003),
	('16/11/2019', '18/11/2019', 3001, 003, 2006),
	('10/11/2019', '20/11/2019', 3002, 001, 2009),
	('11/11/2019', '22/11/2019', 3003, 014, 2012),
	('12/11/2019', '24/11/2019', 3004, 019, 2015);


/*Ver Datos de Equipo*/

    SELECT * FROM equipo;

/*Ver Datos de Facultad*/

    SELECT * FROM facultad;

/*Ver Datos de Investigador*/

    SELECT * FROM investigador;

/*Ver Datos de Reserva*/

    SELECT * FROM reserva;
/*6.       Una vez ingresados los datos realizar las siguientes operaciones y consultas de datos:

  6.1   Obtener el número de cédula y nombre de los investigadores que han realizado más de una reserva.*/

    SELECT inv_ci, inv_nombres
    FROM public.investigador
    WHERE inv_id = 
	    (
		    SELECT inv_id FROM public.reserva
	 	    GROUP BY inv_id
     	    HAVING COUNT(*)>1
	    );
/* DE OTRA FORMA*/
  	SELECT inv_ci, inv_nombres
    FROM public.investigador AS I
	JOIN public.reserva AS R ON
	I.inv_id=R.inv_id
	GROUP BY I.inv_id
	HAVING COUNT(*)>1;
    
/*6.2   Obtener un listado completo de reservas, en el que se incluyan el número de cédula, el nombre del investigador y la facultad 
        donde trabaja.*/

        SELECT inv_ci, inv_nombres, fac_nombre
		FROM public.reserva
		INNER JOIN public.investigador
		ON reserva.inv_id = investigador.inv_id
		INNER JOIN public.facultad
		ON facultad.fac_cod = investigador.fac_cod;

/*6.3   Listado de los equipos con el nombre de cada facultad y el control si está o no reservado.*/

        SELECT equ_nombre, fac_nombre, equ_estado
		FROM public.equipo
		INNER JOIN public.facultad
		ON equipo.fac_cod = facultad.fac_cod;

/*6.4   Listado con el número de cédula y nombre de los investigadores,   la facultad a la que pertenecen, nombre del equipo si han 
        reservado, con la fecha de inicio y finalización de la reserva. (este reporte es solo para los investigadores que han reservado 
        equipos)*/

        SELECT inv_ci, inv_nombres, fac_nombre, equ_nombre, res_fini, res_ffin
		FROM public.reserva
		INNER JOIN public.investigador
		ON reserva.inv_id = investigador.inv_id
		INNER JOIN public.facultad
		ON facultad.fac_cod = investigador.fac_cod
		INNER JOIN public.equipo
		ON reserva.equ_nserie = equipo.equ_nserie;

/*6.5   Listado con el número de cédula y nombre de los investigadores que han reservado equipos que no son de su facultad.*/

        SELECT inv_ci, inv_nombres, equ_nombre
		FROM public.reserva
		INNER JOIN public.investigador
		ON reserva.inv_id = investigador.inv_id
		INNER JOIN public.equipo
		ON reserva.equ_nserie = equipo.equ_nserie
		INNER JOIN public.facultad
		ON facultad.fac_cod = investigador.fac_cod AND facultad.fac_cod != equipo.fac_cod;

/*   Obtener el número de serie y nombre de los equipos que nunca han sido reservados.*/

        SELECT equ_nserie,equ_nombre
        FROM public.equipo
        WHERE equ_estado!='Reservado';

        SELECT equ_nserie,equ_nombre
        FROM public.equipo NO EXISTS
        SELECT * FROM reserva;
