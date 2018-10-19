use Videos4
---Procedimiento con script---
go
create procedure Procedimiento(
	@parametro nvarchar (100)
)
as
begin
	declare @newvarchar int
	set @newvarchar = 0
	
	select* from Empleado
	where vNombre_Empleado like '%' + @parametro + '%'
	
	select * from Ventas
	end
	exec Procedimiento @parametro = 'Jhon'
---Procedimientos almacenados---
go
create procedure ProcedimientoAlmacenado1(
	@parametro nvarchar (100)
)
as
begin
	declare @newvarchar int
	set @newvarchar = 0
	
	select* from EmpleadosBusqueda
	where [Nombre Completo] like '%' + @parametro + '%'
	
	select * from Puesto
	end
	exec ProcedimientoAlmacenado1 @parametro = 'Guillermo'
----------------------2-------------------------------------
go

create procedure ProcedimientoAlmacenado2(
	@parametro nvarchar (100)
)
as
begin
	
	select* from Pelicula
	where vNombre_Peli like '%' + @parametro + '%'
	
	select * from ReporteActorPeliculas1
	end
	exec ProcedimientoAlmacenado2 @parametro = 'Avengers'
	----------------------3-------------------------------------
	
go
create procedure ProcedimientoAlmacenado3
(
@valor int 
)
as 
begin  
update ReporteCliente set Subtotal= 180 where @valor = 112
select * from ReporteCliente
end
exec ProcedimientoAlmacenado3 @valor= '112'
----------------------4-------------------------------------
go
create procedure ProcedimientoAlmacenado4(
	@parametro nvarchar (100)
)
as
begin
	declare @newvarchar int
	set @newvarchar = 0
	
	select* from VentasEnGeneral1
	where [vNombre_Peli] like '%' + @parametro + '%'
	
	select * from Pelicula
	end
	exec ProcedimientoAlmacenado4 @parametro = 'Avengers'
	----------------------5-------------------------------------
go
create procedure ProcedimientoAlmacenado5(
	@parametro nvarchar (100)
)
as
begin
	declare @newvarchar int
	set @newvarchar = 0
	
	select* from VentasXEmpleado
	where [Total de ventas] like '%' + @parametro + '%'
	
	select * from Empleado
	end
	exec ProcedimientoAlmacenado5 @parametro = 3
---Funciones---
Go
create function Promedio
(
@Valor1 int,
@Valor2 int 
)
returns int
as
begin 
declare @Resultado int
set @Resultado = @Valor1+@Valor2/2
return @Resultado 
end
select dbo.Promedio (20,29) as Promedio