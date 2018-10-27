use Videos8
----------------------------------Práctica 4----------------------------------------
--Update--
Update Genero Set vGenero = 'Romance/Amor'
From Genero
Where iID_Genero = '48'

Select * From Genero

Update Domicilio Set vColonia = 'CABEZADA'
From Domicilio
Where iID_Direccion = 161

Update Domicilio Set vCalle = 'B. Reyes'
From Domicilio
Where vColonia LIKE '%fe'

Select * From Domicilio

Update Tipo Set vTipo = 'Ordinario'
From Tipo
Where iID_Tipo = 171

Select * From Tipo

Update Cliente Set vNombre_Cliente = 'Ariel'
From Cliente
Where vNombre_Cliente = 'Pablo'

Update Cliente Set vApellidoM_Cliente = 'Hernández'
From Cliente
Where iID_Cliente = 115

Update Cliente Set vApellidoP_Cliente = 'Bueno'
From Cliente
Where iID_Cliente = 116

Select * From Cliente

Update Alquiler Set dFecha_Renta = '2018/03/15', mTotal = 150
From Alquiler
Where iID_Alquiler = 383

Select * From Alquiler

--Delete--
Delete From Genero
Where iID_Genero = 44

Delete From Genero
Where vGenero = 'Romance/Amor'

Select * From Genero

Delete From Calidad
Where iID_Calidad = 71

Select * From Calidad

Delete From Puesto
Where iID_Puesto = 53

Delete From Puesto
Where Nombre_Puesto = 'Imagen'

Select * From Puesto

Delete From Cliente
Where iID_Cliente = 119

Delete From Cliente
Where vApellidoP_Cliente = 'Perez'

Delete From Cliente
Where vNombre_Cliente = 'Sergio'

Select * From Cliente

Delete From Domicilio
Where vNumero = '417'

Select * From Domicilio

Delete From Forma_Pago
Where vForma_Pago = 'Tarjeta de Credito'

Select * From Forma_Pago

----------------------------------Práctica 5----------------------------------------
--5 selects basicos con cambio de nombre de la columna, alias y usar funciones

Select (vNombre_Cliente + ' ' + vApellidoP_Cliente + ' ' + vApellidoM_Cliente) As 'Nombre Completo'
From Cliente As Clien

Select Count (Clien.iID_Cliente)
From Cliente As Clien

Select ('Genero: ' + Gen.vGenero) As 'Tipos de Generos'
From Genero As Gen

Select Max (vCod_Postal) 'Código postal más grande'
From Domicilio As Domi

Select Min (vNumero) 'Número de calle más chico'
From Domicilio As Domi

--4 selects Join (cross, inner, left, right)
Select Clien.vNombre_Completo As 'Nombre de Cliente', Tip.vTipo As 'Tipo de cliente'
From Cliente As Clien
Inner Join Tipo As Tip
On Clien.iID_Tipo = Tip.iID_Tipo

Select Pago.vForma_Pago As 'Tipo de pago', Clien.vNombre_Completo As 'Nombre de Cliente'
From Forma_Pago As Pago
Left Join Cliente As Clien
On Pago.iID_Pago = Clien.iID_Pago

Select (Domi.vCalle + ' ' + Domi.vNumero + 'Col. ' +Domi.vColonia) As Direcciòn, Clien.vNombre_Completo As 'Nombre de Cliente'
From Domicilio As Domi
Right Join Cliente As Clien
On Domi.iID_Cliente = Clien.iID_Cliente

Select Clien.vNombre_Completo , Alqui.*
From Cliente As Clien, Alquiler As Alqui

Select Clien.vNombre_Completo As 'Nombre de Cliente', Tip.*
From Cliente As Clien
Full Join Tipo As Tip
On Clien.iID_Tipo = Tip.iID_Tipo

--5 select con uso de where en diferentes tablas y campos (1 con order by)
Select Gene.vGenero As 'Genero de Peliculas' 
From Genero As Gene
Where vGenero Like '%A'

Select Cali.vCalidad As 'Calidad de Peliculas' 
From Calidad As Cali
Where vCalidad Like 'Blu-Ray %'

Select (Domi.vCalle + ' ' + Domi.vNumero + ' Col. ' + Domi.vColonia + ' # Postal ' + vCod_Postal) As 'Dirección de Clientes' 
From Domicilio As Domi
Where vCod_Postal > 50000

Select Clien.vNombre_Completo As 'Nombre Cliente', Clien.dFecha_Nac As 'Fecha de Nacimiento'
From Cliente As Clien
Where Clien.dFecha_Nac >= 1999/09/15
Order By Clien.dFecha_Nac Desc

Select *
From Alquiler As Alqui
Where Alqui.mTotal > 120
Order By Alqui.dFecha_Renta Asc

--5 selects con uso de funciones de agregación (min, max, avg, std, count)
--2 sin group by
--3 con group by-->1 con having
Select Min (Domi.vCod_Postal) As MinimoCP
From Domicilio As Domi

Select Max (Gene.iID_Genero) As 'ID de genero Maximo'
From Genero As Gene

Select Pago.vForma_Pago As 'Forma de pago', Count (Clien.iID_Pago) As 'Cantidad de clientes'
From Forma_Pago As Pago Full Join Cliente As Clien
On pago.iID_Pago = Clien.iID_Pago
Group By Pago.vForma_Pago
Having Count (Clien.iID_Pago) > 0

Select Clien.vNombre_Completo As 'Nombre Cliente', Avg (Alqui.mTotal) As 'Promedio del total de alquiler'
From Cliente As Clien Full Join Alquiler As Alqui
On Clien.iID_Cliente =  Alqui.iID_Cliente
Group By Clien.vNombre_Completo
Having Avg (Alqui.mTotal) > 100

Select Clien.vNombre_Completo As 'Nombre Cliente', Stdevp (Alqui.mTotal) As 'Desviación estandar del subtotal de alquiler'
From Cliente As Clien Full Join Alquiler As Alqui
On Clien.iID_Cliente =  Alqui.iID_Cliente
Group By Clien.vNombre_Completo
Having Stdevp (Alqui.mTotal) > 0

Select Clien.vNombre_Completo As 'Nombre Cliente', Sum (Alqui.mTotal) As 'Suma del subtotal de alquiler'
From Cliente As Clien Full Join Alquiler As Alqui
On Clien.iID_Cliente =  Alqui.iID_Cliente
Group By Clien.vNombre_Completo
Having Stdevp (Alqui.mTotal) > 0

--3 selects con join y group by
Select Clien.vNombre_Completo As 'Nombre completo del cliente', (Domi.vCalle + ' ' + Domi.vNumero + 'Col. ' +Domi.vColonia) As Direcciòn
From Cliente As Clien Inner Join Domicilio As Domi
On Clien.iID_Cliente = Domi.iID_Cliente
Group By Clien.vNombre_Completo, (Domi.vCalle + ' ' + Domi.vNumero + 'Col. ' +Domi.vColonia)

Select Clien.vNombre_Completo As 'Nombre de Cliente', Tip.vTipo As 'Tipo de cliente'
From Cliente As Clien Inner Join Tipo As Tip
On Clien.iID_Tipo = Tip.iID_Tipo
Group By Clien.vNombre_Completo, Tip.vTipo

Select Pago.vForma_Pago As 'Tipo de pago', Clien.vNombre_Completo As 'Nombre de Cliente'
From Forma_Pago As Pago Left Join Cliente As Clien
On Pago.iID_Pago = Clien.iID_Pago
Group By Pago.vForma_Pago, Clien.vNombre_Completo

--1 select into con drop table y reinsertar las filas

Select *
Into #Genero
From Genero

Select *
From #Genero

Select *
From Genero

Drop Table Genero

Select*
Into Genero
From #Genero

----------------------------------Práctica 6----------------------------------------
--3 Subconsultas
--1 subconsulta de columna
Select mSueldo, (
					Select count(mSueldo) 
					From Empleado as E 
					Where E.mSueldo=Empleado.mSueldo
					) as 'Cantidad de sueldos'
	From Empleado
	Group by mSueldo
	Order by mSueldo desc

--1 subconsulta tabla
Select *
From
	(Select vMunicipio As 'Municipio', count (vMunicipio) As 'Cantidad'
		From Domicilio
		Group by vMunicipio
	) As Municipio

--1 de la que sea (columna, tabla)
Select iAño_Estreno, (
					Select count(iAño_Estreno) 
					From Pelicula as P
					Where P.iAño_Estreno = Pelicula.iAño_Estreno
					) as 'Cantidad de peliculas'
	From Pelicula
	Group by iAño_Estreno
	Order by iAño_Estreno desc

select iAño_Estreno, count (iAño_Estreno) as 'cantidad de peliculas'
from Pelicula
group by iAño_Estreno
order by iAño_Estreno desc

select mSueldo, count (mSueldo) as 'cantidad de sueldos'
from Empleado
group by mSueldo
order by mSueldo desc

select vMunicipio As 'Municipio', count (vMunicipio) as 'cantidad'
from Domicilio
group by vMunicipio

--1 subconsulta with
with SumaPuntuaje As (
select fPuntuaje, count(fPuntuaje) as [Cantidad Pelicula]
	From Pelicula
	group by fPuntuaje)

select *
from SumaPuntuaje

with SumaPeliculasAccion as (select iID_Genero AS Peliculas_Accion, count(iID_Genero) as [Cantidad] from Pelicula
group by iID_Genero )

select * from SumaPeliculasAccion where SumaPeliculasAccion.Cantidad > 1 AND Peliculas_Accion=40

--5 Vistas Deben ser reportes de su aplicacion
	--Join (cualquiera)
	--Función de Agregacion (cualquiera)

Create View ReporteMensualEmpleVentas
As select Emple.vNombre_Completo as [Nombre Empleado], sum (Alqui.mTotal) as [Total de ventas]
from Empleado as Emple Inner join Alquiler as Alqui 
on Emple.iID_Empleado = Alqui.iID_Empleado
Where MONTH(Alqui.dFecha_Renta) = MONTH(GETDATE()) --convierte la fehcas y ha ambas les trae el mes
group by Emple.vNombre_Completo

select * From ReporteMensualEmpleVentas

create view ReporteMensualMarzo as(
select vNombre_Completo
, count (a.iID_Alquier) as [Total de Renta]
  from Alquiler as a left join Empleado e on a.iID_Empleado = e.iID_Empleado
 where Month(a.dFecha_Renta) = 03
group by vNombre_Completo)
select *from ReporteMensualMarzo


Create View ReporteMensualPeli
As select Peli.vNombre_Peli as [Nombre de pelicula] , sum (AD.tCantidad) as [Total de rentas]
from Alquiler_Detalle as AD Inner join Pelicula as Peli 
on ad.iID_Pelicula = Peli.iID_Pelicula, Alquiler
Where MONTH(Alquiler.dFecha_Renta) = MONTH(GETDATE())
group by Peli.vNombre_Peli

select * From ReporteMensualPeli


Create View ReporteMensualSucursal
As select Sucu.vSucursal as [Nombre de sucursal] , sum (Alqui.mTotal) as [Total de rentas]
from Sucursal as Sucu Inner join Alquiler_Detalle as AlquiD 
on sucu.iID_Sucursal = AlquiD.iID_Sucursal, Alquiler as Alqui
Where MONTH(Alqui.dFecha_Renta) = MONTH(GETDATE())
group by Sucu.vSucursal

select * From ReporteMensualSucursal

create view EmpleadosSucursal as(
select vNombre_Completo
, s.vSucursal as [Sucursal]
  from Sucursal as s inner join Empleado e on s.iID_Sucursal = e.iID_Sucursal where s.iID_Sucursal=120
group by vNombre_Completo, s.vSucursal)

select * from EmpleadosSucursal


Create View ReporteMensualPeliVendida
As select top 1 Peli.vNombre_Peli as [Nombre de pelicula] , Max (Alqui.mTotal) as [Mas vendida]
from Pelicula as Peli Inner join Alquiler_Detalle as AlquiD 
on Peli.iID_Pelicula = AlquiD.iID_Pelicula, Alquiler as Alqui
Where MONTH(Alqui.dFecha_Renta) = MONTH(GETDATE())
group by Peli.vNombre_Peli

select * From ReporteMensualPeliVendida


Create View ReporteMensualEmpleVentasMax
As select Emple.vNombre_Completo as [Nombre Empleado], sum (AlquiD.tCantidad) as [Cantidad de ventas]
from Empleado as Emple Inner join Alquiler_Detalle as AlquiD
on Emple.iID_Empleado = AlquiD.iID_Alquiler, Alquiler as Alqui
Where MONTH(Alqui.dFecha_Renta) = MONTH(GETDATE())
group by Emple.vNombre_Completo

select * From ReporteMensualEmpleVentasMax

create view Inventario1 as(
select p.vNombre_Peli, p.tCantidad as [Cantidad Peliculas], a.tCantidad as [Peliculas Compradas],(p.tCantidad-a.tCantidad) AS [Peliculas Disponibles Actualmente]
  from Alquiler as al left join Alquiler_Detalle a  on al.iID_Alquier = a.iID_Alquiler 
  left join Pelicula p  on  a.iID_Pelicula=p.iID_Pelicula 
  left join Cliente c on al.iID_Cliente=c.iID_Cliente where c.iID_Cliente>100  and  p.iID_Pelicula>80
group by p.vNombre_Peli,p.tCantidad, a.tCantidad)

select *from Inventario1


--1 consulta dinamica
declare @queryCliente2 nvarchar(MAX)
declare @nomclien nvarchar(MAX) = 'iID_Cliente from Empleado--'
set @queryCliente2 = 'select vNombre_Completo as ' + @nomclien + ' from Cliente'

exec (@queryCliente2)

----------------------------------Práctica 7----------------------------------------
--1 Procedimiento tipo scrip (borrar y crear tabla)
create procedure ScripBorrarCrearTablaGenero
(@parametroTabla nvarchar(100))
as
begin

	declare @variable nvarchar(100)
	set @variable = @parametroTabla
	if @variable = 'Genero'
	begin

	Select *
	Into #Genero --Tabla temporal que se crea en la sesion solamente
	From Genero;

	Drop Table Genero;

	Select*
	Into Genero --Crear tabla Genero e introducir lo que haya en #Genero en la nueva tabla Genero
	From #Genero;
	end

end

exec ScripBorrarCrearTablaGenero @parametroTabla = 'Genero'
GO

create procedure RestarExistencia(
@CodPel int)
AS
begin
Declare @Cantidad int
select @Cantidad = count(iID_Alquiler)  from Alquiler_Detalle where iID_Pelicula = @CodPel
if @Cantidad > 0
begin
select p.iID_Pelicula, p.vNombre_Peli, p.tCantidad as [Cantidad Peliculas],count(a.iID_Alquiler) as [Peliculas Rentadas]
  from Pelicula as p left join Alquiler_Detalle a  on p.iID_Pelicula = a.iID_Pelicula 
group by p.iID_Pelicula, p.vNombre_Peli,p.tCantidad
UPDATE Pelicula set tCantidad=tCantidad-@Cantidad where iID_Pelicula = @CodPel
end
end
Select *from Pelicula

exec RestarExistencia 80

--5 Procedimientos almacenados donde consulten sus reportes y filtren con parametros
create procedure ProcedimientoEmpleVentas 
(@parametro nvarchar(100))
as
begin

	select * 
	From ReporteMensualEmpleVentas
	where [Total de ventas] >  @parametro

end

exec ProcedimientoEmpleVentas  @parametro = 1000
GO

-- vista usada --->select * From ReporteMensualEmpleVentas

create procedure ProcedimientoPeli
(@parametro nvarchar(100))
as
begin

	select * 
	From ReporteMensualPeli
	where [Nombre de pelicula] like '%' + @parametro + '%'

end

exec ProcedimientoPeli  @parametro = 'z'
GO

-- vista usada --->select * From ReporteMensualPeli

create procedure ProcedimientoSucursal
(@parametro nvarchar(100))
as
begin

	select * 
	From ReporteMensualSucursal
	where [Total de rentas] > @parametro and [Total de rentas] < 3000

end

exec ProcedimientoSucursal  @parametro = 1800
GO

-- vista usada --->select * From ReporteMensualSucursal

create procedure ProcedimientoPeliVendida
(@parametro nvarchar(100))
as
begin

	select * 
	From ReporteMensualPeliVendida
	where [Nombre de pelicula] Like '['+@parametro+']%'

end

exec ProcedimientoPeliVendida  @parametro = 'a-z'
GO

-- vista usada --->select * From ReporteMensualPeliVendida

create procedure ProcedimientoEmpleVentasMax
(@parametro nvarchar(100))
as
begin

	select * 
	From ReporteMensualEmpleVentasMax
	where [Nombre Empleado] Like @parametro +'%'

end

exec ProcedimientoEmpleVentasMax  @parametro = 'jesse'
GO

-- vista usada --->select * From ReporteMensualEmpleVentasMax


create procedure InventarioFiltro(
@letra nvarchar (100)
)
as
begin 
	select *from Inventario1
	where vNombre_Peli like '%' + @letra +'%' and [Peliculas Disponibles Actualmente] = 4

end

exec InventarioFiltro @letra ='e'
GO

-- vista usada --->select * From Inventario1


--1 funcion (de lo que sea)
create function ClasificacionPelicula (@parametro int)
returns varchar(50)
as
begin
	declare @clasificacion varchar(50)
	declare @puntuaje double precision

	Select @puntuaje = sum(fPuntuaje*1)
	From Pelicula as peli
	Where iID_Pelicula = @parametro
	If(@puntuaje>8.5) begin
	Select @clasificacion='Buena pelicula'
	end
	else begin
	Select @clasificacion='Mala pelicula'
	end
	Return @clasificacion

end

Select dbo.ClasificacionPelicula(80) as Critica

select * from pelicula

----------------------------------Práctica 8----------------------------------------
--3 Triggers--
Create Trigger tr_insert
on Pelicula
instead of update --delete/*instaed
as
begin
	select * 
	from INSERTED -->tabla temporal, se pone la info que va llegando, solo existe para update e insert
	Select *
	from deleted -->tabla temporal, tiene la info que se va a borrar o que va de salida
end

update Pelicula set tCantidad= 200
where tCantidad =4

Create Trigger tr_insertEmpleado
on Empleado
instead of insert --delete/*instaed
as
begin
declare @NuevoUsuario nvarchar(50)
declare @ViejoUsuario nvarchar(50)
declare @NuevoSueldo nvarchar(50)
declare @ViejoSueldo nvarchar(50)
declare @PuestoNuevo nvarchar(50)
declare @PuestoViejo nvarchar(50)
	select * 
	from INSERTED -->tabla temporal, se pone la info que va llegando, solo existe para update e insert
	insert into Evento(dFecha_Evento,nvDescripcion_Evento)
values (GETDATE(),'Creado por Usuario : ' + @ViejoUsuario + ' Sueldo cambio de : ' + @ViejoSueldo + 'Puesto cambio de : ' + @PuestoViejo +
' | Cambio por Usuario : ' +@NuevoUsuario + ' A ' + @NuevoSueldo + ' A ' + @PuestoViejo )
end

Insert into Empleado (vNombre_Empleado,vApellidoP_Empleado,vApellidoM_Empleado,mSueldo,iID_Sucursal,iID_Puesto) values('OwO','Cerio','Torrs',1300,120,64)


Select *from Empleado
Select *from Evento


Create trigger tr_UpdateEmpleado
on Empleado
for update
as
begin
declare @NuevoUsuario nvarchar(50)
declare @ViejoUsuario nvarchar(50)
declare @NuevoSueldo nvarchar(50)
declare @ViejoSueldo nvarchar(50)
declare @PuestoNuevo nvarchar(50)
declare @PuestoViejo nvarchar(50)

select @NuevoUsuario = vNombre_Empleado ,@NuevoSueldo = mSueldo, @PuestoNuevo = iID_Puesto from inserted 
select @ViejoUsuario = vNombre_Empleado ,@ViejoSueldo = mSueldo, @PuestoViejo = iID_Puesto from deleted

insert into Evento(dFecha_Evento,nvDescripcion_Evento)
values (GETDATE(), 'Creado por Usuario : ' + @ViejoUsuario + ' Sueldo cambio de : ' + @ViejoSueldo + 'Puesto cambio de : ' + @PuestoViejo +
' | Cambio por Usuario : ' +@NuevoUsuario + ' A ' + @NuevoSueldo + ' A ' + @PuestoViejo )

end

Update Empleado set mSueldo=2000 where iID_Empleado=131

Select *from Empleado
Select *from Evento