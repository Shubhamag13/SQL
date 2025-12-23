use world;
select * from city;

-- id can be primary key (UNIQUE VALUE)
desc city;

SELECT count(id), count(distinct id) as 'UNIQUE ID',count(population),count(distinct population) as 'UNIQUE POPULATION' from city;

-- Country Table => CODE  => PRIMARY KEY
select * from country;


-- city and country =>  COUNTRY CODE and CODE (SAME)


-- City Table
select ct.name, ct.countrycode from city as ct;

-- Country Table
select cnty.code,cnty.name from country as cnty;

-- FIND OUT THE CITY AND THIER RESPECTIVE COUNTRY NAME (join two table where countrycode = code )
select ct.name, ct.countrycode, cnty.code, cnty.name from city as ct join country as cnty where ct.countrycode=cnty.code;

-- Q you need to find city name, population the city along with the govt form in that city with the population from highest to the lowest 
select ct.name, ct.population, cnty.GovernmentForm  from city as ct join country as cnty  where ct.countrycode=cnty.code order by ct.population DESC;


--  COUNTRY,COUNTRY LANGUAGE 
-- U NEED TO GET COUNTRY NAME POPULATION AND ALL THE LANGUAGE SPOKEN FOR EACH COUNTRY;
-- both table has country code 
SELECT * FROM countrylanguage;
 
 select cnty.name, cnty.population,cntylan.language  from country as cnty join countrylanguage as cntylan  where cnty.code=cntylan.countrycode;
 
 
 -- what is the actor name, movies name 
select  ac.first_name, fac.film_id from actor as ac join film_actor as fac where ac.actor_id=fac.actor_id;

use sakila;
select * from actor;
select * from film_actor;
-- actor --> actor_id primary
-- film_actor -- id is foreing key
-- Q get the actor id and first name along with its film id 

select ac.actor_id , ac.first_name, fac.film_id from actor as ac join film_actor as fac where ac.actor_id=fac.actor_id;

-- Q actor table, film actor table film table 
select * from film;