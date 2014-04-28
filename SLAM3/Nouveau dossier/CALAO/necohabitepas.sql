/* requete simple */

Select distinct espece.libelle
from ESPECE
join COHABITER
	on espece.codeespece=cohabiter.CODEESPECE
where espece.CODEESPECE not in(
	select codeespece_1
	from cohabiter
	where cohabiter.CODEESPECE=2
)
;

/* procédure stockées */

CREATE PROCEDURE ListeEspeceNeCohabitePas (@codeEspece int) AS
DECLARE ListeEspece CURSOR FOR
	SELECT	 libelle
	FROM	ESPECE 
	WHERE 	codeespece not in (select 	CODEESPECE
					 from 	COHABITER
					 where  	CODEESPECE = @codeEspece)
DECLARE @nomEspece char(32)

OPEN 	ListeEspece
PRINT 	'Liste des especes qui ne cohabitent pas avec cette espèce : '
FETCH 	ListeEspece INTO @nomEspece

WHILE 	(@@FETCH_STATUS = 0)
BEGIN
	PRINT '   --> ' + @nomEspece
	FETCH ListeEspece INTO @nomEspece
END

CLOSE 			ListeEspece
DEALLOCATE	 ListeEspece



execute ListeEspeceNeCohabitePas 2