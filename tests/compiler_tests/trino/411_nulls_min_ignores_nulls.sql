WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      null AS x
   UNION ALL
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      9 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MIN(V.x) AS m
FROM
  t_0_V AS V;