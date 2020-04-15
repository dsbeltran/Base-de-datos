/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     15/10/2019 17:55:26                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_EXAMENES_RELATIONS_HISTORIA') then
    alter table EXAMENES
       delete foreign key FK_EXAMENES_RELATIONS_HISTORIA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_EXAMENES_RELATIONS_TIPO_EXA') then
    alter table EXAMENES
       delete foreign key FK_EXAMENES_RELATIONS_TIPO_EXA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_FICHA_VI_RELATIONS_PACIENTE') then
    alter table FICHA_VISITA
       delete foreign key FK_FICHA_VI_RELATIONS_PACIENTE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_FICHA_VI_RELATIONS_PERSONAL') then
    alter table FICHA_VISITA
       delete foreign key FK_FICHA_VI_RELATIONS_PERSONAL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HABITACI_RELATIONS_PROPIETA') then
    alter table HABITACION_CONSULTORIO
       delete foreign key FK_HABITACI_RELATIONS_PROPIETA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HABITACI_RELATIONS_ARRENDAT') then
    alter table HABITACION_CONSULTORIO
       delete foreign key FK_HABITACI_RELATIONS_ARRENDAT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HABITACI_RELATIONS_TORRES') then
    alter table HABITACION_CONSULTORIO
       delete foreign key FK_HABITACI_RELATIONS_TORRES
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HISTORIA_RELATIONS_PACIENTE') then
    alter table HISTORIAL_SERVICIO
       delete foreign key FK_HISTORIA_RELATIONS_PACIENTE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HISTORIA_RELATIONS_TIPO_SER') then
    alter table HISTORIAL_SERVICIO
       delete foreign key FK_HISTORIA_RELATIONS_TIPO_SER
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_HISTORIA_RELATIONS_PERSONAL') then
    alter table HISTORIAL_SERVICIO
       delete foreign key FK_HISTORIA_RELATIONS_PERSONAL
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MEDICAME_RELATIONS_HISTORIA') then
    alter table MEDICAMENTOS
       delete foreign key FK_MEDICAME_RELATIONS_HISTORIA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_MEDICAME_RELATIONS_TIPO_MED') then
    alter table MEDICAMENTOS
       delete foreign key FK_MEDICAME_RELATIONS_TIPO_MED
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PACIENTE_RELATIONS_HABITACI') then
    alter table PACIENTE
       delete foreign key FK_PACIENTE_RELATIONS_HABITACI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PERSONAL_RELATIONS_CLINICA') then
    alter table PERSONAL_ADM_OPER
       delete foreign key FK_PERSONAL_RELATIONS_CLINICA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_REMODELA_RELATIONS_HABITACI') then
    alter table REMODELACION
       delete foreign key FK_REMODELA_RELATIONS_HABITACI
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SUMINIST_RELATIONS_HISTORIA') then
    alter table SUMINISTROS
       delete foreign key FK_SUMINIST_RELATIONS_HISTORIA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_SUMINIST_RELATIONS_TIPO_SUM') then
    alter table SUMINISTROS
       delete foreign key FK_SUMINIST_RELATIONS_TIPO_SUM
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TORRES_RELATIONS_CLINICA') then
    alter table TORRES
       delete foreign key FK_TORRES_RELATIONS_CLINICA
end if;

drop index if exists ARRENDATARIO.ARRENDATARIO_PK;

drop table if exists ARRENDATARIO;

drop index if exists CLINICA.CLINICA_PK;

drop table if exists CLINICA;

drop index if exists EXAMENES.RELATIONSHIP_6_FK;

drop index if exists EXAMENES.RELATIONSHIP_3_FK;

drop index if exists EXAMENES.EXAMENES_PK;

drop table if exists EXAMENES;

drop index if exists FICHA_VISITA.RELATIONSHIP_10_FK;

drop index if exists FICHA_VISITA.RELATIONSHIP_9_FK;

drop index if exists FICHA_VISITA.FICHA_VISITA_PK;

drop table if exists FICHA_VISITA;

drop index if exists HABITACION_CONSULTORIO.RELATIONSHIP_16_FK;

drop index if exists HABITACION_CONSULTORIO.RELATIONSHIP_14_FK;

drop index if exists HABITACION_CONSULTORIO.RELATIONSHIP_13_FK;

drop index if exists HABITACION_CONSULTORIO.HABITACION_CONSULTORIO_PK;

drop table if exists HABITACION_CONSULTORIO;

drop index if exists HISTORIAL_SERVICIO.RELATIONSHIP_11_FK;

drop index if exists HISTORIAL_SERVICIO.RELATIONSHIP_8_FK;

drop index if exists HISTORIAL_SERVICIO.RELATIONSHIP_7_FK;

drop index if exists HISTORIAL_SERVICIO.HISTORIAL_SERVICIO_PK;

drop table if exists HISTORIAL_SERVICIO;

drop index if exists MEDICAMENTOS.RELATIONSHIP_5_FK;

drop index if exists MEDICAMENTOS.RELATIONSHIP_2_FK;

drop index if exists MEDICAMENTOS.MEDICAMENTOS_PK;

drop table if exists MEDICAMENTOS;

drop index if exists PACIENTE.RELATIONSHIP_12_FK;

drop index if exists PACIENTE.PACIENTE_PK;

drop table if exists PACIENTE;

drop index if exists PERSONAL_ADM_OPER.RELATIONSHIP_18_FK;

drop index if exists PERSONAL_ADM_OPER.PERSONAL_ADM_OPER_PK;

drop table if exists PERSONAL_ADM_OPER;

drop index if exists PERSONAL_PLANTA.PERSONAL_PLANTA_PK;

drop table if exists PERSONAL_PLANTA;

drop index if exists PROPIETARIO.PROPIETARIO_PK;

drop table if exists PROPIETARIO;

drop index if exists REMODELACION.RELATIONSHIP_15_FK;

drop index if exists REMODELACION.REMODELACION_PK;

drop table if exists REMODELACION;

drop index if exists SUMINISTROS.RELATIONSHIP_4_FK;

drop index if exists SUMINISTROS.RELATIONSHIP_1_FK;

drop index if exists SUMINISTROS.SUMINISTROS_PK;

drop table if exists SUMINISTROS;

drop index if exists TIPO_EXAMENES.TIPO_EXAMENES_PK;

drop table if exists TIPO_EXAMENES;

drop index if exists TIPO_MEDICAMENTOS.TIPO_MEDICAMENTOS_PK;

drop table if exists TIPO_MEDICAMENTOS;

drop index if exists TIPO_SERVICIOS.TIPO_SERVICIOS_PK;

drop table if exists TIPO_SERVICIOS;

drop index if exists TIPO_SUMINISTROS.TIPO_SUMINISTROS_PK;

drop table if exists TIPO_SUMINISTROS;

drop index if exists TORRES.RELATIONSHIP_17_FK;

drop index if exists TORRES.TORRES_PK;

drop table if exists TORRES;

/*==============================================================*/
/* Table: ARRENDATARIO                                          */
/*==============================================================*/
create table ARRENDATARIO 
(
   ARR_RUC              numeric(20)                    not null,
   ARR_NOMBRE           varchar(30)                    not null,
   ARR_DIRECCION        varchar(30)                    not null,
   ARR_TELEFONO         numeric(15)                    not null,
   constraint PK_ARRENDATARIO primary key (ARR_RUC)
);

/*==============================================================*/
/* Index: ARRENDATARIO_PK                                       */
/*==============================================================*/
create unique index ARRENDATARIO_PK on ARRENDATARIO (
ARR_RUC ASC
);

/*==============================================================*/
/* Table: CLINICA                                               */
/*==============================================================*/
create table CLINICA 
(
   CLI_RUC              numeric(20)                    not null,
   CLIC_NOMBRE          varchar(30)                    not null,
   CLIC_DIRECCION       varchar(40)                    not null,
   constraint PK_CLINICA primary key (CLI_RUC)
);

/*==============================================================*/
/* Index: CLINICA_PK                                            */
/*==============================================================*/
create unique index CLINICA_PK on CLINICA (
CLI_RUC ASC
);

/*==============================================================*/
/* Table: EXAMENES                                              */
/*==============================================================*/
create table EXAMENES 
(
   EXA_ID               numeric(15)                    not null,
   TEXA_ID              numeric(15)                    not null,
   SER_ID               varchar(20)                    not null,
   EXA_FECHA            date                           not null,
   EXA_CANTIDAD         numeric(15)                    not null,
   EXA_VALOR            numeric(20)                    not null,
   constraint PK_EXAMENES primary key (EXA_ID)
);

/*==============================================================*/
/* Index: EXAMENES_PK                                           */
/*==============================================================*/
create unique index EXAMENES_PK on EXAMENES (
EXA_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on EXAMENES (
SER_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on EXAMENES (
TEXA_ID ASC
);

/*==============================================================*/
/* Table: FICHA_VISITA                                          */
/*==============================================================*/
create table FICHA_VISITA 
(
   VIS_ID               numeric(20)                    not null,
   PAC_ID               numeric(30)                    not null,
   PER_ID               numeric(20)                    not null,
   VIS_FECHA            date                           not null,
   VIS_HORA_            date                           not null,
   constraint PK_FICHA_VISITA primary key (VIS_ID)
);

/*==============================================================*/
/* Index: FICHA_VISITA_PK                                       */
/*==============================================================*/
create unique index FICHA_VISITA_PK on FICHA_VISITA (
VIS_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_9_FK on FICHA_VISITA (
PER_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_10_FK on FICHA_VISITA (
PAC_ID ASC
);

/*==============================================================*/
/* Table: HABITACION_CONSULTORIO                                */
/*==============================================================*/
create table HABITACION_CONSULTORIO 
(
   HAB_NUMERO           numeric(100)                   not null,
   TORR_ID              numeric(20)                    not null,
   PRO_RUC              numeric(20)                    not null,
   ARR_RUC              numeric(20)                    not null,
   HAB_PISO             numeric(10)                    not null,
   HAB_ANCHO            numeric(10)                    not null,
   HAB_LARGO            numeric(10)                    not null,
   HAB_BANO             numeric(5)                     not null,
   HAB_CLOSETS          numeric(10)                    not null,
   HAB_CAMA             numeric(5)                     not null,
   HAB_VENTANA          numeric(10)                    not null,
   HAB_TIPO_            varchar(10)                    not null,
   HAB_PROPIA_          varchar(10)                    not null,
   HAB_VALOR_METRO      numeric(40)                    not null,
   HAB_SIMPLE           numeric(2)                     not null,
   HAB_TV               numeric(5)                     not null,
   HAB_COSTO_DIARIO     numeric(50)                    not null,
   constraint PK_HABITACION_CONSULTORIO primary key (HAB_NUMERO)
);

/*==============================================================*/
/* Index: HABITACION_CONSULTORIO_PK                             */
/*==============================================================*/
create unique index HABITACION_CONSULTORIO_PK on HABITACION_CONSULTORIO (
HAB_NUMERO ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_13_FK on HABITACION_CONSULTORIO (
PRO_RUC ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_14_FK on HABITACION_CONSULTORIO (
ARR_RUC ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_16_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_16_FK on HABITACION_CONSULTORIO (
TORR_ID ASC
);

/*==============================================================*/
/* Table: HISTORIAL_SERVICIO                                    */
/*==============================================================*/
create table HISTORIAL_SERVICIO 
(
   SER_ID               varchar(20)                    not null,
   TSER_ID_             numeric(10)                    not null,
   PAC_ID               numeric(30)                    not null,
   PER_ID               numeric(20)                    not null,
   SER_FECHADESDE       date                           not null,
   SER_FECHAHASTA       date                           not null,
   SER_COMENTARIOS      varchar(30)                    not null,
   constraint PK_HISTORIAL_SERVICIO primary key (SER_ID)
);

/*==============================================================*/
/* Index: HISTORIAL_SERVICIO_PK                                 */
/*==============================================================*/
create unique index HISTORIAL_SERVICIO_PK on HISTORIAL_SERVICIO (
SER_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on HISTORIAL_SERVICIO (
TSER_ID_ ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_8_FK on HISTORIAL_SERVICIO (
PER_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_11_FK on HISTORIAL_SERVICIO (
PAC_ID ASC
);

/*==============================================================*/
/* Table: MEDICAMENTOS                                          */
/*==============================================================*/
create table MEDICAMENTOS 
(
   MED_ID               numeric(15)                    not null,
   SER_ID               varchar(20)                    not null,
   TMED_ID              numeric(20)                    not null,
   MED_FECHA            date                           not null,
   MED_CANTIDAD         numeric(20)                    not null,
   MED_VALOR            numeric(20)                    not null,
   constraint PK_MEDICAMENTOS primary key (MED_ID)
);

/*==============================================================*/
/* Index: MEDICAMENTOS_PK                                       */
/*==============================================================*/
create unique index MEDICAMENTOS_PK on MEDICAMENTOS (
MED_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on MEDICAMENTOS (
SER_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on MEDICAMENTOS (
TMED_ID ASC
);

/*==============================================================*/
/* Table: PACIENTE                                              */
/*==============================================================*/
create table PACIENTE 
(
   PAC_ID               numeric(30)                    not null,
   HAB_NUMERO           numeric(100)                   not null,
   PAC_CEDULA           numeric(10)                    not null,
   PAC_NOMBRE           varchar(20)                    not null,
   PAC_DIRECCION        varchar(20)                    not null,
   PAC_TELEFONO         numeric(15)                    not null,
   PAC_AFILIACION_      varchar(10)                    not null,
   PAC_ENFERMEDADES     varchar(15)                    not null,
   PAC_CIRUGIAS_        varchar(15)                    not null,
   constraint PK_PACIENTE primary key (PAC_ID)
);

/*==============================================================*/
/* Index: PACIENTE_PK                                           */
/*==============================================================*/
create unique index PACIENTE_PK on PACIENTE (
PAC_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_12_FK on PACIENTE (
HAB_NUMERO ASC
);

/*==============================================================*/
/* Table: PERSONAL_ADM_OPER                                     */
/*==============================================================*/
create table PERSONAL_ADM_OPER 
(
   ADM_ID               numeric(15)                    not null,
   CLI_RUC              numeric(20)                    not null,
   ADM_CEDULA           numeric(15)                    not null,
   ADM__NOMBRE          varchar(20)                    not null,
   ADM__TELEFONO        numeric(15)                    not null,
   ADM__DIRECCION_      varchar(20)                    not null,
   ADM__AREA_           varchar(15)                    not null,
   constraint PK_PERSONAL_ADM_OPER primary key (ADM_ID)
);

/*==============================================================*/
/* Index: PERSONAL_ADM_OPER_PK                                  */
/*==============================================================*/
create unique index PERSONAL_ADM_OPER_PK on PERSONAL_ADM_OPER (
ADM_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_18_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_18_FK on PERSONAL_ADM_OPER (
CLI_RUC ASC
);

/*==============================================================*/
/* Table: PERSONAL_PLANTA                                       */
/*==============================================================*/
create table PERSONAL_PLANTA 
(
   PER_ID               numeric(20)                    not null,
   PER_CEDULA           numeric(15)                    not null,
   PER_NOMBRE           varchar(20)                    not null,
   PER_TELEFONO         numeric(15)                    not null,
   PER_ESPECIALIZACION  varchar(20)                    not null,
   PER_CATEGORIA_       varchar(30)                    not null,
   constraint PK_PERSONAL_PLANTA primary key (PER_ID)
);

/*==============================================================*/
/* Index: PERSONAL_PLANTA_PK                                    */
/*==============================================================*/
create unique index PERSONAL_PLANTA_PK on PERSONAL_PLANTA (
PER_ID ASC
);

/*==============================================================*/
/* Table: PROPIETARIO                                           */
/*==============================================================*/
create table PROPIETARIO 
(
   PRO_RUC              numeric(20)                    not null,
   PRO_NOMBRE           varchar(30)                    not null,
   PRO_TELEFONO         numeric(15)                    not null,
   PRO_DIRECCION        varchar(30)                    not null,
   constraint PK_PROPIETARIO primary key (PRO_RUC)
);

/*==============================================================*/
/* Index: PROPIETARIO_PK                                        */
/*==============================================================*/
create unique index PROPIETARIO_PK on PROPIETARIO (
PRO_RUC ASC
);

/*==============================================================*/
/* Table: REMODELACION                                          */
/*==============================================================*/
create table REMODELACION 
(
   REM_ID               numeric(100)                   not null,
   HAB_NUMERO           numeric(100)                   not null,
   REM_NUMERO_HAB       numeric(50)                    not null,
   REM_FECHA_MANT       date                           not null,
   REM_VALOR_ADM        numeric(300)                   not null,
   REM_COSTO_           numeric(300)                   not null,
   constraint PK_REMODELACION primary key (REM_ID)
);

/*==============================================================*/
/* Index: REMODELACION_PK                                       */
/*==============================================================*/
create unique index REMODELACION_PK on REMODELACION (
REM_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_15_FK on REMODELACION (
HAB_NUMERO ASC
);

/*==============================================================*/
/* Table: SUMINISTROS                                           */
/*==============================================================*/
create table SUMINISTROS 
(
   SUM_ID               numeric(20)                    not null,
   TSUM_ID              numeric(15)                    not null,
   SER_ID               varchar(20)                    not null,
   SUM_FECHA            date                           not null,
   SUM_CANTIDAD         numeric(15)                    not null,
   SUM_VALOR            numeric(15)                    not null,
   constraint PK_SUMINISTROS primary key (SUM_ID)
);

/*==============================================================*/
/* Index: SUMINISTROS_PK                                        */
/*==============================================================*/
create unique index SUMINISTROS_PK on SUMINISTROS (
SUM_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on SUMINISTROS (
SER_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on SUMINISTROS (
TSUM_ID ASC
);

/*==============================================================*/
/* Table: TIPO_EXAMENES                                         */
/*==============================================================*/
create table TIPO_EXAMENES 
(
   TEXA_ID              numeric(15)                    not null,
   TEXA_NOMBRE          varchar(10)                    not null,
   TEXA_COSTO           numeric(10)                    not null,
   constraint PK_TIPO_EXAMENES primary key (TEXA_ID)
);

/*==============================================================*/
/* Index: TIPO_EXAMENES_PK                                      */
/*==============================================================*/
create unique index TIPO_EXAMENES_PK on TIPO_EXAMENES (
TEXA_ID ASC
);

/*==============================================================*/
/* Table: TIPO_MEDICAMENTOS                                     */
/*==============================================================*/
create table TIPO_MEDICAMENTOS 
(
   TMED_ID              numeric(20)                    not null,
   TMED_NOMBRES_GENERICO varchar(30)                    not null,
   TMED_NOMBRE_COMERIAL varchar(20)                    not null,
   TMED_COSTO           numeric(15)                    not null,
   constraint PK_TIPO_MEDICAMENTOS primary key (TMED_ID)
);

/*==============================================================*/
/* Index: TIPO_MEDICAMENTOS_PK                                  */
/*==============================================================*/
create unique index TIPO_MEDICAMENTOS_PK on TIPO_MEDICAMENTOS (
TMED_ID ASC
);

/*==============================================================*/
/* Table: TIPO_SERVICIOS                                        */
/*==============================================================*/
create table TIPO_SERVICIOS 
(
   TSER_ID_             numeric(10)                    not null,
   TSER_NOMBRE          varchar(20)                    not null,
   TSER_COSTO           numeric(50)                    not null,
   constraint PK_TIPO_SERVICIOS primary key (TSER_ID_)
);

/*==============================================================*/
/* Index: TIPO_SERVICIOS_PK                                     */
/*==============================================================*/
create unique index TIPO_SERVICIOS_PK on TIPO_SERVICIOS (
TSER_ID_ ASC
);

/*==============================================================*/
/* Table: TIPO_SUMINISTROS                                      */
/*==============================================================*/
create table TIPO_SUMINISTROS 
(
   TSUM_ID              numeric(15)                    not null,
   TSUM_NOMBRE_         varchar(30)                    not null,
   TSUM_COSTO           numeric(20)                    not null,
   constraint PK_TIPO_SUMINISTROS primary key (TSUM_ID)
);

/*==============================================================*/
/* Index: TIPO_SUMINISTROS_PK                                   */
/*==============================================================*/
create unique index TIPO_SUMINISTROS_PK on TIPO_SUMINISTROS (
TSUM_ID ASC
);

/*==============================================================*/
/* Table: TORRES                                                */
/*==============================================================*/
create table TORRES 
(
   TORR_ID              numeric(20)                    not null,
   CLI_RUC              numeric(20)                    not null,
   TORR_NOMBRES         varchar(30)                    not null,
   TORR_TIPO_           varchar(10)                    not null,
   constraint PK_TORRES primary key (TORR_ID)
);

/*==============================================================*/
/* Index: TORRES_PK                                             */
/*==============================================================*/
create unique index TORRES_PK on TORRES (
TORR_ID ASC
);

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create index RELATIONSHIP_17_FK on TORRES (
CLI_RUC ASC
);

alter table EXAMENES
   add constraint FK_EXAMENES_RELATIONS_HISTORIA foreign key (SER_ID)
      references HISTORIAL_SERVICIO (SER_ID)
      on update restrict
      on delete restrict;

alter table EXAMENES
   add constraint FK_EXAMENES_RELATIONS_TIPO_EXA foreign key (TEXA_ID)
      references TIPO_EXAMENES (TEXA_ID)
      on update restrict
      on delete restrict;

alter table FICHA_VISITA
   add constraint FK_FICHA_VI_RELATIONS_PACIENTE foreign key (PAC_ID)
      references PACIENTE (PAC_ID)
      on update restrict
      on delete restrict;

alter table FICHA_VISITA
   add constraint FK_FICHA_VI_RELATIONS_PERSONAL foreign key (PER_ID)
      references PERSONAL_PLANTA (PER_ID)
      on update restrict
      on delete restrict;

alter table HABITACION_CONSULTORIO
   add constraint FK_HABITACI_RELATIONS_PROPIETA foreign key (PRO_RUC)
      references PROPIETARIO (PRO_RUC)
      on update restrict
      on delete restrict;

alter table HABITACION_CONSULTORIO
   add constraint FK_HABITACI_RELATIONS_ARRENDAT foreign key (ARR_RUC)
      references ARRENDATARIO (ARR_RUC)
      on update restrict
      on delete restrict;

alter table HABITACION_CONSULTORIO
   add constraint FK_HABITACI_RELATIONS_TORRES foreign key (TORR_ID)
      references TORRES (TORR_ID)
      on update restrict
      on delete restrict;

alter table HISTORIAL_SERVICIO
   add constraint FK_HISTORIA_RELATIONS_PACIENTE foreign key (PAC_ID)
      references PACIENTE (PAC_ID)
      on update restrict
      on delete restrict;

alter table HISTORIAL_SERVICIO
   add constraint FK_HISTORIA_RELATIONS_TIPO_SER foreign key (TSER_ID_)
      references TIPO_SERVICIOS (TSER_ID_)
      on update restrict
      on delete restrict;

alter table HISTORIAL_SERVICIO
   add constraint FK_HISTORIA_RELATIONS_PERSONAL foreign key (PER_ID)
      references PERSONAL_PLANTA (PER_ID)
      on update restrict
      on delete restrict;

alter table MEDICAMENTOS
   add constraint FK_MEDICAME_RELATIONS_HISTORIA foreign key (SER_ID)
      references HISTORIAL_SERVICIO (SER_ID)
      on update restrict
      on delete restrict;

alter table MEDICAMENTOS
   add constraint FK_MEDICAME_RELATIONS_TIPO_MED foreign key (TMED_ID)
      references TIPO_MEDICAMENTOS (TMED_ID)
      on update restrict
      on delete restrict;

alter table PACIENTE
   add constraint FK_PACIENTE_RELATIONS_HABITACI foreign key (HAB_NUMERO)
      references HABITACION_CONSULTORIO (HAB_NUMERO)
      on update restrict
      on delete restrict;

alter table PERSONAL_ADM_OPER
   add constraint FK_PERSONAL_RELATIONS_CLINICA foreign key (CLI_RUC)
      references CLINICA (CLI_RUC)
      on update restrict
      on delete restrict;

alter table REMODELACION
   add constraint FK_REMODELA_RELATIONS_HABITACI foreign key (HAB_NUMERO)
      references HABITACION_CONSULTORIO (HAB_NUMERO)
      on update restrict
      on delete restrict;

alter table SUMINISTROS
   add constraint FK_SUMINIST_RELATIONS_HISTORIA foreign key (SER_ID)
      references HISTORIAL_SERVICIO (SER_ID)
      on update restrict
      on delete restrict;

alter table SUMINISTROS
   add constraint FK_SUMINIST_RELATIONS_TIPO_SUM foreign key (TSUM_ID)
      references TIPO_SUMINISTROS (TSUM_ID)
      on update restrict
      on delete restrict;

alter table TORRES
   add constraint FK_TORRES_RELATIONS_CLINICA foreign key (CLI_RUC)
      references CLINICA (CLI_RUC)
      on update restrict
      on delete restrict;

