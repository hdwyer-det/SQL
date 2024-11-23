-- select all games
SELECT * FROM Games;

-- select all from games and developers (missing join condition)
-- This query returns unexpected rows, as every record in the games table
--   is joined with every record in the developers table
SELECT * FROM Games, Developers;

-- select all from games and developers (with join condition)
-- This query is now correct, as it is restricting so we can get the records matching on the foreign key
SELECT * FROM Games, Developers
WHERE Games.Developer_ID = Developers.Developer_ID;

-- selecting with all 3 tables joined, using AS to rename columns for display
SELECT Games.name AS 'Game Name',
       Publishers.Name AS PublisherName,
       Developers.First_Name AS 'Developer First Name', 
       Developers.Last_Name AS 'Developer Last Name',
       Quantity_Sold
FROM Games, Publishers, Developers
WHERE Games.Developer_ID = Developers.Developer_ID
  AND Games.Publisher_ID = Publishers.Publisher_ID;

-- First attempt to see total sales by developer
-- This won't work as intended
SELECT Publishers.Name,
       Quantity_Sold
FROM Publishers, Games
WHERE Publishers.Publisher_ID = Games.Publisher_ID
ORDER BY Publishers.Name;

-- Fixing this with a GROUP BY clause
SELECT Publishers.Name,
       SUM(Games.Quantity_Sold)
FROM Publishers, Games
WHERE Publishers.Publisher_ID = Games.Publisher_ID
GROUP BY Publishers.Publisher_ID
ORDER BY Publishers.Name;

-- Using a group by to see number of games per developer
SELECT Developers.First_Name, 
       Developers.Last_Name, 
       count(*) AS 'Number of Games'
FROM Developers, Games
WHERE Developers.Developer_ID = Games.Developer_ID
GROUP BY Developers.Developer_ID;

-- SQL Queries with group by can use the following calculations:
--   SUM  -> Calculates the total of the column across all grouped records
--   AVG  -> Calculates the average of the column across all grouped records
--   COUNT -> Calculates the number of grouped records
--   MAX   -> Calculates the maximum value of the column across all grouped records
--   MIN   -> Calculates the minimum value of the column across all grouped records

-- You can group by multiple columns. So we could group unique developer/publisher combinations
SELECT Developers.First_Name, 
       Developers.Last_Name, 
       Publishers.Name,
       AVG(Cost)
FROM Developers, Games, Publishers
WHERE Developers.Developer_ID = Games.Developer_ID 
  AND Publishers.Publisher_ID = Games.Publisher_ID
GROUP BY Developers.Developer_ID, 
         Publishers.Publisher_ID;

-- For comparison with above. Excluding group by
SELECT Developers.First_Name, 
       Developers.Last_Name, 
       Publishers.Name,
       Cost
FROM Developers, Games, Publishers
WHERE Developers.Developer_ID = Games.Developer_ID 
  AND Publishers.Publisher_ID = Games.Publisher_ID;
