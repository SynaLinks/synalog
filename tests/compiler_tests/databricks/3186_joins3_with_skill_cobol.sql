WITH t_0_E AS (SELECT * FROM VALUES
  (1, "ann", 10, null),
  (2, "bob", 10, 1),
  (3, "cid", 20, 1),
  (4, "dee", null, 2),
  (5, "eve", 30, 3),
  (6, "fay", 20, null)
AS UNUSED_TABLE_NAME(id, name, dept, boss)),
t_1_S AS (SELECT * FROM VALUES
  (1, "sql"),
  (1, "go"),
  (2, "sql"),
  (3, "rust"),
  (5, "sql"),
  (5, "go"),
  (6, "excel")
AS UNUSED_TABLE_NAME(id, skill))
SELECT
  E.name AS name
FROM
  t_0_E AS E, t_1_S AS S
WHERE
  (S.id = E.id) AND
  (S.skill = "cobol");