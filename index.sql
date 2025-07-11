--create database
CREATE DATABASE united_nations;

--use database
USE united_nations;

--create a table
CREATE TABLE access_to_basic_services(
    Region VARCHAR(32),
    Sub_region VARCHAR(25),
    Country_name INTEGER NOT NULL,
    Time_period INTEGER NOT NULL,
    Pct_managed_drinking_water_services NUMERIC(5,2),
    Pct_managed_sanitation_services NUMERIC(5,2),
    Est_population_in_millions NUMERIC(11,6),
    Est_gdp_in_billions NUMERIC(8,2),
    Land_area NUMERIC(10,2),
    Pct_unemployment NUMERIC(5,2)
);

--modify country name data type
ALTER TABLE access_to_basic_services
MODIFY COLUMN Country_name VARCHAR(37);

--add new column 
ALTER TABLE access_to_basic_services
ADD COLUMN Gini_index FLOAT;

--drop column
ALTER TABLE access_to_basic_services
DROP COLUMN Gini_index

--drop table
DROP TABLE Gini_index

--drop database
DROP DATABASE united_nations



--=============================================================
--create database
CREATE DATABASE united_nations;

--use database
USE united_nations;

--create table
CREATE TABLE access_to_basic_services(
    Region VARCHAR(32),
    Sub_region VARCHAR(25),
    Country_name VARCHAR(35) NOT NULL,
    Time_period INTEGER NOT NULL,
    Pct_managed_drinking_water_services NUMERIC(5,2),
    Pct_managed_sanitation_services NUMERIC(5,2),
    Est_population_in_millions NUMERIC(11,6),
    Est_gdp_in_billions NUMERIC(8,2),
    Land_area NUMERIC(10,2),
    Pct_unemployment NUMERIC(5,2)
);
--insert into table
INSERT INTO access_to_basic_services(
    Region,
    Sub_region,
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions,
    Land_area,
    Pct_unemployment
) VALUES 
    ('Central and Southern Asia', 'Central Asia', 'Kazakhstan', 2020, 95.0, 98.0, 18.755666, 271.08, 2699700.0, 4.09),
    ('Sub-Saharan Africa', 'Southern Africa', 'Namibia', 2020, 83.67, 35.0, 2.489098, 10.58, 623290.0, NULL),
    ('Sub-Saharan Africa', 'Southern Africa', 'Lesotho', 2020, 76.33, 49.67, 2.2541, 2.23, 30030.0, NULL),
    ('Sub-Saharan Africa', 'Southern Africa', 'Botswana', 2020, 89.67, 74.33, 2.546402, 14.93, 566730.0, 21.02);

--delete row in a table
DELETE FROM access_to_basic_services
WHERE Sub_region = 'Central Asia'

--truncate table
TRUNCATE TABLE access_to_basic_services

--update data in a table
UPDATE access_to_basic_services 
SET Pct_unemployment = 4.53  
WHERE Country_name = 'China'  
AND Time_period = 2016;

--4 Query with SQL
-- 4.5 SELECT And SELECT WHERE

-- SELECT all columns in the database
SELECT
    *
FROM
    Access_to_Basic_Services;

-- SELECT all columns and LIMIT to 10 rows
SELECT
    *
FROM
    Access_to_Basic_Services
LIMIT 10;

-- SELECT distinct column
SELECT DISTINCT 
    Country_name
FROM 
    Access_to_Basic_Services;

-- Saving the query into a table 
CREATE TABLE 
    Country_list(
        Country_name VARCHAR(225)
    );
INSERT INTO Country_list(
    Country_name
)
SELECT DISTINCT 
    Country_name
FROM 
    Access_to_Basic_Services;

-- Check for country that has the lowest pct of people with access tp managed drinking water services
SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services AS pct_access_water
FROM 
    Access_to_Basic_Services
WHERE 
    Time_period = 2020;

-- 4.8 Using Logical And Comparison Operations 

-- This query selects data from Access_to_Basic_Services for certain African countries
-- Specifically, it selects:
--   Country_name, Time_period, % managed drinking water services, % managed sanitation services,
--   estimated population (in millions), and estimated GDP (in billions).
--
-- The WHERE clause logic works as follows:
--   - If Country_name is 'South Africa', then Time_period must be between 2019 and 2020.
--   - For all the other listed countries (Nigeria, Ethiopia, Congo, Egypt, Tanzania, Kenya),
--     they will be included regardless of the time period, because no explicit time condition is applied to them.
--
-- Note: Because of operator precedence, the AND condition only applies to 'South Africa'.

SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions
FROM
    Access_to_Basic_Services
WHERE
    Country_name = 'Nigeria'
    OR Country_name = 'Ethiopia'
    OR Country_name = 'Congo'
    OR Country_name = 'Egypt'
    OR Country_name = 'Tanzania'
    OR Country_name = 'Kenya'
    OR Country_name = 'South Africa'
    AND Time_period BETWEEN 2019 AND 2020;

-- This query selects data from the Access_to_Basic_Services table
-- It retrieves country name, time period, percentage with managed drinking water services,
-- percentage with managed sanitation services, estimated population (in millions),
-- and estimated GDP (in billions)
--
-- The WHERE clause logic works as follows:
--   - It filters for records where Country_name is one of the following:
--     'Nigeria', 'Ethiopia', 'Congo', 'Egypt', 'Tanzania', 'Kenya', or 'South Africa'
--   - It also requires that Time_period is between 2019 and 2020 for all selected countries


SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions
FROM
    Access_to_Basic_Services
WHERE
    (
    Country_name = 'Nigeria',
    OR Country_name = 'Ethiopia',
    OR Country_name = 'Congo',
    OR Country_name = 'Egypt',
    OR Country_name = 'Tanzania',
    OR Country_name = 'Kenya',
    OR Country_name = 'South Africa'
    )
    AND Time_period BETWEEN 2019 AND 2020;

/* 
   Select countries from Access_to_Basic_Services table
   where the time period is 2020,
   the percentage of managed drinking water services is less than or equal to 50,
   and the percentage of managed sanitation services is less than or equal to 50
*/


SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions
FROM
    Access_to_Basic_Services
WHERE
    Time_period = 2020
    AND Pct_managed_sanitation_services <= 50
    AND Pct_managed_drinking_water_services <= 50;


-- 4.9 Using Logical And Comparison Operators II
-- This query selects data from the Access_to_Basic_Services table
-- It retrieves the following columns:
--   - Country_name
--   - Time_period
--   - Percentage with managed drinking water services
--   - Percentage with managed sanitation services
--   - Estimated population in millions
--   - Estimated GDP in billions
--   - Region
--
-- The WHERE clause filters for:
--   - Records where Region is 'Sub-Saharan Africa'
--   - Records where Time_period is 2020
--
-- This effectively returns data for all Sub-Saharan African countries
-- for the year 2020 only.

SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions,
    Region
FROM
    Access_to_Basic_Services
WHERE
    Region = 'Sub-Saharan Africa'
AND
    Time_period = 2020;

-- This query selects data from the Access_to_Basic_Services table
-- It retrieves the following columns:
--   - Country_name
--   - Time_period
--   - Percentage with managed drinking water services
--   - Percentage with managed sanitation services
--   - Estimated population in millions
--   - Estimated GDP in billions
--   - Region
--
-- The WHERE clause filters for:
--   - Records where the Region is 'Sub-Saharan Africa'
--   - Records where Time_period is 2020
--   - Records where Est_gdp_in_billions is NULL
--
-- This means it returns data for Sub-Saharan African countries in 2020
-- where estimated GDP data is missing (i.e., Est_gdp_in_billions has no value)

SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions,
    Region
FROM
    Access_to_Basic_Services
WHERE
    Region = 'Sub-Saharan Africa'
AND
    Time_period = 2020
AND 
	Est_gdp_in_billions IS NULL;


-- This query selects data from the Access_to_Basic_Services table
-- It retrieves the following columns:
--   - Country_name
--   - Time_period
--   - Percentage with managed drinking water services
--   - Percentage with managed sanitation services
--   - Estimated population in millions
--   - Estimated GDP in billions
--   - Region
--
-- The WHERE clause filters for:
--   - Records where Region is 'Sub-Saharan Africa'
--   - Records where Time_period is 2020
--   - Records where Est_gdp_in_billions is NOT NULL
--
-- This means it returns data for Sub-Saharan African countries in 2020
-- but only for countries that have estimated GDP data available 
-- (i.e., Est_gdp_in_billions has a value)

SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions,
    Region
FROM
    Access_to_Basic_Services
WHERE
    Region = 'Sub-Saharan Africa'
AND
    Time_period = 2020
AND 
	Est_gdp_in_billions IS NOT NULL;



-- This query selects data from the Access_to_Basic_Services table
-- It retrieves the following columns:
--   - Country_name
--   - Time_period
--   - Percentage with managed drinking water services
--   - Percentage with managed sanitation services
--   - Estimated population in millions
--   - Estimated GDP in billions
--   - Region
--
-- The WHERE clause filters for:
--   - Records where Region is 'Sub-Saharan Africa'
--   - Records where Time_period is 2020
--   - Records where Est_gdp_in_billions is NOT NULL
--   - Records where Country_name is one of the following:
--     'Nigeria', 'South Africa', 'Ethiopia', 'Kenya', or 'Ghana'
--
-- This means it returns data for 2020 only,
-- for selected major Sub-Saharan African countries that have available GDP estimates

SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions,
    Region
FROM
    Access_to_Basic_Services
WHERE
    Region = 'Sub-Saharan Africa'
AND
    Time_period = 2020
AND 
	Est_gdp_in_billions IS NOT NULL
AND
    Country_name IN ('Nigeria','South Africa','Ethiopia','Kenya','Ghana');

-- This query selects data from the Access_to_Basic_Services table
-- It retrieves the following columns:
--   - Country_name
--   - Time_period
--   - Percentage with managed drinking water services
--   - Percentage with managed sanitation services
--   - Estimated population in millions
--   - Estimated GDP in billions
--   - Region
--
-- The WHERE clause filters for:
--   - Records where Region is 'Sub-Saharan Africa'
--   - Records where Time_period is 2020
--   - Records where Est_gdp_in_billions is NOT NULL (i.e., GDP data is available)
--   - Records where Country_name is NOT in the list:
--     'Nigeria', 'South Africa', 'Ethiopia', 'Kenya', or 'Ghana'
--
-- This means it returns data for all Sub-Saharan African countries in 2020
-- that have GDP estimates available,
-- but excludes these major countries: Nigeria, South Africa, Ethiopia, Kenya, and Ghana

SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services,
    Est_population_in_millions,
    Est_gdp_in_billions,
    Region
FROM
    Access_to_Basic_Services
WHERE
    Region = 'Sub-Saharan Africa'
AND
    Time_period = 2020
AND
    Est_gdp_in_billions IS NOT NULL
AND
    Country_name NOT IN ('Nigeria','South Africa','Ethiopia','Kenya','Ghana');

--4.10 The LIKE Operator Wildcards
--This specify the data where 
-- Country_name is Iran OR Country_name is Korea

SELECT
     *
FROM 
    Access_to_Basic_Services
WHERE
    Country_name = "Iran"
    OR Country_name = "Korea"

-- We use wildcards to for patterns in the country_name

SELECT 
    *
FROM Access_to_Basic_Services

WHERE 
    Country_name LIKE 'Iran%'
    OR Country_name LIKE '%_Republic of Korea'

--We use the wildcards to specify the columns we want to see 


SELECT 
    Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services
FROM Access_to_Basic_Services

WHERE 
    Country_name LIKE 'Iran%'
    OR Country_name LIKE '%_Republic of Korea'
