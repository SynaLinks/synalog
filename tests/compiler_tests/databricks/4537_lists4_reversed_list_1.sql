WITH t_3_L AS (SELECT * FROM VALUES
  (1, ARRAY(1, 2, 3)),
  (2, ARRAY()),
  (3, ARRAY(7)),
  (4, ARRAY(5, 5, 9, 1))
AS UNUSED_TABLE_NAME(k, l))
SELECT
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(- x_4 AS arg, x_4 AS value))), s -> s.value) END) AS s
FROM
  t_3_L AS t_0_L, LATERAL (SELECT explode(t_0_L.l) AS x_4) AS pushkin
WHERE
  (t_0_L.k = 1);