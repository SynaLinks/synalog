WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      CAST(ROW(2) AS ROW(k double)) AS r
   UNION ALL
  
    SELECT
      CAST(ROW(1) AS ROW(k double)) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.r.k AS k
FROM
  t_0_V AS V ORDER BY k;