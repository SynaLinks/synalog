WITH t_2_Person AS (SELECT * FROM VALUES
  (1, "Ann", "red", 34, true),
  (2, "Bob", "red", null, false),
  (3, "Cid", "blue", 52, true),
  (4, "Dee", "blue", 23, false),
  (5, "Eve", "green", 41, null),
  (6, "Fay", "red", 19, true),
  (7, "Gus", "gold", 60, false)
AS UNUSED_TABLE_NAME(id, name, team, age, active)),
t_1_Team AS (SELECT
  Person.team AS team
FROM
  t_2_Person AS Person
GROUP BY 1),
t_3_Senior AS (SELECT
  t_4_Person.team AS team
FROM
  t_2_Person AS t_4_Person
WHERE
  t_4_Person.active AND
  (t_4_Person.age > 40)
GROUP BY 1)
SELECT
  t_0_Team.team AS team
FROM
  t_1_Team AS t_0_Team
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_Senior AS Senior
  WHERE
    (Senior.team = t_0_Team.team)) IS NULL) ORDER BY team NULLS LAST;