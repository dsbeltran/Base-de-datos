/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     16/12/2019 4:14:35                           */
/*==============================================================*/

/*==============================================================*/
/* Table: AUTOBUS                                               */
/*==============================================================*/
create table AUTOBUS (
   AUT_ID               NUMERIC(15)          not null,
   MOD_ID               NUMERIC(15)          not null,
   constraint PK_AUTOBUS primary key (AUT_ID)
);

/*==============================================================*/
/* Index: AUTOBUS_PK                                            */
/*==============================================================*/
create unique index AUTOBUS_PK on AUTOBUS (
AUT_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on AUTOBUS (
MOD_ID
);

/*==============================================================*/
/* Table: BILLETE                                               */
/*==============================================================*/
create table BILLETE (
   BILL_HORADSALIDA     TIME                 not null,
   BILL_HORADLLEGADA    TIME                 not null,
   BILL_ID              NUMERIC(15)          not null,
   PAS_ID               NUMERIC(15)          not null,
   VIA_ID               NUMERIC(15)          not null,
   SER_ID               NUMERIC(15)          not null,
   constraint PK_BILLETE primary key (BILL_ID)
);

/*==============================================================*/
/* Index: BILLETE_PK                                            */
/*==============================================================*/
create unique index BILLETE_PK on BILLETE (
BILL_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on BILLETE (
PAS_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on BILLETE (
VIA_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on BILLETE (
SER_ID
);

/*==============================================================*/
/* Table: CONDUCTOR                                             */
/*==============================================================*/
create table CONDUCTOR (
   CON_ID               NUMERIC(15)          not null,
   CON_TELEFONO         NUMERIC(15)          not null,
   CON_CEDULA           NUMERIC(15)          not null,
   CON_NOMBRES          VARCHAR(40)          not null,
   CON_DIRRECION        VARCHAR(30)          not null,
   constraint PK_CONDUCTOR primary key (CON_ID)
);

/*==============================================================*/
/* Index: CONDUCTOR_PK                                          */
/*==============================================================*/
create unique index CONDUCTOR_PK on CONDUCTOR (
CON_ID
);

/*==============================================================*/
/* Table: LUGAR                                                 */
/*==============================================================*/
create table LUGAR (
   LUG_ID               NUMERIC(15)          not null,
   RUT_ID               NUMERIC(15)          not null,
   LUG_ACTIVIDAD        VARCHAR(30)          not null,
   LUG_KM               NUMERIC(5)           not null,
   LUG_TIEMPO           TIME                 not null,
   LUG_TDEPARADA        TIME                 not null,
   LUG_ORIGEN           VARCHAR(15)          not null,
   constraint PK_LUGAR primary key (LUG_ID)
);

/*==============================================================*/
/* Index: LUGAR_PK                                              */
/*==============================================================*/
create unique index LUGAR_PK on LUGAR (
LUG_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on LUGAR (
RUT_ID
);

/*==============================================================*/
/* Table: MODELO_BUS                                            */
/*==============================================================*/
create table MODELO_BUS (
   MOD_ID               NUMERIC(15)          not null,
   MOD_CARACTERISTICAS  VARCHAR(20)          not null,
   MOD_NPLAZAS          NUMERIC(5)           not null,
   MOD_FABRICANTE       NUMERIC(15)          not null,
   constraint PK_MODELO_BUS primary key (MOD_ID)
);

/*==============================================================*/
/* Index: MODELO_BUS_PK                                         */
/*==============================================================*/
create unique index MODELO_BUS_PK on MODELO_BUS (
MOD_ID
);

/*==============================================================*/
/* Table: PASAJERO                                              */
/*==============================================================*/
create table PASAJERO (
   PAS_NOMBRE           VARCHAR(20)          not null,
   PAS_ID               NUMERIC(15)          not null,
   PAS_CEDULA           NUMERIC(15)          not null,
   PAS_APELLIDO         VARCHAR(20)          not null,
   PAS_TELEFONO         NUMERIC(15)          not null,
   constraint PK_PASAJERO primary key (PAS_ID)
);

/*==============================================================*/
/* Index: PASAJERO_PK                                           */
/*==============================================================*/
create unique index PASAJERO_PK on PASAJERO (
PAS_ID
);

/*==============================================================*/
/* Table: REPARACION                                            */
/*==============================================================*/
create table REPARACION (
   REP_ID               NUMERIC(15)          not null,
   REV_ID               NUMERIC(15)          not null,
   REP_TIEMPO           TIME                 not null,
   REP_COMENTARIO       VARCHAR(40)          null,
   constraint PK_REPARACION primary key (REP_ID)
);

/*==============================================================*/
/* Index: REPARACION_PK                                         */
/*==============================================================*/
create unique index REPARACION_PK on REPARACION (
REP_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on REPARACION (
REV_ID
);

/*==============================================================*/
/* Table: REVISION                                              */
/*==============================================================*/
create table REVISION (
   REV_ID               NUMERIC(15)          not null,
   AUT_ID               NUMERIC(15)          not null,
   REV_FECHA            DATE                 not null,
   REV_DIAGNOSTICO      VARCHAR(40)          not null,
   constraint PK_REVISION primary key (REV_ID)
);

/*==============================================================*/
/* Index: REVISION_PK                                           */
/*==============================================================*/
create unique index REVISION_PK on REVISION (
REV_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on REVISION (
AUT_ID
);

/*==============================================================*/
/* Table: RUTA                                                  */
/*==============================================================*/
create table RUTA (
   RUT_ID               NUMERIC(15)          not null,
   RUT_IMPORTE          MONEY                not null,
   constraint PK_RUTA primary key (RUT_ID)
);

/*==============================================================*/
/* Index: RUTA_PK                                               */
/*==============================================================*/
create unique index RUTA_PK on RUTA (
RUT_ID
);

/*==============================================================*/
/* Table: SERVICIO_DIARIO                                       */
/*==============================================================*/
create table SERVICIO_DIARIO (
   SER_FECHA            DATE                 not null,
   SER_ID               NUMERIC(15)          not null,
   CON_ID               NUMERIC(15)          not null,
   RUT_ID               NUMERIC(15)          not null,
   AUT_ID               NUMERIC(15)          not null,
   constraint PK_SERVICIO_DIARIO primary key (SER_ID)
);

/*==============================================================*/
/* Index: SERVICIO_DIARIO_PK                                    */
/*==============================================================*/
create unique index SERVICIO_DIARIO_PK on SERVICIO_DIARIO (
SER_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on SERVICIO_DIARIO (
CON_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on SERVICIO_DIARIO (
RUT_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on SERVICIO_DIARIO (
AUT_ID
);

/*==============================================================*/
/* Table: VIAJE                                                 */
/*==============================================================*/
create table VIAJE (
   VIA_FECHA            DATE                 not null,
   VIA_HORA             TIME                 not null,
   VIA_ID               NUMERIC(15)          not null,
   constraint PK_VIAJE primary key (VIA_ID)
);

/*==============================================================*/
/* Index: VIAJE_PK                                              */
/*==============================================================*/
create unique index VIAJE_PK on VIAJE (
VIA_ID
);