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
t_1_A AS (SELECT
  I.customer AS customer,
  ARRAY_AGG(I.item) AS l
FROM
  t_2_I AS I
GROUP BY 1)
SELECT
  ARRAY_SIZE(CONCAT(A.l, t_0_A.l)) AS n,
  (ARRAY_CONTAINS(CONCAT(A.l, t_0_A.l), "cap")) AS has_cap
FROM
  t_1_A AS A, t_1_A AS t_0_A
WHERE
  (A.customer = "bob") AND
  (t_0_A.customer = "cid");