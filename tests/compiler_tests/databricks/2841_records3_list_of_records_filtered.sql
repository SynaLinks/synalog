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
  x_1.n AS n
FROM
  t_0_T AS T, LATERAL (SELECT explode(T.l) AS x_1) AS pushkin
WHERE
  (x_1.v > 1) ORDER BY n NULLS LAST;