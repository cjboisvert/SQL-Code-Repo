--The names of players older than 25
SELECT "name"
FROM players_personal
WHERE "age" > '25'
ORDER BY "name";

-- What if there are multiple players with the same name? Testing for multiple names
SELECT "name", 
COUNT(*) as cnt 
FROM players_personal  
WHERE "age" > 25 
GROUP BY "name" 
ORDER BY count(*) DESC;

-- Appear to be multiple Felipes, testing.
SELECT * 
FROM players_personal 
WHERE "name" = 'Felipe' 
ORDER BY "age";

-- What is the average height, weight, age and wage of players across all countries?
SELECT ROUND(AVG("Wage_K"),2) AS Wage_K,
ROUND(AVG("age"),0) AS Age,
ROUND(AVG("Height_cm"),2) AS Height_cm,
ROUND(AVG("Weight_kg"),2) AS Weight_kg
FROM players_personal;

-- How many players per country?
SELECT "nationality" 
 ,COUNT("nationality") AS No_of_players
FROM players_personal
GROUP BY "nationality"
ORDER BY No_of_players DESC; 

-- What is the average height, weight, age and wage of players from Brazil?
SELECT COUNT("nationality"),
ROUND(AVG("Wage_K"),2) AS Wage_K,
ROUND(AVG("age"),0) AS Age,
ROUND(AVG("Height_cm"),2) AS Height_cm,
ROUND(AVG("Weight_kg"),2) AS Weight_kg
FROM players_personal
WHERE "nationality" = 'Brazil';

-- Is it possible to compare the overall rating and potential rating per nationality from each player?
SELECT "nationality" 
,MAX("overall")"overall"
FROM public.players_personal
GROUP BY "nationality"
ORDER BY "overall" DESC;

-- Rename columns to be more descriptive
ALTER TABLE players_personal
RENAME "overall" TO points;

ALTER TABLE players_personal
RENAME "potential" TO strength;
