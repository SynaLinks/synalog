WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      "a" AS n,
      3 AS s
   UNION ALL
  
    SELECT
      "b" AS n,
      9 AS s
   UNION ALL
  
    SELECT
      "c" AS n,
      1 AS s
   UNION ALL
  
    SELECT
      "d" AS n,
      5 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ARRAY_AGG(V.n order by [V.s][offset(0)] limit 1)[OFFSET(0)] AS w
FROM
  t_1_V AS V;