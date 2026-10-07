WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      CAST(ROW(2) AS ROW(k double)) AS r
   UNION ALL
  
    SELECT
      CAST(ROW(1) AS ROW(k double)) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.r.k AS k
FROM
  t_1_R AS t_0_R ORDER BY k;