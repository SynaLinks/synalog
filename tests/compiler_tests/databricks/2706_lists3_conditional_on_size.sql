WITH t_4_I AS (SELECT * FROM VALUES
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
t_1_L AS (SELECT
  I.`order` AS `order`,
  TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(I.pos AS arg, I.item AS value))), s -> s.value) AS l
FROM
  t_4_I AS I
GROUP BY 1)
SELECT
  t_0_L.`order` AS `order`,
  CASE WHEN (ARRAY_SIZE(t_0_L.l) > 1) THEN ELEMENT_AT(t_0_L.l, 0 + 1) ELSE "single" END AS v
FROM
  t_1_L AS t_0_L ORDER BY `order` NULLS LAST, v NULLS LAST;