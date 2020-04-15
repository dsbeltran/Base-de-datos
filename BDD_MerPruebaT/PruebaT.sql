/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     29/11/2019 11:38:35                          */
/*==============================================================*/


drop index CLIENTES_PK;

drop table CLIENTES;

drop index RELATIONSHIP_1_FK;

drop index CUENTAS_PK;

drop table CUENTAS;

drop index RELATIONSHIP_6_FK;

drop index RELATIONSHIP_5_FK;

drop table DEBE;

drop index RELATIONSHIP_4_FK;

drop index PRESTAMOS_PK;

drop table PRESTAMOS;

drop index SUCURSALES_PK;

drop table SUCURSALES;

drop index RELATIONSHIP_3_FK;

drop index RELATIONSHIP_2_FK;

drop table TIENE;

/*==============================================================*/
/* Table: CLIENTES                                              */
/*==============================================================*/
create table CLIENTES (
   CLI_NOMBRE           CHAR(30)             not null,
   CLI_CALLE            CHAR(30)             not null,
   CLI_CIUDAD           CHAR(30)             not null,
   CLI_SEXO             CHAR(1)              not null,
   constraint PK_CLIENTES primary key (CLI_NOMBRE)
);

/*==============================================================*/
/* Index: CLIENTES_PK                                           */
/*==============================================================*/
create unique index CLIENTES_PK on CLIENTES (
CLI_NOMBRE
);

/*==============================================================*/
/* Table: CUENTAS                                               */
/*==============================================================*/
create table CUENTAS (
   CUE_NUMERO           CHAR(7)              not null,
   SUC_NOMBRE           CHAR(30)             not null,
   CUE_SALDO            NUMERIC(11,2)        not null,
   CUE_TIPO             CHAR(5)              not null,
   constraint PK_CUENTAS primary key (CUE_NUMERO)
);

/*==============================================================*/
/* Index: CUENTAS_PK                                            */
/*==============================================================*/
create unique index CUENTAS_PK on CUENTAS (
CUE_NUMERO
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on CUENTAS (
SUC_NOMBRE
);

/*==============================================================*/
/* Table: DEBE                                                  */
/*==============================================================*/
create table DEBE (
   PRE_NUMERO           CHAR(5)              not null,
   CLI_NOMBRE           CHAR(30)             not null
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on DEBE (
PRE_NUMERO
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on DEBE (
CLI_NOMBRE
);

/*==============================================================*/
/* Table: PRESTAMOS                                             */
/*==============================================================*/
create table PRESTAMOS (
   PRE_NUMERO           CHAR(5)              not null,
   SUC_NOMBRE           CHAR(30)             not null,
   PRE_IMPORTE          NUMERIC(11,2)        not null,
   PRE_FECHA            DATE                 not null,
   constraint PK_PRESTAMOS primary key (PRE_NUMERO)
);

/*==============================================================*/
/* Index: PRESTAMOS_PK                                          */
/*==============================================================*/
create unique index PRESTAMOS_PK on PRESTAMOS (
PRE_NUMERO
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on PRESTAMOS (
SUC_NOMBRE
);

/*==============================================================*/
/* Table: SUCURSALES                                            */
/*==============================================================*/
create table SUCURSALES (
   SUC_NOMBRE           CHAR(30)             not null,
   SUC_CUIDAD           CHAR(39)             not null,
   SUC_ACTIVO           NUMERIC(11,2)        not null,
   SUC_TELEFONO         CHAR(10)             not null,
   constraint PK_SUCURSALES primary key (SUC_NOMBRE)
);

/*==============================================================*/
/* Index: SUCURSALES_PK                                         */
/*==============================================================*/
create unique index SUCURSALES_PK on SUCURSALES (
SUC_NOMBRE
);

/*==============================================================*/
/* Table: TIENE                                                 */
/*==============================================================*/
create table TIENE (
   CLI_NOMBRE           CHAR(30)             not null,
   CUE_NUMERO           CHAR(7)              not null
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on TIENE (
CUE_NUMERO
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on TIENE (
CLI_NOMBRE
);

alter table CUENTAS
   add constraint FK_CUENTAS_RELATIONS_SUCURSAL foreign key (SUC_NOMBRE)
      references SUCURSALES (SUC_NOMBRE)
      on delete restrict on update restrict;

alter table DEBE
   add constraint FK_DEBE_RELATIONS_PRESTAMO foreign key (PRE_NUMERO)
      references PRESTAMOS (PRE_NUMERO)
      on delete restrict on update restrict;

alter table DEBE
   add constraint FK_DEBE_RELATIONS_CLIENTES foreign key (CLI_NOMBRE)
      references CLIENTES (CLI_NOMBRE)
      on delete restrict on update restrict;

alter table PRESTAMOS
   add constraint FK_PRESTAMO_RELATIONS_SUCURSAL foreign key (SUC_NOMBRE)
      references SUCURSALES (SUC_NOMBRE)
      on delete restrict on update restrict;

alter table TIENE
   add constraint FK_TIENE_RELATIONS_CUENTAS foreign key (CUE_NUMERO)
      references CUENTAS (CUE_NUMERO)
      on delete restrict on update restrict;

alter table TIENE
   add constraint FK_TIENE_RELATIONS_CLIENTES foreign key (CLI_NOMBRE)
      references CLIENTES (CLI_NOMBRE)
      on delete restrict on update restrict;

