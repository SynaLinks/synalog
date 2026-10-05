WITH t_2_V AS (SELECT * FROM VALUES
  ("a", 1),
  ("a", 2),
  ("b", 2),
  ("c", 3)
AS UNUSED_TABLE_NAME(g, x)),
t_1_S AS (SELECT
  V.g AS g,
  ARRAY_AGG(DISTINCT V.x) AS s
FROM
  t_2_V AS V
GROUP BY 1)
SELECT
  t_0_S.g AS g
FROM
  t_1_S AS t_0_S, LATERAL (SELECT explode(t_0_S.s) AS x_3) AS pushkin
WHERE
  (2 = x_3) ORDER BY g NULLS LAST;