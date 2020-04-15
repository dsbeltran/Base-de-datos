/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     14/10/2019 8:50:39                           */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_ALOJA_RELATIONS_HOTEL') then
    alter table ALOJA
       delete foreign key FK_ALOJA_RELATIONS_HOTEL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_ALOJA_RELATIONS_PARTICIP') then
    alter table ALOJA
       delete foreign key FK_ALOJA_RELATIONS_PARTICIP
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_CAMPEONA_RELATIONS_PARTICIP') then
    alter table CAMPEONATOS
       delete foreign key FK_CAMPEONA_RELATIONS_PARTICIP
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_JUEGO_RELATIONS_PARTIDA') then
    alter table JUEGO
       delete foreign key FK_JUEGO_RELATIONS_PARTIDA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_JUEGO_RELATIONS_PARTICIP') then
    alter table JUEGO
       delete foreign key FK_JUEGO_RELATIONS_PARTICIP
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MEDIOS_RELATIONS_SALA') then
    alter table MEDIOS
       delete foreign key FK_MEDIOS_RELATIONS_SALA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MEDIOS_RELATIONS_TIPO_MED') then
    alter table MEDIOS
       delete foreign key FK_MEDIOS_RELATIONS_TIPO_MED
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MOVIMIEN_RELATIONS_JUEGO') then
    alter table MOVIMIENTOS
       delete foreign key FK_MOVIMIEN_RELATIONS_JUEGO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MOVIMIEN_RELATIONS_TIPO_MOV') then
    alter table MOVIMIENTOS
       delete foreign key FK_MOVIMIEN_RELATIONS_TIPO_MOV
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PARTICIP_RELATIONS_PAIS') then
    alter table PARTICIPANTES
       delete foreign key FK_PARTICIP_RELATIONS_PAIS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PARTIDA_RELATIONS_SALA') then
    alter table PARTIDA
       delete foreign key FK_PARTIDA_RELATIONS_SALA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SALA_RELATIONS_HOTEL') then
    alter table SALA
       delete foreign key FK_SALA_RELATIONS_HOTEL
end if;

drop index if exists ALOJA.RELATIONSHIP_2_FK;

drop index if exists ALOJA.RELATIONSHIP_1_FK;

drop index if exists ALOJA.ALOJA_PK;

drop table if exists ALOJA;

drop index if exists CAMPEONATOS.RELATIONSHIP_6_FK;

drop index if exists CAMPEONATOS.CAMPEONATOS_PK;

drop table if exists CAMPEONATOS;

drop index if exists HOTEL.HOTEL_PK;

drop table if exists HOTEL;

drop index if exists JUEGO.RELATIONSHIP_4_FK;

drop index if exists JUEGO.RELATIONSHIP_3_FK;

drop index if exists JUEGO.JUEGO_PK;

drop table if exists JUEGO;

drop index if exists MEDIOS.RELATIONSHIP_12_FK;

drop index if exists MEDIOS.RELATIONSHIP_11_FK;

drop index if exists MEDIOS.MEDIOS_PK;

drop table if exists MEDIOS;

drop index if exists MOVIMIENTOS.RELATIONSHIP_8_FK;

drop index if exists MOVIMIENTOS.RELATIONSHIP_7_FK;

drop index if exists MOVIMIENTOS.MOVIMIENTOS_PK;

drop table if exists MOVIMIENTOS;

drop index if exists PAIS.PAIS_PK;

drop table if exists PAIS;

drop index if exists PARTICIPANTES.RELATIONSHIP_5_FK;

drop index if exists PARTICIPANTES.PARTICIPANTES_PK;

drop table if exists PARTICIPANTES;

drop index if exists PARTIDA.RELATIONSHIP_9_FK;

drop index if exists PARTIDA.PARTIDA_PK;

drop table if exists PARTIDA;

drop index if exists SALA.RELATIONSHIP_10_FK;

drop index if exists SALA.SALA_PK;

drop table if exists SALA;

drop index if exists TIPO_MEDIOS.TIPO_MEDIOS_PK;

drop table if exists TIPO_MEDIOS;

drop index if exists TIPO_MOVIMIENTO.TIPO_MOVIMIENTO_PK;

drop table if exists TIPO_MOVIMIENTO;

/*==============================================================*/
/* Table: ALOJA                                                 */
/*==============================================================*/
create table ALOJA 
(
   ALO_ID               numeric(100)                   not null,
   HOT_ID               numeric(100)                   not null,
   PER_ID               numeric(100)                   not null,
   ALO_FECHA_INGRESO    date                           not null,
   ALO_FECHA_SALIDA     date                           not null,
   ALO_DIAS             numeric(10)                    not null,
   constraint PK_ALOJA primary key (ALO_ID)
);

/*==============================================================*/
/* Index: ALOJA_PK                                              */
/*==============================================================*/
create unique index ALOJA_PK on ALOJA (
ALO_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on ALOJA (
HOT_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on ALOJA (
PER_ID ASC
);

/*==============================================================*/
/* Table: CAMPEONATOS                                           */
/*==============================================================*/
create table CAMPEONATOS 
(
   CAM_ID               numeric(100)                   not null,
   PER_ID               numeric(100)                   not null,
   CAM_DESCRIPCION      varchar(30)                    not null,
   CAM_FECHA            date                           not null,
   CAM_LUGAR            varchar(20)                    not null,
   constraint PK_CAMPEONATOS primary key (CAM_ID)
);

/*==============================================================*/
/* Index: CAMPEONATOS_PK                                        */
/*==============================================================*/
create unique index CAMPEONATOS_PK on CAMPEONATOS (
CAM_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on CAMPEONATOS (
PER_ID ASC
);

/*==============================================================*/
/* Table: HOTEL                                                 */
/*==============================================================*/
create table HOTEL 
(
   HOT_ID               numeric(100)                   not null,
   HOT_NOMBRE           varchar(30)                    not null,
   HOT_DIRECCION        varchar(40)                    not null,
   HOT_TELEFONO         numeric(15)                    not null,
   constraint PK_HOTEL primary key (HOT_ID)
);

/*==============================================================*/
/* Index: HOTEL_PK                                              */
/*==============================================================*/
create unique index HOTEL_PK on HOTEL (
HOT_ID ASC
);

/*==============================================================*/
/* Table: JUEGO                                                 */
/*==============================================================*/
create table JUEGO 
(
   JUE_ID               numeric(100)                   not null,
   PAR_NUM_CORRELACIONADOR_ numeric(50)                    not null,
   PER_ID               numeric(100)                   not null,
   JUE_COLOR_           char(2)                        not null,
   constraint PK_JUEGO primary key (JUE_ID)
);

/*==============================================================*/
/* Index: JUEGO_PK                                              */
/*==============================================================*/
create unique index JUEGO_PK on JUEGO (
JUE_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on JUEGO (
PAR_NUM_CORRELACIONADOR_ ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on JUEGO (
PER_ID ASC
);

/*==============================================================*/
/* Table: MEDIOS                                                */
/*==============================================================*/
create table MEDIOS 
(
   MED_ID               numeric(10)                    not null,
   TMED_ID              numeric(100)                   not null,
   SAL_ID               numeric(40)                    not null,
   MED_CANTIDAD         numeric(10)                    not null,
   MED_ESTADO           smallint                       not null,
   constraint PK_MEDIOS primary key (MED_ID)
);

/*==============================================================*/
/* Index: MEDIOS_PK                                             */
/*==============================================================*/
create unique index MEDIOS_PK on MEDIOS (
MED_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_11_FK on MEDIOS (
SAL_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_12_FK on MEDIOS (
TMED_ID ASC
);

/*==============================================================*/
/* Table: MOVIMIENTOS                                           */
/*==============================================================*/
create table MOVIMIENTOS 
(
   MOV_ID               numeric(100)                   not null,
   JUE_ID               numeric(100)                   not null,
   TMOV_ID              numeric(1000)                  not null,
   MOV_JUGADA           varchar(10)                    not null,
   MOV_MOVIMIENTO       varchar(10)                    not null,
   MOV_COMENTARIO       varchar(30)                    not null,
   constraint PK_MOVIMIENTOS primary key (MOV_ID)
);

/*==============================================================*/
/* Index: MOVIMIENTOS_PK                                        */
/*==============================================================*/
create unique index MOVIMIENTOS_PK on MOVIMIENTOS (
MOV_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on MOVIMIENTOS (
JUE_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_8_FK on MOVIMIENTOS (
TMOV_ID ASC
);

/*==============================================================*/
/* Table: PAIS                                                  */
/*==============================================================*/
create table PAIS 
(
   PAI_NUMERO           numeric(100)                   not null,
   PAI_NOMBRE           varchar(30)                    not null,
   PAI_NUMERO_CLUBES    numeric(100)                   not null,
   constraint PK_PAIS primary key (PAI_NUMERO)
);

/*==============================================================*/
/* Index: PAIS_PK                                               */
/*==============================================================*/
create unique index PAIS_PK on PAIS (
PAI_NUMERO ASC
);

/*==============================================================*/
/* Table: PARTICIPANTES                                         */
/*==============================================================*/
create table PARTICIPANTES 
(
   PER_ID               numeric(100)                   not null,
   PAI_NUMERO           numeric(100)                   not null,
   PER_NUMEROSOCIO      numeric(100)                   not null,
   PER_NOMBRE           varchar(20)                    not null,
   PER_DIRECCION        varchar(40)                    not null,
   PER_TELEFONO         numeric(15)                    not null,
   PER_NIVEL_JUEGO_JUGADOR_ numeric(10)                    not null,
   constraint PK_PARTICIPANTES primary key (PER_ID)
);

/*==============================================================*/
/* Index: PARTICIPANTES_PK                                      */
/*==============================================================*/
create unique index PARTICIPANTES_PK on PARTICIPANTES (
PER_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on PARTICIPANTES (
PAI_NUMERO ASC
);

/*==============================================================*/
/* Table: PARTIDA                                               */
/*==============================================================*/
create table PARTIDA 
(
   PAR_NUM_CORRELACIONADOR_ numeric(50)                    not null,
   SAL_ID               numeric(40)                    not null,
   PAR_DESCRIPCION_     varchar(30)                    not null,
   PAR_FECHA            date                           not null,
   PAR_HORA             time                           not null,
   constraint PK_PARTIDA primary key (PAR_NUM_CORRELACIONADOR_)
);

/*==============================================================*/
/* Index: PARTIDA_PK                                            */
/*==============================================================*/
create unique index PARTIDA_PK on PARTIDA (
PAR_NUM_CORRELACIONADOR_ ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_9_FK on PARTIDA (
SAL_ID ASC
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
create table SALA 
(
   SAL_ID               numeric(40)                    not null,
   HOT_ID               numeric(100)                   not null,
   SAL_NOMBRE           varchar(20)                    not null,
   SAL_CAPACIDAD        numeric(100)                   not null,
   constraint PK_SALA primary key (SAL_ID)
);

/*==============================================================*/
/* Index: SALA_PK                                               */
/*==============================================================*/
create unique index SALA_PK on SALA (
SAL_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_10_FK on SALA (
HOT_ID ASC
);

/*==============================================================*/
/* Table: TIPO_MEDIOS                                           */
/*==============================================================*/
create table TIPO_MEDIOS 
(
   TMED_ID              numeric(100)                   not null,
   TMED_NOMBRE          varchar(30)                    not null,
   TMED_CANTIDAD        numeric(20)                    not null,
   constraint PK_TIPO_MEDIOS primary key (TMED_ID)
);

/*==============================================================*/
/* Index: TIPO_MEDIOS_PK                                        */
/*==============================================================*/
create unique index TIPO_MEDIOS_PK on TIPO_MEDIOS (
TMED_ID ASC
);

/*==============================================================*/
/* Table: TIPO_MOVIMIENTO                                       */
/*==============================================================*/
create table TIPO_MOVIMIENTO 
(
   TMOV_ID              numeric(1000)                  not null,
   TMOV_DESCRIPCION     char(20)                       not null,
   constraint PK_TIPO_MOVIMIENTO primary key (TMOV_ID)
);

/*==============================================================*/
/* Index: TIPO_MOVIMIENTO_PK                                    */
/*==============================================================*/
create unique index TIPO_MOVIMIENTO_PK on TIPO_MOVIMIENTO (
TMOV_ID ASC
);

alter table ALOJA
   add constraint FK_ALOJA_RELATIONS_HOTEL foreign key (HOT_ID)
      references HOTEL (HOT_ID)
      on update restrict
      on delete restrict;

alter table ALOJA
   add constraint FK_ALOJA_RELATIONS_PARTICIP foreign key (PER_ID)
      references PARTICIPANTES (PER_ID)
      on update restrict
      on delete restrict;

alter table CAMPEONATOS
   add constraint FK_CAMPEONA_RELATIONS_PARTICIP foreign key (PER_ID)
      references PARTICIPANTES (PER_ID)
      on update restrict
      on delete restrict;

alter table JUEGO
   add constraint FK_JUEGO_RELATIONS_PARTIDA foreign key (PAR_NUM_CORRELACIONADOR_)
      references PARTIDA (PAR_NUM_CORRELACIONADOR_)
      on update restrict
      on delete restrict;

alter table JUEGO
   add constraint FK_JUEGO_RELATIONS_PARTICIP foreign key (PER_ID)
      references PARTICIPANTES (PER_ID)
      on update restrict
      on delete restrict;

alter table MEDIOS
   add constraint FK_MEDIOS_RELATIONS_SALA foreign key (SAL_ID)
      references SALA (SAL_ID)
      on update restrict
      on delete restrict;

alter table MEDIOS
   add constraint FK_MEDIOS_RELATIONS_TIPO_MED foreign key (TMED_ID)
      references TIPO_MEDIOS (TMED_ID)
      on update restrict
      on delete restrict;

alter table MOVIMIENTOS
   add constraint FK_MOVIMIEN_RELATIONS_JUEGO foreign key (JUE_ID)
      references JUEGO (JUE_ID)
      on update restrict
      on delete restrict;

alter table MOVIMIENTOS
   add constraint FK_MOVIMIEN_RELATIONS_TIPO_MOV foreign key (TMOV_ID)
      references TIPO_MOVIMIENTO (TMOV_ID)
      on update restrict
      on delete restrict;

alter table PARTICIPANTES
   add constraint FK_PARTICIP_RELATIONS_PAIS foreign key (PAI_NUMERO)
      references PAIS (PAI_NUMERO)
      on update restrict
      on delete restrict;

alter table PARTIDA
   add constraint FK_PARTIDA_RELATIONS_SALA foreign key (SAL_ID)
      references SALA (SAL_ID)
      on update restrict
      on delete restrict;

alter table SALA
   add constraint FK_SALA_RELATIONS_HOTEL foreign key (HOT_ID)
      references HOTEL (HOT_ID)
      on update restrict
      on delete restrict;

