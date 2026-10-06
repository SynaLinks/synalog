WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY(STRUCT("a" AS n, 1 AS v), STRUCT("b" AS n, 2 AS v)) AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY(STRUCT("c" AS n, 3 AS v)) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k,
  x_3.n AS n,
  x_3.v AS v
FROM
  t_0_T AS T, LATERAL (SELECT explode(T.l) AS x_3) AS pushkin ORDER BY k NULLS LAST, n NULLS LAST;