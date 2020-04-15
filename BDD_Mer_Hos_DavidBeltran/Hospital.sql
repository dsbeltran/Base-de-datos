/*==============================================================*/
/* DBMS name:      PostgreSQL 7.3                               */
/* Created on:     15/12/2019 06:27:37 p. m.                    */
/*==============================================================*/
/*==============================================================*/
/* Table: HOSPITAL                                              */
/*==============================================================*/
create table HOSPITAL (
ID_HOSTPITAL         NUMERIC              not null,
NOMBRE_HOSPITAL      CHAR(256)            not null,
HOS_CIUDAD           CHAR(256)            not null,
HOS_TELEFNO          NUMERIC              not null,
constraint PK_HOSPITAL primary key (ID_HOSTPITAL)
);

/*==============================================================*/
/* Index: HOSPITAL_PK                                           */
/*==============================================================*/
create unique index HOSPITAL_PK on HOSPITAL (
ID_HOSTPITAL
);

/*==============================================================*/
/* Table: MEDICO                                                */
/*==============================================================*/
create table MEDICO (
MED_COD              NUMERIC              not null,
ID_HOSTPITAL         NUMERIC              not null,
MED_NOMBRE           CHAR(256)            not null,
MED_FECHANACI        DATE                 not null,
MED_TELEFNO          NUMERIC              not null,
constraint PK_MEDICO primary key (MED_COD)
);

/*==============================================================*/
/* Index: MEDICO_PK                                             */
/*==============================================================*/
create unique index MEDICO_PK on MEDICO (
MED_COD
);

/*==============================================================*/
/* Index: PERTENECE_FK                                          */
/*==============================================================*/
create  index PERTENECE_FK on MEDICO (
ID_HOSTPITAL
);

/*==============================================================*/
/* Table: MEDICO_TRABAJA                                        */
/*==============================================================*/
create table MEDICO_TRABAJA (
ID_MED_TRABA         NUMERIC              not null,
MED_COD              NUMERIC              not null,
ID_SERV_HOSPITAL     NUMERIC              not null,
constraint PK_MEDICO_TRABAJA primary key (ID_MED_TRABA)
);

/*==============================================================*/
/* Index: MEDICO_TRABAJA_PK                                     */
/*==============================================================*/
create unique index MEDICO_TRABAJA_PK on MEDICO_TRABAJA (
ID_MED_TRABA
);

/*==============================================================*/
/* Index: ME_MT_FK                                              */
/*==============================================================*/
create  index ME_MT_FK on MEDICO_TRABAJA (
MED_COD
);

/*==============================================================*/
/* Index: SER_MED_FK                                            */
/*==============================================================*/
create  index SER_MED_FK on MEDICO_TRABAJA (
ID_SERV_HOSPITAL
);

/*==============================================================*/
/* Table: PACIENTE                                              */
/*==============================================================*/
create table PACIENTE (
ID_PAC               NUMERIC              not null,
NOMBR_PAC            CHAR(256)            not null,
FEHCA_NOC            DATE                 not null,
COD_HIST             NUMERIC              not null,
NUM_SS               NUMERIC              not null,
OTROS                CHAR(256)            not null,
constraint PK_PACIENTE primary key (ID_PAC)
);

/*==============================================================*/
/* Index: PACIENTE_PK                                           */
/*==============================================================*/
create unique index PACIENTE_PK on PACIENTE (
ID_PAC
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
SER_COD              NUMERIC              not null,
SERV_NOMBRE          CHAR(256)            not null,
SER_COMENTARIO       CHAR(256)            not null,
constraint PK_SERVICIO primary key (SER_COD)
);

/*==============================================================*/
/* Index: SERVICIO_PK                                           */
/*==============================================================*/
create unique index SERVICIO_PK on SERVICIO (
SER_COD
);

/*==============================================================*/
/* Table: SERVICIO_HOSPITAL                                     */
/*==============================================================*/
create table SERVICIO_HOSPITAL (
ID_HOSPITAL          NUMERIC              not null,
ID_SERV_HOSPITAL     NUMERIC              not null,
ID_HOSTPITAL         NUMERIC              not null,
SER_COD              NUMERIC              not null,
constraint PK_SERVICIO_HOSPITAL primary key (ID_SERV_HOSPITAL)
);

/*==============================================================*/
/* Index: SERVICIO_HOSPITAL_PK                                  */
/*==============================================================*/
create unique index SERVICIO_HOSPITAL_PK on SERVICIO_HOSPITAL (
ID_SERV_HOSPITAL
);

/*==============================================================*/
/* Index: SER_SERHOS_FK                                         */
/*==============================================================*/
create  index SER_SERHOS_FK on SERVICIO_HOSPITAL (
SER_COD
);

/*==============================================================*/
/* Index: SERHOS_HOS_FK                                         */
/*==============================================================*/
create  index SERHOS_HOS_FK on SERVICIO_HOSPITAL (
ID_HOSTPITAL
);

/*==============================================================*/
/* Table: VISITA_MEDICA                                         */
/*==============================================================*/
create table VISITA_MEDICA (
FECHA_HORA           DATE                 not null,
ID_HOSTPITAL         NUMERIC              not null,
ID_PAC               NUMERIC              not null,
DIAGNOSTICO          CHAR(256)            not null,
TRATAMIENTO          CHAR(256)            not null,
NUMHAB               NUMERIC              not null,
FECHAALITA           DATE                 not null,
constraint PK_VISITA_MEDICA primary key (FECHA_HORA)
);

/*==============================================================*/
/* Index: VISITA_MEDICA_PK                                      */
/*==============================================================*/
create unique index VISITA_MEDICA_PK on VISITA_MEDICA (
FECHA_HORA
);

/*==============================================================*/
/* Index: ACUDE_FK                                              */
/*==============================================================*/
create  index ACUDE_FK on VISITA_MEDICA (
ID_PAC
);

/*==============================================================*/
/* Index: OCURRE_FK                                             */
/*==============================================================*/
create  index OCURRE_FK on VISITA_MEDICA (
ID_HOSTPITAL
);



