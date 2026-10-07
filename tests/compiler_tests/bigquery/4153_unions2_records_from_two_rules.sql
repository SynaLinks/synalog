WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      STRUCT("a" AS n, ARRAY[] AS l) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      STRUCT("b" AS n, ARRAY[7, 8] AS l) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.k AS k,
  t_0_R.r.n AS n,
  ARRAY_LENGTH(t_0_R.r.l) AS c
FROM
  t_1_R AS t_0_R ORDER BY k NULLS LAST;