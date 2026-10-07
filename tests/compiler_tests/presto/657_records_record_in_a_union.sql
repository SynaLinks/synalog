WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      CAST(ROW(1) AS ROW(a double)) AS r
   UNION ALL
  
    SELECT
      CAST(ROW(2) AS ROW(a double)) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.r.a AS a
FROM
  t_0_V AS V ORDER BY a;