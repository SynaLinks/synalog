WITH t_0_Person AS (SELECT * FROM VALUES
  (1, "Ann", "red", 34, true),
  (2, "Bob", "red", null, false),
  (3, "Cid", "blue", 52, true),
  (4, "Dee", "blue", 23, false),
  (5, "Eve", "green", 41, null),
  (6, "Fay", "red", 19, true),
  (7, "Gus", "gold", 60, false)
AS UNUSED_TABLE_NAME(id, name, team, age, active)),
t_7_A AS (SELECT * FROM VALUES
  (1, 10, 8),
  (1, 11, 4),
  (2, 10, 12),
  (3, 12, 20),
  (3, 14, 2),
  (4, 12, 6),
  (6, 11, 15),
  (5, 13, 1)
AS UNUSED_TABLE_NAME(id, pid, hours)),
t_6_Hours AS (SELECT
  A.id AS id,
  SUM(A.hours) AS h
FROM
  t_7_A AS A
GROUP BY 1),
t_2_Tag AS (SELECT * FROM (
  
    SELECT
      t_3_Person.id AS id,
      "young" AS tag
    FROM
      t_0_Person AS t_3_Person
    WHERE
      (t_3_Person.age < 30)
   UNION ALL
  
    SELECT
      t_4_Person.id AS id,
      "active" AS tag
    FROM
      t_0_Person AS t_4_Person
    WHERE
      t_4_Person.active
   UNION ALL
  
    SELECT
      t_5_Hours.id AS id,
      "busy" AS tag
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
    (t_1_Tag.id = Person.id)) IS NULL) ORDER BY id NULLS LAST;