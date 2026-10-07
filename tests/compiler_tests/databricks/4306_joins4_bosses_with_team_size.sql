WITH t_2_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_0_T AS (SELECT
  t_1_E.boss AS b,
  SUM(1) AS n
FROM
  t_2_E AS t_1_E
GROUP BY 1)
SELECT
  E.n AS name,
  T.n AS n
FROM
  t_0_T AS T, t_2_E AS E
WHERE
  (E.id = T.b) ORDER BY name NULLS LAST;