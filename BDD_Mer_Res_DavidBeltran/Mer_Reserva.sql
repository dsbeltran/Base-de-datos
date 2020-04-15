/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     17/11/2019 22:38:10                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_EQUIPO_RELATIONS_FACULTAD') then
    alter table EQUIPO
       delete foreign key FK_EQUIPO_RELATIONS_FACULTAD
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_INVESTIG_RELATIONS_FACULTAD') then
    alter table INVESTIGADOR
       delete foreign key FK_INVESTIG_RELATIONS_FACULTAD
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RESERVA_RELATIONS_EQUIPO') then
    alter table RESERVA
       delete foreign key FK_RESERVA_RELATIONS_EQUIPO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_RESERVA_RELATIONS_INVESTIG') then
    alter table RESERVA
       delete foreign key FK_RESERVA_RELATIONS_INVESTIG
end if;

drop index if exists EQUIPO.RELATIONSHIP_1_FK;

drop index if exists EQUIPO.EQUIPO_PK;

drop table if exists EQUIPO;

drop index if exists FACULTAD.FACULTAD_PK;

drop table if exists FACULTAD;

drop index if exists INVESTIGADOR.RELATIONSHIP_2_FK;

drop index if exists INVESTIGADOR.INVESTIGADOR_PK;

drop table if exists INVESTIGADOR;

drop index if exists RESERVA.RELATIONSHIP_4_FK;

drop index if exists RESERVA.RELATIONSHIP_3_FK;

drop index if exists RESERVA.RESERVA_PK;

drop table if exists RESERVA;

/*==============================================================*/
/* Table: EQUIPO                                                */
/*==============================================================*/
create table EQUIPO 
(
   EQU_NSERIE           numeric(30)                    not null,
   FAC_COD              numeric(30)                    not null,
   EQU_NOMBRE           varchar(30)                    not null,
   EQU_ESTADO           varchar(20)                    not null,
   constraint PK_EQUIPO primary key (EQU_NSERIE)
);

/*==============================================================*/
/* Index: EQUIPO_PK                                             */
/*==============================================================*/
create unique index EQUIPO_PK on EQUIPO (
EQU_NSERIE ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on EQUIPO (
FAC_COD ASC
);

/*==============================================================*/
/* Table: FACULTAD                                              */
/*==============================================================*/
create table FACULTAD 
(
   FAC_COD              numeric(30)                    not null,
   FAC_NOMBRE           varchar(30)                    not null,
   FAC_DESCRIP          varchar(40)                    not null,
   constraint PK_FACULTAD primary key (FAC_COD)
);

/*==============================================================*/
/* Index: FACULTAD_PK                                           */
/*==============================================================*/
create unique index FACULTAD_PK on FACULTAD (
FAC_COD ASC
);

/*==============================================================*/
/* Table: INVESTIGADOR                                          */
/*==============================================================*/
create table INVESTIGADOR 
(
   INV_CI               numeric(15)                    not null,
   INV_ID               numeric(30)                    not null,
   FAC_COD              numeric(30)                    not null,
   INV_NOMBRES          numeric(30)                    not null,
   INV_EDAD             numeric(10)                    not null,
   INV_AEXINVESTI       numeric(10)                    not null,
   constraint PK_INVESTIGADOR primary key (INV_ID)
);

/*==============================================================*/
/* Index: INVESTIGADOR_PK                                       */
/*==============================================================*/
create unique index INVESTIGADOR_PK on INVESTIGADOR (
INV_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on INVESTIGADOR (
FAC_COD ASC
);

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA 
(
   RES_FINI             date                           not null,
   RES_FFIN             date                           not null,
   RES_ID               numeric(40)                    not null,
   INV_ID               numeric(30)                    not null,
   EQU_NSERIE           numeric(30)                    not null,
   constraint PK_RESERVA primary key (RES_ID)
);

/*==============================================================*/
/* Index: RESERVA_PK                                            */
/*==============================================================*/
create unique index RESERVA_PK on RESERVA (
RES_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on RESERVA (
EQU_NSERIE ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on RESERVA (
INV_ID ASC
);

alter table EQUIPO
   add constraint FK_EQUIPO_RELATIONS_FACULTAD foreign key (FAC_COD)
      references FACULTAD (FAC_COD)
      on update restrict
      on delete restrict;

alter table INVESTIGADOR
   add constraint FK_INVESTIG_RELATIONS_FACULTAD foreign key (FAC_COD)
      references FACULTAD (FAC_COD)
      on update restrict
      on delete restrict;

alter table RESERVA
   add constraint FK_RESERVA_RELATIONS_EQUIPO foreign key (EQU_NSERIE)
      references EQUIPO (EQU_NSERIE)
      on update restrict
      on delete restrict;

alter table RESERVA
   add constraint FK_RESERVA_RELATIONS_INVESTIG foreign key (INV_ID)
      references INVESTIGADOR (INV_ID)
      on update restrict
      on delete restrict;

