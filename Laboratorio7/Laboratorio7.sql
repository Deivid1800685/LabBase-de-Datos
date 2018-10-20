use Videos4
---Procedimiento con script---
go
create procedure Aumento(
	@iID_Ventas int 
)
as
begin
	declare @Aumento int
	declare @Valor1 int
	
	select @Valor1 = iID_Empleado from Empleado where iID_Ventas=@iID_Ventas
	if @iID_Ventas>0
	UPDATE Empleado set mSueldo = mSueldo+40 where iID_Ventas=@iID_Ventas
	select * from Empleado
	end
	exec Aumento @iID_Ventas = 149
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
CREATE FUNCTION Promedio3
(

 @iID_Venta int 
)
RETURNS decimal (18,4)
AS
BEGIN

	DECLARE @calcular decimal (18,4)

	
	SELECT @calcular = SUM(tCantidad * mPrecio) from Pelicula
	where iID_Pelicula = @iID_Venta
	
	RETURN @calcular

END
GO
select dbo.Promedio3 (80) as ValorDinero

