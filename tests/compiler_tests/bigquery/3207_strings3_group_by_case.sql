WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      "a" AS w
   UNION ALL
  
    SELECT
      2 AS k,
      "A" AS w
   UNION ALL
  
    SELECT
      3 AS k,
      "a" AS w
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.w AS w,
  SUM(1) AS n
FROM
  t_0_V AS V
GROUP BY w ORDER BY w;