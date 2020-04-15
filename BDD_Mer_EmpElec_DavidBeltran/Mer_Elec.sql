/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     25/11/2019 8:19:32                           */
/*==============================================================*/


drop table if exists CENTRAL_HIDROELECTRICA;

drop table if exists CENTRAL_NUCLEAR;

drop table if exists CENTRAL_SOLAR;

drop table if exists CENTRAL_TERMICA;

drop table if exists COMPANIA;

drop table if exists ESTACION_PRIMARIA;

drop table if exists LINEA;

drop table if exists PORTE;

drop table if exists PRODUCTOR_BASICO;

drop table if exists PROVEE;

drop table if exists PROVINCIA;

drop table if exists RED;

drop table if exists SUBESTACION;

drop table if exists SUMINISTRADOR;

drop table if exists TIENE;

drop table if exists TRANSPORTISTA;

drop table if exists ZONA_DE_SERVICIO;

/*==============================================================*/
/* Table: CENTRAL_HIDROELECTRICA                                */
/*==============================================================*/
create table CENTRAL_HIDROELECTRICA
(
   CH_OCUPACION         numeric(30,0) not null,
   CH_CAPACIDADMAXIMA   numeric(50,0) not null,
   CH_NTURBINAS         numeric(100,0) not null,
   CH_ID                numeric(50,0) not null,
   PRB_NOMBRE           varchar(40),
   primary key (CH_ID)
);

/*==============================================================*/
/* Table: CENTRAL_NUCLEAR                                       */
/*==============================================================*/
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
/* Table: CENTRAL_SOLAR                                         */
/*==============================================================*/
create table CENTRAL_SOLAR
(
   CS_SUPPANELES        numeric(30,0) not null,
   CS_MEDIAANUALHSOL    numeric(100,0) not null,
   CS_TIPO              varchar(50) not null,
   CS_ID                numeric(30,0) not null,
   PRB_NOMBRE           varchar(40),
   primary key (CS_ID)
);

/*==============================================================*/
/* Table: CENTRAL_TERMICA                                       */
/*==============================================================*/
create table CENTRAL_TERMICA
(
   CT_NHORNOS           numeric(100,0) not null,
   CT_VCARBON           numeric(100,0) not null,
   CT_VEMISIONGAS       numeric(100,0) not null,
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
   RED_NUMERO           numeric(100,0),
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
   RED_NUMERO           numeric(100,0),
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
   PRB_PRODUCION_MEDIA  numeric(100,0) not null,
   PRB_PROCUCIONMAXIMA  numeric(100,0) not null,
   primary key (PRB_NOMBRE)
);

/*==============================================================*/
/* Table: PROVEE                                                */
/*==============================================================*/
create table PROVEE
(
   PROVEE_ID            numeric(100,0) not null,
   ESPR_NOMBRE          varchar(40),
   PRB_NOMBRE           varchar(40),
   primary key (PROVEE_ID)
);

/*==============================================================*/
/* Table: PROVINCIA                                             */
/*==============================================================*/
create table PROVINCIA
(
   PRO_CODIGO           numeric(100,0) not null,
   PRO_NOMBRE           varchar(40) not null,
   primary key (PRO_CODIGO)
);

/*==============================================================*/
/* Table: RED                                                   */
/*==============================================================*/
create table RED
(
   RED_NUMERO           numeric(100,0) not null,
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
   PRO_CODIGO           numeric(100,0),
   primary key (ZDS_ID)
);

alter table CENTRAL_HIDROELECTRICA add constraint FK_RELATIONSHIP_11 foreign key (PRB_NOMBRE)
      references PRODUCTOR_BASICO (PRB_NOMBRE) on delete restrict on update restrict;

alter table CENTRAL_NUCLEAR add constraint FK_RELATIONSHIP_12 foreign key (PRB_NOMBRE)
      references PRODUCTOR_BASICO (PRB_NOMBRE) on delete restrict on update restrict;

alter table CENTRAL_SOLAR add constraint FK_RELATIONSHIP_13 foreign key (PRB_NOMBRE)
      references PRODUCTOR_BASICO (PRB_NOMBRE) on delete restrict on update restrict;

alter table CENTRAL_TERMICA add constraint FK_RELATIONSHIP_14 foreign key (PRB_NOMBRE)
      references PRODUCTOR_BASICO (PRB_NOMBRE) on delete restrict on update restrict;

alter table COMPANIA add constraint FK_RELATIONSHIP_1 foreign key (RED_NUMERO)
      references RED (RED_NUMERO) on delete restrict on update restrict;

alter table LINEA add constraint FK_RELATIONSHIP_2 foreign key (RED_NUMERO)
      references RED (RED_NUMERO) on delete restrict on update restrict;

alter table PORTE add constraint FK_RELATIONSHIP_15 foreign key (CN_ID)
      references CENTRAL_NUCLEAR (CN_ID) on delete restrict on update restrict;

alter table PORTE add constraint FK_RELATIONSHIP_16 foreign key (SUM_ID)
      references SUMINISTRADOR (SUM_ID) on delete restrict on update restrict;

alter table PORTE add constraint FK_RELATIONSHIP_17 foreign key (TRA_NOMBRE)
      references TRANSPORTISTA (TRA_NOMBRE) on delete restrict on update restrict;

alter table PROVEE add constraint FK_RELATIONSHIP_10 foreign key (PRB_NOMBRE)
      references PRODUCTOR_BASICO (PRB_NOMBRE) on delete restrict on update restrict;

alter table PROVEE add constraint FK_RELATIONSHIP_9 foreign key (ESPR_NOMBRE)
      references ESTACION_PRIMARIA (ESPR_NOMBRE) on delete restrict on update restrict;

alter table RED add constraint FK_RELATIONSHIP_3 foreign key (ESPR_NOMBRE)
      references ESTACION_PRIMARIA (ESPR_NOMBRE) on delete restrict on update restrict;

alter table SUBESTACION add constraint FK_RELATIONSHIP_4 foreign key (LIN_NUMSEC)
      references LINEA (LIN_NUMSEC) on delete restrict on update restrict;

alter table TIENE add constraint FK_RELATIONSHIP_7 foreign key (SUB_ID)
      references SUBESTACION (SUB_ID) on delete restrict on update restrict;

alter table TIENE add constraint FK_RELATIONSHIP_8 foreign key (ZDS_ID)
      references ZONA_DE_SERVICIO (ZDS_ID) on delete restrict on update restrict;

alter table ZONA_DE_SERVICIO add constraint FK_RELATIONSHIP_6 foreign key (PRO_CODIGO)
      references PROVINCIA (PRO_CODIGO) on delete restrict on update restrict;

