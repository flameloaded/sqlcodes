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
	(
    Country_name = 'Nigeria'
    OR Country_name = 'Ethiopia'
    OR Country_name = 'Congo'
    OR Country_name = 'Egypt'
    OR Country_name = 'Tanzania'
    OR Country_name = 'Kenya'
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


-- Country_name is Iran OR Country_name is Korea

SELECT
     Country_name,
     Time_period,
     Pct_managed_drinking_water_services,
     Pct_managed_sanitation_services
FROM 
    Access_to_Basic_Services
WHERE
    Country_name LIKE "Iran%"
    OR Country_name LIKE "%_Republic of Korea"
    
    
    
