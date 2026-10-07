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
t_4_D AS (SELECT * FROM VALUES
  (10, "sales", "paris"),
  (20, "tech", "oslo"),
  (30, "ops", "paris"),
  (40, "legal", "rome")
AS UNUSED_TABLE_NAME(d, dn, city)),
t_2_Any AS (SELECT * FROM (
  
    SELECT
      t_3_D.d AS d
    FROM
      t_4_D AS t_3_D
   UNION ALL
  
    SELECT
      null AS d
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_1_E AS E, t_2_Any AS t_0_Any
WHERE
  (t_0_Any.d = E.d);