Create table AVOIR_ACTIVITE (
	idVolontaire int
	idTranche int
	datePeriode date
	idDisponibilite int
	deGarde tinyint
	primary key pk_avoiracti (idVolontaire idTranche datePeriode),
	foreign key fk_volontaire (idVolontaire)references volontaire(id),
	foreign key fk_tranche (idTranche)references periodegarde(idTranche),
	foreign key fk_dateperiode (dateperiode)references PeriodeGarde(datePeriode),
	foreign key fk_disponibilite (idDisponibilite)references Disponibilite(id)
);

select libelle, datePeriode, nbPompier
from periode_garde
join tranche
	on idtranche = id
where datePeriode = #06/06/2011#;

select datePeriode, idTranche, Count(deGarde)
from avoir_activite
where degarde=true
and datePeriode = #06/06/2011#
group by datePeriode, idTranche;

select datePeriode, tranche.libelle
from tranche
join periode_garde
	on idtranche = id
where nbPompiers > (
	select count(deGarde)
	from avoir_activite
	join periode_garde
		on avoir_activite.datePeriode=periode_garde.datePeriode
	and avoir_activite.idTranche=periode_garde.idTranche
	where avoir_activite.deGarde=true
);
