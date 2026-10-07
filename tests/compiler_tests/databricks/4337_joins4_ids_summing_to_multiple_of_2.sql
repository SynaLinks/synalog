WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay))
SELECT
  E.n AS a,
  t_0_E.n AS b
FROM
  t_1_E AS E, t_1_E AS t_0_E
WHERE
  (E.id < t_0_E.id) AND
  ((MOD(((E.id) + (t_0_E.id)), NULLIF(2, 0))) = 0) ORDER BY a NULLS LAST, b NULLS LAST;