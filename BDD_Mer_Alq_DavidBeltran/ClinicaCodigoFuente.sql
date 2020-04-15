/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     15/10/2019 20:10:38                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_ALQUILA_RELATIONS_PUNTOS_A') then
    alter table ALQUILA
       delete foreign key FK_ALQUILA_RELATIONS_PUNTOS_A
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ALQUILA_RELATIONS_MEDIO_TR') then
    alter table ALQUILA
       delete foreign key FK_ALQUILA_RELATIONS_MEDIO_TR
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_AYUDANTE_RELATIONS_PUNTOS_A') then
    alter table AYUDANTES
       delete foreign key FK_AYUDANTE_RELATIONS_PUNTOS_A
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CABECERA_RELATIONS_CLIENTE') then
    alter table CABECERA_FACTURA
       delete foreign key FK_CABECERA_RELATIONS_CLIENTE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DETALLE__RELATIONS_CABECERA') then
    alter table DETALLE_FACTURA
       delete foreign key FK_DETALLE__RELATIONS_CABECERA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_DETALLE__RELATIONS_TIPO_REP') then
    alter table DETALLE_FACTURA
       delete foreign key FK_DETALLE__RELATIONS_TIPO_REP
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MANTENIM_RELATIONS_MEDIO_TR') then
    alter table MANTENIMIENTO
       delete foreign key FK_MANTENIM_RELATIONS_MEDIO_TR
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MANTENIM_RELATIONS_TIPO_MAN') then
    alter table MANTENIMIENTO
       delete foreign key FK_MANTENIM_RELATIONS_TIPO_MAN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PUNTOS_A_RELATIONS_NEGOCIO') then
    alter table PUNTOS_ALQUILER
       delete foreign key FK_PUNTOS_A_RELATIONS_NEGOCIO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_REPUESTO_RELATIONS_MEDIO_TR') then
    alter table REPUESTOS
       delete foreign key FK_REPUESTO_RELATIONS_MEDIO_TR
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_REPUESTO_RELATIONS_TIPO_REP') then
    alter table REPUESTOS
       delete foreign key FK_REPUESTO_RELATIONS_TIPO_REP
end if;

drop index if exists ALQUILA.RELATIONSHIP_4_FK;

drop index if exists ALQUILA.RELATIONSHIP_3_FK;

drop index if exists ALQUILA.ALQUILA_PK;

drop table if exists ALQUILA;

drop index if exists AYUDANTES.RELATIONSHIP_2_FK;

drop index if exists AYUDANTES.AYUDANTES_PK;

drop table if exists AYUDANTES;

drop index if exists CABECERA_FACTURA.RELATIONSHIP_11_FK;

drop index if exists CABECERA_FACTURA.CABECERA_FACTURA_PK;

drop table if exists CABECERA_FACTURA;

drop index if exists CLIENTE.CLIENTE_PK;

drop table if exists CLIENTE;

drop index if exists DETALLE_FACTURA.RELATIONSHIP_10_FK;

drop index if exists DETALLE_FACTURA.RELATIONSHIP_9_FK;

drop index if exists DETALLE_FACTURA.DETALLE_FACTURA_PK;

drop table if exists DETALLE_FACTURA;

drop index if exists MANTENIMIENTO.RELATIONSHIP_6_FK;

drop index if exists MANTENIMIENTO.RELATIONSHIP_5_FK;

drop index if exists MANTENIMIENTO.MANTENIMIENTO_PK;

drop table if exists MANTENIMIENTO;

drop index if exists MEDIO_TRANSPORTE.MEDIO_TRANSPORTE_PK;

drop table if exists MEDIO_TRANSPORTE;

drop index if exists NEGOCIO.NEGOCIO_PK;

drop table if exists NEGOCIO;

drop index if exists PUNTOS_ALQUILER.RELATIONSHIP_1_FK;

drop index if exists PUNTOS_ALQUILER.PUNTOS_ALQUILER_PK;

drop table if exists PUNTOS_ALQUILER;

drop index if exists REPUESTOS.RELATIONSHIP_8_FK;

drop index if exists REPUESTOS.RELATIONSHIP_7_FK;

drop index if exists REPUESTOS.REPUESTOS_PK;

drop table if exists REPUESTOS;

drop index if exists TIPO_MANTENIMIENTO.TIPO_MANTENIMIENTO_PK;

drop table if exists TIPO_MANTENIMIENTO;

drop index if exists TIPO_REPUESTOS.TIPO_REPUESTOS_PK;

drop table if exists TIPO_REPUESTOS;

/*==============================================================*/
/* Table: ALQUILA                                               */
/*==============================================================*/
create table ALQUILA 
(
   ALQ_ID               numeric(15)                    not null,
   PUN_ID               numeric(15)                    not null,
   TRAN_ID              numeric(15)                    not null,
   ALQ_FECHA_           date                           not null,
   ALQ_VALOR            numeric(15)                    not null,
   constraint PK_ALQUILA primary key (ALQ_ID)
);

/*==============================================================*/
/* Index: ALQUILA_PK                                            */
/*==============================================================*/
create unique index ALQUILA_PK on ALQUILA (
ALQ_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on ALQUILA (
PUN_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on ALQUILA (
TRAN_ID ASC
);

/*==============================================================*/
/* Table: AYUDANTES                                             */
/*==============================================================*/
create table AYUDANTES 
(
   AYU_ID               numeric(25)                    not null,
   PUN_ID               numeric(15)                    not null,
   AYU_CEDULA           numeric(15)                    not null,
   AYU_NOMBRE           varchar(25)                    not null,
   AYU_DIRECCION        varchar(53)                    not null,
   AYU_TELEFONO_        numeric(15)                    not null,
   AYU_SUELDO_BAS       numeric(25)                    not null,
   constraint PK_AYUDANTES primary key (AYU_ID)
);

/*==============================================================*/
/* Index: AYUDANTES_PK                                          */
/*==============================================================*/
create unique index AYUDANTES_PK on AYUDANTES (
AYU_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on AYUDANTES (
PUN_ID ASC
);

/*==============================================================*/
/* Table: CABECERA_FACTURA                                      */
/*==============================================================*/
create table CABECERA_FACTURA 
(
   FAC_NUM_FAC          numeric(20)                    not null,
   CLI_ID               numeric(15)                    not null,
   FAC_FECHA            date                           not null,
   FAC_TIPO_PAGO        varchar(25)                    not null,
   constraint PK_CABECERA_FACTURA primary key (FAC_NUM_FAC)
);

/*==============================================================*/
/* Index: CABECERA_FACTURA_PK                                   */
/*==============================================================*/
create unique index CABECERA_FACTURA_PK on CABECERA_FACTURA (
FAC_NUM_FAC ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_11_FK on CABECERA_FACTURA (
CLI_ID ASC
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE 
(
   CLI_ID               numeric(15)                    not null,
   CLI_CEDULA           numeric(25)                    not null,
   CLI_NOMBRE_          varchar(30)                    not null,
   constraint PK_CLIENTE primary key (CLI_ID)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
CLI_ID ASC
);

/*==============================================================*/
/* Table: DETALLE_FACTURA                                       */
/*==============================================================*/
create table DETALLE_FACTURA 
(
   DET_ID               numeric(25)                    not null,
   TREP_ID              numeric(15)                    not null,
   FAC_NUM_FAC          numeric(20)                    not null,
   DET_CANTIDAD         numeric(20)                    not null,
   DET_VALOR            numeric(15)                    not null,
   constraint PK_DETALLE_FACTURA primary key (DET_ID)
);

/*==============================================================*/
/* Index: DETALLE_FACTURA_PK                                    */
/*==============================================================*/
create unique index DETALLE_FACTURA_PK on DETALLE_FACTURA (
DET_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_9_FK on DETALLE_FACTURA (
TREP_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_10_FK on DETALLE_FACTURA (
FAC_NUM_FAC ASC
);

/*==============================================================*/
/* Table: MANTENIMIENTO                                         */
/*==============================================================*/
create table MANTENIMIENTO 
(
   MAN_ID               numeric(20)                    not null,
   SER_ID               numeric(15)                    not null,
   TRAN_ID              numeric(15)                    not null,
   MAN_FECHA_           date                           not null,
   MAN_VALOR            numeric(20)                    not null,
   MAN_TIPO_            varchar(40)                    not null,
   constraint PK_MANTENIMIENTO primary key (MAN_ID)
);

/*==============================================================*/
/* Index: MANTENIMIENTO_PK                                      */
/*==============================================================*/
create unique index MANTENIMIENTO_PK on MANTENIMIENTO (
MAN_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on MANTENIMIENTO (
TRAN_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on MANTENIMIENTO (
SER_ID ASC
);

/*==============================================================*/
/* Table: MEDIO_TRANSPORTE                                      */
/*==============================================================*/
create table MEDIO_TRANSPORTE 
(
   TRAN_ID              numeric(15)                    not null,
   TRAN_TIPO_           varchar(25)                    not null,
   TRAN_MARCA           varchar(25)                    not null,
   TRAN_ESTADO_ASIENTO_ varchar(15)                    not null,
   TRAN_ESTADO_MANUBRIO varchar(15)                    not null,
   TRAN_ESTADO_CAMBIOS  varchar(15)                    not null,
   TRAN_ESTADO_LLANTAS  varchar(15)                    not null,
   TRAN_ANO_            numeric(10)                    not null,
   TRAN_TAMANO_         numeric(20)                    not null,
   TRAN_PRECIO_ALQUILER numeric(25)                    not null,
   constraint PK_MEDIO_TRANSPORTE primary key (TRAN_ID)
);

/*==============================================================*/
/* Index: MEDIO_TRANSPORTE_PK                                   */
/*==============================================================*/
create unique index MEDIO_TRANSPORTE_PK on MEDIO_TRANSPORTE (
TRAN_ID ASC
);

/*==============================================================*/
/* Table: NEGOCIO                                               */
/*==============================================================*/
create table NEGOCIO 
(
   NEG_ID               numeric(15)                    not null,
   NEG_NOMBRE           varchar(25)                    not null,
   NEG_RUCPROPIETARIO   numeric(15)                    not null,
   NEG_NOMBREPROPEITARIO varchar(20)                    not null,
   NEG_DIRECCION        varchar(30)                    not null,
   NEG_TELEFONO         numeric(15)                    not null,
   constraint PK_NEGOCIO primary key (NEG_ID)
);

/*==============================================================*/
/* Index: NEGOCIO_PK                                            */
/*==============================================================*/
create unique index NEGOCIO_PK on NEGOCIO (
NEG_ID ASC
);

/*==============================================================*/
/* Table: PUNTOS_ALQUILER                                       */
/*==============================================================*/
create table PUNTOS_ALQUILER 
(
   PUN_ID               numeric(15)                    not null,
   NEG_ID               numeric(15)                    not null,
   PUN_NOMBRE           varchar(25)                    not null,
   PUN_SECTOR           varchar(35)                    not null,
   PUN_DIRECCION        varchar(40)                    not null,
   constraint PK_PUNTOS_ALQUILER primary key (PUN_ID)
);

/*==============================================================*/
/* Index: PUNTOS_ALQUILER_PK                                    */
/*==============================================================*/
create unique index PUNTOS_ALQUILER_PK on PUNTOS_ALQUILER (
PUN_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on PUNTOS_ALQUILER (
NEG_ID ASC
);

/*==============================================================*/
/* Table: REPUESTOS                                             */
/*==============================================================*/
create table REPUESTOS 
(
   REP_ID               numeric(15)                    not null,
   TREP_ID              numeric(15)                    not null,
   TRAN_ID              numeric(15)                    not null,
   REP_FECHA_           date                           not null,
   REP_CANTIDAD         numeric(10)                    not null,
   REP_VALOR            numeric(10)                    not null,
   REP_TIPO_            varchar(25)                    not null,
   constraint PK_REPUESTOS primary key (REP_ID)
);

/*==============================================================*/
/* Index: REPUESTOS_PK                                          */
/*==============================================================*/
create unique index REPUESTOS_PK on REPUESTOS (
REP_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on REPUESTOS (
TRAN_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_8_FK on REPUESTOS (
TREP_ID ASC
);

/*==============================================================*/
/* Table: TIPO_MANTENIMIENTO                                    */
/*==============================================================*/
create table TIPO_MANTENIMIENTO 
(
   SER_ID               numeric(15)                    not null,
   SER_DESCRIPCION      varchar(20)                    not null,
   SER_VALOR            numeric(10)                    not null,
   constraint PK_TIPO_MANTENIMIENTO primary key (SER_ID)
);

/*==============================================================*/
/* Index: TIPO_MANTENIMIENTO_PK                                 */
/*==============================================================*/
create unique index TIPO_MANTENIMIENTO_PK on TIPO_MANTENIMIENTO (
SER_ID ASC
);

/*==============================================================*/
/* Table: TIPO_REPUESTOS                                        */
/*==============================================================*/
create table TIPO_REPUESTOS 
(
   TREP_ID              numeric(15)                    not null,
   TREP_DESCRIPCION     varchar(35)                    not null,
   TREP_VALOR           numeric(15)                    not null,
   TREP_STOCK           numeric(20)                    not null,
   constraint PK_TIPO_REPUESTOS primary key (TREP_ID)
);

/*==============================================================*/
/* Index: TIPO_REPUESTOS_PK                                     */
/*==============================================================*/
create unique index TIPO_REPUESTOS_PK on TIPO_REPUESTOS (
TREP_ID ASC
);

alter table ALQUILA
   add constraint FK_ALQUILA_RELATIONS_PUNTOS_A foreign key (PUN_ID)
      references PUNTOS_ALQUILER (PUN_ID)
      on update restrict
      on delete restrict;

alter table ALQUILA
   add constraint FK_ALQUILA_RELATIONS_MEDIO_TR foreign key (TRAN_ID)
      references MEDIO_TRANSPORTE (TRAN_ID)
      on update restrict
      on delete restrict;

alter table AYUDANTES
   add constraint FK_AYUDANTE_RELATIONS_PUNTOS_A foreign key (PUN_ID)
      references PUNTOS_ALQUILER (PUN_ID)
      on update restrict
      on delete restrict;

alter table CABECERA_FACTURA
   add constraint FK_CABECERA_RELATIONS_CLIENTE foreign key (CLI_ID)
      references CLIENTE (CLI_ID)
      on update restrict
      on delete restrict;

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__RELATIONS_CABECERA foreign key (FAC_NUM_FAC)
      references CABECERA_FACTURA (FAC_NUM_FAC)
      on update restrict
      on delete restrict;

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__RELATIONS_TIPO_REP foreign key (TREP_ID)
      references TIPO_REPUESTOS (TREP_ID)
      on update restrict
      on delete restrict;

alter table MANTENIMIENTO
   add constraint FK_MANTENIM_RELATIONS_MEDIO_TR foreign key (TRAN_ID)
      references MEDIO_TRANSPORTE (TRAN_ID)
      on update restrict
      on delete restrict;

alter table MANTENIMIENTO
   add constraint FK_MANTENIM_RELATIONS_TIPO_MAN foreign key (SER_ID)
      references TIPO_MANTENIMIENTO (SER_ID)
      on update restrict
      on delete restrict;

alter table PUNTOS_ALQUILER
   add constraint FK_PUNTOS_A_RELATIONS_NEGOCIO foreign key (NEG_ID)
      references NEGOCIO (NEG_ID)
      on update restrict
      on delete restrict;

alter table REPUESTOS
   add constraint FK_REPUESTO_RELATIONS_MEDIO_TR foreign key (TRAN_ID)
      references MEDIO_TRANSPORTE (TRAN_ID)
      on update restrict
      on delete restrict;

alter table REPUESTOS
   add constraint FK_REPUESTO_RELATIONS_TIPO_REP foreign key (TREP_ID)
      references TIPO_REPUESTOS (TREP_ID)
      on update restrict
      on delete restrict;

