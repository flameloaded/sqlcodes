USE united_nations;
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

