WITH t_0_Lo AS (SELECT
  MIN(x_4) AS m
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_4) AS pushkin),
t_0_Hi AS (SELECT
  MAX(x_4) AS m
FROM
  LATERAL (SELECT explode(ARRAY(1, 2, 3)) AS x_4) AS pushkin)
SELECT * FROM (
  
    SELECT
      "min" AS k,
      Lo.m AS v
    FROM
      t_0_Lo AS Lo
   UNION ALL
  
    SELECT
      "max" AS k,
      Hi.m AS v
    FROM
      t_0_Hi AS Hi
  
) AS UNUSED_TABLE_NAME  ORDER BY k NULLS LAST ;