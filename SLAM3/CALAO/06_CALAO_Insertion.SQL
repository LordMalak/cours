 /* -----------------------------------------------------------------------------
      TABLE : ENCLOS
----------------------------------------------------------------------------- */ 
 insert into ENCLOS values (1,'Les lions',2300);
 insert into ENCLOS values (2,'Les oiseaux',1500);
 insert into ENCLOS values (3,'Les reptiles',240);
 insert into ENCLOS values (4,'Les singes',1000);
 insert into ENCLOS values (5,'les équides',2500);
 insert into ENCLOS values (6,'les ours',3000);
 
/* -----------------------------------------------------------------------------
      TABLE : ESPECE
----------------------------------------------------------------------------- */
insert into ESPECE values (1,'Lion');
insert into ESPECE values (2,'Poule');
insert into ESPECE values (3,'Ours brun');
insert into ESPECE values (4,'Chevre');
insert into ESPECE values (5,'Aigle');
insert into ESPECE values (6,'Faucon');
insert into ESPECE values (7,'Tigre');
insert into ESPECE values (8,'Orang-outan');
insert into ESPECE values (9,'Gorille');
insert into ESPECE values (10,'Chimpanzes');
insert into ESPECE values (11,'chevaux');
insert into ESPECE values (12,'Ane');
insert into ESPECE values (13,'serpent');

/* -----------------------------------------------------------------------------
      TABLE : POUVOIRLOGER
----------------------------------------------------------------------------- */
insert into POUVOIRLOGER values (1,1);
insert into POUVOIRLOGER values (7,1);
insert into POUVOIRLOGER values (5,2);
insert into POUVOIRLOGER values (6,2);
insert into POUVOIRLOGER values (13,3);
insert into POUVOIRLOGER values (2,4);
insert into POUVOIRLOGER values (8,4);
insert into POUVOIRLOGER values (9,4);
insert into POUVOIRLOGER values (10,4);
insert into POUVOIRLOGER values (12,5);
insert into POUVOIRLOGER values (11,5);
insert into POUVOIRLOGER values (2,5);
insert into POUVOIRLOGER values (3,6);

/* -----------------------------------------------------------------------------
      TABLE : ANIMAL
----------------------------------------------------------------------------- */
insert into ANIMAL values (1,'Leo','M',2000,'');
insert into ANIMAL values (1,'Clarence','M',1999,'');
insert into ANIMAL values (1,'Felix','M',2005,'');
insert into ANIMAL values (2,'Titi','F',2010,2011);
insert into ANIMAL values (2,'Fifi','M',2009,'');
insert into ANIMAL values (2,'Riri','F',2010,'');
insert into ANIMAL values (3,'Balou','M',1990,'');
insert into ANIMAL values (3,'Balouette','F',1991,'');
insert into ANIMAL values (4,'Seguin','F',2011,'');
insert into ANIMAL values (4,'Pouky','M',2000,'');
insert into ANIMAL values (5,'Riri','M',2000,'');
insert into ANIMAL values (5,'Titi','F',2008,'');
insert into ANIMAL values (6,'Fifi','F',2006,'');
insert into ANIMAL values (7,'Baguera','F',2007,'');
insert into ANIMAL values (8,'Chitta','F',2005,'');
insert into ANIMAL values (9,'Chitta','F',2003,'');
insert into ANIMAL values (10,'Bibi','F',2004,2010);
insert into ANIMAL values (11,'CrinBlanc','F',2010,'');
insert into ANIMAL values (11,'Baguera','F',2010,'');
insert into ANIMAL values (12,'Titi','F',2010,'');
insert into ANIMAL values (13,'Martinet','F',2010,'');

/* -----------------------------------------------------------------------------
      TABLE : COHABITER
----------------------------------------------------------------------------- */
insert into  COHABITER values (7,1);
insert into  COHABITER values (8,9);
insert into  COHABITER values (8,10);
insert into  COHABITER values (8,2);
insert into  COHABITER values (9,8);
insert into  COHABITER values (9,10);
insert into  COHABITER values (9,2);
insert into  COHABITER values (10,8);
insert into  COHABITER values (10,9);
insert into  COHABITER values (10,2);
insert into  COHABITER values (11,12);
insert into  COHABITER values (11,2);
insert into  COHABITER values (12,11);
insert into  COHABITER values (12,2);
insert into  COHABITER values (1,7);
insert into  COHABITER values (2,3);
insert into  COHABITER values (2,4);
insert into  COHABITER values (2,8);
insert into  COHABITER values (2,9);
insert into  COHABITER values (2,10);
insert into  COHABITER values (2,11);
insert into  COHABITER values (2,12);
insert into  COHABITER values (3,2);
insert into  COHABITER values (4,11);
insert into  COHABITER values (4,12);
insert into  COHABITER values (4,2);
insert into  COHABITER values (5,6);
insert into  COHABITER values (6,5);

/* -----------------------------------------------------------------------------
      TABLE : SOIGNANT
----------------------------------------------------------------------------- */
insert into SOIGNANT values (1,'Dupont','Pierre','02.40.95.93.10');
insert into SOIGNANT values (2,'Dubois','Julie','02.40.87.67.45');
insert into SOIGNANT values (3,'Bureuil','Laura','02.40.83.24.35');
insert into SOIGNANT values (4,'Roulous','Maxime','02.40.45.50.32');
insert into SOIGNANT values (5,'Durant','Jacques','02.40.39.56.46');
insert into SOIGNANT values (6,'Gougnoux','Valerie','02.40.98.76.54');

/* -----------------------------------------------------------------------------
      TABLE : SOIGNER
----------------------------------------------------------------------------- */
insert into SOIGNER values (1,1);
insert into SOIGNER values (2,1);
insert into SOIGNER values (3,1);
insert into SOIGNER values (4,2);
insert into SOIGNER values (5,2);
insert into SOIGNER values (6,3);
insert into SOIGNER values (7,3);
insert into SOIGNER values (8,3);
insert into SOIGNER values (9,4);
insert into SOIGNER values (10,4);
insert into SOIGNER values (11,4);
insert into SOIGNER values (12,5);
insert into SOIGNER values (2,5);
insert into SOIGNER values (13,6);
insert into SOIGNER values (1,6);

/* -----------------------------------------------------------------------------
      TABLE : MENUTYPE
----------------------------------------------------------------------------- */
insert into MENUTYPE values (1,1,'viande de boeuf',35);
insert into MENUTYPE values (2,1,'poulet',35);
insert into MENUTYPE values (3,2,'Mais',1);
insert into MENUTYPE values (4,3,'Melange homi',20);
insert into MENUTYPE values (5,4,'herbe',2);
insert into MENUTYPE values (6,5,'Melange Gaine',1);
insert into MENUTYPE values (7,6,'Melange Gaine',1);
insert into MENUTYPE values (8,7,'Melange Viande',20);
insert into MENUTYPE values (9,8,'Bananes',10);
insert into MENUTYPE values (10,9,'Feuillebambou',10);
insert into MENUTYPE values (11,10,'feuillage et bananes',10);
insert into MENUTYPE values (12,11,'foin',12);
insert into MENUTYPE values (13,12,'herbes verte',10);
insert into MENUTYPE values (14,13,'souris',10);

/* -----------------------------------------------------------------------------
      TABLE : DATEHEURE 
----------------------------------------------------------------------------- */
insert into DATEHEURE values ('2013-10-10 12:00');
insert into DATEHEURE values ('2013-10-10 20:00');

/* -----------------------------------------------------------------------------
      TABLE : MANGER
----------------------------------------------------------------------------- */
insert into MANGER values (1,1,'Leo','2013-01-10 12:00',10);
insert into MANGER values (1,2,'Leo','2013-02-11 12:00',8);
insert into MANGER values (1,3,'Leo','2013-03-10 12:00',10);

/* -----------------------------------------------------------------------------
      TABLE : PERIODE
----------------------------------------------------------------------------- */
insert into PERIODE values (1,'01/01/2013','31/01/2013');
insert into PERIODE values (2,'01/02/2013','28/02/2013');
insert into PERIODE values (3,'01/03/2013','31/03/2013');
insert into PERIODE values (4,'01/04/2013','30/04/2013');

/* -----------------------------------------------------------------------------
      TABLE : OCCUPER
----------------------------------------------------------------------------- */
insert into OCCUPER values (1,'Leo',1,1);
insert into OCCUPER values (1,'Leo',1,3);
insert into OCCUPER values (1,'Clarence',1,2);
insert into OCCUPER values (3,'Balou',6,1);
insert into OCCUPER values (2,'Titi',5,1);
insert into OCCUPER values (2,'Titi',4,2);
insert into OCCUPER values (2,'Fifi',5,1);
insert into OCCUPER values (2,'Riri',5,2);

/* -----------------------------------------------------------------------------
      TABLE : TYPEOBJET
----------------------------------------------------------------------------- */
insert into TYPEOBJET values (1,'Cordage echelle');
insert into TYPEOBJET values (2,'Bassin amovible');
insert into TYPEOBJET values (3,'Ballon');
insert into TYPEOBJET values (4,'Rondin bois');
/* -----------------------------------------------------------------------------
      TABLE : OBJETACHETER
----------------------------------------------------------------------------- */
insert into OBJETACHETER values (4,1,10);
insert into OBJETACHETER values (2,2,7);
insert into OBJETACHETER values (4,6,10);

/* -----------------------------------------------------------------------------
      TABLE : OBJETPRETER
----------------------------------------------------------------------------- */
insert into OBJETPRETER values (4,4,12);
insert into OBJETPRETER values (3,3,3);
insert into OBJETPRETER values (2,1,12);

