/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
create table CLIENTES (
   CLI_NOMBRE           CHAR(30)             not null,
   CLI_CALLE            CHAR(30)             not null,
   CLI_CIUDAD           CHAR(30)             not null,
   CLI_SEXO             CHAR(1)              not null,
   constraint PK_CLIENTES primary key (CLI_NOMBRE)
);

/*==============================================================*/
/* Index: CLIENTES_PK                                           */
/*==============================================================*/
create unique index CLIENTES_PK on CLIENTES (
CLI_NOMBRE
);

/*==============================================================*/
/* Table: CUENTAS                                               */
/*==============================================================*/
create table CUENTAS (
   CUE_NUMERO           CHAR(7)              not null,
   SUC_NOMBRE           CHAR(30)             not null,
   CUE_SALDO            NUMERIC(11,2)        not null,
   CUE_TIPO             CHAR(5)              not null,
   constraint PK_CUENTAS primary key (CUE_NUMERO)
);

/*==============================================================*/
/* Index: CUENTAS_PK                                            */
/*==============================================================*/
create unique index CUENTAS_PK on CUENTAS (
CUE_NUMERO
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index FK_GENERA on CUENTAS (
SUC_NOMBRE
);

/*==============================================================*/
/* Table: DEBE                                                  */
/*==============================================================*/
create table DEBE (
   PRE_NUMERO           CHAR(5)              not null,
   CLI_NOMBRE           CHAR(30)             not null
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index FK_DEBE on DEBE (
PRE_NUMERO
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index FK_DEBE2 on DEBE (
CLI_NOMBRE
);

/*==============================================================*/
/* Table: PRESTAMOS                                             */
/*==============================================================*/
create table PRESTAMOS (
   PRE_NUMERO           CHAR(5)              not null,
   SUC_NOMBRE           CHAR(30)             not null,
   PRE_IMPORTE          NUMERIC(11,2)        not null,
   PRE_FECHA            DATE                 not null,
   constraint PK_PRESTAMOS primary key (PRE_NUMERO)
);

/*==============================================================*/
/* Index: PRESTAMOS_PK                                          */
/*==============================================================*/
create unique index PRESTAMOS_PK on PRESTAMOS (
PRE_NUMERO
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index FK_CONCEDE on PRESTAMOS (
SUC_NOMBRE
);

/*==============================================================*/
/* Table: SUCURSALES                                            */
/*==============================================================*/
create table SUCURSALES (
   SUC_NOMBRE           CHAR(30)             not null,
   SUC_CUIDAD           CHAR(39)             not null,
   SUC_ACTIVO           NUMERIC(11,2)        not null,
   SUC_TELEFONO         CHAR(10)             not null,
   constraint PK_SUCURSALES primary key (SUC_NOMBRE)
);

/*==============================================================*/
/* Index: SUCURSALES_PK                                         */
/*==============================================================*/
create unique index SUCURSALES_PK on SUCURSALES (
SUC_NOMBRE
);

/*==============================================================*/
/* Table: TIENE                                                 */
/*==============================================================*/
create table TIENE (
   CLI_NOMBRE           CHAR(30)             not null,
   CUE_NUMERO           CHAR(7)              not null
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index FK_TIENE on TIENE (
CUE_NUMERO
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index FK_TIENE2 on TIENE (
CLI_NOMBRE
);

SELECT * FROM SUCURSALES;
SELECT * FROM PRESTAMOS;
SELECT * FROM CLIENTES;
SELECT * FROM CUENTAS;

SELECT * FROM TIENE;
SELECT * FROM DEBE;

/*==============================================================*/
/* Ejercicio N1                                                 */
/*==============================================================*/
ALTER TABLE SUCURSALES
  ADD  SUC_CORREOI VARCHAR(150);
/*==============================================================*/
/* Ejercicio N2                                                 */
/*==============================================================*/
ALTER TABLE CLIENTES
  ADD  CLI_ECIVIL CHAR(10);
/*==============================================================*/
/* Ejercicio N3                                                 */
/*==============================================================*/
ALTER TABLE CUENTAS
  ADD  CUE_ESTADOLOGICO CHAR(10);
/*==============================================================*/
/* Ejercicio N4                                                 */
/*==============================================================*/
create table ACTIVOS_FIJOS (
   ACTF_NOMBRE                CHAR(30)             not null,
   ACTF_COD                   CHAR(7)              not null,
   ACTF_DESCRIPCION           CHAR(7)              not null,
   ACTF_UBICA_A               CHAR(7)              not null,
   ACTF_ESTADO_U              CHAR(7)              not null
);
/*==============================================================*/
/* Ejercicio N5                                                 */
/*==============================================================*/
DELETE FROM CUENTAS;
/*==============================================================*/
/* Ejercicio N6                                                 */
/*==============================================================*/
 SELECT PRE_IMPORTE
    FROM PRESTAMOS
    ORDER BY PRE_IMPORTE ASC
    LIMIT (1);

/*==============================================================*/
/* Ejercicio N7                                                 */
/*==============================================================*/
SELECT CLI_CALLE ,CLI_NOMBRE ,CLI_CIUDAD
FROM CLIENTES,(SELECT *
                FROM CLIENTES, PRESTAMOS,DEBE
                WHERE CLIENTES.CLI_NOMBRE=DEBE.CLI_NOMBRE AND PRESTAMOS.PRE_NUMERO = DEBE.PRE_NUMERO
              ) AS P
WHERE P.PRE_IMPORTE>500;
/*==============================================================*/
/* Ejercicio N8                                                 */
/*==============================================================*/
SELECT COUNT(CUE_NUMERO)
FROM CUENTAS;
SELECT COUNT(PRE_NUMERO)
FROM PRESTAMOS;

SELECT SUC_NOMBRE
FROM SUCURSALES
WHERE   (SELECT COUNT(CUE_NUMERO)FROM CUENTAS)
    	<
        (SELECT COUNT(PRE_NUMERO)FROM PRESTAMOS);

/*==============================================================*/
/* Ejercicio N9                                                 */
/*==============================================================*/
ALTER TABLE CLIENTES
  ADD  CLI_ASTER CHAR(1);

SELECT CLI_ASTER
FROM (SELECT COUNT(CLI_NOMBRE, CUE_NUMERO)
        FROM (SELECT CLIENTES.cli_nombre, CUENTAS.CUE_NUMERO 
                FROM CLIENTES, CUENTAS, TIENE
                WHERE(CLIENTES.CLI_NOMBRE = DEBE.CLI_NOMBRE AND CUENTAS.CUE_NUMERO=DEBE.CUE_NUMERO)))

INSERT INTO CLIENTES(CLI_ASTER)
	VALUES ('*');

/*==============================================================*/
/* Ejercicio N10                                                */
/*==============================================================*/
DELETE FROM CUENTAS
	WHERE CUE_SALDO<100;
/*==============================================================*/
/* Ejercicio N11                                                */
/*==============================================================*/
DELETE CLI_NOMBRE
    FROM CLIENTES,DEBE,PRESTAMOS, (    SELECT CLIENTES.CLI_NOMBRE
                                        FROM CLIENTES, DEBE , PRESTAMOS
                                        WHERE(CLIENTES.CLI_NOMBRE=DEBE.CLI_NOMBRE AND PRESTAMOS.PRE_NUMERO=DEBE.PRE_NUMERO))AS P
	WHERE CLI_CIUDAD= 'GUAYAQUIL' AND (SELECT COUNT(CLI_NOMBRE) FROM P)<2 ;
    
