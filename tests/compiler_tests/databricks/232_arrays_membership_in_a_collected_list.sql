WITH t_1_L AS (SELECT
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(COLLECT_LIST(STRUCT(x_8 AS v)), s -> s.v) END) AS l
FROM
  LATERAL (SELECT explode(ARRAY(1, 3)) AS x_8) AS pushkin)
SELECT
  x_3 AS x
FROM
  t_1_L AS t_0_L, LATERAL (SELECT explode(t_0_L.l) AS x_3) AS pushkin, LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_5) AS pushkin
WHERE
  (x_5 = x_3) ORDER BY x NULLS LAST;