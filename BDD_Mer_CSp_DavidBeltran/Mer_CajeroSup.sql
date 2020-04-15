/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     18/11/2019 10:56:06                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_VENTA_RELATIONS_CAJERO') then
    alter table VENTA
       delete foreign key FK_VENTA_RELATIONS_CAJERO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VENTA_RELATIONS_CAJA_REG') then
    alter table VENTA
       delete foreign key FK_VENTA_RELATIONS_CAJA_REG
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_VENTA_RELATIONS_PRODUCTO') then
    alter table VENTA
       delete foreign key FK_VENTA_RELATIONS_PRODUCTO
end if;

drop index if exists CAJA_REGISTRADORA.CAJA_REGISTRADORA_PK;

drop table if exists CAJA_REGISTRADORA;

drop index if exists CAJERO.CAJERO_PK;

drop table if exists CAJERO;

drop index if exists PRODUCTO.PRODUCTO_PK;

drop table if exists PRODUCTO;

drop index if exists VENTA.RELATIONSHIP_3_FK;

drop index if exists VENTA.RELATIONSHIP_2_FK;

drop index if exists VENTA.RELATIONSHIP_1_FK;

drop table if exists VENTA;

/*==============================================================*/
/* Table: CAJA_REGISTRADORA                                     */
/*==============================================================*/
create table CAJA_REGISTRADORA 
(
   CREG_COD             numeric(30)                    not null,
   CREG_UBICA           varchar(20)                    not null,
   constraint PK_CAJA_REGISTRADORA primary key (CREG_COD)
);

/*==============================================================*/
/* Index: CAJA_REGISTRADORA_PK                                  */
/*==============================================================*/
create unique index CAJA_REGISTRADORA_PK on CAJA_REGISTRADORA (
CREG_COD ASC
);

/*==============================================================*/
/* Table: CAJERO                                                */
/*==============================================================*/
create table CAJERO 
(
   CAJ_COD              numeric(40)                    not null,
   CAJ_NOMBRE           varchar(30)                    not null,
   constraint PK_CAJERO primary key (CAJ_COD)
);

/*==============================================================*/
/* Index: CAJERO_PK                                             */
/*==============================================================*/
create unique index CAJERO_PK on CAJERO (
CAJ_COD ASC
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO 
(
   PRO_CODIGO           numeric(30)                    not null,
   PRO_NOMBRE           varchar(30)                    not null,
   PRO_PVP              numeric(20)                    not null,
   constraint PK_PRODUCTO primary key (PRO_CODIGO)
);

/*==============================================================*/
/* Index: PRODUCTO_PK                                           */
/*==============================================================*/
create unique index PRODUCTO_PK on PRODUCTO (
PRO_CODIGO ASC
);

/*==============================================================*/
/* Table: VENTA                                                 */
/*==============================================================*/
create table VENTA 
(
   CAJ_COD              numeric(40)                    not null,
   PRO_CODIGO           numeric(30)                    not null,
   CREG_COD             numeric(30)                    not null,
   VEN_FECHA            date                           not null
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on VENTA (
CAJ_COD ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on VENTA (
CREG_COD ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on VENTA (
PRO_CODIGO ASC
);

alter table VENTA
   add constraint FK_VENTA_RELATIONS_CAJERO foreign key (CAJ_COD)
      references CAJERO (CAJ_COD)
      on update restrict
      on delete restrict;

alter table VENTA
   add constraint FK_VENTA_RELATIONS_CAJA_REG foreign key (CREG_COD)
      references CAJA_REGISTRADORA (CREG_COD)
      on update restrict
      on delete restrict;

alter table VENTA
   add constraint FK_VENTA_RELATIONS_PRODUCTO foreign key (PRO_CODIGO)
      references PRODUCTO (PRO_CODIGO)
      on update restrict
      on delete restrict;

