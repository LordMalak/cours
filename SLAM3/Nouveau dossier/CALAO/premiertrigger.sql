create trigger AnimalMangerMenuAdapte on MANGER for insert, update as
declare @nbAnimal int
declare @nbMenu int
set @nbAnimal = (
	select COUNT(*)
	from ANIMAL
	where CODEESPECE=
		(select CODEESPECE 
		from inserted)
	and NOMBAPTEME=(
		select NOMBAPTEME
		from inserted)
	)
print @nbAnimal
if @nbAnimal>0
begin
	set @nbMenu=(
		select COUNT(*)
		from MENUTYPE
		where CODEMENU=(
			select CODEMENU
			from inserted)
		and CODEESPECE=(
			select CODEESPECE
			from inserted)
		)
	print @nbMenu
	if @nbMenu=0
	begin
		rollback
		print 'vous avez une erreur : cet animal ne peu pas manger ce menu'
	end
end
