WITH t_2_Person AS (SELECT * FROM VALUES
  (1, "ann", 30),
  (2, "bob", null),
  (3, "cid", 25),
  (4, null, 40),
  (5, "eve", null)
AS UNUSED_TABLE_NAME(id, name, age)),
t_1_Age AS (SELECT
  Person.age AS age
FROM
  t_2_Person AS Person
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (Person.age IS NULL)) IS NULL)
GROUP BY 1)
SELECT
  SUM(1) AS n
FROM
  t_1_Age AS t_0_Age;
