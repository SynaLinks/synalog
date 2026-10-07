WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      2 AS p,
      3 AS q
   UNION ALL
  
    SELECT
      1 AS p,
      5 AS q
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(((V.p) * (V.q))) AS t
FROM
  t_0_V AS V;