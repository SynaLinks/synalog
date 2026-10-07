WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      null AS x
   UNION ALL
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      null AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(CASE WHEN (V.x IS NULL) THEN 1 ELSE 0 END) AS n
FROM
  t_0_V AS V;