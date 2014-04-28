/*
 ----------------------------------------------------------------------------
             Génération d'une base de données
 ----------------------------------------------------------------------------
     Nom de la base : CALAO
     Projet : SLAM3
     Auteur : Hervy
     Date de dernière modification : 01/11/2013 10:17:59
 ----------------------------------------------------------------------------
*/



/* -----------------------------------------------------------------------------
      OUVERTURE DE LA BASE CALAO
----------------------------------------------------------------------------- */

create database CALAO_GULCU2
go
use CALAO_GULCU2
go

/* -----------------------------------------------------------------------------
      TABLE : ENCLOS
----------------------------------------------------------------------------- */

create table ENCLOS
  (
     CODEENCLOS int  not null  ,
     NOM char(32)  null  ,
     SUPERFICIE int  null       ,
     constraint PK_ENCLOS primary key (CODEENCLOS)
  ) ;
  

/* -----------------------------------------------------------------------------
      TABLE : ESPECE
----------------------------------------------------------------------------- */

create table ESPECE
  (
     CODEESPECE int  not null  ,
     LIBELLE char(32)  null   ,
     constraint PK_ESPECE primary key (CODEESPECE)
  ) ;


/* -----------------------------------------------------------------------------
      TABLE : POUVOIRLOGER
----------------------------------------------------------------------------- */

create table POUVOIRLOGER
  (
     CODEESPECE int  not null  ,
     CODEENCLOS int  not null  ,
     constraint PK_POUVOIRLOGER primary key (CODEESPECE, CODEENCLOS)
  ) ;



/*      INDEX DE POUVOIRLOGER      */


/* -----------------------------------------------------------------------------
      TABLE : ANIMAL
----------------------------------------------------------------------------- */

create table ANIMAL
  (
     CODEESPECE int  not null  ,
     NOMBAPTEME char(32)  not null  ,
     SEXE char(1)  null  ,
     DATENAISSANCE int  null  ,
     DATEDECES int  null  ,
     constraint PK_ANIMAL primary key (CODEESPECE, NOMBAPTEME)
  ) ;





/*      INDEX DE ANIMAL      */

/* -----------------------------------------------------------------------------
      TABLE : COHABITER
----------------------------------------------------------------------------- */

create table COHABITER
  (
     CODEESPECE int  not null  ,
     CODEESPECE_1 int  not null  ,
     constraint PK_COHABITER primary key (CODEESPECE, CODEESPECE_1)
  ) ;




/*      INDEX DE COHABITER      */

/* -----------------------------------------------------------------------------
      TABLE : SOIGNANT
----------------------------------------------------------------------------- */

create table SOIGNANT
  (
     CODESOIGNANT int  not null  ,
     NOMSOIGNANT char(32)  null  ,
     PRENOMSOIGNANT char(32)  null  ,
     TELSOIGNANT char(14)  null  ,
     constraint PK_SOIGNANT primary key (CODESOIGNANT)
  ) ;




/* -----------------------------------------------------------------------------
      TABLE : SOIGNER
----------------------------------------------------------------------------- */

create table SOIGNER
  (
     CODEESPECE int  not null  ,
     CODESOIGNANT int  not null  ,
     constraint PK_SOIGNER primary key (CODEESPECE, CODESOIGNANT)
  ) ;



/*      INDEX DE SOIGNER      */

/* -----------------------------------------------------------------------------
      TABLE : MENUTYPE
----------------------------------------------------------------------------- */

create table MENUTYPE
  (
     CODEMENU int  not null  ,
     CODEESPECE int  not null  ,
     LIBELLEALIMENT char(32)  null  ,
     QTERECOMMANDEE int  null ,
     constraint PK_MENU_TYPE primary key (CODEMENU)
  ) ;


/*      INDEX DE MENU_TYPE      */


/* -----------------------------------------------------------------------------
      TABLE : DATEHEURE 
----------------------------------------------------------------------------- */

create table DATEHEURE
  (
     DATEHEUREMANGER datetime not null ,
     constraint PK_DATEHEURE primary key (DATEHEUREMANGER)
  ) ;



/* -----------------------------------------------------------------------------
      TABLE : MANGER
----------------------------------------------------------------------------- */

create table MANGER
  (
     CODEMENU int  not null  ,
     CODEESPECE int  not null  ,
     NOMBAPTEME char(32)  not null  ,
     DATEHEUREMANGER datetime  not null  ,
     QTEABSORBEE bigint  null ,
     constraint PK_MANGER primary key (CODEMENU, CODEESPECE, NOMBAPTEME, DATEHEUREMANGER)
  ) ;




/*      INDEX DE MANGER      */

/* -----------------------------------------------------------------------------
      TABLE : PERIODE
----------------------------------------------------------------------------- */

create table PERIODE
  (
     CODEPERIODE int  not null  ,
     DATEDEBUT date  null  ,
     DATEFIN date  null ,
     constraint PK_PERIODE primary key (CODEPERIODE)
  ) ;



/* -----------------------------------------------------------------------------
      TABLE : OCCUPER
----------------------------------------------------------------------------- */

create table OCCUPER
  (
     CODEESPECE int  not null  ,
     NOMBAPTEME char(32)  not null  ,
     CODEENCLOS int  not null  ,
     CODEPERIODE int  not null  ,
     constraint PK_OCCUPER primary key (CODEESPECE, NOMBAPTEME, CODEENCLOS, CODEPERIODE)
  ) ;




/*      INDEX DE OCCUPER      */

/* -----------------------------------------------------------------------------
      TABLE : TYPEOBJET
----------------------------------------------------------------------------- */

create table TYPEOBJET
  (
     CODEOBJET int  not null  ,
     NOMOBJET char(32)  null  ,
     constraint PK_TYPEOBJET primary key (CODEOBJET)
  ) 
go


/* -----------------------------------------------------------------------------
      TABLE : OBJETACHETER
----------------------------------------------------------------------------- */

create table OBJETACHETER
  (
     CODEOBJET int  not null  ,
     CODEENCLOS int  not null  ,
     QTEOBJETACHAT int  null  ,
     constraint PK_OBJETACHETER primary key (CODEOBJET, CODEENCLOS)
  ) ;



/*      INDEX DE OBJETACHETER      */


/* -----------------------------------------------------------------------------
      TABLE : OBJETPRETER
----------------------------------------------------------------------------- */

create table OBJETPRETER
  (
     CODEOBJET int  not null  ,
     CODEENCLOS int  not null  ,
     QTEOBJETPRET int  null  ,
     constraint PK_OBJETPRETER primary key (CODEOBJET, CODEENCLOS)
  ) 
go




/*      INDEX DE OBJETPRETER      */

/* -----------------------------------------------------------------------------
      REFERENCES SUR LES TABLES
----------------------------------------------------------------------------- */



alter table MENUTYPE 
     add constraint FK_MENU_TYPE_ESPECE foreign key (CODEESPECE) 
               references ESPECE (CODEESPECE)
go




alter table ANIMAL 
     add constraint FK_ANIMAL_ESPECE foreign key (CODEESPECE) 
               references ESPECE (CODEESPECE)
go




alter table COHABITER 
     add constraint FK_COHABITER_ESPECE foreign key (CODEESPECE) 
               references ESPECE (CODEESPECE)
go




alter table COHABITER 
     add constraint FK_COHABITER_ESPECE1 foreign key (CODEESPECE_1) 
               references ESPECE (CODEESPECE)
go




alter table OBJETACHETER 
     add constraint FK_OBJETACHETER_TYPEOBJET foreign key (CODEOBJET) 
               references TYPEOBJET (CODEOBJET)
go




alter table OBJETACHETER 
     add constraint FK_OBJETACHETER_ENCLOS foreign key (CODEENCLOS) 
               references ENCLOS (CODEENCLOS)
go




alter table POUVOIRLOGER 
     add constraint FK_POUVOIRLOGER_ESPECE foreign key (CODEESPECE) 
               references ESPECE (CODEESPECE)
go




alter table POUVOIRLOGER 
     add constraint FK_POUVOIRLOGER_ENCLOS foreign key (CODEENCLOS) 
               references ENCLOS (CODEENCLOS)
go




alter table OBJETPRETER 
     add constraint FK_OBJETPRETER_TYPEOBJET foreign key (CODEOBJET) 
               references TYPEOBJET (CODEOBJET)
go




alter table OBJETPRETER 
     add constraint FK_OBJETPRETER_ENCLOS foreign key (CODEENCLOS) 
               references ENCLOS (CODEENCLOS)
go




alter table MANGER 
     add constraint FK_MANGER_MENU_TYPE foreign key (CODEMENU) 
               references MENUTYPE (CODEMENU)
go




alter table MANGER 
     add constraint FK_MANGER_ANIMAL foreign key (CODEESPECE, NOMBAPTEME) 
               references ANIMAL (CODEESPECE, NOMBAPTEME)
go




alter table MANGER 
     add constraint FK_MANGER_DATEHEURE foreign key (DATEHEUREMANGER) 
               references DATEHEURE (DATEHEUREMANGER)
go




alter table SOIGNER 
     add constraint FK_SOIGNER_ESPECE foreign key (CODEESPECE) 
               references ESPECE (CODEESPECE)
go




alter table SOIGNER 
     add constraint FK_SOIGNER_SOIGNANT foreign key (CODESOIGNANT) 
               references SOIGNANT (CODESOIGNANT)
go




alter table OCCUPER 
     add constraint FK_OCCUPER_ANIMAL foreign key (CODEESPECE, NOMBAPTEME) 
               references ANIMAL (CODEESPECE, NOMBAPTEME)
go




alter table OCCUPER 
     add constraint FK_OCCUPER_ENCLOS foreign key (CODEENCLOS) 
               references ENCLOS (CODEENCLOS)
go




alter table OCCUPER 
     add constraint FK_OCCUPER_PERIODE foreign key (CODEPERIODE) 
               references PERIODE (CODEPERIODE)
go




/*
 -----------------------------------------------------------------------------
               FIN DE GENERATION
 -----------------------------------------------------------------------------
*/