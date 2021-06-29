-- ---------------------------------------------------------
-- Autor: Ricardo Soto
-- Fecha: 23/06/2021
-- Descripcion: Sp que inserta Habitos con mayor intensidad en las zonas con mas restaurantes
-- 
-- drop procedure insertHabits
EXEC insertHabits 

create procedure insertHabits
as 
begin 
declare @i bigint = 0 

exec [dbo].CreateAuxTables

DECLARE @habits TABLE (id INT,title varchar(200), name varchar(128),description varchar(200),
picture varchar(300))
insert into @habits values (1,'No comprar botellas plasticas','Disminucion de plastico'
	,'Este habito consiste en no comprar botellas plasticas en el establecimento en el 
	que se encuentra','http:googleDrive/Antiplatic.png'),
	(2,'Sin pajillas','Anti-Pajilla'
	,'Este habito intenta reducir el uso de pajillas','http:googleDrive/AntiPajilla.png'),
	(3,'Sin miedo a reciclar','Recicla y venceras'
	,'Este habito consiste reciclar lo ultimo que consumio','http:googleDrive/Reicle.png'),
	(4,'A la playa','La playa es vida'
	,'Este habito consiste recoger unas cuantas basuras de su playa mas cercana','http:googleDrive/playa.png')
declare @checkinQuantity int
declare @idgroup varchar(10)
declare @idCount bigint
declare @cityid bigint
declare @city varchar(50)
declare @Ausarid int
declare @lati float
declare @longi float
declare @locationHabit bigint 
declare @rand int
declare @habitid bigint 
declare @amount money 
declare @ratio bigint 
declare @geoLoc geography 
declare @date date 
declare @date2 date 
declare @UserName VARCHAR(128) 
DECLARE @IPaddres VARBINARY(16)
Declare @DateStart	Date 
Declare @DateEnd	Date 
declare @habit bigint
declare @randUser bigint
declare @user bigint

while @i < 1000
begin
	set @idgroup  = '1'	
	select  @idCount = count(idGroupLocation) from checkinValues where idGroupLocation = @idgroup
	if @idCount <100
		begin
		set @checkinQuantity = 3
		insert into checkinValues values (@idgroup)
		end
	else begin
		set @idgroup ='2'
		select  @idCount = count(idGroupLocation) from checkinValues where idGroupLocation = @idgroup

		if @idCount <200
			begin
			set @checkinQuantity = 5
			insert into checkinValues values (@idgroup)
			end
		else
			begin
			set @idgroup ='3'
			select  @idCount = count(idGroupLocation) from checkinValues where idGroupLocation = @idgroup
			if @idCount <1000
				begin
				set @checkinQuantity = 8
				insert into checkinValues values (@idgroup)
				end
			else
				begin
				delete from checkinValues
				DBCC CHECKIDENT ('checkinValues', RESEED, 0)
				set @idgroup = '1'
				set @checkinQuantity = 3
				insert into checkinValues values (@idgroup)
			end
		end
	end

	select top 1 @city = city, @Ausarid = Ausarid from Ausar where ID = @idgroup order by newid()
	
	--Locations
	select @cityid = (SELECT CityId from Cities where name = @city)



		select @lati= latitude, @longi=longitude from Ausar where  Ausarid = @Ausarid;

		select @locationHabit = Locations.LocationId from Locations where Locations.Location.Lat = @lati and Locations.Location.Long = @longi
		if not exists(select Locations.Location.Lat,Locations.Location.Long from Locations where Locations.Location.Lat = @lati and Locations.Location.Long = @longi)
		begin
			insert into Locations 
			select top 1 CONCAT(name,@cityid,@Ausarid), @cityid,geography::Point(latitude, longitude, 4326) from Ausar where Ausarid = @Ausarid;
			set @locationHabit =  IDENT_CURRENT('Locations')
		end
	

	
	
		-- ingreso a habits

		set @rand = cast(rand()*4+1 as int)

		Insert into Habits select 
		concat(title,convert(varchar(20),@i)),
		concat(name,@locationHabit,convert(varchar(20),@i)),
		description,
		picture,
		1,
		cast(rand()*IDENT_CURRENT('Users') as int)
		from @habits where id = @rand;
	
		set @habitid = IDENT_CURRENT('Habits')
		exec [dbo].checkinReference @habitid,@checkinQuantity,@locationHabit;

		-- ingreso a locationxHabits
	


		set @ratio = rand()*1000+100
		select @geoLoc = geography::Point(Locations.Location.Lat, Locations.Location.Long, 4326) from Locations where Locations.LocationId = @locationHabit
		EXEC @amount = dbo.changeit_SP_VerificarCostoHabito @geoLoc,@ratio

		set @DateStart	= '2021-01-01'
		set @DateEnd = '2021-12-30'


		set @date = DateAdd(Day, Rand() * DateDiff(Day, @DateStart, @DateEnd), @DateStart)
		set @date2 = DateAdd(Day, Rand() * DateDiff(Day, @date, @DateEnd), @date)

		set @randUser = cast(rand()*IDENT_CURRENT('Users')+1 as int)
		select @user = UserId from Users where UserId = @randUser

		SET @UserName = (SELECT Name FROM Users WHERE UserId = @user)
		SET @IPaddres = CAST( CONCAT(CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1),'.',CONVERT(INT,RAND()*(255-1)+1)) AS VARBINARY)

		insert into LocationsxHabit values (@locationHabit,1,@amount,@date,@date2,@ratio,@habitid,
		CONCAT('PC-',@UserName),@UserName,@IPaddres,
		CHECKSUM(@locationHabit,1,@amount,@date,@date2,@ratio,@habitid,CONCAT('PC-',@UserName),@UserName,@IPaddres))
		set @i = @i +1
		COMMIT
	end
		
end






-- ---------------------------------------------------------
-- Autor: Ricardo Soto
-- Fecha: 23/06/2021
-- Descripcion: Sp que Establece tablas auxiliares para insertar habitos de forma coherente
-- 
--
-- drop procedure CreateAuxTables
create procedure CreateAuxTables as 
begin 


DROP TABLE IF EXISTS [dbo].checkinValues;
DROP TABLE IF EXISTS [dbo].Ausar;

create table checkinValues  ( id int identity(1,1),idGroupLocation varchar(10))
create table Ausar (ID varchar(10),name varchar(50),province varchar(50), city varchar(50),latitude float, longitude float, Ausarid int identity(1,1))

delete checkinValues
DBCC CHECKIDENT ('checkinValues', RESEED, 0)

delete Ausar
DBCC CHECKIDENT ('Ausar', RESEED, 0)

insert into Ausar
SELECT '1'as ID,name,province,city,latitude,longitude FROM [dbo].[Restaurants] 
WHERE 40.09755 > CAST(latitude AS FLOAT) AND CAST(latitude AS FLOAT) > 38.09755 AND CAST(longitude AS FLOAT) < -93.58253 AND CAST(longitude AS FLOAT) > -95.58253
UNION
-- SEATLLE 47.608649159818405, -122.34741263090288 MEDIO POBLADOS
SELECT '2' as ID,name,province,city,latitude,longitude FROM [dbo].[Restaurants]
WHERE 48.60864 > CAST(latitude AS FLOAT) AND CAST(latitude AS FLOAT) > 46.60864 AND CAST(longitude AS FLOAT) < -121.34741 AND CAST(longitude AS FLOAT) > -123.34741
UNION
-- NUEVA YORK 40.71948994105135, -74.01427182245892 MUY POBLADO
SELECT '3'as ID,name,province,city,latitude,longitude FROM [dbo].[Restaurants]
WHERE 41.71948 > CAST(latitude AS FLOAT) AND CAST(latitude AS FLOAT) > 39.71948 AND CAST(longitude AS FLOAT) < -73.01427 AND CAST(longitude AS FLOAT) > -75.01427
ORDER BY latitude,longitude,province,city

end




SELECT * FROM [dbo].[HabitCheck]

SELECT * FROM Habits
SELECT * FROM [dbo].[LocationsxHabit]

SELECT * FROM Achievements
SELECT * FROM [dbo].[AcomplishedGoals]


delete from HabitCheck
delete from LocationsxHabit
delete from Locations
delete from Habits
delete from checkinValues
DBCC CHECKIDENT ('HabitCheck', RESEED, 0)

DBCC CHECKIDENT ('checkinValues', RESEED, 0)
DBCC CHECKIDENT ('Locations', RESEED, 0)
DBCC CHECKIDENT ('Habits', RESEED, 0)
DBCC CHECKIDENT ('LocationsxHabit', RESEED, 0)