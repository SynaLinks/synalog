WITH t_3_V AS (SELECT * FROM (
  
    SELECT
      3 AS k,
      "c" AS v
   UNION ALL
  
    SELECT
      1 AS k,
      "a" AS v
   UNION ALL
  
    SELECT
      2 AS k,
      "b" AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ARRAY_AGG(t_0_V.v order by [t_0_V.k][offset(0)]) AS l
FROM
  t_3_V AS t_0_V;