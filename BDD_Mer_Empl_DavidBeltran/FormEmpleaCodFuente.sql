/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     23/10/2019 8:20:07                           */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_DESCUENT_RELATIONS_LINEA') then
    alter table DESCUENTO
       delete foreign key FK_DESCUENT_RELATIONS_LINEA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_EMPLEADO_RELATIONS_DEPARTAM') then
    alter table EMPLEADO
       delete foreign key FK_EMPLEADO_RELATIONS_DEPARTAM
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_INGRESO_RELATIONS_LINEA') then
    alter table INGRESO
       delete foreign key FK_INGRESO_RELATIONS_LINEA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_INGRESO_RELATIONS_CONCEPTO') then
    alter table INGRESO
       delete foreign key FK_INGRESO_RELATIONS_CONCEPTO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_LINEA_RELATIONS_NOMINA') then
    alter table LINEA
       delete foreign key FK_LINEA_RELATIONS_NOMINA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_NOMINA_RELATIONS_EMPLEADO') then
    alter table NOMINA
       delete foreign key FK_NOMINA_RELATIONS_EMPLEADO
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SEDE_RELATIONS_DEPARTAM') then
    alter table SEDE
       delete foreign key FK_SEDE_RELATIONS_DEPARTAM
end if;

drop index if exists CONCEPTO_TRIBUTARIO.CONCEPTO_TRIBUTARIO_PK;

drop table if exists CONCEPTO_TRIBUTARIO;

drop index if exists DEPARTAMENTO.DEPARTAMENTO_PK;

drop table if exists DEPARTAMENTO;

drop index if exists DESCUENTO.RELATIONSHIP_7_FK;

drop index if exists DESCUENTO.DESCUENTO_PK;

drop table if exists DESCUENTO;

drop index if exists EMPLEADO.RELATIONSHIP_2_FK;

drop index if exists EMPLEADO.EMPLEADO_PK;

drop table if exists EMPLEADO;

drop index if exists INGRESO.RELATIONSHIP_5_FK;

drop index if exists INGRESO.RELATIONSHIP_6_FK;

drop index if exists INGRESO.INGRESO_PK;

drop table if exists INGRESO;

drop index if exists LINEA.RELATIONSHIP_8_FK;

drop index if exists LINEA.LINEA_PK;

drop table if exists LINEA;

drop index if exists NOMINA.RELATIONSHIP_3_FK;

drop index if exists NOMINA.NOMINA_PK;

drop table if exists NOMINA;

drop index if exists SEDE.RELATIONSHIP_1_FK;

drop index if exists SEDE.SEDE_PK;

drop table if exists SEDE;

/*==============================================================*/
/* Table: CONCEPTO_TRIBUTARIO                                   */
/*==============================================================*/
create table CONCEPTO_TRIBUTARIO 
(
   CONCEP_COD           numeric(20)                    not null,
   CONCEP_DES           numeric(20)                    not null,
   constraint PK_CONCEPTO_TRIBUTARIO primary key (CONCEP_COD)
);

/*==============================================================*/
/* Index: CONCEPTO_TRIBUTARIO_PK                                */
/*==============================================================*/
create unique index CONCEPTO_TRIBUTARIO_PK on CONCEPTO_TRIBUTARIO (
CONCEP_COD ASC
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO 
(
   DEP_COD              numeric(30)                    not null,
   DEP_NOMBRE           varchar(40)                    not null,
   constraint PK_DEPARTAMENTO primary key (DEP_COD)
);

/*==============================================================*/
/* Index: DEPARTAMENTO_PK                                       */
/*==============================================================*/
create unique index DEPARTAMENTO_PK on DEPARTAMENTO (
DEP_COD ASC
);

/*==============================================================*/
/* Table: DESCUENTO                                             */
/*==============================================================*/
create table DESCUENTO 
(
   DES_BASE             numeric(20)                    not null,
   DES_PORCEC           decimal(100)                   not null,
   DES_ID               numeric(25)                    not null,
   LIN_NUM              numeric(30)                    null,
   constraint PK_DESCUENTO primary key (DES_ID)
);

/*==============================================================*/
/* Index: DESCUENTO_PK                                          */
/*==============================================================*/
create unique index DESCUENTO_PK on DESCUENTO (
DES_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on DESCUENTO (
LIN_NUM ASC
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO 
(
   EMP_ID               numeric(30)                    not null,
   DEP_COD              numeric(30)                    null,
   EMP_NOMBRE           varchar(40)                    not null,
   EMP_NUDEIDENFISC     numeric(20)                    not null,
   EMP_NUMDEHIJOS       numeric(20)                    not null,
   EMP_PORHACIENDA      numeric(100)                   not null,
   EMP_BANCOSU          numeric(30)                    not null,
   EMP_BACNOCUENTA      numeric(20)                    not null,
   EMP_BANCONOMBRE      varchar(30)                    not null,
   constraint PK_EMPLEADO primary key (EMP_ID)
);

/*==============================================================*/
/* Index: EMPLEADO_PK                                           */
/*==============================================================*/
create unique index EMPLEADO_PK on EMPLEADO (
EMP_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on EMPLEADO (
DEP_COD ASC
);

/*==============================================================*/
/* Table: INGRESO                                               */
/*==============================================================*/
create table INGRESO 
(
   INGRE_ID             numeric(30)                    not null,
   LIN_NUM              numeric(30)                    null,
   CONCEP_COD           numeric(20)                    null,
   constraint PK_INGRESO primary key (INGRE_ID)
);

/*==============================================================*/
/* Index: INGRESO_PK                                            */
/*==============================================================*/
create unique index INGRESO_PK on INGRESO (
INGRE_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on INGRESO (
CONCEP_COD ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on INGRESO (
LIN_NUM ASC
);

/*==============================================================*/
/* Table: LINEA                                                 */
/*==============================================================*/
create table LINEA 
(
   LIN_NUM              numeric(30)                    not null,
   NOM_ID               numeric(30)                    null,
   LIN_SANT             varchar(20)                    not null,
   constraint PK_LINEA primary key (LIN_NUM)
);

/*==============================================================*/
/* Index: LINEA_PK                                              */
/*==============================================================*/
create unique index LINEA_PK on LINEA (
LIN_NUM ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_8_FK on LINEA (
NOM_ID ASC
);

/*==============================================================*/
/* Table: NOMINA                                                */
/*==============================================================*/
create table NOMINA 
(
   NOM_EF               numeric(20)                    not null,
   NOM_INGRE            numeric(100)                   not null,
   NOM_DESC             numeric(100)                   not null,
   NOM_NOMBRE           varchar(30)                    not null,
   NOM_ID               numeric(30)                    not null,
   EMP_ID               numeric(30)                    null,
   constraint PK_NOMINA primary key (NOM_ID)
);

/*==============================================================*/
/* Index: NOMINA_PK                                             */
/*==============================================================*/
create unique index NOMINA_PK on NOMINA (
NOM_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on NOMINA (
EMP_ID ASC
);

/*==============================================================*/
/* Table: SEDE                                                  */
/*==============================================================*/
create table SEDE 
(
   SED_COD              numeric(20)                    not null,
   DEP_COD              numeric(30)                    null,
   SED_NOM              varchar(30)                    not null,
   constraint PK_SEDE primary key (SED_COD)
);

/*==============================================================*/
/* Index: SEDE_PK                                               */
/*==============================================================*/
create unique index SEDE_PK on SEDE (
SED_COD ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on SEDE (
DEP_COD ASC
);

alter table DESCUENTO
   add constraint FK_DESCUENT_RELATIONS_LINEA foreign key (LIN_NUM)
      references LINEA (LIN_NUM)
      on update restrict
      on delete restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_DEPARTAM foreign key (DEP_COD)
      references DEPARTAMENTO (DEP_COD)
      on update restrict
      on delete restrict;

alter table INGRESO
   add constraint FK_INGRESO_RELATIONS_LINEA foreign key (LIN_NUM)
      references LINEA (LIN_NUM)
      on update restrict
      on delete restrict;

alter table INGRESO
   add constraint FK_INGRESO_RELATIONS_CONCEPTO foreign key (CONCEP_COD)
      references CONCEPTO_TRIBUTARIO (CONCEP_COD)
      on update restrict
      on delete restrict;

alter table LINEA
   add constraint FK_LINEA_RELATIONS_NOMINA foreign key (NOM_ID)
      references NOMINA (NOM_ID)
      on update restrict
      on delete restrict;

alter table NOMINA
   add constraint FK_NOMINA_RELATIONS_EMPLEADO foreign key (EMP_ID)
      references EMPLEADO (EMP_ID)
      on update restrict
      on delete restrict;

alter table SEDE
   add constraint FK_SEDE_RELATIONS_DEPARTAM foreign key (DEP_COD)
      references DEPARTAMENTO (DEP_COD)
      on update restrict
      on delete restrict;

