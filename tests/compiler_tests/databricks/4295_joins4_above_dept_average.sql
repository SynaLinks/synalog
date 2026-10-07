WITH t_1_E AS (SELECT * FROM VALUES
  (1, "ann", null, 10, 5000),
  (2, "bob", 1, 10, 4000),
  (3, "cid", 1, 20, 4200),
  (4, "dee", 2, 10, 3000),
  (5, "eve", 3, 20, 3100),
  (6, "fay", 3, null, 2900),
  (7, "gus", null, 30, 6000),
  (8, "hal", 7, 30, 2500)
AS UNUSED_TABLE_NAME(id, n, boss, d, pay)),
t_2_A AS (SELECT
  t_3_E.d AS d,
  AVG(t_3_E.pay) AS a
FROM
  t_1_E AS t_3_E
GROUP BY 1)
SELECT
  E.n AS n
FROM
  t_1_E AS E, t_2_A AS t_0_A
WHERE
  (E.pay > t_0_A.a) AND
  (t_0_A.d = E.d) ORDER BY n NULLS LAST;