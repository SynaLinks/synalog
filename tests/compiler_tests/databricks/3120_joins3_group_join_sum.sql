WITH t_2_E AS (SELECT * FROM VALUES
  (1, "a", 10),
  (2, "a", 20),
  (3, "b", null),
  (4, null, 5)
AS UNUSED_TABLE_NAME(id, g, v)),
t_1_S AS (SELECT
  E.g AS g,
  SUM(E.v) AS s
FROM
  t_2_E AS E
GROUP BY 1),
t_3_F AS (SELECT * FROM VALUES
  ("a", 1),
  ("b", 2),
  (null, 3)
AS UNUSED_TABLE_NAME(g, w))
SELECT
  t_0_S.g AS g,
  t_0_S.s AS s,
  F.w AS w
FROM
  t_1_S AS t_0_S, t_3_F AS F
WHERE
  (F.g = t_0_S.g) ORDER BY g NULLS LAST;