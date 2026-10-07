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
t_5_D AS (SELECT * FROM VALUES
  (10, "sales", "paris"),
  (20, "tech", "oslo"),
  (30, "ops", "paris"),
  (40, "legal", "rome")
AS UNUSED_TABLE_NAME(d, dn, city)),
t_1_Pick_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_2_E.id AS id
    FROM
      t_4_E AS t_2_E, t_5_D AS t_3_D
    WHERE
      (t_3_D.d = t_2_E.d) AND
      (t_3_D.city = "paris")
   UNION ALL
  
    SELECT
      t_6_E.id AS id
    FROM
      t_4_E AS t_6_E
    WHERE
      (t_6_E.pay > 4500)
  
) AS UNUSED_TABLE_NAME  ),
t_0_Pick AS (SELECT
  Pick_MultBodyAggAux.id AS id
FROM
  t_1_Pick_MultBodyAggAux AS Pick_MultBodyAggAux
GROUP BY 1)
SELECT
  E.n AS n
FROM
  t_0_Pick AS Pick, t_4_E AS E
WHERE
  (E.id = Pick.id) ORDER BY n NULLS LAST;