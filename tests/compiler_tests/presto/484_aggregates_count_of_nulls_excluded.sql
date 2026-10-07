WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      null AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(CASE WHEN (V.x IS null) THEN 0 ELSE 1 END) AS n
FROM
  t_0_V AS V;