WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'Ann' AS name,
      'red' AS team,
      34 AS age,
      true AS active
   UNION ALL
  
    SELECT
      2 AS id,
      'Bob' AS name,
      'red' AS team,
      null AS age,
      false AS active
   UNION ALL
  
    SELECT
      3 AS id,
      'Cid' AS name,
      'blue' AS team,
      52 AS age,
      true AS active
   UNION ALL
  
    SELECT
      4 AS id,
      'Dee' AS name,
      'blue' AS team,
      23 AS age,
      false AS active
   UNION ALL
  
    SELECT
      5 AS id,
      'Eve' AS name,
      'green' AS team,
      41 AS age,
      null AS active
   UNION ALL
  
    SELECT
      6 AS id,
      'Fay' AS name,
      'red' AS team,
      19 AS age,
      true AS active
   UNION ALL
  
    SELECT
      7 AS id,
      'Gus' AS name,
      'gold' AS team,
      60 AS age,
      false AS active
  
) AS UNUSED_TABLE_NAME  ),
t_1_A AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      10 AS pid,
      8 AS hours
   UNION ALL
  
    SELECT
      1 AS id,
      11 AS pid,
      4 AS hours
   UNION ALL
  
    SELECT
      2 AS id,
      10 AS pid,
      12 AS hours
   UNION ALL
  
    SELECT
      3 AS id,
      12 AS pid,
      20 AS hours
   UNION ALL
  
    SELECT
      3 AS id,
      14 AS pid,
      2 AS hours
   UNION ALL
  
    SELECT
      4 AS id,
      12 AS pid,
      6 AS hours
   UNION ALL
  
    SELECT
      6 AS id,
      11 AS pid,
      15 AS hours
   UNION ALL
  
    SELECT
      5 AS id,
      13 AS pid,
      1 AS hours
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.id AS id
FROM
  t_0_Person AS Person
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_5.value)) AS logica_value
  FROM
    t_1_A AS A, JSON_EACH(JSON_ARRAY(0)) as x_5
  WHERE
    (A.id = Person.id)) IS NULL) AND
  (Person.team = 'gold');