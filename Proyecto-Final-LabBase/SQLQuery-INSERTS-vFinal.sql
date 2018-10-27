use Videos8
---Pelicula--------------------------------------------------------------------
---Genero---
Insert Into Genero (vGenero) Values ('Acción')
Insert Into Genero (vGenero) Values ('Aventura')
Insert Into Genero (vGenero) Values ('Ciencia Ficción')
Insert Into Genero (vGenero) Values ('Comedia')
Insert Into Genero (vGenero) Values ('Anime')
Insert Into Genero (vGenero) Values ('Docuemental')
Insert Into Genero (vGenero) Values ('Drama')
Insert Into Genero (vGenero) Values ('Fantásia')
Insert Into Genero (vGenero) Values ('Romance')
Insert Into Genero (vGenero) Values ('Suspenso')
Insert Into Genero (vGenero) Values ('Terror')
Insert Into Genero (vGenero) Values ('Miedo')
Insert Into Genero (vGenero) Values ('Familiar')

Select * From Genero
---Calidad----
Insert Into Calidad (vCalidad) Values ('DVDRip')
Insert Into Calidad (vCalidad) Values ('Blu-Ray RIP HD 720p')
Insert Into Calidad (vCalidad) Values ('Blu-Ray RIP HD 1080p')

Select * From Calidad
---Resolucion---
Insert into Resolucion values('720x304')
Insert into Resolucion values('1916x796')
Insert into Resolucion values('1280x528 ')

Select * From Resolucion
---Formato---
Insert into Formato values('.AVI')
Insert into Formato values('.MP4')

Select * From Formato
---Clasificacion---
insert into Clasificacion(cClasificacion) values ('A')
insert into Clasificacion(cClasificacion) values ('B')
insert into Clasificacion(cClasificacion) values ('C')

Select * From Clasificacion
---Actor---
Insert into Actor values('Jason Statham')
Insert into Actor values('Mel Nelson')
Insert into Actor values('Tom Cruse')
Insert into Actor values('Denzel Washington')
Insert into Actor values('Jhon Taylor')
Insert into Actor values('Will Smith')
Insert into Actor values('Selena Ortiz')
Insert into Actor values('Jaime Torres')

Select * From Actor
---Idioma---
Insert into Idioma values('Español')
Insert into Idioma values('Inglés')
Insert into Idioma values('Frances')
Insert into Idioma values('Ruso')

Select * From Idioma
---Pelicula---
Insert Into Pelicula values('Megalodon',2018,100,7.5,'1:40','Pelicula sobre un tiburon gigante','imagen1',4,40,30,20,10,70,60,50)
Insert Into Pelicula values('Rascacielos',2018,150,9.5,'1:55','Pelicula de un ex militar, rescatando a su familia','imagen2',8,40,31,20,11,71,60,50)
Insert Into Pelicula values('Sicario 2',2018,150,9.5,'1:40','La historia del sicario mas malo de todos','imagen3',4,41,32,20,12,72,60,50)
Insert Into Pelicula values('Tropa de Héroes',2017,100,8.5,'1:48','Pelicula sobre heores en la tierra y agua','imagen4',5,42,33,21,10,70,60,52)
Insert Into Pelicula values('Deseo de Matar',2017,100,7.0,'1:40','Pelicula sobre un hombre al que le matan a su esposa','imagen5',4,43,34,21,11,71,61,50)
Insert Into Pelicula values('Pantera Negra',2018,100,8.5,'1:55','Pelicula sobre un heroe al estilo pantera MARVEL','imagen6',9,44,35,20,12,72,60,52)
Insert Into Pelicula values('Maze Runner',2017,150,9.5,'2:10','Pelicula sobre un grupo de corredores, buscanso una salida','imagen7',10,45,36,21,10,70,61,50)
Insert Into Pelicula values('El Implacable',2016,95,7.0,'1:40','Pelicula sobre un hombre al que le matan a su hija','imagen8',3,46,30,20,11,71,60,52)
Insert Into Pelicula values('Liga de la Justicia',2017,100,7.5,'2:10','Los super heroes se unen una vez más en la busqueda del bien','imagen9',7,47,31,21,12,72,63,50)
Insert Into Pelicula values('Bright',2018,150,8.5,'1:40','Humanos, policias y mutantes, ¿Qué sucedera?','imagen10',8,48,32,20,10,70,62,51)

Select * From Pelicula
---Casting---
insert into Casting values(80,30)
insert into Casting values(81,31)
insert into Casting values(82,32)
insert into Casting values(83,33)
insert into Casting values(84,34)
insert into Casting values(85,35)
insert into Casting values(86,36)
insert into Casting values(87,37)
insert into Casting values(88,30)
insert into Casting values(89,31)

Select * From Casting

---Cliente--------------------------------------------------------------------
---Forma de pago---
insert into Forma_Pago values('Efectivo')
insert into Forma_Pago values('Tarjeta de Credito')

Select * From Forma_Pago
---Domicilio---
insert into Domicilio values ('Duque de Nava', 'Voulebard Orange', '1891', '67673', 'Guadalupe', 100)
insert into Domicilio values ('Duque la fe', 'Voulebard Jalisco', '417', '6656', 'Escobedo', 101)
insert into Domicilio values('Galaxia','Manzana', '887', '2376', 'Apodaca', 103)
insert into Domicilio values('Concordia','Garganzo', '1024', '2576', 'Apodaca', 104)
insert into Domicilio values('Islandia','General Gz', '1234', '2676', 'Apodaca', 105)
insert into Domicilio values('Arabe','Gutierrez', '754', '8643', 'Apodaca', 107)
insert into Domicilio values('Barrio moderno','Ehrlich', '5634', '2346', 'Monterrey', 102)
insert into Domicilio values('Valle de la fe','Las Diligencias', '532', '9822', 'Monterrey', 106)

Select * From Domicilio
---Tipo---
insert into Tipo values('Distinguido')
insert into Tipo values('Regular')
insert into Tipo values('Beneficioso')

Select * From Tipo
---Cliente---
insert into Cliente values('Sergio','Almaguer','de Leon',2000/04/24,90,160,170)
insert into Cliente values('Pablo','Lopez','Sanchez',2000/05/23,90,161,171)
insert into Cliente values('Alejandra','Garcia','Sanchez',1999/07/19,90,166,172)
insert into Cliente values('Juan','Bueno','Lara',1999/07/03,91,162,172)
insert into Cliente values('David','Perez','Darif',2001/12/21,90,163,171)
insert into Cliente values('Roberto','Pesina','Juarez',1999/09/15,90,164,170)
insert into Cliente values('Tadeo','Lopez','Martinez',1998/04/24,91,167,172)
insert into Cliente values('Paulina','Vazquez','Atxutegi',1998/09/30,90,165,170)

Select * From Cliente

---Empleado--------------------------------------------------------------------
---Sucursal---
insert into Sucursal values('Plaza Centrika', 'Vicente Guerrero 2520, Col Del Prado')
insert into Sucursal values('Chapultepec', 'Av. Chapultepec 1839, Buenos Aires')

Select * From Sucursal
---Puesto---
insert into Puesto values('Cajero')
insert into Puesto values('Gerente')
insert into Puesto values('Imagen')
insert into Puesto values('Ayudante General')

Select * From Puesto
---Horario1---
insert into Horario1 values('6:00am-2:00pm')
insert into Horario1 values('1:00pm-10:00pm')

Select * From Horario1
---Usuario---
insert into Usuario values('GJML48','Hola12345',130)
insert into Usuario values('HHDD10','Adios12345',132)
insert into Usuario values('DGMR12','HI12345',133)
insert into Usuario values('GERA23','asq12345',134)

Select * From Usuario
---Evento---
Select * From Evento
---Empleado---
insert into Empleado values('Jair','Garcia','Uriel',4000,120,50,260)
insert into Empleado values('Marta','Gonzales','Espinoza',8000,120,52,260)
insert into Empleado values('Andrea','Vazquez','Atxutegi',4000,120,50,261)
insert into Empleado values('Mario','Gutierrez','Ezpinoza',4000,120,50,261)
insert into Empleado values('Erick','Martinez','de la Paz',8000,120,51,261)
insert into Empleado values('Rodrigo','Bravo','Ramos',4000,121,52,260)
insert into Empleado values('Zabdiel','Diaz','Cerda',4000,121,52,260)
insert into Empleado values('Jorge','Garcia','Marin',8000,121,53,260)

Select * From Empleado
---Inventario---
Insert into Inventario values(120,80)
Insert into Inventario values(120,81)
Insert into Inventario values(120,82)
Insert into Inventario values(120,83)
Insert into Inventario values(120,84)
Insert into Inventario values(120,85)
Insert into Inventario values(120,86)
Insert into Inventario values(120,87)
Insert into Inventario values(121,88)
Insert into Inventario values(121,89)

Select * from Inventario

---Alquiler--------------------------------------------------------------------
insert into Alquiler values(380,'2018/01/02',110,100,130)
insert into Alquiler values(381,'2018/03/10',160,101,130)
insert into Alquiler values(382,'2018/03/09',310,102,130)
insert into Alquiler values(383,'2018/03/12',110,104,132)
insert into Alquiler values(384,'2018/04/07',110,105,132)
insert into Alquiler values(385,'2018/04/10',210,107,133)
insert into Alquiler values(386,'2018/05/15',160,102,133)
insert into Alquiler values(387,'2018/06/20',90,107,133)

Select * from Alquiler
---Alquiler_Detalle---
insert into Alquiler_Detalle values(100,1,'2018/01/02','2018/01/17',120,80)
insert into Alquiler_Detalle values(150,1,'2018/03/10','2018/03/25',120,81)
insert into Alquiler_Detalle values(150,2,'2018/03/09','2018/03/24',120,82)
insert into Alquiler_Detalle values(100,1,'2018/03/12','2018/03/27',120,83)
insert into Alquiler_Detalle values(100,1,'2018/04/07','2018/04/22',120,84)
insert into Alquiler_Detalle values(100,2,'2018/04/10','2018/04/25',120,85)
insert into Alquiler_Detalle values(150,1,'2018/05/15','2018/05/30',120,86)
insert into Alquiler_Detalle values(87,1,'2018/06/20','2018/07/05',120,87)

Select * from Alquiler_Detalle
---Devolucion---
insert into Devolucion values(380,130,100,80,'2018/01/17')
insert into Devolucion values(381,132,101,81,'2018/03/25')
insert into Devolucion values(382,133,102,82,'2018/03/24')
insert into Devolucion values(384,132,105,84,'2018/04/20')
insert into Devolucion values(386,133,102,86,'2018/06/22')

Select * from Devolucion