WITH t_3_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_4_D AS (SELECT * FROM VALUES
  (10, "sales", "paris"),
  (20, "tech", "oslo"),
  (30, "ops", "paris"),
  (40, "legal", "rome")
AS UNUSED_TABLE_NAME(d, dn, city))
SELECT
  E.n AS a,
  t_0_E.n AS b
FROM
  t_3_E AS E, t_3_E AS t_0_E, t_4_D AS t_1_D, t_4_D AS t_2_D
WHERE
  (E.n < t_0_E.n) AND
  (t_1_D.d = E.d) AND
  (t_2_D.d = t_0_E.d) AND
  (t_2_D.city = t_1_D.city) ORDER BY a NULLS LAST, b NULLS LAST;