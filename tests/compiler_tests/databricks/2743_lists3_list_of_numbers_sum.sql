WITH t_1_I AS (SELECT * FROM VALUES
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
t_0_Q0 AS (SELECT
  I.customer AS customer,
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(COLLECT_LIST(STRUCT(I.qty AS v)), s -> s.v) END) AS l
FROM
  t_1_I AS I
GROUP BY 1)
SELECT
  Q0.customer AS customer,
  SUM(x_3) AS t
FROM
  t_0_Q0 AS Q0, LATERAL (SELECT explode(Q0.l) AS x_3) AS pushkin
GROUP BY 1 ORDER BY customer NULLS LAST, t NULLS LAST;