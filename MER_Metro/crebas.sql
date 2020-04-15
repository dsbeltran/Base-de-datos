/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     11/11/2019 10:48:23                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ESTACION_LINEA') and o.name = 'FK_ESTACION_ELI_ESTACION')
alter table ESTACION_LINEA
   drop constraint FK_ESTACION_ELI_ESTACION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ESTACION_LINEA') and o.name = 'FK_ESTACION_ESTLI_LINEA')
alter table ESTACION_LINEA
   drop constraint FK_ESTACION_ESTLI_LINEA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('METRO') and o.name = 'FK_METRO_LM_LINEA')
alter table METRO
   drop constraint FK_METRO_LM_LINEA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('METRO') and o.name = 'FK_METRO_MG_GARAGE')
alter table METRO
   drop constraint FK_METRO_MG_GARAGE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ESTACIONES')
            and   type = 'U')
   drop table ESTACIONES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ESTACION_LINEA')
            and   name  = 'ELI_FK'
            and   indid > 0
            and   indid < 255)
   drop index ESTACION_LINEA.ELI_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ESTACION_LINEA')
            and   name  = 'ESTLI_FK'
            and   indid > 0
            and   indid < 255)
   drop index ESTACION_LINEA.ESTLI_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ESTACION_LINEA')
            and   type = 'U')
   drop table ESTACION_LINEA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('GARAGE')
            and   type = 'U')
   drop table GARAGE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('LINEA')
            and   type = 'U')
   drop table LINEA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('METRO')
            and   name  = 'MG_FK'
            and   indid > 0
            and   indid < 255)
   drop index METRO.MG_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('METRO')
            and   name  = 'LM_FK'
            and   indid > 0
            and   indid < 255)
   drop index METRO.LM_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('METRO')
            and   type = 'U')
   drop table METRO
go

/*==============================================================*/
/* Table: ESTACIONES                                            */
/*==============================================================*/
create table ESTACIONES (
   EST_ID               numeric(20)          not null,
   EST_NOMBRE           char(20)             not null,
   EST_DIRECCION        char(20)             not null,
   constraint PK_ESTACIONES primary key nonclustered (EST_ID)
)
go

/*==============================================================*/
/* Table: ESTACION_LINEA                                        */
/*==============================================================*/
create table ESTACION_LINEA (
   ELI_ID               numeric(20)          not null,
   EST_ID               numeric(20)          not null,
   LIN_ID               numeric(20)          not null,
   constraint PK_ESTACION_LINEA primary key nonclustered (ELI_ID)
)
go

/*==============================================================*/
/* Index: ESTLI_FK                                              */
/*==============================================================*/
create index ESTLI_FK on ESTACION_LINEA (
LIN_ID ASC
)
go

/*==============================================================*/
/* Index: ELI_FK                                                */
/*==============================================================*/
create index ELI_FK on ESTACION_LINEA (
EST_ID ASC
)
go

/*==============================================================*/
/* Table: GARAGE                                                */
/*==============================================================*/
create table GARAGE (
   GAR_ID               numeric(20)          not null,
   GAR_NOMBRE           char(20)             not null,
   GAR_DIRECCION        char(20)             not null,
   GAR_CAPACIDAD        numeric(20)          not null,
   constraint PK_GARAGE primary key nonclustered (GAR_ID)
)
go

/*==============================================================*/
/* Table: LINEA                                                 */
/*==============================================================*/
create table LINEA (
   LIN_ID               numeric(20)          not null,
   LIN_NOMBRE           char(20)             not null,
   LIN_LONGITUD         decimal(20)          not null,
   constraint PK_LINEA primary key nonclustered (LIN_ID)
)
go

/*==============================================================*/
/* Table: METRO                                                 */
/*==============================================================*/
create table METRO (
   MET_ID               numeric(20)          not null,
   GAR_ID               numeric(20)          not null,
   LIN_ID               numeric(20)          not null,
   MET_MODELO           char(20)             not null,
   MET_VAGONES          numeric(20)          not null,
   constraint PK_METRO primary key nonclustered (MET_ID)
)
go

/*==============================================================*/
/* Index: LM_FK                                                 */
/*==============================================================*/
create index LM_FK on METRO (
LIN_ID ASC
)
go

/*==============================================================*/
/* Index: MG_FK                                                 */
/*==============================================================*/
create index MG_FK on METRO (
GAR_ID ASC
)
go

alter table ESTACION_LINEA
   add constraint FK_ESTACION_ELI_ESTACION foreign key (EST_ID)
      references ESTACIONES (EST_ID)
go

alter table ESTACION_LINEA
   add constraint FK_ESTACION_ESTLI_LINEA foreign key (LIN_ID)
      references LINEA (LIN_ID)
go

alter table METRO
   add constraint FK_METRO_LM_LINEA foreign key (LIN_ID)
      references LINEA (LIN_ID)
go

alter table METRO
   add constraint FK_METRO_MG_GARAGE foreign key (GAR_ID)
      references GARAGE (GAR_ID)
go

