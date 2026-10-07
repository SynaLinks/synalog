WITH t_1_E AS (SELECT * FROM VALUES
  (1, "a", 10),
  (2, "a", 20),
  (3, "b", null),
  (4, null, 5)
AS UNUSED_TABLE_NAME(id, g, v)),
t_2_G AS (SELECT * FROM VALUES
  ("a"),
  ("b"),
  ("c")
AS UNUSED_TABLE_NAME(g))
SELECT
  t_0_G.g AS g,
  COALESCE((SELECT
  SUM(1) AS logica_value
FROM
  t_1_E AS E
WHERE
  (E.g = t_0_G.g)), 0) AS n
FROM
  t_2_G AS t_0_G ORDER BY g NULLS LAST;