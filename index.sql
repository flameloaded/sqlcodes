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
