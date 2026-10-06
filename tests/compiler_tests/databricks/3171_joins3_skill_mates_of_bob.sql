WITH t_2_E AS (SELECT * FROM VALUES
  (1, "ann", 10, null),
  (2, "bob", 10, 1),
  (3, "cid", 20, 1),
  (4, "dee", null, 2),
  (5, "eve", 30, 3),
  (6, "fay", 20, null)
AS UNUSED_TABLE_NAME(id, name, dept, boss)),
t_3_S AS (SELECT * FROM VALUES
  (1, "sql"),
  (1, "go"),
  (2, "sql"),
  (3, "rust"),
  (5, "sql"),
  (5, "go"),
  (6, "excel")
AS UNUSED_TABLE_NAME(id, skill))
SELECT
  t_1_E.name AS name
FROM
  t_2_E AS E, t_3_S AS S, t_3_S AS t_0_S, t_2_E AS t_1_E
WHERE
  (t_0_S.id != E.id) AND
  (E.name = "bob") AND
  (S.id = E.id) AND
  (t_0_S.skill = S.skill) AND
  (t_1_E.id = t_0_S.id)
GROUP BY 1 ORDER BY name NULLS LAST;