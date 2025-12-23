-- function(Date, String, Number)
 
 
 -- AGRREGATE FUNCTION  (To perform the calculation on set of rows) (Multi line functions)
use world;
SELECT * FROM country;
 -- COUNT() 
SELECT count(indepyear) FROM country; -- Only value rows are count 
SELECT count(*)FROM country; -- ALL ROWS are count including null value 

-- DISTINCT() --> only receive distinct value (find to unique value from one or more column we use distinct)
 SELECT distinct (continent) FROM country;
 SELECT distinct continent, region FROM country;
 
 -- SUM() , AVG()
 SELECT count(population), sum(population),avg(population) FROM country;
 SELECT count(distinct governmentform)FROM country;
 SELECT count(governmentform),count(distinct governmentform) FROM country where continent='ASIA';
 SELECT count(name),sum(population),count(distinct indepyear) FROM country where continent='Africa';
 
 -- Q. get the total countries, the avg surface area and the total pouplation,for the countries which has got the independance from 1947 to 1998 (these two year not be included)
 SELECT count(name),avg(surfacearea),sum(population) FROM country WHERE Indepyear > 1947 and Indepyear < 1998;

-- Q get the total number of countires and number of unique continents along with avg population and the total number of capital from the countries which is starting with a and starting with d 
SELECT count(name), count(distinct continent), avg(population), sum(capital) FROM country WHERE name like 'd%' or name like 'a%';

-- GROUP BY  --> collect the similar values, we dont select other column while using particular any column
SELECT continent,count(*) from country group by Continent;
SELECT indepyear from country;
SELECT indepyear,count(*) from country group by indepyear;

SELECT governmentform, count(*) from country group by governmentform;


SELECT continent, count(name),sum(population), avg(population),max(Population),min(Population),max(indepyear),min(Indepyear) from country group by continent;


-- FROM the city table u have to find the total cities , the total districts, unique districts, the total popilation from the city table;

SELECT * from city;
SELECT countrycode, count(*) as 'Total cities',count(district) as 'Total Districts',count(distinct district) as 'Unique District', sum(population) as 'total population' from city group by countrycode;


-- count cities which have a population of more than 1 lakh
-- where (sabse pehle execute ) => group by => count(), only filter the data which is exist in the original table
-- where(WHERE )  filter the data from the og table
-- have(HAVING) use to filter the agrregate  column 
use world;
select * from country;

SELECT continent, count(name) from country where indepyear>1987 group by continent;

SELECT continent, sum(population) from country group by continent having sum(population)>100 ;

SELECT continent, sum(population) from country where lifeexpectancy >35.0 group by continent;
-- Q u need to find out the total country for each governmentform where the total number of country should be greater than 30
	SELECT governmentform, count(name) as 'TotalCountry' from country  group by governmentform having TotalCountry>30;

-- Q u need to find out the total country for each governmentform only for the countries having there capital greater than 30 and total pupulation greater than 3 lakh
	SELECT governmentform, count(name)as 'TotalCountry', sum(population) as 'TotalPopulation' from country  where capital>30 group by governmentform having  TotalPopulation>300000;

SELECT continent, region, count(name) from country where indepyear>1988 group by continent,region;

