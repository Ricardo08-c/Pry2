-- ---------------------------------------------------------
-- Autor: Leonardo Fariña
-- Fecha: 25/06/2021
-- Descripcion: Llenado de base
-- ---------------------------------------------------------

-- Llenamos las ciudades con el documento .csv  importar documento antes
INSERT INTO Cities (Name)
	SELECT DISTINCT city 
	FROM [dbo].[Restaurants]

-- Agregamos Redes Sociales
INSERT INTO SocialMedia VALUES
('Facebook','www.Facebook.com'),('Instagram','www.Instagram.com'),('Twitter','www.Twitter.com')			

-- Tipos y SubTipos De Transaccións
	
INSERT INTO [dbo].[TransType] VALUES
('Credito'),('Debito'),('Cancelación')	

INSERT INTO [dbo].[TransSubTypes] VALUES
('Ads'),('Patrocinio'),('Ganancia Patrocinio'),('Ganancia ChangeIt')		

-- Ayuda Habits
INSERT INTO [dbo].[Habits] VALUES
('PRUEBA','NAME1','LOL','WWW.LOL.COM',1,3)

-- payment ayudita
INSERT INTO [dbo].[PaymentStatus] VALUES
('Exito'),('Procesando'),('Fallo')

INSERT INTO [dbo].[Merchants] VALUES
('AD',1,'WWW.MERCHANT.COM','WWW.ICON.COM')


-- tipos de posts
INSERT INTO [dbo].[PostTypes] VALUES
('Ads'),('Posts')

-- Interacciones
INSERT INTO [dbo].[Interactions] VALUES
('Like'),('Comment'),('Share')

-- Achievements
INSERT INTO [dbo].[Achievements] VALUES
(' menos de plastico en el mundo.'),
(' menos de basura en el mundo.'),
(' de agua ahorraste.'),
(' de electricidad ahorraste.'),
(' de CO2 menos en la atmosfera.'),
(' de aluminio menos en el mar.'),
(' menos para el efecto invernadero en el mundo.')


-- EXEC [changeit_SP_GeneracionDeUsers] 100000
