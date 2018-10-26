use Videos10
create table Pelicula_Auditada
(
vUsuario nvarchar (50) default null,
iID_Pelicula int,
Fecha_Modificacion datetime default null,
Operacion nvarchar (50) default NULL,
Tabla nvarchar (50) NOT NULL
)
select * from Pelicula_Auditada
drop Table Pelicula_Auditada

Go
Create trigger tr_PeliculaINSERT
on Pelicula for insert
as
declare @vUsuario nvarchar (50)
declare @iID_Pelicula int
select @iID_Pelicula = iID_Pelicula from inserted

insert into Pelicula_Auditada
values (SUSER_NAME(),@iID_Pelicula,GETDATE(),'INSERT','Pelicula')

Go
Create trigger tr_PeliculaDELETE
on Pelicula for delete 
as
declare @iID_Pelicula int
select @iID_Pelicula = iID_Pelicula from deleted

insert into Pelicula_Auditada 
values (SUSER_NAME(),@iID_Pelicula,GETDATE(),'DELETE','Pelicula')
Go
Create trigger tr_PeliculaUPDATE
on Pelicula for update
as
declare @iID_Pelicula int
select @iID_Pelicula = iID_Pelicula from deleted
insert into Pelicula_Auditada 
values (SUSER_NAME(),@iID_Pelicula,GETDATE(),'UPDATE','Pelicula')

update Pelicula set vNombre_Peli='MEGALODON' where iID_Pelicula = 80

select * from Pelicula_Auditada
