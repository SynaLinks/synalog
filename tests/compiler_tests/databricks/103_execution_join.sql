WITH t_1_Person AS (SELECT * FROM VALUES
  ("ann", 1),
  ("bob", 2)
AS UNUSED_TABLE_NAME(name, city_id)),
t_2_City AS (SELECT * FROM VALUES
  (1, "paris"),
  (2, "rome"),
  (3, "oslo")
AS UNUSED_TABLE_NAME(city_id, city))
SELECT
  Person.name AS name,
  t_0_City.city AS city
FROM
  t_1_Person AS Person, t_2_City AS t_0_City
WHERE
  (t_0_City.city_id = Person.city_id) ORDER BY name NULLS LAST;