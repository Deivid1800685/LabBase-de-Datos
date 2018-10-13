use Videos4
---Subconsultas-------------------------------
Select top 1 *From (select vNombre_Cliente, (select count(vNombre_Cliente) from Cliente as C
where C.vNombre_Cliente=Cliente.vNombre_Cliente
) as 'Nombres Cantidad'
From Cliente
) as NC
where NC.[Nombres Cantidad] > 1

select * from (select vNombre_Cliente, count (vNombre_Cliente) as 'C' from Cliente group by vNombre_Cliente) as NC 
where NC.C > 1
 
 select * from Pelicula where iID_Pelicula in (select iID_Pelicula from Alquiler_Pelicula where iID_Alquiler=110)
 with SumaPagos as (select mSueldo, sum(mSueldo) as '[Saldo]' From Empleado group by mSueldo)
select * from SumaPagos Where SumaPagos.[[Saldo]]] > 100
 ---Subconsultas-------------------------------
 ---Vistas-------------------------------------
Go
 Create view ReporteActorPeliculas1 as (
select vNombre_Peli, count (P.iID_Pelicula) as [Total de Peliculas]
from Pelicula as P
left join Actor A on A.iID_Actor = P.iID_Actor
Where iAño_Estreno=2018 group by vNombre_Peli)
go
select * from ReporteActorPeliculas1
insert into Empleado (vNombre_Empleado,vApellidoP_Empleado,vApellidoM_Empleado,mSueldo) values ('Guillermo','Fernandez','Rodriguez',3000)
insert into Alquiler values ('2018-12-15','2018-12-22',117,120,1)
insert into Alquiler values ('2018-10-08','2018-12-12',117,120,1)
select* from Ventas
insert into Ventas values (132,113,'2018-12-15')
insert into Ventas values (132,112,'2018-12-15')
insert into Empleado (vNombre_Empleado,vApellidoP_Empleado,vApellidoM_Empleado,mSueldo,iID_Ventas) values ('Guillermo','Fernandez','Rodriguez',3000,149)
insert into Ventas values (131,112,'2018-12-15')
go
select * from Ventas
Go
Create view VentasEnGeneral1 as (
select vNombre_Peli, sum (P.mPrecio) as [Ganancias]
from Pelicula as P
inner join Alquiler_Pelicula AP on P.iID_Pelicula=AP.iID_Pelicula group by vNombre_Peli)
go
select * from VentasEnGeneral1
Go
Create view VentasXEmpleado as
(
select   E.vNombre_Empleado + ' ' + E.vApellidoP_Empleado + ' ' + E.vApellidoM_Empleado as [Nombre Completo], count(V.iID_Ventas) as [Total de ventas]
from Empleado E 
inner join Ventas V on E.iID_Ventas = V.iID_Ventas AND E.iID_Empleado = V.iID_Empleado
group by  E.vNombre_Empleado + ' ' + E.vApellidoP_Empleado + ' ' + E.vApellidoM_Empleado
)
go
select * from VentasXEmpleado

Go
Create view ReporteCliente as 
(
select P.vNombre_Peli, AP.iID_Pelicula, A.iID_Alquiler, A.iID_Cliente, C.iID_Cliente as InformacionDeCompra, C.vNombre_Cliente, A.dFecha_Alquiler, A.Subtotal from Alquiler as A
inner join Alquiler_Pelicula as AP on A.iID_Alquiler = AP.iID_Alquiler 
inner join Cliente as C on A.iID_Cliente = C.iID_Cliente 
inner join Pelicula as P on AP.iID_Pelicula = P.iID_Pelicula
where C.iID_Cliente=115
)
Go
select * from ReporteCliente

insert into Puesto values ('Gerente')
insert into Puesto values ('Vendedor')
insert into Puesto values ('Limpieza')
insert into Puesto values ('Proveedor')
update Empleado set iID_Puesto = 50 where iID_Empleado = 130
update Empleado set iID_Puesto = 51 where iID_Empleado = 131
update Empleado set iID_Puesto = 52 where iID_Empleado = 135
select * from Empleado
Go
Create view EmpleadosBusqueda as 
(
select  E.vNombre_Empleado + ' ' + E.vApellidoP_Empleado + ' ' + E.vApellidoM_Empleado as [Nombre Completo], Puesto.iID_Puesto, Puesto.Nombre_Puesto 
from  Empleado as E 
inner join Puesto on E.iID_Puesto = Puesto.iID_Puesto
)
Go
select * from EmpleadosBusqueda
select * from Empleado
---Consultas Dinamicas----
DECLARE @QUERY AS NVARCHAR(4000)
SET @QUERY = ''
SET @QUERY = @QUERY +  ' SELECT * '
SET @QUERY = @QUERY +  ' FROM Empleado AS E  '
SET @QUERY = @QUERY +  '  inner join Puesto AS Pst ON '
SET @QUERY = @QUERY +  '  E.iID_Puesto= Pst.iID_Puesto'
EXEC SP_EXECUTESQL @QUERY
