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
t_0_A AS (SELECT
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(COLLECT_LIST(STRUCT(I.item AS v)), s -> s.v) END) AS `all`,
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE ARRAY_DISTINCT(TRANSFORM(COLLECT_LIST(STRUCT(I.item AS v)), s -> s.v)) END) AS distinct_items
FROM
  t_1_I AS I
WHERE
  (I.customer = "ann"))
SELECT
  ARRAY_SIZE(A.`all`) AS n,
  ARRAY_SIZE(A.distinct_items) AS d
FROM
  t_0_A AS A;