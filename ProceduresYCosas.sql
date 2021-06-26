create procedure registerHabits 
@n bigint
as
begin 
declare @i bigint = 0 
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
while @i < @n
begin
	
declare @rand int= cast(rand()*4+1 as int);
Insert into Habits select concat(title,convert(varchar(20),@i)),concat(name,convert(varchar(20),@i)),
description,picture,0 from @habits where id = @rand;
set @i = @i +1
end
end
exec registerHabits 10000


create procedure insertLocationsxHabit
@n bigint
as begin
declare @i bigint =0
while @i < @n
begin
declare @location bigint =  cast(rand()*IDENT_CURRENT('Locations')+1 as int);
declare @amount bigint =  rand()*10000000 +1000
declare @ratio bigint =  rand()*90+10
Declare @DateStart	Date = getdate()
			,@DateEnd	Date = '2023-01-01'
declare @date date 
set @date = DateAdd(Day, Rand() * DateDiff(Day, @DateStart, @DateEnd), @DateStart)
declare @habit bigint
select top 1  @habit= HabitId from Habits order by newid();
Insert into LocationsxHabit values (@location,1,@amount,GETDATE(),@date,@ratio,@habit)
set @i = @i +1
end
end
exec  insertLocationsxHabit 10000


create procedure RegisterCheckin  as
begin 

declare @user bigint= cast(rand()*IDENT_CURRENT('Users')+1 as int);

declare @locationxHabit bigint =  cast(rand()*IDENT_CURRENT('LocationsxHabit')+1 as int);

declare @location bigint 
declare @habit bigint
select @habit = HabitId, @location = LocationId from LocationsxHabit where LocationxHabitId = @locationxHabit

insert into HabitCheck values (@habit,@location,@user,GETDATE())

end
select count(*) from HabitCheck

create procedure returnSharedReport
@username varchar(40)
as begin 

select Users.name, HabitCheck.HabitId, HabitCheck.PostTime from HabitCheck
inner join Users on Users.UserId = HabitCheck.UserId where Users.name = @username


end

delete from HabitCheck
DBCC CHECKIDENT ('HabitCheck', RESEED, 0)

select * from HabitCheck


select name,province,city,latitude,longitude from Restaurants order by province,city, latitude,longitude
create procedure llenadoLocations as 
begin
Insert into Cities select distinct city from Restaurants
declare @puntoRand float =  0.00001*100*cast(rand()*9 as int)
declare @lat float
declare @long float;
declare @city varchar(100)
declare @name varchar(100)
declare cursorFil cursor for 
select  latitude,longitude,city, name from Restaurants order by city
open cursorFil
	fetch next from cursorFil into @lat,@long,@city, @name

WHILE @@FETCH_STATUS = 0  
BEGIN  

	fetch next from cursorFil into @lat,@long,@city, @name
set @lat = @lat-@puntoRand
set @long = @long+@puntoRand	
declare @location geography = geography::Point(@lat, @long, 4326)  
declare @cityId bigint
select @cityId = Cities.CityId from Cities where Cities.Name = @city
INSERT INTO Locations values(@name,@cityId,@location)

end
close cursorFil
deallocate cursorFil
end;







select top 1000 name,city, location.Lat Latitud, location.Long Longit from   Locations order by location.Lat
select top 1000 name,city,latitude,longitude from Fast_Food_Restaurants order by latitude

declare @puntoRand float =  0.00001*100*cast(rand()*9 as int)

declare @location geography = geography::Point(10.660408958171534, 107.77588345061677, 4326)  
declare @location2 geography = geography::Point(10.66040958171534, 107.77508345061677, 4326)


select top 10 Loc.Lat,Loc.Long from 
(select top 1000 geography::Point(latitude,longitude, 4326) Loc from Fast_Food_Restaurants) as B inner join(
select top 100 Users.name,Users.UserId,Locations.LocationId,Locations.location location from LocationsxHabit
inner join Locations on LocationsxHabit.LocationId = Locations.LocationId
inner join Users on LocationsxHabit.UserId = Users.UserId) as R on 
  Loc.BufferWithTolerance ( 90, 0.1, 1 ).STContains(R.location) = 1;

 select Users.UserId Us,convert(float,Locations.location.Lat) latitude, Locations.location.Long Long from LocationsxUser
inner join Users on LocationsxUser.UserId = Users.UserId
inner join Locations on Locations.LocationId = LocationsxUser.LocationId
create procedure createSharedPost 
@userId	bigint,
@beginDate datetime,
@endDate datetime
as 
begin 
select AcomplishedGoals.
select HabitId,UserId From HabitCheck where HabitCheck.UserId = @userId and posttime >@beginDate and posttime < @endDate


end;
select * from Fast_Food_Restaurants order by longitude desc
select count(*) from PostInteractions
inner join Posts on Posts.PostId = PostInteractions.PostId
inner join Interactions on Interactions.InteractionId = PostInteractions.InteractionId where Posts.UserId = @paramId

