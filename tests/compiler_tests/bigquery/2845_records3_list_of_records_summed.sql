WITH t_1_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY[STRUCT("a" AS n, 1 AS v), STRUCT("b" AS n, 2 AS v)] AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY[STRUCT("c" AS n, 3 AS v)] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_T.k AS k,
  SUM(x_3.v) AS t
FROM
  t_1_T AS t_0_T, UNNEST(t_0_T.l) as x_3
GROUP BY k ORDER BY k NULLS LAST;