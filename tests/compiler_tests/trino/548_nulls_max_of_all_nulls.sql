WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      null AS x
   UNION ALL
  
    SELECT
      null AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  MAX(V.x) AS m
FROM
  t_0_V AS V;