-- BETWEEN (find the value in range )

SELECT name , continent, indepyear FROM country WHERE indepyear BETWEEN 1901 AND 1960;

SELECT name , continent, indepyear FROM country WHERE indepyear  NOT BETWEEN 1901 AND 1960;

SELECT name , continent, indepyear FROM country WHERE indepyear  NOT IN( 1901 ,1960);

-- btw value in range
-- in specific values
