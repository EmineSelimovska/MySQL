SELECT * FROM geography.countries;

use geography;


SELECT country_name, population
FROM countries
WHERE continent_code = 'EU'
ORDER BY population DESC,
country_name ASC
LIMIT 30;

SELECT country_name, country_code, IF(currency_code = 'EUR','Euro','Not Euro')
 AS currency
FROM 
countries
ORDER BY country_name;
