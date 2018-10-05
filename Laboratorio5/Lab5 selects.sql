use Videos4
-- 5 selects
select (vNombre_Cliente +' '+ vApellidoP_Cliente +' '+ vApellidoM_Cliente) as vNombre_Completo ,  vNombre_Completo as 'NC' from Cliente
select ('Nombre del cliente: '+C.vNombre_Cliente) from Cliente as C
select ('Nombre del Pelicula: '+P.vNombre_Peli) from Pelicula as P
select ('La forma de pagar sera:'+FP.vForma_Pago) from Forma_Pago as FP
insert into Empleado (vNombre_Empleado,vApellidoP_Empleado,vApellidoM_Empleado,mSueldo) values ('Jhon',' Gutierrez', 'Zaragoza',3000)
select (vNombre_Empleado+' '+vApellidoP_Empleado+' '+vApellidoM_Empleado) as Nombre_Completo from Empleado
-- Selects con join
select * from  Cliente C Left join  Forma_Pago FP on C.iID_Pago=FP.iID_Pago 
select * from Pelicula P right join Actor A on P.iID_Actor=A.iID_Actor and a.iID_Actor<30
select * from Pelicula P right join Actor A on P.iID_Actor=A.iID_Actor and a.iID_Actor=30
select* from Pelicula P right join Formato F on P.iID_Formato=F.iID_Formato   
select*from Pelicula P full join Formato F on P.iID_Formato=F.iID_Formato
-- Selects con where
select * from Forma_Pago FP inner join Cliente C on FP.iID_Pago = C.iID_Pago where vForma_Pago = 'Efectivo'
insert into Actor values ('Tom Holland') 
insert into Actor values ('Chris Evans') 
insert into Casting values ('Spiderman','Tom Holland',97,31)
insert into Casting values ('Spiderman2','Tom Holland',97,31)
insert into Ventas values (130,110,'2018/09/20')
insert into Alquiler values (2018/09/20,2018/09/25,115,120,1)
select*from Casting CAS inner join Actor A on CAS.iID_Actor=A.iID_Actor where vNombre_Pelicula = 'Spiderman'
select*from Pelicula P inner join Formato FT on P.iID_Formato=FT.iID_Formato where vFormato = 'Blu-ray' order by vNombre_Peli
select*from Empleado E inner join Ventas V on E.iID_Empleado=V.iID_Empleado where FechaDeVenta = '2018/09/20'
select*from  Alquiler AL inner join Ventas V on AL.iID_Alquiler= V.iID_Alquiler where iID_Empleado = 130

--Selects con funciones de agregacion 
select count (vNombre_Cliente) from Cliente
select count (iID_Pelicula) from Pelicula
--Selects con funciones de agregacion order by
select vNombre_Completo from Cliente join (select dFecha_Nac, count (*) as FechaDeNacimiento from Cliente Group by dFecha_Nac)subq on Cliente.dFecha_Nac= subq.dFecha_Nac
select count(iID_Cliente) as ID, vNombre_Completo from  Cliente group by vNombre_Completo having COUNT (iID_Cliente)=1
select MAX (mPrecio) as PrecioMaximo, vDuración from Pelicula group by vDuración
---Selects con Join y group by
insert into Alquiler_Pelicula values (110,80)
select MAX (iID_Casting) As Resultado from Casting CAS inner join Actor A on CAS.iID_Actor=A.iID_Actor group by A.vNombre_Actor 
SELECT COUNT (V.iID_Ventas)  as Total  from Empleado E inner join Ventas V on E.iID_Empleado=V.iID_Empleado group by FechaDeVenta
select MAX (AL.Subtotal) as MaximoaPagar from Alquiler AL inner join Alquiler_Pelicula ALP on AL.iID_Alquiler=ALP.iID_Alquiler group by dFecha_Alquiler
---select into con drop table y reinsertar las filas

insert into Demo values (1,'Hola')
Select* into DemoBack1 from Demo

drop table Demo

select*into Demo from DemoBack1
select*from Demo

Select *into DemoTemp 
From Demo
INSERT INTO Demo SELECT * FROM DemoTemp