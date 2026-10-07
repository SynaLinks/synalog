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
t_7_A AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  ),
t_6_Hours AS (SELECT
  A.id AS id,
  SUM(A.hours) AS h
FROM
  t_7_A AS A
GROUP BY 1),
t_2_Tag AS (SELECT * FROM (
  
    SELECT
      t_3_Person.id AS id,
      'young' AS tag
    FROM
      t_0_Person AS t_3_Person
    WHERE
      (t_3_Person.age < 30)
   UNION ALL
  
    SELECT
      t_4_Person.id AS id,
      'active' AS tag
    FROM
      t_0_Person AS t_4_Person
    WHERE
      t_4_Person.active
   UNION ALL
  
    SELECT
      t_5_Hours.id AS id,
      'busy' AS tag
    FROM
      t_6_Hours AS t_5_Hours
    WHERE
      (t_5_Hours.h > 10)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.id AS id
FROM
  t_0_Person AS Person
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_2_Tag AS t_1_Tag
  WHERE
    (t_1_Tag.id = Person.id)) IS NULL) ORDER BY id;