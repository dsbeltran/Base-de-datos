/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2000 (Deprecated)       */
/* Created on:     19/9/2019 0:59:34                            */
/*==============================================================*/


if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CANTON') and o.name = 'FK_CANTON_RELATIONS_PROVINCI')
alter table CANTON
   drop constraint FK_CANTON_RELATIONS_PROVINCI
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PERSONALIZADA') and o.name = 'FK_PERSONAL_RELATIONS_FLOTA')
alter table PERSONALIZADA
   drop constraint FK_PERSONAL_RELATIONS_FLOTA
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('RUTAS') and o.name = 'FK_RUTAS_RELATIONS_PROVINCI')
alter table RUTAS
   drop constraint FK_RUTAS_RELATIONS_PROVINCI
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRANSACCION') and o.name = 'FK_TRANSACC_RELATIONS_CLIENTE')
alter table TRANSACCION
   drop constraint FK_TRANSACC_RELATIONS_CLIENTE
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRANSACCION') and o.name = 'FK_TRANSACC_RELATIONS_PROVINCI')
alter table TRANSACCION
   drop constraint FK_TRANSACC_RELATIONS_PROVINCI
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRANSACCION') and o.name = 'FK_TRANSACC_RELATIONS_PAQUETE')
alter table TRANSACCION
   drop constraint FK_TRANSACC_RELATIONS_PAQUETE
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRANSACCION') and o.name = 'FK_TRANSACC_RELATIONS_FLOTA')
alter table TRANSACCION
   drop constraint FK_TRANSACC_RELATIONS_FLOTA
go

if exists (select 1
   from dbo.sysreferences r join dbo.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('VEHICULO') and o.name = 'FK_VEHICULO_RELATIONS_FLOTA')
alter table VEHICULO
   drop constraint FK_VEHICULO_RELATIONS_FLOTA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CANTON')
            and   name  = 'RELATIONSHIP_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index CANTON.RELATIONSHIP_4_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CANTON')
            and   type = 'U')
   drop table CANTON
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CLIENTE')
            and   type = 'U')
   drop table CLIENTE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('FLOTA')
            and   type = 'U')
   drop table FLOTA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PAQUETE')
            and   type = 'U')
   drop table PAQUETE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PERSONALIZADA')
            and   name  = 'RELATIONSHIP_7_FK'
            and   indid > 0
            and   indid < 255)
   drop index PERSONALIZADA.RELATIONSHIP_7_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PERSONALIZADA')
            and   type = 'U')
   drop table PERSONALIZADA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PROVINCIA')
            and   type = 'U')
   drop table PROVINCIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('RUTAS')
            and   name  = 'RELATIONSHIP_5_FK'
            and   indid > 0
            and   indid < 255)
   drop index RUTAS.RELATIONSHIP_5_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RUTAS')
            and   type = 'U')
   drop table RUTAS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRANSACCION')
            and   name  = 'RELATIONSHIP_6_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRANSACCION.RELATIONSHIP_6_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRANSACCION')
            and   name  = 'RELATIONSHIP_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRANSACCION.RELATIONSHIP_3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRANSACCION')
            and   name  = 'RELATIONSHIP_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRANSACCION.RELATIONSHIP_2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRANSACCION')
            and   name  = 'RELATIONSHIP_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRANSACCION.RELATIONSHIP_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TRANSACCION')
            and   type = 'U')
   drop table TRANSACCION
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('VEHICULO')
            and   name  = 'RELATIONSHIP_8_FK'
            and   indid > 0
            and   indid < 255)
   drop index VEHICULO.RELATIONSHIP_8_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('VEHICULO')
            and   type = 'U')
   drop table VEHICULO
go

/*==============================================================*/
/* Table: CANTON                                                */
/*==============================================================*/
create table CANTON (
   ID_CANTON            numeric(100)         not null,
   ID_PROVINCIA         numeric(24)          not null,
   CAN_NOMBRE           varchar(20)          not null,
   constraint PK_CANTON primary key (ID_CANTON)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_4_FK on CANTON (
ID_PROVINCIA ASC
)
go

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           numeric(100)         not null,
   CLI_CI               numeric(10)          null,
   CLI_DIRECCION        varchar(30)          not null,
   CLI_APELLIDONOMBRE   varchar(30)          not null,
   CLI_TELEFONO         numeric(10)          not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
)
go

/*==============================================================*/
/* Table: FLOTA                                                 */
/*==============================================================*/
create table FLOTA (
   ID_FLOTA             numeric(10)          not null,
   FLO_DESCRIPCION      varchar(20)          null,
   constraint PK_FLOTA primary key (ID_FLOTA)
)
go

/*==============================================================*/
/* Table: PAQUETE                                               */
/*==============================================================*/
create table PAQUETE (
   ID_PAQUETE           numeric(1000)        not null,
   PAC_DESCRIPCION      varchar(40)          not null,
   PAC_PVP              money                not null,
   constraint PK_PAQUETE primary key (ID_PAQUETE)
)
go

/*==============================================================*/
/* Table: PERSONALIZADA                                         */
/*==============================================================*/
create table PERSONALIZADA (
   ID_PERSONALIZADA     numeric(100)         not null,
   ID_FLOTA             numeric(10)          not null,
   PER_NOMBRE           varchar(20)          not null,
   PER_TIPO             varchar(10)          not null,
   PER_ESTADO           bit                  not null,
   constraint PK_PERSONALIZADA primary key (ID_PERSONALIZADA)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_7_FK on PERSONALIZADA (
ID_FLOTA ASC
)
go

/*==============================================================*/
/* Table: PROVINCIA                                             */
/*==============================================================*/
create table PROVINCIA (
   ID_PROVINCIA         numeric(24)          not null,
   PRO_NOMBRE           varchar(20)          not null,
   constraint PK_PROVINCIA primary key (ID_PROVINCIA)
)
go

/*==============================================================*/
/* Table: RUTAS                                                 */
/*==============================================================*/
create table RUTAS (
   ID_RUTA              numeric(100)         not null,
   ID_PROVINCIA         numeric(24)          not null,
   RUT_NOMBRE           varchar(20)          null,
   RUT_DESCRIPCION      varchar(50)          not null,
   constraint PK_RUTAS primary key (ID_RUTA)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_5_FK on RUTAS (
ID_PROVINCIA ASC
)
go

/*==============================================================*/
/* Table: TRANSACCION                                           */
/*==============================================================*/
create table TRANSACCION (
   ID_TRANSACCION       numeric(1000)        not null,
   ID_PROVINCIA         numeric(24)          not null,
   ID_PAQUETE           numeric(1000)        not null,
   ID_FLOTA             numeric(10)          null,
   ID_CLIENTE           numeric(100)         not null,
   TRA_FECHA            datetime             not null,
   TRA_TIPOPAGO         varchar(10)          null,
   constraint PK_TRANSACCION primary key (ID_TRANSACCION)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_1_FK on TRANSACCION (
ID_CLIENTE ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_2_FK on TRANSACCION (
ID_PROVINCIA ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_3_FK on TRANSACCION (
ID_PAQUETE ASC
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_6_FK on TRANSACCION (
ID_FLOTA ASC
)
go

/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
create table VEHICULO (
   ID_VEHICULO          numeric(30)          not null,
   ID_FLOTA             numeric(10)          not null,
   VEH_DESCRIPCION      varchar(30)          not null,
   VEHI_NOMBRE          varchar(20)          not null,
   constraint PK_VEHICULO primary key (ID_VEHICULO)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create index RELATIONSHIP_8_FK on VEHICULO (
ID_FLOTA ASC
)
go

alter table CANTON
   add constraint FK_CANTON_RELATIONS_PROVINCI foreign key (ID_PROVINCIA)
      references PROVINCIA (ID_PROVINCIA)
go

alter table PERSONALIZADA
   add constraint FK_PERSONAL_RELATIONS_FLOTA foreign key (ID_FLOTA)
      references FLOTA (ID_FLOTA)
go

alter table RUTAS
   add constraint FK_RUTAS_RELATIONS_PROVINCI foreign key (ID_PROVINCIA)
      references PROVINCIA (ID_PROVINCIA)
go

alter table TRANSACCION
   add constraint FK_TRANSACC_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
go

alter table TRANSACCION
   add constraint FK_TRANSACC_RELATIONS_PROVINCI foreign key (ID_PROVINCIA)
      references PROVINCIA (ID_PROVINCIA)
go

alter table TRANSACCION
   add constraint FK_TRANSACC_RELATIONS_PAQUETE foreign key (ID_PAQUETE)
      references PAQUETE (ID_PAQUETE)
go

alter table TRANSACCION
   add constraint FK_TRANSACC_RELATIONS_FLOTA foreign key (ID_FLOTA)
      references FLOTA (ID_FLOTA)
go

alter table VEHICULO
   add constraint FK_VEHICULO_RELATIONS_FLOTA foreign key (ID_FLOTA)
      references FLOTA (ID_FLOTA)
go

