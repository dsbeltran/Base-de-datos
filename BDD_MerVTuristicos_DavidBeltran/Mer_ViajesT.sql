/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     25/11/2019 10:31:22                          */
/*==============================================================*/


drop index RELATIONSHIP_10_FK;

drop index AUTOBUS_PK;

drop table AUTOBUS;

drop index RELATIONSHIP_6_FK;

drop index RELATIONSHIP_2_FK;

drop index RELATIONSHIP_1_FK;

drop index BILLETE_PK;

drop table BILLETE;

drop index CONDUCTOR_PK;

drop table CONDUCTOR;

drop index RELATIONSHIP_3_FK;

drop index LUGAR_PK;

drop table LUGAR;

drop index RELATIONSHIP_9_FK;

drop index REPARACION_PK;

drop table REPARACION;

drop index RELATIONSHIP_8_FK;

drop index REVISION_PK;

drop table REVISION;

drop index RUTA_PK;

drop table RUTA;

drop index SERVICIOS_DIARIOS_PK;

drop table SERVICIOS_DIARIOS;

drop index RELATIONSHIP_5_FK;

drop index RELATIONSHIP_4_FK;

drop index SERVICIO_RUTA_PK;

drop table SERVICIO_RUTA;

drop index VIAJERO_PK;

drop table VIAJERO;

/*==============================================================*/
/* Table: AUTOBUS                                               */
/*==============================================================*/
create table AUTOBUS (
   AUT_MATRICULA        NUMERIC(30)          not null,
   CON_ID               NUMERIC(30)          not null,
   AUT_MODELO           VARCHAR(20)          not null,
   AUT_NPLAZAS          NUMERIC(20)          not null,
   AUT_DESCRIPCION      VARCHAR(40)          not null,
   constraint PK_AUTOBUS primary key (AUT_MATRICULA)
);

/*==============================================================*/
/* Index: AUTOBUS_PK                                            */
/*==============================================================*/
create unique index AUTOBUS_PK on AUTOBUS (
AUT_MATRICULA
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on AUTOBUS (
CON_ID
);

/*==============================================================*/
/* Table: BILLETE                                               */
/*==============================================================*/
create table BILLETE (
   BIL_ID               NUMERIC(50)          not null,
   RUT_ID               NUMERIC(30)          not null,
   VIA_ID               NUMERIC(30)          not null,
   AUT_MATRICULA        NUMERIC(30)          not null,
   BIL_FECHA            DATE                 not null,
   BIL_HORA             TIME                 not null,
   constraint PK_BILLETE primary key (BIL_ID)
);

/*==============================================================*/
/* Index: BILLETE_PK                                            */
/*==============================================================*/
create unique index BILLETE_PK on BILLETE (
BIL_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on BILLETE (
RUT_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on BILLETE (
VIA_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on BILLETE (
AUT_MATRICULA
);

/*==============================================================*/
/* Table: CONDUCTOR                                             */
/*==============================================================*/
create table CONDUCTOR (
   CON_CI               NUMERIC(20)          not null,
   CON_ID               NUMERIC(30)          not null,
   CON_NOMBRE           VARCHAR(30)          not null,
   CON_TELEFONO         NUMERIC(15)          not null,
   CON_DIRRECCION       VARCHAR(50)          not null,
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
   LUG_NOMBRE           VARCHAR(30)          not null,
   LUG_HLLEGADA         TIME                 not null,
   LUG_ACTIVIDAD        VARCHAR(30)          not null,
   LUG_TPARADA          TIME                 not null,
   LUG_ID               NUMERIC(30)          not null,
   RUT_ID               NUMERIC(30)          not null,
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
/* Table: REPARACION                                            */
/*==============================================================*/
create table REPARACION (
   REP_TIEMPO           TIME                 not null,
   REP_CODREPARACION    NUMERIC(50)          not null,
   REV_ID               NUMERIC(40)          not null,
   REP_DESCRIPCION      VARCHAR(39)          not null,
   constraint PK_REPARACION primary key (REP_CODREPARACION)
);

/*==============================================================*/
/* Index: REPARACION_PK                                         */
/*==============================================================*/
create unique index REPARACION_PK on REPARACION (
REP_CODREPARACION
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on REPARACION (
REV_ID
);

/*==============================================================*/
/* Table: REVISION                                              */
/*==============================================================*/
create table REVISION (
   REV_ID               NUMERIC(40)          not null,
   AUT_MATRICULA        NUMERIC(30)          not null,
   REV_FECHA            DATE                 not null,
   REV_DIAGNOSTICO      VARCHAR(30)          not null,
   constraint PK_REVISION primary key (REV_ID)
);

/*==============================================================*/
/* Index: REVISION_PK                                           */
/*==============================================================*/
create unique index REVISION_PK on REVISION (
REV_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on REVISION (
AUT_MATRICULA
);

/*==============================================================*/
/* Table: RUTA                                                  */
/*==============================================================*/
create table RUTA (
   RUT_ID               NUMERIC(30)          not null,
   RUT_RECORIDO         VARCHAR(50)          not null,
   RUT_HORA_INI         TIME                 not null,
   RUT_HORA_FIN         TIME                 not null,
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
/* Table: SERVICIOS_DIARIOS                                     */
/*==============================================================*/
create table SERVICIOS_DIARIOS (
   SERDIA_ID            NUMERIC(30)          not null,
   SERDIA_NOMBRE        VARCHAR(30)          not null,
   SERDIA_DESCRIPCION   VARCHAR(40)          null,
   constraint PK_SERVICIOS_DIARIOS primary key (SERDIA_ID)
);

/*==============================================================*/
/* Index: SERVICIOS_DIARIOS_PK                                  */
/*==============================================================*/
create unique index SERVICIOS_DIARIOS_PK on SERVICIOS_DIARIOS (
SERDIA_ID
);

/*==============================================================*/
/* Table: SERVICIO_RUTA                                         */
/*==============================================================*/
create table SERVICIO_RUTA (
   SERRUT_ID            NUMERIC(30)          not null,
   SERDIA_ID            NUMERIC(30)          null,
   RUT_ID               NUMERIC(30)          null,
   constraint PK_SERVICIO_RUTA primary key (SERRUT_ID)
);

/*==============================================================*/
/* Index: SERVICIO_RUTA_PK                                      */
/*==============================================================*/
create unique index SERVICIO_RUTA_PK on SERVICIO_RUTA (
SERRUT_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on SERVICIO_RUTA (
SERDIA_ID
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on SERVICIO_RUTA (
RUT_ID
);

/*==============================================================*/
/* Table: VIAJERO                                               */
/*==============================================================*/
create table VIAJERO (
   VIA_ID               NUMERIC(30)          not null,
   VIA_CI               NUMERIC(15)          not null,
   VIA_APELLODO         VARCHAR(15)          not null,
   VIA_NOMBRE           VARCHAR(15)          not null,
   VIA_TELEFONO         NUMERIC(20)          not null,
   VIA_TOTALH           NUMERIC(50)          null,
   constraint PK_VIAJERO primary key (VIA_ID)
);

/*==============================================================*/
/* Index: VIAJERO_PK                                            */
/*==============================================================*/
create unique index VIAJERO_PK on VIAJERO (
VIA_ID
);

alter table AUTOBUS
   add constraint FK_AUTOBUS_RELATIONS_CONDUCTO foreign key (CON_ID)
      references CONDUCTOR (CON_ID)
      on delete restrict on update restrict;

alter table BILLETE
   add constraint FK_BILLETE_RELATIONS_RUTA foreign key (RUT_ID)
      references RUTA (RUT_ID)
      on delete restrict on update restrict;

alter table BILLETE
   add constraint FK_BILLETE_RELATIONS_VIAJERO foreign key (VIA_ID)
      references VIAJERO (VIA_ID)
      on delete restrict on update restrict;

alter table BILLETE
   add constraint FK_BILLETE_RELATIONS_AUTOBUS foreign key (AUT_MATRICULA)
      references AUTOBUS (AUT_MATRICULA)
      on delete restrict on update restrict;

alter table LUGAR
   add constraint FK_LUGAR_RELATIONS_RUTA foreign key (RUT_ID)
      references RUTA (RUT_ID)
      on delete restrict on update restrict;

alter table REPARACION
   add constraint FK_REPARACI_RELATIONS_REVISION foreign key (REV_ID)
      references REVISION (REV_ID)
      on delete restrict on update restrict;

alter table REVISION
   add constraint FK_REVISION_RELATIONS_AUTOBUS foreign key (AUT_MATRICULA)
      references AUTOBUS (AUT_MATRICULA)
      on delete restrict on update restrict;

alter table SERVICIO_RUTA
   add constraint FK_SERVICIO_RELATIONS_SERVICIO foreign key (SERDIA_ID)
      references SERVICIOS_DIARIOS (SERDIA_ID)
      on delete restrict on update restrict;

alter table SERVICIO_RUTA
   add constraint FK_SERVICIO_RELATIONS_RUTA foreign key (RUT_ID)
      references RUTA (RUT_ID)
      on delete restrict on update restrict;

