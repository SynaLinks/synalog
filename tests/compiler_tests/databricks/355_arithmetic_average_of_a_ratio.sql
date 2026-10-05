WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      1 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  AVG(((V.a) / (V.b))) AS r
FROM
  t_0_V AS V;