WITH t_0_A AS (SELECT * FROM VALUES
  (1, "paris"),
  (2, "lyon")
AS UNUSED_TABLE_NAME(k, c))
SELECT
  A.k AS k,
  A.c AS c
FROM
  t_0_A AS A, LATERAL (SELECT explode(ARRAY(1, 2)) AS x_6) AS pushkin
WHERE
  (A.k = x_6) ORDER BY k NULLS LAST;