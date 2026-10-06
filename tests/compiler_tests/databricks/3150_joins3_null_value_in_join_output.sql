WITH t_0_E AS (SELECT * FROM VALUES
  (1, "a", 10),
  (2, "a", 20),
  (3, "b", null),
  (4, null, 5)
AS UNUSED_TABLE_NAME(id, g, v)),
t_1_F AS (SELECT * FROM VALUES
  ("a", 1),
  ("b", 2),
  (null, 3)
AS UNUSED_TABLE_NAME(g, w))
SELECT
  E.id AS id,
  E.v AS v,
  F.w AS w
FROM
  t_0_E AS E, t_1_F AS F
WHERE
  (E.g = "b") AND
  (F.g = "b");