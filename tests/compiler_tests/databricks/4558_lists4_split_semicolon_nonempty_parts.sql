WITH t_0_T AS (SELECT * FROM VALUES
  (1, "a,b,c"),
  (2, ""),
  (3, "abc"),
  (4, ",,"),
  (5, "x,"),
  (6, null)
AS UNUSED_TABLE_NAME(k, s))
SELECT
  T.k AS k,
  x_4 AS x
FROM
  t_0_T AS T, LATERAL (SELECT explode(SPLIT(T.s, REGEXP_REPLACE(";", '([^a-zA-Z0-9])', '\\\\$1'))) AS x_4) AS pushkin
WHERE
  (x_4 != "") ORDER BY k NULLS LAST, x NULLS LAST;