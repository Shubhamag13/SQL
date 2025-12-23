use world;
show tables;

-- * use for all column , SELECT use for print column, to see the current output
select * from city;
SELECT name,population from city;

-- SEE THE TABLE DATA WITH DESCRIBE
describe city;

-- WHERE clause we will filter the data
SELECT * FROM city WHERE district='Zuid-Holland';
SELECT * FROM city WHERE CountryCode='ARG'; -- IF ANYTHING NOT FOUND THEY GIVE YOU BLANK TABLE

SELECT * FROM city WHERE Population>600000;

SELECT * FROM city WHERE CountryCode!='AFG';-- ['!='/'<>'] BOTH ARE NOT EQUAL TO 

SELECT * FROM Country;
-- IN opertor = filter the data in the specific set of values  
SELECT * FROM country WHERE continent ='North America';
SELECT * FROM country WHERE continent in ('North America','Europe');
SELECT * FROM country WHERE continent in ('North America','Europe','ASIA');

SELECT name, continent from country WHERE indepyear in (1901,1960);
SELECT name, continent from country WHERE indepyear=1947;

-- BETWEEN (find the value in range )

SELECT name , continent, indepyear FROM country WHERE indepyear BETWEEN 1901 AND 1960;

SELECT name , continent, indepyear FROM country WHERE indepyear  NOT BETWEEN 1901 AND 1960;

SELECT name , continent, indepyear FROM country WHERE indepyear  NOT IN( 1901 ,1960);

-- btw value in range
-- in specific values
DESCRIBE country;

-- Q1 get the code, country name, and the region where the region is not middle east
SELECT code, name, region FROM country WHERE region!= 'middle east';

-- Q2 get the name, Indepyear and population with expected 10%(population+population *0.1 ) (p*1.1) increment in population
SELECT name, Indepyear, population, population *1.1 as 'Expected Inc Population 10%' FROM country;

-- Q3 get all the column of the country where the  life expectancy is 38.3 or 66.4
SELECT * FROM country WHERE lifeexpectancy IN (38.3,66.4);

-- Q4 get the name, continent, population and the GNP column from the table where population is not from 5k to 2 lac
SELECT name, continent, population , GNP FROM country WHERE population NOT BETWEEN 5000 AND 200000;

-- LIKE Operator (SEARCH THE PATTERN ) to meet with pattern  
SELECT name,continent from country WHERE continent ='Asia';
-- special character is called wildcard character 

-- %[where are finding zero or more character ] ASIA%
SELECT name,continent from country WHERE continent LIKE 'Asia';
SELECT name,continent from country WHERE name LIKE 'A%';-- first character is a 
SELECT name,continent from country WHERE name LIKE '%A'; -- last character is a 
SELECT name,continent from country WHERE name LIKE '%A%'; -- haracter a will be any location 
SELECT name,continent from country WHERE name LIKE '%Ad%'; -- ad both are together at any location
 
 -- _(UNDERSCORE )=> 1 character(first character is anything )
 -- _D only one character before D 
 -- D_ _ _ only three character AFTER D 
 SELECT name,continent from country WHERE name LIKE  'Ir_n';
 
 
 