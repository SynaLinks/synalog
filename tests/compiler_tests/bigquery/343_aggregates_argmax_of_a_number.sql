WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      10 AS id,
      1 AS s
   UNION ALL
  
    SELECT
      30 AS id,
      9 AS s
   UNION ALL
  
    SELECT
      20 AS id,
      5 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ARRAY_AGG(V.id order by  [V.s][offset(0)] desc limit 1)[OFFSET(0)] AS w
FROM
  t_1_V AS V;