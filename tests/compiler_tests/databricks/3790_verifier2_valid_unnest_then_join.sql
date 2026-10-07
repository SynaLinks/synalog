WITH t_1_N AS (SELECT * FROM VALUES
  (1, "x"),
  (2, "y"),
  (3, "z")
AS UNUSED_TABLE_NAME(n, s))
SELECT
  x_2 AS n,
  t_0_N.s AS s
FROM
  t_1_N AS t_0_N, LATERAL (SELECT explode(ARRAY(2, 3)) AS x_2) AS pushkin
WHERE
  (t_0_N.n = x_2) ORDER BY n NULLS LAST;