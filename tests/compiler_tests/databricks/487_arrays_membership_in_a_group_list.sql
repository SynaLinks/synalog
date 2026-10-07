WITH t_2_V AS (SELECT * FROM VALUES
  ("a", 1),
  ("a", 2),
  ("b", 3)
AS UNUSED_TABLE_NAME(g, x)),
t_1_L AS (SELECT
  V.g AS g,
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(COLLECT_LIST(STRUCT(V.x AS v)), s -> s.v) END) AS l
FROM
  t_2_V AS V
GROUP BY 1)
SELECT
  t_0_L.g AS g
FROM
  t_1_L AS t_0_L, LATERAL (SELECT explode(t_0_L.l) AS x_3) AS pushkin
WHERE
  (2 = x_3);