-- ---------------------------------------------------------
-- Autor: Ricardo Soto
-- Fecha: 23/06/2021
-- Descripcion: Sp que inserta Habitos con mayor intensidad en las zonas con mas restaurantes
-- 
--
CREATE PROCEDURE Inserthabits
AS
  BEGIN
      DECLARE @i BIGINT = 0

      EXEC [dbo].Createauxtables

      DECLARE @habits TABLE
        (
           id          INT,
           title       VARCHAR(200),
           NAME        VARCHAR(128),
           description VARCHAR(200),
           picture     VARCHAR(300)
        )

      INSERT INTO @habits
      VALUES      (1,
                   'No comprar botellas plasticas',
                   'Disminucion de plastico',
                   'Este habito consiste en no comprar botellas plasticas en el establecimento en el  que se encuentra',
                   'http:googleDrive/Antiplatic.png'),
                  (2,
                   'Sin pajillas',
                   'Anti-Pajilla',
                   'Este habito intenta reducir el uso de pajillas',
                   'http:googleDrive/AntiPajilla.png'),
                  (3,
                   'Sin miedo a reciclar',
                   'Recicla y venceras',
                   'Este habito consiste reciclar lo ultimo que consumio',
                   'http:googleDrive/Reicle.png'),
                  (4,
                   'A la playa',
                   'La playa es vida',
'Este habito consiste recoger unas cuantas basuras de su playa mas cercana',
'http:googleDrive/playa.png')

DECLARE @checkinQuantity INT

WHILE @i < 6000
  BEGIN
      DECLARE @idgroup VARCHAR(10) = '1'
      DECLARE @idCount BIGINT;

      SELECT @idCount = Count(idgrouplocation)
      FROM   checkinvalues
      WHERE  idgrouplocation = @idgroup

      IF @idCount < 1000
        BEGIN
            SET @checkinQuantity = 3

            INSERT INTO checkinvalues
            VALUES      (@idgroup)
        END
      ELSE
        BEGIN
            SET @idgroup ='2'

            SELECT @idCount = Count(idgrouplocation)
            FROM   checkinvalues
            WHERE  idgrouplocation = @idgroup

            IF @idCount < 2000
              BEGIN
                  SET @checkinQuantity = 5

                  INSERT INTO checkinvalues
                  VALUES      (@idgroup)
              END
            ELSE
              BEGIN
                  SET @idgroup ='3'

                  SELECT @idCount = Count(idgrouplocation)
                  FROM   checkinvalues
                  WHERE  idgrouplocation = @idgroup

                  IF @idCount < 3000
                    BEGIN
                        SET @checkinQuantity = 8

                        INSERT INTO checkinvalues
                        VALUES      (@idgroup)
                    END
                  ELSE
                    BEGIN
                        DELETE FROM checkinvalues

                        DBCC checkident ('checkinValues', reseed, 0)

                        SET @idgroup = '1'
                        SET @checkinQuantity = 3

                        INSERT INTO checkinvalues
                        VALUES      (@idgroup)
                    END
              END
        END

      DECLARE @cityid BIGINT
      DECLARE @city VARCHAR(50)
      DECLARE @Ausarid INT

      SELECT TOP 1 @city = city,
                   @Ausarid = ausarid
      FROM   ausar
      WHERE  id = @idgroup
      ORDER  BY Newid()

      --Locations
      SELECT @cityid = cityid
      FROM   cities
      WHERE  NAME = @city

      DECLARE @lati FLOAT
      DECLARE @longi FLOAT

      SELECT @lati = latitude,
             @longi = longitude
      FROM   ausar
      WHERE  ausarid = @Ausarid;

      DECLARE @locationHabit BIGINT

      SELECT @locationHabit = locations.locationid
      FROM   locations
      WHERE  locations.location.lat = @lati
             AND locations.location.long = @longi

      IF NOT EXISTS(SELECT locations.location.lat,
                           locations.location.long
                    FROM   locations
                    WHERE  locations.location.lat = @lati
                           AND locations.location.long = @longi)
        BEGIN
            INSERT INTO locations
            SELECT TOP 1 NAME,
                         @cityid,
                         geography::Point(latitude, longitude, 4326)
            FROM   ausar
            WHERE  ausarid = @Ausarid;

            SET @locationHabit = Ident_current('Locations')
        END

      -- ingreso a habits
      DECLARE @rand INT= Cast(Rand() * 4 + 1 AS INT);

      INSERT INTO habits
      SELECT Concat(title, CONVERT(VARCHAR(20), @i)),
             Concat(NAME, CONVERT(VARCHAR(20), @i)),
             description,
             picture,
             1
      FROM   @habits
      WHERE  id = @rand;

      DECLARE @habitid BIGINT = Ident_current('Habits')

      EXEC [dbo].Checkinreference
        @habitid,
        @checkinQuantity,
        @locationHabit;

      -- ingreso a locationxHabits
      DECLARE @amount MONEY
      DECLARE @ratio BIGINT = Rand() * 1000 + 100
      DECLARE @geoLoc GEOGRAPHY;

      SELECT @geoLoc = geography::Point(locations.location.lat,
                       locations.location.long, 4326
                              )
      FROM   locations
      WHERE  locations.locationid = @locationHabit

      EXEC @amount = dbo.Changeit_sp_verificarcostohabito
        @geoLoc,
        @ratio

      DECLARE @DateStart DATE = Getdate(),
              @DateEnd   DATE = '2025-01-01'
      DECLARE @date DATE

      SET @date = Dateadd(day, Rand() * Datediff(day, @DateStart, @DateEnd),
                  @DateStart)

      DECLARE @habit BIGINT
      DECLARE @randUser BIGINT= Cast(Rand() * Ident_current('Users') + 1 AS
                                     INT)
      ;
      DECLARE @user BIGINT

      SELECT @user = userid
      FROM   users
      WHERE  userid = @randUser

      INSERT INTO locationsxhabit
      VALUES      (@locationHabit,
                   1,
                   @amount,
                   Getdate(),
                   @date,
                   @ratio,
                   @habitid)

      SET @i = @i + 1
  END
END

-- ---------------------------------------------------------
-- Autor: Ricardo Soto
-- Fecha: 23/06/2021
-- Descripcion: Sp que Establece tablas auxiliares para insertar habitos de forma coherente
-- 
--
CREATE PROCEDURE Createauxtables
AS
  BEGIN
      IF NOT EXISTS (SELECT NAME
                     FROM   sys.tables
                     WHERE  NAME = 'checkinValues')
        CREATE TABLE checkinvalues
          (
             id              INT IDENTITY(1, 1),
             idgrouplocation VARCHAR(10)
          )

      IF NOT EXISTS (SELECT NAME
                     FROM   sys.tables
                     WHERE  NAME = 'Ausar')
        CREATE TABLE ausar
          (
             id        VARCHAR(10),
             NAME      VARCHAR(50),
             city      VARCHAR(50),
             latitude  FLOAT,
             longitude FLOAT,
             ausarid   INT IDENTITY(1, 1)
          )

      DELETE FROM checkinvalues

      DBCC checkident ('checkinValues', reseed, 0)

      DELETE FROM ausar

      DBCC checkident ('Ausar', reseed, 0)

      SELECT province,
             city,
             latitude,
             longitude,
             Count(NAME)
      FROM   restaurants
      GROUP  BY province,
                city,
                latitude,
                longitude
      HAVING Count(NAME) > 2
      ORDER  BY province,
                city,
                latitude,
                longitude

      SELECT Count(NAME),
             province
      FROM   restaurants
      GROUP  BY province
      ORDER  BY Count(NAME) DESC

      INSERT INTO ausar
      SELECT '1'AS ID,
             NAME,
             province,
             city,
             latitude,
             longitude
      FROM   [dbo].[restaurants]
      WHERE  40.09755 > Cast(latitude AS FLOAT)
             AND Cast(latitude AS FLOAT) > 38.09755
             AND Cast(longitude AS FLOAT) < -93.58253
             AND Cast(longitude AS FLOAT) > -95.58253
      UNION
      -- SEATLLE 47.608649159818405, -122.34741263090288 MEDIO POBLADOS
      SELECT '3' AS ID,
             NAME,
             province,
             city,
             latitude,
             longitude
      FROM   [dbo].[restaurants]
      WHERE  48.60864 > Cast(latitude AS FLOAT)
             AND Cast(latitude AS FLOAT) > 46.60864
             AND Cast(longitude AS FLOAT) < -121.34741
             AND Cast(longitude AS FLOAT) > -123.34741
      UNION
      -- NUEVA YORK 40.71948994105135, -74.01427182245892 MUY POBLADO
      SELECT '2'AS ID,
             NAME,
             province,
             city,
             latitude,
             longitude
      FROM   [dbo].[restaurants]
      WHERE  41.71948 > Cast(latitude AS FLOAT)
             AND Cast(latitude AS FLOAT) > 39.71948
             AND Cast(longitude AS FLOAT) < -73.01427
             AND Cast(longitude AS FLOAT) > -75.01427
      ORDER  BY latitude,
                longitude,
                province,
                city
  END 