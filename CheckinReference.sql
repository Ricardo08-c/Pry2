-- Descripcion: Sp que inserta Checkins las veces y en el habito recibido en el parametro
-- 
--
create procedure [dbo].checkinReference
@habitId bigint,
@n bigint,
@locationid bigint
as begin 
declare @i bigint = 0 
declare @name varchar(60)
declare @city bigint
declare @latitudeReference float
declare @longitudeReference float
select @name = name, @city = CityId,@latitudeReference = Locations.Location.Lat, @longitudeReference=Locations.Location.Long from Locations where LocationId = @locationid
while @i < @n 
	begin
	declare @puntoRand float =  0.0001*(rand()*100+10)*cast(rand()*9 as int)
	declare @locationPoint geography = geography::Point((@latitudeReference+@puntoRand), (@longitudeReference+@puntoRand), 4326)
	declare @lati float = @latitudeReference+@puntoRand
	declare @longi float = @longitudeReference+@puntoRand
	declare @locationidpoint bigint 
	select @locationidpoint = Locations.LocationId from Locations where Locations.Location.Lat = @lati and Locations.Location.Long = @longi
	if not exists(select Locations.Location.Lat,Locations.Location.Long from Locations where Locations.Location.Lat = @lati and Locations.Location.Long = @longi)
	begin 
		insert into Locations values (@name,@city,@locationPoint)
		set @locationidpoint =  IDENT_CURRENT('Locations')
	end
	insert into HabitCheck values(@habitId,@locationidpoint,cast(rand()*IDENT_CURRENT('Users')+1 as int),getdate())
	set @i = @i +1
	end 
end

