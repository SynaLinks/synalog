WITH t_4_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_2_M AS (SELECT
  t_3_E.d AS d,
  MAX(t_3_E.pay) AS m
FROM
  t_4_E AS t_3_E
GROUP BY 1),
t_5_D AS (SELECT * FROM VALUES
  (10, "sales", "paris"),
  (20, "tech", "oslo"),
  (30, "ops", "paris"),
  (40, "legal", "rome")
AS UNUSED_TABLE_NAME(d, dn, city))
SELECT
  t_1_D.dn AS dn,
  E.n AS n
FROM
  t_2_M AS t_0_M, t_4_E AS E, t_5_D AS t_1_D
WHERE
  (E.d = t_0_M.d) AND
  (E.pay = t_0_M.m) AND
  (t_1_D.d = t_0_M.d) ORDER BY dn NULLS LAST;