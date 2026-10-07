WITH t_0_AllSquares AS (SELECT * FROM (
  
    SELECT
      x_15 AS x,
      ((x_15) * (x_15)) AS sq,
      "even" AS type
    FROM
      LATERAL (SELECT explode(FILTER(SEQUENCE(0, CAST(10 AS BIGINT)), x -> x < 10)) AS x_15) AS pushkin
    WHERE
      ((MOD(x_15, NULLIF(2, 0))) = 0)
   UNION ALL
  
    SELECT
      x_25 AS x,
      ((x_25) * (x_25)) AS sq,
      "odd" AS type
    FROM
      LATERAL (SELECT explode(FILTER(SEQUENCE(0, CAST(10 AS BIGINT)), x -> x < 10)) AS x_25) AS pushkin
    WHERE
      ((MOD(x_25, NULLIF(2, 0))) = 1)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AllSquares.x AS x,
  AllSquares.sq AS sq,
  AllSquares.type AS type
FROM
  t_0_AllSquares AS AllSquares ORDER BY x NULLS LAST;