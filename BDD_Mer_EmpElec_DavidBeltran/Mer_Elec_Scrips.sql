Create Database Eletricidad
use Eletricidad
create table CENTRAL_HIDROELECTRICA
(
   CH_OCUPACION         numeric(30) not null,
   CH_CAPACIDADMAXIMA   numeric(50) not null,
   CH_NTURBINAS         numeric(60) not null,
   CH_ID                numeric(50) not null,
   PRB_NOMBRE           varchar(40),
   primary key (CH_ID)
);
create table CENTRAL_NUCLEAR
(
   CN_NREACTORES        numeric(30,0) not null,
   CN_VOLPLUTONIO       numeric(30,0) not null,
   CN_RESIDUOSNUC       numeric(30,0) not null,
   CN_ID                numeric(30,0) not null,
   PRB_NOMBRE           varchar(40),
   primary key (CN_ID)
);
/*==============================================================*/
/* Table: CENTRAL_TERMICA                                       */
/*==============================================================*/
create table CENTRAL_TERMICA
(
   CT_NHORNOS           numeric(60,0) not null,
   CT_VCARBON           numeric(60,0) not null,
   CT_VEMISIONGAS       numeric(60,0) not null,
   CT_ID                numeric(30,0) not null,
   PRB_NOMBRE           varchar(40),
   primary key (CT_ID)
);

/*==============================================================*/
/* Table: COMPANIA                                              */
/*==============================================================*/
create table COMPANIA
(
   COM_NOMBRE           varchar(30) not null,
   RED_NUMERO           numeric(60,0),
   primary key (COM_NOMBRE)
);

/*==============================================================*/
/* Table: ESTACION_PRIMARIA                                     */
/*==============================================================*/
create table ESTACION_PRIMARIA
(
   ESPR_NOMBRE          varchar(40) not null,
   ESPR_NTRANSFORMADORESBAJA numeric(30,0) not null,
   ESPR_NTRANSFORMADORESALTA numeric(30,0) not null,
   primary key (ESPR_NOMBRE)
);

/*==============================================================*/
/* Table: LINEA                                                 */
/*==============================================================*/
create table LINEA
(
   LIN_NUMSEC           numeric(40,0) not null,
   RED_NUMERO           numeric(65,0),
   LIN_LONG             numeric(30,0) not null,
   primary key (LIN_NUMSEC)
);

/*==============================================================*/
/* Table: PORTE                                                 */
/*==============================================================*/
create table PORTE
(
   POR_TOTAL_VENTA      numeric(30,0) not null,
   POR_ID               numeric(30,0) not null,
   CN_ID                numeric(30,0),
   SUM_ID               numeric(15,0),
   TRA_NOMBRE           varchar(10),
   primary key (POR_ID)
);

/*==============================================================*/
/* Table: PRODUCTOR_BASICO                                      */
/*==============================================================*/
create table PRODUCTOR_BASICO
(
   PRB_NOMBRE           varchar(40) not null,
   PRB_FECHA            date not null,
   PRB_PRODUCION_MEDIA  numeric(60,0) not null,
   PRB_PROCUCIONMAXIMA  numeric(60,0) not null,
   primary key (PRB_NOMBRE)
);

/*==============================================================*/
/* Table: PROVEE                                                */
/*==============================================================*/
create table PROVEE
(
   PROVEE_ID            numeric(60,0) not null,
   ESPR_NOMBRE          varchar(40),
   PRB_NOMBRE           varchar(40),
   primary key (PROVEE_ID)
);

/*==============================================================*/
/* Table: PROVINCIA                                             */
/*==============================================================*/
create table PROVINCIA
(
   PRO_CODIGO           numeric(60,0) not null,
   PRO_NOMBRE           varchar(40) not null,
   primary key (PRO_CODIGO)
);

/*==============================================================*/
/* Table: RED                                                   */
/*==============================================================*/
create table RED
(
   RED_NUMERO           numeric(60,0) not null,
   ESPR_NOMBRE          varchar(40),
   primary key (RED_NUMERO)
);

/*==============================================================*/
/* Table: SUBESTACION                                           */
/*==============================================================*/
create table SUBESTACION
(
   SUB_NOMBRE           varchar(40) not null,
   SUB_ID               numeric(30,0) not null,
   LIN_NUMSEC           numeric(40,0),
   primary key (SUB_ID)
);

/*==============================================================*/
/* Table: SUMINISTRADOR                                         */
/*==============================================================*/
create table SUMINISTRADOR
(
   SUM_NOMBRE           varchar(20) not null,
   SUM_PAIS             varchar(10) not null,
   SUM_ID               numeric(15,0) not null,
   primary key (SUM_ID)
);

/*==============================================================*/
/* Table: TIENE                                                 */
/*==============================================================*/
create table TIENE
(
   TIE_ID               numeric(30,0) not null,
   SUB_ID               numeric(30,0),
   ZDS_ID               numeric(30,0),
   primary key (TIE_ID)
);

/*==============================================================*/
/* Table: TRANSPORTISTA                                         */
/*==============================================================*/
create table TRANSPORTISTA
(
   TRA_NOMBRE           varchar(10) not null,
   TRA_MATRICULA        numeric(15,0) not null,
   primary key (TRA_NOMBRE)
);

/*==============================================================*/
/* Table: ZONA_DE_SERVICIO                                      */
/*==============================================================*/
create table ZONA_DE_SERVICIO
(
   ZDS_CONSUMOMEDIO     numeric(30,0) not null,
   ZDS_NCONSUMIDORFINAL numeric(50,0) not null,
   ZDS_CATEGORIA        varchar(40) not null,
   ZDS_ID               numeric(30,0) not null,
   PRO_CODIGO           numeric(60,0),
   primary key (ZDS_ID)
);

SELECT PRO_NOMBRE FROM provincia;
SELECT RED_NUMERO FROM red;
SELECT ESPR_NOMBRE FROM estacion_primaria;
SELECT PRB_NOMBRE FROM productor_basico;

SELECT PRB_NOMBRE, PRB_FECHA, CH_NTURBINAS
		FROM productor_basico as PB
		INNER JOIN central_hidroelectrica as CH
		ON PB.PRB_NOMBRE = CH.PRB_NOMBRE;
        
SELECT PRB_NOMBRE, PRB_FECHA, CN_NRACTORES
		FROM productor_basico as PB
		INNER JOIN central_nuclear as CN
		ON PB.PRB_NOMBRE = CN.PRB_NOMBRE;
        
SELECT PRB_NOMBRE, PRB_FECHA, CS_TIPO
		FROM productor_basico as PB
		INNER JOIN central_solar as CS
		ON PB.PRB_NOMBRE = CS.PRB_NOMBRE;