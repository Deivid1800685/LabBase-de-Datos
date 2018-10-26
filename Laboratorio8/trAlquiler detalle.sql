Use Videos8
Go
Create trigger trAlquiler_Detalle 
on Alquiler 
after insert
as 
declare @iID_Alquiler int
declare @mPrecio money
declare @tCantidad tinyint
declare @mSubtotal money
declare @dFecha_Alquiler date
declare @dFecha_Devolucion date
declare @iID_Sucursal int
declare @iID_Pelicula int 

select @iID_Alquiler = iID_Alquier from inserted
select @mPrecio = mTotal from inserted
select @tCantidad = tCantidad from inserted
select @mSubtotal = SUM(@mPrecio*@tCantidad) from inserted
select @dFecha_Alquiler = dFecha_Renta from inserted
select @dFecha_Devolucion = DATEADD(WEEK,1 ,@dFecha_Alquiler)
select @iID_Sucursal = (select iID_Sucursal from Sucursal where iID_Sucursal=120)
select @iID_Pelicula = (select iID_Pelicula from inserted ) from Pelicula
insert into Alquiler_Detalle values (@iID_Alquiler,@mPrecio,@tCantidad,@mSubtotal,@dFecha_Alquiler,@dFecha_Devolucion,@iID_Sucursal,@iID_Pelicula)


insert into Alquiler values (1,2018-02-02,120,2,100,130)
insert into Cliente values ('MARCOS','TEJADA','BRUNO',1999-01-01,90,160,160,170)
select * from Cliente
