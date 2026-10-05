WITH t_0_A AS (SELECT * FROM VALUES
  (2, "y"),
  (1, "x")
AS UNUSED_TABLE_NAME(k, v))
SELECT
  A.k AS k,
  A.v AS v
FROM
  t_0_A AS A, LATERAL (SELECT explode(ARRAY(1, 2)) AS x_6) AS pushkin
WHERE
  (A.k = x_6) ORDER BY k NULLS LAST LIMIT 1;