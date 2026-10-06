WITH t_2_I AS (SELECT * FROM VALUES
  (1, "ann", "pen", 2.5E0, 3, 1),
  (1, "ann", "ink", 7.0E0, 1, 2),
  (2, "ann", "pad", 4.0E0, 2, 1),
  (3, "bob", "pen", 2.5E0, 10, 1),
  (3, "bob", "cap", 1.25E0, 4, 2),
  (3, "bob", "ink", 7.0E0, 2, 3),
  (4, "cid", "pad", 4.0E0, 1, 1),
  (5, "cid", "pen", 2.5E0, 1, 1),
  (5, "cid", "pen", 2.5E0, 2, 2)
AS UNUSED_TABLE_NAME(`order`, customer, item, price, qty, pos)),
t_3_T AS (SELECT
  t_5_I.pos AS pos,
  SUM(x_13) AS t
FROM
  t_2_I AS t_5_I, LATERAL (SELECT explode(FILTER(SEQUENCE(0, t_5_I.qty), x -> x < t_5_I.qty)) AS x_13) AS pushkin
WHERE
  (t_5_I.`order` = 3)
GROUP BY 1)
SELECT
  t_1_T.pos AS pos,
  ARRAY_SIZE(FILTER(SEQUENCE(0, I.qty), x -> x < I.qty)) AS n,
  t_1_T.t AS t
FROM
  t_2_I AS I, t_3_T AS t_1_T
WHERE
  (I.pos = t_1_T.pos) AND
  (I.`order` = 3) ORDER BY pos NULLS LAST, n NULLS LAST, t NULLS LAST;