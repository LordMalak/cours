/*
 ----------------------------------------------------------------------------
             Génération d'une base de données pour
                        SQL Server 7.x
                       (19/11/2013 10:22:01)
 ----------------------------------------------------------------------------
     Nom de la base : MLR1
     Projet : 
     Auteur : eleve
     Date de dernière modification : 19/11/2013 10:20:17
 ----------------------------------------------------------------------------
*/

drop database MLR1
go

/* -----------------------------------------------------------------------------
      OUVERTURE DE LA BASE MLR1
----------------------------------------------------------------------------- */

create database MLR1
go

use MLR1
go



/* -----------------------------------------------------------------------------
      TABLE : REPAS
----------------------------------------------------------------------------- */

create table REPAS
  (
     DATEHEURE DB_DATE(8)  not null  
     ,
     constraint PK_REPAS primary key (DATEHEURE)
  ) 
go



/* -----------------------------------------------------------------------------
      TABLE : ENCLOS
----------------------------------------------------------------------------- */

create table ENCLOS
  (
     CODEENCLOS DB_LONG(4)  not null  ,
     NOM DB_TEXT, 32  null  ,
     SUPERFICIE DB_LONG(4)  null  
     ,
     constraint PK_ENCLOS primary key (CODEENCLOS)
  ) 
go



/* -----------------------------------------------------------------------------
      TABLE : ESPECE
----------------------------------------------------------------------------- */

create table ESPECE
  (
     CODEESPECE DB_LONG(4)  not null  ,
     LIBELLE DB_TEXT, 32  null  
     ,
     constraint PK_ESPECE primary key (CODEESPECE)
  ) 
go



/* -----------------------------------------------------------------------------
      TABLE : PERIODE
----------------------------------------------------------------------------- */

create table PERIODE
  (
     CODEPERIODE DB_LONG(4)  not null  ,
     DATEDEBUT DB_DATE(8)  null  ,
     DATEFIN DB_DATE(8)  null  
     ,
     constraint PK_PERIODE primary key (CODEPERIODE)
  ) 
go



/* -----------------------------------------------------------------------------
      TABLE : TYPEOBJET
----------------------------------------------------------------------------- */

create table TYPEOBJET
  (
     CODETYPE DB_LONG(4)  not null  ,
     LIBELLE DB_TEXT, 32  null  
     ,
     constraint PK_TYPEOBJET primary key (CODETYPE)
  ) 
go



/* -----------------------------------------------------------------------------
      TABLE : SOIGNANT
----------------------------------------------------------------------------- */

create table SOIGNANT
  (
     CODESOIGNANT DB_LONG(4)  not null  ,
     NOMSOIGNANT DB_TEXT, 32  null  ,
     PRENOMSOIGNANT DB_TEXT, 32  null  ,
     TELSOIGNANT DB_TEXT, 32  null  
     ,
     constraint PK_SOIGNANT primary key (CODESOIGNANT)
  ) 
go



/* -----------------------------------------------------------------------------
      TABLE : ANIMAL
----------------------------------------------------------------------------- */

create table ANIMAL
  (
     CODEESPECE DB_LONG(4)  not null  ,
     NOMBAPTEME DB_TEXT, 32  not null  ,
     SEXE DB_TEXT, 1  null  ,
     DATENAISSANCE DB_DATE(8)  null  ,
     DATEDECES DB_DATE(8)  null  
     ,
     constraint PK_ANIMAL primary key (CODEESPECE, NOMBAPTEME)
  ) 
go



/*      INDEX DE ANIMAL      */



/* -----------------------------------------------------------------------------
      TABLE : MENUTYPE
----------------------------------------------------------------------------- */

create table MENUTYPE
  (
     CODEMENU DB_LONG(4)  not null  ,
     CODEESPECE DB_LONG(4)  not null  ,
     LIBELLEALIMENT DB_TEXT, 32  null  ,
     QTERECOMMANDEE DB_LONG(4)  null  
     ,
     constraint PK_MENUTYPE primary key (CODEMENU)
  ) 
go



/*      INDEX DE MENUTYPE      */



/* -----------------------------------------------------------------------------
      TABLE : SOIGNER
----------------------------------------------------------------------------- */

create table SOIGNER
  (
     CODEESPECE DB_LONG(4)  not null  ,
     CODESOIGNANT DB_LONG(4)  not null  
     ,
     constraint PK_SOIGNER primary key (CODEESPECE, CODESOIGNANT)
  ) 
go



/*      INDEX DE SOIGNER      */



/* -----------------------------------------------------------------------------
      TABLE : POUVOIRLOGER
----------------------------------------------------------------------------- */

create table POUVOIRLOGER
  (
     CODEESPECE DB_LONG(4)  not null  ,
     CODEENCLOS DB_LONG(4)  not null  
     ,
     constraint PK_POUVOIRLOGER primary key (CODEESPECE, CODEENCLOS)
  ) 
go



/*      INDEX DE POUVOIRLOGER      */



/* -----------------------------------------------------------------------------
      TABLE : ANIMALRECEVOIRMENU
----------------------------------------------------------------------------- */

create table ANIMALRECEVOIRMENU
  (
     CODEMENU DB_LONG(4)  not null  ,
     CODEESPECE DB_LONG(4)  not null  ,
     NOMBAPTEME DB_TEXT, 32  not null  ,
     DATEHEURE DB_DATE(8)  not null  ,
     QTEABSORBEE DB_LONG(4)  null  
     ,
     constraint PK_ANIMALRECEVOIRMENU primary key (CODEMENU, CODEESPECE, NOMBAPTEME, DATEHEURE)
  ) 
go



/*      INDEX DE ANIMALRECEVOIRMENU      */



/* -----------------------------------------------------------------------------
      TABLE : PRETER
----------------------------------------------------------------------------- */

create table PRETER
  (
     CODETYPE DB_LONG(4)  not null  ,
     CODEENCLOS DB_LONG(4)  not null  ,
     QTEOBJETPRET DB_LONG(4)  null  
     ,
     constraint PK_PRETER primary key (CODETYPE, CODEENCLOS)
  ) 
go



/*      INDEX DE PRETER      */



/* -----------------------------------------------------------------------------
      TABLE : ACHETER
----------------------------------------------------------------------------- */

create table ACHETER
  (
     CODETYPE DB_LONG(4)  not null  ,
     CODEENCLOS DB_LONG(4)  not null  ,
     QTEOBJETACHAT DB_LONG(4)  null  
     ,
     constraint PK_ACHETER primary key (CODETYPE, CODEENCLOS)
  ) 
go



/*      INDEX DE ACHETER      */



/* -----------------------------------------------------------------------------
      TABLE : OCCUPER
----------------------------------------------------------------------------- */

create table OCCUPER
  (
     CODEESPECE DB_LONG(4)  not null  ,
     NOMBAPTEME DB_TEXT, 32  not null  ,
     CODEENCLOS DB_LONG(4)  not null  ,
     CODEPERIODE DB_LONG(4)  not null  
     ,
     constraint PK_OCCUPER primary key (CODEESPECE, NOMBAPTEME, CODEENCLOS, CODEPERIODE)
  ) 
go



/*      INDEX DE OCCUPER      */



/* -----------------------------------------------------------------------------
      TABLE : COHABITER
----------------------------------------------------------------------------- */

create table COHABITER
  (
     CODEESPECE_ACCEPTER DB_LONG(4)  not null  ,
     CODEESPECE_POUVOIR_COHABITER DB_LONG(4)  not null  
     ,
     constraint PK_COHABITER primary key (CODEESPECE_ACCEPTER, CODEESPECE_POUVOIR_COHABITER)
  ) 
go



/*      INDEX DE COHABITER      */



/* -----------------------------------------------------------------------------
      REFERENCES SUR LES TABLES
----------------------------------------------------------------------------- */



alter table ANIMAL 
     add constraint FK_ANIMAL_ESPECE foreign key (CODEESPECE) 
               references ESPECE (CODEESPECE)
go




alter table MENUTYPE 
     add constraint FK_MENUTYPE_ESPECE foreign key (CODEESPECE) 
               references ESPECE (CODEESPECE)
go




alter table SOIGNER 
     add constraint FK_SOIGNER_ESPECE foreign key (CODEESPECE) 
               references ESPECE (CODEESPECE)
go




alter table SOIGNER 
     add constraint FK_SOIGNER_SOIGNANT foreign key (CODESOIGNANT) 
               references SOIGNANT (CODESOIGNANT)
go




alter table POUVOIRLOGER 
     add constraint FK_POUVOIRLOGER_ESPECE foreign key (CODEESPECE) 
               references ESPECE (CODEESPECE)
go




alter table POUVOIRLOGER 
     add constraint FK_POUVOIRLOGER_ENCLOS foreign key (CODEENCLOS) 
               references ENCLOS (CODEENCLOS)
go




alter table ANIMALRECEVOIRMENU 
     add constraint FK_ANIMALRECEVOIRMENU_MENUTYPE foreign key (CODEMENU) 
               references MENUTYPE (CODEMENU)
go




alter table ANIMALRECEVOIRMENU 
     add constraint FK_ANIMALRECEVOIRMENU_ANIMAL foreign key (CODEESPECE, NOMBAPTEME) 
               references ANIMAL (CODEESPECE, NOMBAPTEME)
go




alter table ANIMALRECEVOIRMENU 
     add constraint FK_ANIMALRECEVOIRMENU_REPAS foreign key (DATEHEURE) 
               references REPAS (DATEHEURE)
go




alter table PRETER 
     add constraint FK_PRETER_TYPEOBJET foreign key (CODETYPE) 
               references TYPEOBJET (CODETYPE)
go




alter table PRETER 
     add constraint FK_PRETER_ENCLOS foreign key (CODEENCLOS) 
               references ENCLOS (CODEENCLOS)
go




alter table ACHETER 
     add constraint FK_ACHETER_TYPEOBJET foreign key (CODETYPE) 
               references TYPEOBJET (CODETYPE)
go




alter table ACHETER 
     add constraint FK_ACHETER_ENCLOS foreign key (CODEENCLOS) 
               references ENCLOS (CODEENCLOS)
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




alter table COHABITER 
     add constraint FK_COHABITER_ESPECE foreign key (CODEESPECE_ACCEPTER) 
               references ESPECE (CODEESPECE)
go




alter table COHABITER 
     add constraint FK_COHABITER_ESPECE1 foreign key (CODEESPECE_POUVOIR_COHABITER) 
               references ESPECE (CODEESPECE)
go




/*
 -----------------------------------------------------------------------------
               FIN DE GENERATION
 -----------------------------------------------------------------------------
*/