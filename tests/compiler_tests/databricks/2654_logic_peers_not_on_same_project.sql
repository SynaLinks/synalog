WITH t_1_Person AS (SELECT * FROM VALUES
  (1, "Ann", "red", 34, true),
  (2, "Bob", "red", null, false),
  (3, "Cid", "blue", 52, true),
  (4, "Dee", "blue", 23, false),
  (5, "Eve", "green", 41, null),
  (6, "Fay", "red", 19, true),
  (7, "Gus", "gold", 60, false)
AS UNUSED_TABLE_NAME(id, name, team, age, active)),
t_4_A AS (SELECT * FROM VALUES
  (1, 10, 8),
  (1, 11, 4),
  (2, 10, 12),
  (3, 12, 20),
  (3, 14, 2),
  (4, 12, 6),
  (6, 11, 15),
  (5, 13, 1)
AS UNUSED_TABLE_NAME(id, pid, hours))
SELECT
  Person.id AS a,
  t_0_Person.id AS b
FROM
  t_1_Person AS Person, t_1_Person AS t_0_Person
WHERE
  (Person.id < t_0_Person.id) AND
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_4_A AS t_2_A, t_4_A AS t_3_A
  WHERE
    (t_2_A.id = Person.id) AND
    (t_3_A.id = t_0_Person.id) AND
    (t_3_A.pid = t_2_A.pid)) IS NULL) AND
  (t_0_Person.team = Person.team);