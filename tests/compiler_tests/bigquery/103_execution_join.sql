WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      "ann" AS name,
      1 AS city_id
   UNION ALL
  
    SELECT
      "bob" AS name,
      2 AS city_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_City AS (SELECT * FROM (
  
    SELECT
      1 AS city_id,
      "paris" AS city
   UNION ALL
  
    SELECT
      2 AS city_id,
      "rome" AS city
   UNION ALL
  
    SELECT
      3 AS city_id,
      "oslo" AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.name AS name,
  City.city AS city
FROM
  t_0_Person AS Person, t_1_City AS City
WHERE
  (City.city_id = Person.city_id) ORDER BY name;