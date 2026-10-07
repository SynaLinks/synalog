WITH t_0_Person AS (SELECT * FROM VALUES
  (1, "Ann", "red", 34, true),
  (2, "Bob", "red", null, false),
  (3, "Cid", "blue", 52, true),
  (4, "Dee", "blue", 23, false),
  (5, "Eve", "green", 41, null),
  (6, "Fay", "red", 19, true),
  (7, "Gus", "gold", 60, false)
AS UNUSED_TABLE_NAME(id, name, team, age, active)),
t_3_Proj AS (SELECT * FROM VALUES
  (10, "red", 300),
  (11, "red", 1200),
  (12, "blue", 800),
  (13, "green", 50),
  (14, "blue", 90)
AS UNUSED_TABLE_NAME(pid, team, budget)),
t_4_A AS (SELECT * FROM VALUES
  (1, 10, 8),
  (1, 11, 4),
  (2, 10, 12),
  (3, 12, 20),
  (3, 14, 2),
  (4, 12, 6),
  (6, 11, 15),
  (5, 13, 1)
AS UNUSED_TABLE_NAME(id, pid, hours)),
t_1_Missing AS (SELECT
  t_2_Person.id AS id,
  Proj.pid AS pid
FROM
  t_0_Person AS t_2_Person, t_3_Proj AS Proj
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_4_A AS A
  WHERE
    (A.id = t_2_Person.id) AND
    (A.pid = Proj.pid)) IS NULL) AND
  (Proj.team = t_2_Person.team))
SELECT
  Person.id AS id
FROM
  t_0_Person AS Person
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_Missing AS Missing
  WHERE
    (Missing.id = Person.id)) IS NULL) AND
  (Person.team = "gold");