WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      CAST(ROW(2) AS ROW(a double)) AS r
   UNION ALL
  
    SELECT
      CAST(ROW(3) AS ROW(a double)) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(V.r.a) AS t
FROM
  t_0_V AS V;