WITH t_0_C AS (SELECT
  ARRAY_AGG(DISTINCT x_3) AS s
FROM
  LATERAL (SELECT explode(SPLIT("a b a", REGEXP_REPLACE(" ", '([^a-zA-Z0-9])', '\\\\$1'))) AS x_3) AS pushkin)
SELECT
  ARRAY_SIZE(C.s) AS n
FROM
  t_0_C AS C;
