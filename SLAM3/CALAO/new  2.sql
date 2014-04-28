/* Comment faire afficher les animaux qui n'ont jamais croisé de chevaux */

select animal.nombapteme, espece.libelle, datenaissance
from animal
join espece
on espece.codeespece=animal.codeespece
join occuper
on occuper.codeespece=espece.codeespece
join enclos
on enclos.codeenclos=occuper.codeenclos
where animal.nombapteme not in 
(select animal.nombapteme
from animal
join occuper
on occuper.nombapteme=animal.nombapteme
where occuper.codeenclos in 
(select enclos.codeenclos
from enclos
join occuper
on enclos.codeenclos=occuper.codeenclos
join espece
on espece.codeespece=occuper.codeespece
where espece.libelle in ('chevaux'))
and occuper.codeperiode in
(select occuper.codeperiode
from occuper
join espece
on espece.codeespece=occuper.codeespece
where espece.libelle in ('chevaux')))
order by 3 desc;