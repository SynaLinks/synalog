WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2.5 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(V.x) AS t
FROM
  t_0_V AS V;